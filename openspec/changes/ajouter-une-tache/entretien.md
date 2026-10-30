# Entretien

> Temps 1 de l'étude. Les fichiers font foi : ce qui a été dit ici ne vit pas dans la conversation. Fin quand la frontière est vide.

## Le besoin, en trois lignes

- Ce qui gêne, ou ce qu'on veut pouvoir faire : dire une tâche en une phrase, avec où elle va (projet, jalon ou liste, et position), ou sans rien préciser pour qu'elle tombe dans la boîte d'entrée ; puis la retrouver là.
- Le signe que c'est réglé : je dicte « ajoute à ORION, dans le jalon wane, mettre à jour ce soir, en haut de la liste ». Ensuite, sur le téléphone comme sur l'ordinateur, la tâche est la première de la liste du jalon wane d'ORION.
- Ce que la demande ne doit pas devenir : un outil d'équipe, ou un gestionnaire de projet complet (dates, assignations, rappels).

Besoin confirmé par le pilote le 2026-10-30.

## Faits vérifiés sans question

- Projet neuf : aucun code, aucune spec dans openspec/specs/, aucun changement archivé (`openspec list --specs`, ETAT.md).
- Capacité visée : « Tâches », la seule de l'index, sans spec (SPEC.md, section 4).
- Mots en jeu : Tâche, Liste, Projet, Jalon, Hiérarchie, Boîte d'entrée, Note rapide, En haut (SPEC.md, section 2).
- Une seule personne ; aucune technologie imposée (SPEC.md, section 7).
- Le langage et la zone de code sont ouverts (QUESTIONS.md, question-2) ; ce changement ne les tranche pas, il dit le comportement.
- Pas de budget, pas d'invariant, pas de modèle de menace écrits (SPEC.md, sections 5 et 6 ; SECURITY.md, face produit) ; le modèle de menace s'écrit avec la première capacité.
- Parking de ROADMAP.md vide.

## Tours

### Tour 1

- **question-entretien-1** Dans un projet, y a-t-il une liste propre au projet en plus de celle de chaque jalon, de sorte que « ajoute à ORION, … » sans jalon range la tâche dans la liste du projet ? ➡ recommandé : oui, chaque projet a sa liste et chaque jalon la sienne ; sans jalon dit, la tâche va dans la liste du projet (vision-2, « une liste par projet en cours »).
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-2** Existe-t-il des listes hors projet autres que la boîte d'entrée, comme la liste de courses, que l'on nomme directement (« ajoute du fromage à la liste de courses ») ? ➡ recommandé : oui, des listes libres nommées à la racine de la hiérarchie, au même niveau que les projets.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-3** Comment la phrase est-elle comprise dans ce premier changement ? ➡ recommandé : une phrase en français courant, dont l'outil reconnaît quelques tournures fixes (`à <projet>`, `dans le jalon <jalon>`, `dans la liste <liste>`, `en haut`) ; le reste de la phrase est le texte de la tâche. La compréhension libre par un modèle de langue, qui enverrait les tâches à un service tiers, va au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-4** La voix est-elle à faire dans ce changement ? ➡ recommandé : non ; on écrit la phrase dans un seul champ, et la dictée du clavier du téléphone suffit à la dire à la voix. Une reconnaissance vocale propre va au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-5** L'ajout « depuis un agent » (vision-3) est-il dans ce changement ? ➡ recommandé : non, au parking ; il demande une porte d'entrée pour programmes et sa propre sécurité.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-6** Une tâche dite sans « en haut » va-t-elle en bas de sa liste ? ➡ recommandé : oui, en bas, sous les autres.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-7** Dans « mettre à jour ce soir », « ce soir » est-il compris comme une date ? ➡ recommandé : non, il reste dans le texte de la tâche ; aucune date n'est comprise (hors du besoin : pas de gestionnaire de projet complet).
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-8** Créer un projet, un jalon ou une liste libre est-il dans ce changement ? ➡ recommandé : oui, de la façon la plus simple, par leur nom, sur un écran ; sans cela, le signe du besoin (ranger dans le jalon wane d'ORION) ne peut pas être observé. Renommer, déplacer, supprimer vont au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-9** Marquer une tâche faite, la supprimer, la déplacer, ranger une note rapide depuis la boîte d'entrée : est-ce dans ce changement ? ➡ recommandé : non, le prochain changement ; celui-ci s'arrête à dire, ranger, retrouver.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-10** Le téléphone doit-il ouvrir Horora'a hors de chez vous, en 4G ? ➡ recommandé : oui, partout où il y a Internet ; c'est ce que dit « aussi facile à ouvrir sur son téléphone » (vision-1).
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-11** Une tâche ajoutée sur le téléphone doit-elle apparaître sur l'ordinateur sans geste ? ➡ recommandé : non, il suffit qu'elle y soit à la prochaine ouverture ou au prochain rafraîchissement de la liste.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-12** Après chaque ajout, Horora'a dit-il où il a rangé la tâche ? ➡ recommandé : oui, une ligne de confirmation, par exemple « Rangée dans ORION › wane, en haut ».
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).

