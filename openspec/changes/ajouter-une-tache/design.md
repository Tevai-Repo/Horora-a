# Conception

> Écrit par l'étude le 2026-10-30 à la demande du pilote, revu le même jour à la lumière du tour 4 de l'entretien (l'application entière, cinq changements) : les options de pile technique, pas une décision. Le pilote tranche dans QUESTIONS.md (question-2) ; l'intégrateur reporte le choix ici et dans DECISIONS.md. Le pourquoi du changement est dans proposal.md.

## Contexte

Quatre contraintes données par le pilote le 2026-10-30, en plus des specs du changement :

1. **Rien à installer qui ne soit pas déjà sur le poste** (SECURITY.md, règle 5, controle-install). Relevé du poste le 2026-10-30 : Node 24.15 et npm 9.9, Python 3.14, .NET 8.0.421, Rust 1.99 et cargo, Java 17 sans Maven ni Gradle, PHP 8.1, Docker 28, SQLite 3.53, OpenSSL 3.2, Git 2.51, PostgreSQL et MySQL, Firefox et Chrome. Les bibliothèques tirées par npm, NuGet, pip ou cargo s'installent dans le projet, pas sur le poste : elles sont permises, chacune avec sa ligne au registre de DECISIONS.md (règle 3).
2. **Un téléphone Android et un ordinateur Windows**, du même utilisateur (question ouverte 1, répondue).
3. **Une application installée sans magasin** (specs/appareils, test-36).
4. **Aucune tâche envoyée à un tiers** (proposal.md, budget proposé ; option (b) retenue par l'étude).

Deux faits qui découlent des contraintes 2 et 3 et ne se discutent pas :

- Sur un téléphone, la seule façon d'avoir une icône sur l'écran d'accueil, le plein écran et pas de magasin est l'**application web installable** (PWA : un manifeste et un service worker). Sur l'ordinateur, Chrome et Edge installent la même application en une icône de bureau ; Firefox ne le fait pas. Le client est donc une application web, quel que soit le reste.
- Une application web installable exige **HTTPS**, et « ouvrir en 4G » (test-41) exige un serveur joignable depuis Internet. Il faut un nom, un certificat et un hébergement : c'est le deuxième axe de choix.

### Ce que le tour 4 a changé, et ce qu'il n'a pas changé

Le tour 4 a dessiné l'application entière en cinq changements (question-entretien-53 : saisir, ranger, joindre, dater, parler) et a grossi celui-ci : projets emboîtés sans limite de profondeur avec une liste chacun, libellé et identifiant séparés, bouton +, modification dans le détail, glisser pour ordonner, cocher et faites par liste, supprimer. La pile doit donc tenir pour les cinq, pas pour le premier seul. Vérification, changement par changement :

| Changement | Ce qu'il demande à la pile | Tenu par A1 + B1 ? |
|---|---|---|
| 1. saisir (celui-ci) | un arbre de profondeur libre, des positions, un état « faite », des dates de création et de modification, le glisser au doigt et à la souris | oui ; le glisser se fait par les événements de pointeur, sans bibliothèque, car le glisser-déposer HTML natif ne marche pas au doigt sur Android |
| 2. ranger | la vue par étiquette triée par dernière modification (question-entretien-52), la recherche, renommer, déplacer des sous-arbres, un prototype jetable avant la spec | oui ; `updated_at` posé dès maintenant ; la recherche sur quelques milliers de tâches tient avec `LIKE`, FTS5 de SQLite si le sondage montre que Node l'embarque ; le prototype se fait dans la même pile en une branche `etude/` |
| 3. joindre | 25 Mo par fichier, 5 Go, servis tels quels | oui ; fichiers sur disque, jamais exécutés ni lus (SECURITY.md, règle 4) |
| 4. dater | des dates, et des **rappels** sur le téléphone | les dates oui ; **les rappels, avec réserve** : une application web ne peut notifier un téléphone fermé que par Web Push, qui passe par le service de poussée du navigateur (Google pour Chrome Android). Le contenu est chiffré de bout en bout (RFC 8291), Google ne lit pas la tâche, mais voit qu'un rappel part et quand. À trancher à l'entretien de « dater » ; aucune pile web n'y échappe, seule une application native (`.apk`) le ferait, déjà écartée |
| 5. parler | une porte d'entrée pour un agent ; la voix libre | l'agent oui : la même API HTTP avec un jeton propre ; la voix libre, **avec réserve** : la reconnaissance vocale du navigateur (Web Speech) envoie l'audio chez Google, comme la dictée du clavier Gboard ; un modèle local dans le navigateur est lourd. À trancher à l'entretien de « parler » |

Conclusion : le tour 4 ne change ni A ni B ; il ajoute trois choix en C (modèle de données, glisser, client qui grossit) et deux réserves pour plus tard (rappels, voix), à porter aux entretiens de « dater » et « parler ».

## Objectifs et non-objectifs

**Objectifs :**

- Tenir les 41 scénarios de specs/taches, specs/hierarchie, specs/appareils, et préparer `joindre-des-fichiers` (test-42 à 52).
- Tenir les changements 2 à 5 sans changer de pile : le tableau ci-dessus.
- Le moins de dépendances possible : chaque ligne au registre coûte une relecture à chaque jalon.
- Une pile qu'un agent relit et refait depuis la spec (decision-fabrication-8) : pas de magie de framework.

**Non-objectifs :**

- La compréhension libre de la phrase (option (c) de la proposition), la voix libre, l'agent : changement « parler ».
- La synchronisation en direct entre appareils (question-entretien-11 : au rafraîchissement suffit).
- Le mode hors ligne : une tâche dite sans réseau est refusée (test-26). Le service worker ne sert qu'à l'installation, pas au cache des données.

## Choix à trancher

Le pilote tranche A et B ; les autres suivent la recommandation sauf avis contraire.

**Tranché par le pilote le 2026-10-30 : A1 et B1 ; les choix C suivent la recommandation (decision-3).**

### A. Le langage et le serveur

Toutes les options partagent : un client web installable en HTML, CSS et JavaScript ; une base SQLite dans un seul fichier (déjà sur le poste, aucune installation côté hébergement non plus ; sauvegarde = copie du fichier) ; HTTPS au bord.

| Option | Dépendances au registre | Durée relative | Pour | Contre |
|---|---|---|---|---|
| **A1. Node 24, TypeScript sans compilateur, zéro dépendance** | 0 : serveur HTTP, SQLite (`node:sqlite`), tests (`node:test`), hachage de mot de passe (`node:crypto`) sont dans Node. | 1 (référence) | Le même langage des deux côtés, le client relit le serveur ; Node 24 exécute le TypeScript directement (types effacés) ; LTS jusqu'en 2028. | `node:sqlite` est encore marqué « en développement actif » par Node, pas définitif : si une version le casse, on épingle Node. Le client reste en JavaScript sans types tant qu'on n'ajoute pas un outil de compilation (esbuild ou tsc, une dépendance de plus, à décider au premier besoin). |
| **A2. .NET 8, API minimale, SQLite** | 1 à 3 : `Microsoft.Data.Sqlite`, et pour les tests `xunit` ou le cadre MSTest fourni. | ≈ 1,3 | Typage fort, serveur Kestrel robuste, outillage de test mûr. | **.NET 8 sort du support le 10 novembre 2026**, dans dix jours ; passer à .NET 10 est une installation (controle-install) : le projet naîtrait sur une version périmée. Deux langages (C# et JavaScript) pour un seul développeur. |
| **A3. Python 3.14, bibliothèque standard seule** | 0 : `http.server`, `sqlite3`, `unittest`, `hashlib`. | ≈ 1,2 | Lisible, SQLite et tests intégrés. | `http.server` n'est pas fait pour servir sur Internet (pas de limite de taille, de délai ni de robustesse) : il faudrait un vrai serveur (uvicorn ou gunicorn + un cadre), soit 3 à 6 dépendances, et deux langages. |
| **A4. Rust 1.99, axum et rusqlite** | 3 directes, ≈ 150 transitives, chacune une ligne au registre. | ≈ 2 | Le plus sûr et le plus rapide à l'exécution. | Démesuré pour une personne et quelques milliers de tâches ; compilation lente ; le registre devient illisible. |

Écartés sans option : Java 17 (aucun outil de construction sur le poste), PHP 8.1 (sans correctifs de sécurité depuis le 31 décembre 2025).

Vu avec le pilote le 2026-10-30 et écarté : **une application Android native (`.apk`) installée directement**, sans Play Store, par le réseau local ou un câble. Android le permet, mais : la fabriquer demande le SDK Android et Gradle, absents du poste (contrainte 1) ; elle ne sert que le téléphone, il faudrait une seconde application pour l'ordinateur (contrainte 2) ; chaque version se réinstalle à la main ; et elle ne dispense pas du serveur sur Internet (test-41). Rouvre question-entretien-17 si le pilote la veut malgré tout. Le tour 4 lui donne un seul argument de plus, les rappels de « dater » sans passer par Google ; il ne suffit pas à renverser les trois autres.

**Recommandation : A1**, inchangée après le tour 4. Elle est la seule à zéro dépendance, en un langage, sur une version supportée longtemps ; son seul risque, `node:sqlite`, se parade en épinglant la version de Node dans le projet. A2 serait la seconde si .NET 10 était sur le poste.

### B. L'hébergement, le nom et le certificat

La contrainte 4 décide : le serveur doit être tenu par le pilote, et personne entre le téléphone et lui ne doit lire le trafic.

| Option | Ce que voit un tiers | Coût | Contre |
|---|---|---|---|
| **B1. L'ordinateur du pilote, à la maison** : port 443 ouvert sur la box, nom DynDNS gratuit, certificat Let's Encrypt obtenu par l'application elle-même (protocole ACME, ≈ 1 dépendance ou 300 lignes à écrire). | Rien : le chiffrement va du téléphone au poste. Le fournisseur DynDNS ne voit que l'adresse IP. | 0 € | L'ordinateur doit rester allumé pour que le téléphone serve ; l'adresse IP du domicile est exposée ; la box doit accepter l'ouverture de port (pas toujours en 4G/5G fixe). |
| **B2. Un petit serveur loué (VPS)**, même logiciel, même certificat. | L'hébergeur a le disque : il peut lire les tâches s'il le veut. Le pilote dit si c'est un tiers au sens de la contrainte 4 ; chiffrer la base au repos ne protège pas d'un hébergeur qui a aussi la mémoire. | 3 à 6 €/mois | Une machine de plus à tenir à jour ; une installation, mais pas « sur le poste ». |
| **B3. Un tunnel** (Cloudflare Tunnel, Tailscale Funnel) depuis le poste. | Cloudflare termine le HTTPS chez lui et lit les tâches : contraire à la contrainte 4. Tailscale ne les lit pas. | 0 € | Les deux exigent l'installation d'un agent sur le poste : contraire à la contrainte 1. Écartée. |

**Recommandation : B1**, inchangée, la seule qui respecte les quatre contraintes sans réserve. Si l'ordinateur ne peut pas rester allumé, B2 avec la question « l'hébergeur est-il un tiers ? » posée au pilote avant. Le changement « dater » pèsera pour B2 : des rappels à l'heure demandent un serveur allumé.

### C. Les choix qui suivent (recommandés, à contredire)

- **Modèle de données**, posé pour les cinq changements : une table `node` pour la hiérarchie (identité, parent, genre : boîte d'entrée, projet, liste libre ; libellé ; identifiant unique en minuscules sans accent ; position parmi ses frères), la liste d'un projet étant le projet lui-même, ce qui tient « une seule liste par projet » (question-entretien-49) sans table de plus ; une table `task` (identité, nœud, texte, position, étiquette, `created_at`, `updated_at`, `done_at` nul tant que la tâche n'est pas faite) ; une table `device` (identité, empreinte du jeton, dates) ; plus tard `attachment` et `reminder`. Rejeté : une table par niveau (projet, sous-projet, liste), qui fige la profondeur que le pilote a voulue libre.
- **Client sans cadre** (ni React ni Vue) : trois panneaux, un champ, une arborescence, cinq gestes ; le DOM, CSS Grid et les événements de pointeur suffisent, et un agent le relit sans connaître un cadre. Le tour 4 a grossi le client d'environ moitié ; **point de bascule** : si le client dépasse 2 000 lignes ou si « ranger » rend la synchronisation des trois panneaux pénible, on reprend ce choix à l'entretien de « ranger », avec un cadre léger livré en un seul fichier versionné (Preact ou Lit, 1 dépendance, sans outil de construction). Rejeté aujourd'hui : un cadre dès le départ, 1 à 30 dépendances et un outil de construction pour un écran.
- **Glisser pour ordonner** (test-16) par les événements de pointeur (`pointerdown`, `pointermove`, `pointerup`), qui marchent à la souris et au doigt ; 100 à 150 lignes. Rejeté : le glisser-déposer HTML natif, muet au doigt sur Chrome Android ; SortableJS, 1 dépendance pour ces 150 lignes.
- **La phrase est comprise par le serveur**, pas par le client : une seule implémentation des tournures (`à <x>`, `dans <x>`, `en haut`, `étiquette <mot>`), x résolu d'abord comme identifiant, puis comme libellé normalisé (minuscules, accents retirés par `String.prototype.normalize`), ambigu ou inconnu → boîte d'entrée (test-7, test-8) ; testée par `node:test` sans navigateur. Rejeté : la comprendre dans le client, qui doublerait la logique le jour où l'agent parle au serveur (« parler »).
- **Appareils** : un mot de passe unique haché par `scrypt` (`node:crypto`) ; à la première ouverture, le serveur crée une ligne `device` et pose un cookie `HttpOnly; Secure; SameSite=Strict` sans date d'expiration, porteur d'un jeton aléatoire de 256 bits ; « déconnecter tous les autres appareils » supprime toutes les lignes sauf la sienne (test-40). Rejeté : un jeton dans le stockage local du navigateur, lisible par tout script.
- **Ordre dans une liste** : une position entière par tâche ; « en haut » et le glisser décalent les autres. Rejeté : des clés fractionnaires, inutiles à cette taille.
- **Faites** (test-17, test-18) : `done_at` posé, la tâche sort de la liste à l'affichage et garde sa ligne ; décocher remet `done_at` à nul et la place en bas. Rejeté : une table d'archives, qui compliquerait le décochage et la vue par étiquette de « ranger ».
- **Fichiers** (pour `joindre-des-fichiers`) : sur le disque à côté de la base, nommés par leur empreinte, la base gardant nom, taille et type ; jamais servis avec un type exécutable par le navigateur (`Content-Disposition: attachment` hors images). Décidé là-bas, mais A1 et B1 le permettent sans rien ajouter.
- **Tests** : `node:test` pour le serveur, le modèle et la compréhension des phrases ; les scénarios d'écran (glisser, téléphone, installation : test-16, test-35, test-36) restent dans la liste de test manuel du pilote tant qu'aucun navigateur piloté (Playwright, 1 dépendance lourde) n'est décidé. À reprendre avec la QA au premier jalon.

## Risques

- [`node:sqlite` change ou casse à une mise à jour de Node] → version de Node épinglée dans le projet (`.nvmrc` ou `package.json` › `engines`), contrôlée par check.ps1.
- [Firefox n'installe pas d'application web sur l'ordinateur] → Chrome ou Edge sur l'ordinateur ; dit dans la liste de test (test-36).
- [B1 : l'ordinateur éteint, le téléphone ne sert plus] → c'est le pilote qui choisit B1 en connaissance ; B2 en repli, et à reconsidérer à « dater ».
- [Mot de passe deviné depuis Internet] → délai croissant après chaque échec, journal des échecs ; à écrire dans la face produit de SECURITY.md.
- [Un seul mot de passe pour tous les appareils, oublié sans appareil connecté] → remise par l'hébergement, hors application (proposal.md, point de détail) ; en B1, c'est le pilote devant son poste.
- [La dictée du clavier Android envoie la voix chez Google] → hors d'Horora'a, mais le pilote doit le savoir : la contrainte 4 vaut pour ce qu'Horora'a envoie, pas pour le clavier du téléphone ; Gboard a un mode hors ligne.
- [Les rappels de « dater » passent par le service de poussée de Google, chiffrés] → à trancher à son entretien ; aucune pile web n'y échappe.
- [Le client sans cadre devient pénible à « ranger »] → point de bascule écrit en C ; un cadre en un fichier, sans outil de construction, si on le franchit.
- [Des sous-projets très profonds rendent l'arborescence illisible sur le téléphone] → l'épreuve d'intention dit revenir en arrière au-delà de trois niveaux ; l'arborescence replie les niveaux au-delà du deuxième.

## Questions ouvertes

Ne changent ni les specs ni l'approche ; changent la liste de test manuel.

1. Le téléphone du pilote : **Android**, répondu le 2026-10-30. Chrome installe.
2. Le navigateur de l'ordinateur : Chrome, Edge ou Firefox ? Avec Firefox, pas d'icône de bureau.
3. En B1 : la box accepte-t-elle l'ouverture du port 443 vers le poste ? Un fait à vérifier par le pilote avant d'ouvrir le jalon.
4. Sondage fait par l'étude le 2026-10-30, accepté par le pilote le même jour : **FTS5 disponible**. `node:sqlite` de Node 24.15.0 embarque SQLite 3.51.3 compilé avec ENABLE_FTS3, ENABLE_FTS3_PARENTHESIS et ENABLE_FTS5 ; une table virtuelle fts5 se crée et répond à MATCH. La recherche de « ranger » peut s'en servir, sans dépendance. Méthode : script jetable d'une dizaine de lignes, hors dépôt, supprimé ; 2 minutes.