### Tour 2

- **question-entretien-13** Que fait Horora'a quand il ne trouve pas l'endroit dit ? Posée par le pilote avant le tour 2.
  Réponse : « S'il ne trouve pas l'endroit où mettre la tâche, l'ajouter dans un dossier en attente d'être rangé. » — confirmée le 2026-10-30. Mot signalé : « dossier » n'est pas dans « Les mots » ; l'étude propose que ce dossier soit la boîte d'entrée (question-entretien-14).
- **question-entretien-14** Le « dossier en attente d'être rangé » est-il la boîte d'entrée de SPEC.md ? ➡ recommandé : oui, un seul endroit d'attente ; la tâche y tombe comme une note rapide.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-15** Quand l'endroit n'est pas trouvé, quel texte garde la tâche ? ➡ recommandé : la phrase entière telle qu'elle a été dite, « ajoute à ORION, dans le jalon wane, … » compris, pour qu'on sache où elle devait aller ; et la confirmation le dit : « ORION › wane introuvable, rangée dans la boîte d'entrée ».
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-16** Combien de temps un appareil reste-t-il connecté ? Posée par le pilote avant le tour 2.
  Réponse : « Je veux que ce soit une application normale sur mon téléphone et, pareil, une application normale sur mon ordinateur : pas de limite de temps de connexion. » — confirmée le 2026-10-30. Mot signalé : « application normale » est flou (question-entretien-17).
- **question-entretien-17** Que veut dire « application normale » ? ➡ recommandé : une icône sur l'écran d'accueil du téléphone et une sur le bureau de l'ordinateur ; elle s'ouvre en plein écran, sans barre de navigateur, et on y reste connecté. Elle s'installe depuis Horora'a lui-même, sans passer par un magasin d'applications. Le passage par un magasin va au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-18** Comment un appareil devient-il le vôtre la première fois ? ➡ recommandé : un mot de passe, demandé une seule fois par appareil ; ensuite l'application s'ouvre sans rien demander.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-19** Sans limite de temps, un téléphone perdu ou volé ouvre toutes vos tâches. Peut-on couper un appareil depuis un autre ? ➡ recommandé : oui ; depuis l'ordinateur, « déconnecter tous les autres appareils », et le téléphone perdu redemande le mot de passe.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-20** Que voit-on en ouvrant l'outil ? Posée par le pilote avant le tour 2.
  Réponse : « Je veux parler d'une version sur un écran d'ordinateur. Réfléchis à la version mobile mais je veux voir une arborescence sur la gauche, des tâches dans le split 1 à droite de l'arborescence et si je clique sur une tâche, ouvrir dans un split 2 les détails de cette tâche. » — confirmée le 2026-10-30. Mots signalés : « arborescence », « split 1 », « split 2 », « détails » (question-entretien-21 et question-entretien-22).
- **question-entretien-21** Les mots de l'écran : l'arborescence est-elle la hiérarchie affichée, et nomme-t-on les deux autres parties « panneau des tâches » et « panneau de détail » ? ➡ recommandé : oui ; trois mots ajoutés à « Les mots » de SPEC.md à l'archivage : Arborescence, Panneau des tâches, Panneau de détail.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-22** Une tâche tient en une ligne (« Les mots ») : que montre le panneau de détail ? ➡ recommandé : le texte entier de la tâche, sa place (par exemple « ORION › wane »), sa position dans la liste et sa date d'ajout ; rien à saisir de plus dans ce changement. Une description longue, des notes, des pièces jointes vont au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-23** L'ordre de l'arborescence ? ➡ recommandé : la boîte d'entrée en tête, avec le nombre de tâches qui attendent ; puis les projets, chacun avec ses jalons dessous ; puis les listes libres ; projets, jalons et listes libres par ordre alphabétique.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-24** À l'ouverture, quel endroit est choisi dans l'arborescence ? ➡ recommandé : le dernier ouvert sur cet appareil ; la toute première fois, la boîte d'entrée.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-25** Où dit-on une tâche ? ➡ recommandé : un champ unique toujours visible, en haut de l'écran sur l'ordinateur, en bas sur le téléphone, quel que soit l'endroit affiché.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-26** Une phrase sans endroit dit, tapée pendant qu'on regarde ORION › wane, va où ? ➡ recommandé : dans la boîte d'entrée, comme le dit le besoin, quel que soit l'endroit affiché ; l'outil se comporte de la même façon partout.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-27** La version téléphone, proposée par l'étude à la demande du pilote : les trois parties l'une après l'autre, en plein écran. On ouvre sur l'arborescence ; un appui sur un endroit montre ses tâches ; un appui sur une tâche montre son détail ; un bouton retour remonte d'un cran. ➡ recommandé : oui.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).

Frontière vide le 2026-10-30, rouverte le même jour par le tour 3. Lecture de l'étude, à contester à la signature : question-entretien-24 vaut pour l'ordinateur ; sur le téléphone, question-entretien-27 l'emporte et l'application s'ouvre sur l'arborescence.

### Tour 3

- **question-entretien-28** Les étiquettes, demandées par le pilote avant la signature de l'épreuve d'intention.
  Réponse : « Je veux ajouter dès le début la notion d'étiquette. Chaque tâche pourra avoir une étiquette qui sera visible dans la liste des tâches. Il servira de tri et d'indication pour l'utilisateur. » — confirmée le 2026-10-30. Mot signalé : « Étiquette » n'est pas dans « Les mots » ; « tri » est ambigu, ordonner ou filtrer (question-entretien-31). Le besoin en trois lignes, confirmé, ne la contient pas : la ligne « ce qu'on veut pouvoir faire » s'élargit (question-entretien-29).
- **question-entretien-29** Le besoin s'élargit-il aux étiquettes, dans ce même changement ? ➡ recommandé : oui, « dès le début » ; la première ligne du besoin devient « … et lui donner une étiquette ; puis la retrouver là ». Mot ajouté à « Les mots » à l'archivage : Étiquette, un mot court posé sur une tâche, visible dans le panneau des tâches.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-30** Combien d'étiquettes par tâche ? ➡ recommandé : aucune ou une, comme vous l'avez dit (« une étiquette ») ; plusieurs vont au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-31** « Servira de tri » : ordonner ou filtrer ? ➡ recommandé : filtrer ; dans le panneau des tâches, un appui sur une étiquette ne montre que les tâches qui la portent, dans leur ordre ; un second appui montre de nouveau toute la liste. L'ordre de la liste reste celui de « en haut » et « en bas », que l'étiquette ne change pas.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-32** Comment donne-t-on une étiquette ? ➡ recommandé : dans la phrase, par une tournure fixe de plus, `étiquette <mot>`, par exemple « ajoute à ORION, mettre à jour ce soir, étiquette urgent ». Changer ou retirer l'étiquette ensuite suit les autres modifications au prochain changement (question-entretien-9).
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-33** Les étiquettes sont-elles libres ou choisies dans une liste préparée ? ➡ recommandé : libres ; un mot nouveau devient une étiquette à sa première utilisation, et vaut pour toute la hiérarchie. Contrairement à un endroit introuvable (question-entretien-13), une étiquette inconnue ne renvoie pas la tâche dans la boîte d'entrée.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-34** Comment une étiquette se voit-elle ? ➡ recommandé : son mot dans une pastille, à droite du texte de la tâche, dans le panneau des tâches et dans le panneau de détail ; toutes les pastilles de la même couleur. Choisir une couleur par étiquette va au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-35** Voir toutes les tâches d'une étiquette, toutes listes confondues ? ➡ recommandé : non dans ce changement ; le filtre vaut pour la liste affichée. La vue par étiquette dans l'arborescence va au parking.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-36** Les images et fichiers, demandés par le pilote dans le tour 3.
  Réponse : « La dernière fonctionnalité très importante à ajouter est de permettre, dans les détails d'une tâche, de coller des images et déposer des fichiers. » — confirmée le 2026-10-30. Contredit question-entretien-22, acceptée par défaut (« rien à saisir de plus dans ce changement ; les pièces jointes vont au parking ») : la réponse du pilote l'emporte, question-entretien-22 est rouverte par question-entretien-39. Mot signalé : rien dans « Les mots » ne nomme un fichier attaché (question-entretien-38). Touche la sécurité : des fichiers venus de l'extérieur sont gardés et rouverts (SECURITY.md, règle 4).
- **question-entretien-37** Un seul changement, ou deux ? ➡ recommandé : deux, dans le même premier jalon ; celui-ci (dire, ranger, retrouver, étiquettes) puis aussitôt `joindre-des-fichiers`, qui reprend les questions 38 à 44 dans son propre entretien. Le premier livre plus tôt une chose utilisable ; les fichiers apportent leurs propres risques (sécurité, place de stockage) qu'on chiffre à part.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-38** Le mot : ➡ recommandé : « Pièce jointe », une image ou un fichier attaché à une tâche ; ajouté à « Les mots » à l'archivage.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-39** Ce que montre le panneau de détail, remplace question-entretien-22 : ➡ recommandé : le texte entier, la place, la position, la date d'ajout, l'étiquette, et les pièces jointes ; une image en aperçu, un autre fichier par son nom et sa taille ; un appui sur une pièce jointe l'ouvre en grand (image) ou la télécharge (autre fichier).
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-40** Quels fichiers sont acceptés ? ➡ recommandé : tout type ; Horora'a n'en exécute ni n'en lit aucun, il les garde et les rend tels quels. Seules les images courantes (PNG, JPEG, GIF, WebP) sont montrées en aperçu.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-41** Quelle taille ? ➡ recommandé : 25 Mo au plus par fichier, 5 Go au total ; au-delà, le fichier est refusé avec un message qui dit la limite, et la tâche reste intacte.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-42** Sur le téléphone, où « coller » et « déposer » ne se font pas comme sur l'ordinateur ? ➡ recommandé : un bouton « Joindre » dans le panneau de détail, qui ouvre au choix l'appareil photo, les photos ou les fichiers du téléphone. Sur l'ordinateur, coller une image, glisser un fichier, ou ce même bouton.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-43** Peut-on retirer une pièce jointe ? ➡ recommandé : oui, dès ce changement, contrairement aux autres modifications (question-entretien-9) : une photo ou un document joint par erreur peut être confidentiel. Retirer demande une confirmation.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).
- **question-entretien-44** Le panneau des tâches signale-t-il les pièces jointes ? ➡ recommandé : oui, un trombone et leur nombre à droite de la ligne, à côté de l'étiquette.
  Réponse : la réponse recommandée — acceptée par défaut le 2026-10-30 (« oui à tout »).

Suite de question-entretien-37 : les pièces jointes forment le changement `joindre-des-fichiers`, ouvert le 2026-10-30 ; les questions 38 à 44 et leurs réponses y sont reprises et font foi là-bas. Pour ce changement-ci, le panneau de détail montre le texte entier, la place, la position, la date d'ajout et l'étiquette (question-entretien-39 sans les pièces jointes).

Besoin, première ligne élargie (question-entretien-29) : dire une tâche en une phrase, avec où elle va (projet, jalon ou liste, et position) et une étiquette, ou sans rien préciser pour qu'elle tombe dans la boîte d'entrée ; puis la retrouver là.

Frontière vide le 2026-10-30, après le tour 3.

### Tour 4 : l'application entière

Frontière rouverte par le pilote le 2026-10-30, avant tout engagement : « je veux réfléchir à l'application entière ». Consignes : trois questions au plus par échange ; design.md ne bouge pas, la pile se choisit après, à partir de ce que l'application doit être. L'épreuve d'intention signée ci-dessous reste écrite mais ne vaut plus engagement tant que ce tour n'est pas fermé ; elle sera réécrite ou confirmée à la fermeture. Proposal.md et les deltas suivront les réponses. Ce qui dépasse `ajouter-une-tache` ira dans SPEC.md (le pilote) ou dans d'autres changements.

- **question-entretien-45** À quoi Horora'a doit-il servir, dans un an, au-delà de dire une tâche et de la retrouver ? ➡ recommandé : quatre usages, dans cet ordre d'arrivée : **saisir** (dire une tâche, de partout, en une phrase) ; **ranger** (la hiérarchie, déplacer, marquer faite, vider la boîte d'entrée) ; **joindre** (images et fichiers) ; **parler** (un agent et la voix libre, vision-3 en entier). Pas de dates, pas de rappels, pas de partage : hors périmètre tenu.
  Réponse :
- **question-entretien-46** La hiérarchie est-elle fixe, projet › jalon › liste, ou libre, des dossiers dans des dossiers sans limite ? ➡ recommandé : fixe, trois niveaux nommés, c'est ce que dit vision-2 (« une hiérarchie définie ») et ce qui permet à une phrase dite d'être comprise sans ambiguïté (« dans le jalon » veut toujours dire la même chose). Une hiérarchie libre rend la phrase floue et l'arborescence sans fond.
  Réponse : « Je pense que la notion de jalon n'est pas la bonne. Je pense juste qu'une arborescence de projet, un projet, une liste, semble cohérent. Au final, un jalon de développement, c'est juste un sous-projet dans un grand projet avec une liste. Il faut surtout un identifiant unique pour chaque liste. » — confirmée le 2026-10-30, ni fixe ni libre : des projets emboîtés, des listes au bout. Conséquences : le mot **Jalon** sort de « Les mots », **Projet** et **Hiérarchie** se redéfinissent (SPEC.md, section 2, par le pilote) ; la tournure `dans le jalon <jalon>` disparaît ; les questions 1, 5 (test-5), 8, 23 et les specs `hierarchie` et `taches` sont à réécrire après ce tour. Forme exacte : question-entretien-49 ; identifiant : question-entretien-50.
- **question-entretien-47** Quelle est la vie d'une tâche, de dite à disparue ? ➡ recommandé : deux états seulement, **à faire** et **faite** ; une tâche faite quitte la liste mais reste consultable dans un historique de l'endroit, jamais effacée ; supprimer existe pour une erreur de saisie, avec confirmation. Pas d'état « en cours », pas d'échéance.
  Réponse : « Oui, je veux une vue sur l'historique des tâches pour une liste donnée. » — confirmée le 2026-10-30 : deux états, historique par liste, suppression avec confirmation.

Réponse à question-entretien-45, reçue le 2026-10-30 : « Saisir : dire une tâche de partout en une seule phrase, mais je veux aussi pouvoir l'utiliser de manière normale, comme une application comme TickTick. Je suis d'accord avec tes trois autres points sur ranger, joindre, parler. Les dates et les rappels seront dans un second temps, mais je compte bien les intégrer à un moment donné. Le partage n'est pas dans le scope du projet. » — confirmée, avec deux écarts à la recommandation : la saisie « normale » s'ajoute à la phrase (question-entretien-48) ; les dates et rappels ne sont pas hors périmètre mais **plus tard** : ils vont dans ROADMAP.md comme jalon à venir, pas au parking, et la troisième ligne du besoin (« pas de dates, assignations, rappels ») devient « pas dans ce changement ; les dates et rappels viendront après ». Le partage reste hors périmètre (SPEC.md, section 7).

#### Échange 2

- **question-entretien-48** « L'utiliser de manière normale, comme TickTick » : quels gestes, dans ce premier changement ? ➡ recommandé : cinq gestes, et pas plus : un bouton **+** dans le panneau des tâches qui crée une tâche dans la liste affichée, le texte tapé sur place ; dans le panneau de détail, **modifier** le texte, l'étiquette et la liste (un choix dans l'arborescence) ; **glisser** une tâche pour changer sa position ; une **case à cocher** pour la marquer faite ; **supprimer** avec confirmation. La phrase reste la voie rapide, les deux font la même chose. Pas repris de TickTick dans ce changement : priorités, sous-tâches, vues « Aujourd'hui » et « 7 jours » (elles viendront avec les dates), habitudes, calendrier, minuteur.
  Réponse : « Ok pour la création de tâche dans l'application. » — confirmée le 2026-10-30 pour la création par le bouton + ; les quatre autres gestes (modifier, glisser, cocher, supprimer) lus par l'étude comme acceptés avec, à contester.
- **question-entretien-49** La forme exacte de la hiérarchie : qu'est-ce qu'un projet contient, et combien ? ➡ recommandé : un projet contient des sous-projets et des listes, autant qu'on veut, sans limite de profondeur ; **seules les listes contiennent des tâches** ; une liste peut aussi être à la racine, sans projet, comme « courses » ; la boîte d'entrée est une liste à la racine qu'on ne peut ni renommer ni supprimer. Un projet n'a donc plus « sa » liste : ORION contient une liste « général » si on veut, et un sous-projet « wane » qui contient sa liste. L'arborescence montre tout ça emboîté, les tâches jamais ailleurs qu'au bout.
  Réponse : « Un projet peut contenir une liste et des sous-projets avec leur propre liste. » — confirmée le 2026-10-30, contre la recommandation : **une seule liste par projet**, pas plusieurs ; des sous-projets sans limite de profondeur, chacun avec sa liste. Lecture de l'étude, à contester : la liste d'un projet naît avec lui (comme test-17) ; les listes libres à la racine (question-entretien-2) et la boîte d'entrée restent ; ORION › wane se lit « le sous-projet wane d'ORION », et « dans ORION » sans plus désigne la liste d'ORION (question-entretien-1 tient).
- **question-entretien-50** L'identifiant unique de chaque liste : à quoi ressemble-t-il, qui le donne, à quoi sert-il ? ➡ recommandé : un **nom court** choisi par l'utilisateur à la création, lettres, chiffres et tirets, unique dans toute l'application, par exemple `orion-wane`, `courses` ; proposé automatiquement depuis le nom et modifiable ; visible dans le panneau de détail de la tâche et dans l'arborescence au survol ; c'est lui que la phrase emploie, `dans orion-wane, mettre à jour ce soir, en haut`, et que l'agent emploiera plus tard. Le nom long (« Mise à jour wane ») reste libre, affiché dans l'arborescence, et peut aussi servir dans la phrase quand il est unique. Les projets ont le même genre d'identifiant, pour pouvoir les nommer dans une phrase ou les déplacer plus tard.
  Réponse : « Je veux un identifiant uniquement pour la phrase ou le pilotage via la voix. » — confirmée le 2026-10-30, plus étroite que la recommandation : l'identifiant ne sert qu'à la phrase ; l'écran, l'arborescence et le panneau de détail montrent les noms, jamais l'identifiant, sauf là où on le règle. Sa forme : question-entretien-51.

#### Échange 3

- **question-entretien-51** La forme de l'identifiant de phrase : qui le donne, et à quoi il ressemble ? ➡ recommandé : chaque projet et chaque liste libre en a un, puisque chaque projet a une seule liste ; lettres sans accent, chiffres et tirets, unique dans toute l'application ; proposé automatiquement depuis le nom à la création (« Mise à jour wane » → `mise-a-jour-wane`), modifiable dans les réglages du projet ou de la liste, nulle part ailleurs ; la phrase dit `dans <identifiant>` ou `à <identifiant>`, et accepte aussi le nom long quand il est unique, pour que « à ORION » marche sans rien régler. La boîte d'entrée a l'identifiant `boite`.
  Réponse : « Et de séparer son identifiant de son libellé dans l'app ? » — confirmée le 2026-10-30 : deux champs distincts, le **libellé** affiché partout et l'**identifiant** pour la phrase seulement, réglés séparément ; le reste de la recommandation accepté. Mot retenu : « Libellé », à la place de « nom long ».
- **question-entretien-52** Une application « normale » cherche : faut-il une recherche dans toutes les tâches, par texte et par étiquette, quelle que soit la liste ? ➡ recommandé : oui, mais dans le changement « ranger », pas dans celui-ci ; un champ de recherche dans l'arborescence, les résultats dans le panneau des tâches avec leur liste à côté.
  Réponse : « Je vois surtout une recherche par étiquettes, du genre : étiquette “Perso” et “Travail”, qui affiche par historique les dernières tâches créées ou modifiées de la plus récente à la plus ancienne. Dur de rentrer dans les détails sans prototype. » — confirmée le 2026-10-30 : une **vue par étiquette**, toutes listes confondues, les tâches de la plus récemment créée ou modifiée à la plus ancienne ; dans le changement « ranger », pas celui-ci. « Sans prototype » : la fiche de l'étude prévoit le prototype jetable pour ce cas ; il sera proposé à l'entretien de « ranger », sur une branche `etude/vue-etiquettes` jamais fusionnée, avant la spec de cette vue.
- **question-entretien-53** Le découpage de l'application entière en changements, dans l'ordre, pour que chacun livre quelque chose d'utilisable : ➡ recommandé : **1. saisir** (ce changement : phrase et bouton +, hiérarchie projets emboîtés et listes, les cinq gestes, détail, appareils, étiquettes) ; **2. ranger** (historique des tâches faites par liste, renommer, déplacer, supprimer projets et listes, déplacer une tâche par glisser dans l'arborescence, recherche) ; **3. joindre** (le changement déjà ouvert, inchangé) ; **4. dater** (dates, rappels, vues « Aujourd'hui » et « 7 jours ») ; **5. parler** (un agent, la voix libre). Les quatre derniers vont dans ROADMAP.md comme jalons à venir ; seuls 1 et 3 ont un entretien aujourd'hui. Si oui, ce tour se ferme et je réécris l'épreuve d'intention, puis la proposition et les deltas.
  Réponse : « Oui, on peut fermer le tour. » — confirmée le 2026-10-30. Lecture de l'étude : la vue par étiquette (question-entretien-52) et l'historique des tâches faites restent répartis comme recommandé, l'historique **par liste** (question-entretien-47) dans ce changement avec la case à cocher, la vue **par étiquette** dans « ranger ».

Frontière vide le 2026-10-30, après le tour 4.

### Ce qui change dans les tours 1 à 3 après le tour 4

- question-entretien-1 : tient ; « à ORION » sans plus désigne la liste d'ORION.
- question-entretien-3 : les tournures deviennent `à <x>` et `dans <x>`, où x est l'identifiant ou le libellé d'un projet ou d'une liste ; `dans le jalon <jalon>` disparaît ; `en haut` et `étiquette <mot>` tiennent.
- question-entretien-8 : créer un projet, un sous-projet ou une liste libre, avec libellé et identifiant ; renommer, déplacer, supprimer passent du parking au changement « ranger ».
- question-entretien-9 : marquer faite, supprimer, modifier entrent dans ce changement (question-entretien-48) ; déplacer une tâche se fait par la liste dans le détail ; glisser vers l'arborescence et vider la boîte d'entrée en bloc vont à « ranger ».
- question-entretien-23 : l'arborescence montre les sous-projets emboîtés sous leur projet ; les jalons n'existent plus.
- Le besoin, troisième ligne : « un outil d'équipe, ou un gestionnaire de projet complet » devient « un outil d'équipe ; ni les dates, les rappels, l'agent ou la voix libre dans ce changement, qui viendront après ».
- SPEC.md, à corriger par le pilote : « Jalon » sort de « Les mots » ; vision-3 cite « dans le jalon wane », à relire (par exemple « ajoute à ORION, dans wane, … »).

## Épreuve d'intention

> Réécrite le 2026-10-30 à la fermeture du tour 4 ; la signature du matin ne vaut plus, le pilote signe de nouveau ou arrête.

1. Le besoin redit : dire une tâche en une phrase dans un champ toujours visible, au clavier ou par la dictée du téléphone, ou la créer par un bouton dans la liste affichée ; Horora'a la range dans le projet, le sous-projet ou la liste dits par leur identifiant ou leur libellé, en haut ou en bas, ou dans la boîte d'entrée s'il n'y a pas d'endroit dit ou s'il ne le trouve pas ; on la retrouve dans l'arborescence de projets emboîtés, le panneau des tâches, filtrable par étiquette, et le panneau de détail où on la modifie ; on la coche faite, on la retrouve dans les faites de sa liste, on la supprime ; sur une application installée au téléphone et à l'ordinateur, sans reconnexion.
2. La phrase de vision qu'il sert : vision-1 en entier ; vision-2 en entier, la hiérarchie étant désormais projets emboîtés et listes, sans jalon ; vision-3 en partie, la voix par la dictée du clavier et des tournures fixes, la compréhension libre et l'agent au changement « parler ».
3. Le principe qu'il tend : « sécurisé » de vision-1, contre « pas de limite de temps de connexion » (question-entretien-16), tenu par le mot de passe à la première ouverture et la coupure des autres appareils ; « une hiérarchie définie » de vision-2, contre des sous-projets sans limite de profondeur (question-entretien-49), tenu par « une seule liste par projet » et l'identifiant unique ; « on lui parle comme à quelqu'un » de vision-3, contre des tournures fixes (question-entretien-3).
4. Ce qu'on observera après, mesurable : sur les 20 premières tâches dites par la phrase avec un endroit, au moins 18 rangées au bon endroit sans correction ; pendant les deux premières semaines, au moins une tâche par jour, sur le téléphone comme sur l'ordinateur ; et au moins une tâche sur trois saisie par la phrase plutôt que par le bouton, signe que la phrase sert.
5. Ce qui ferait revenir en arrière : plus d'une phrase sur cinq dans la boîte d'entrée faute d'avoir été comprise, ce qui rouvre question-entretien-3 ; moins d'une tâche sur cinq saisie par la phrase après un mois, ce qui rouvre vision-3 ; une tâche lue par quelqu'un d'autre que le pilote, ce qui rouvre question-entretien-16 ; une arborescence de plus de trois niveaux de sous-projets, ce qui rouvre question-entretien-49.

Signée par le pilote le : 2026-10-30, « signé », après le tour 4.
