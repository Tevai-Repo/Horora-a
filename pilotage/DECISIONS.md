# Décisions

> Ce que c'est : ce qui a été décidé, et pourquoi. Lu par : tout agent quand une règle compte, le documentaliste, la mère à la rétro. Écrit par : l'intégrateur, après la décision du pilote. Change par : ajout seulement. Une entrée par décision, numérotée, datée, immuable : une décision changée en reçoit une nouvelle qui cite l'ancienne. Cinq rubriques en gras, toujours dans cet ordre (decision-fabrication-10) : **Contexte**, **Décision**, **Rejeté**, **Coût**, **Reflet**, la dernière disant dans quel fichier la décision est appliquée. Une rubrique non écrite dit « Non écrit ». Un seul fichier jusqu'à vingt décisions ; au-delà, un fichier par décision avec un index. Un changement engagé après la porte-engagement a sa décision ici, avec « Reflet : openspec/changes/<nom>/ ».

## Registre des dépendances

Une ligne par dépendance, lue par controle-deps quand le projet l'a : `` - `<nom>` (`<type>`, `<version>`) : <pourquoi, et son coût> ``.

- `node` (`outil du poste`, `24.15`) : serveur HTTP, base SQLite (`node:sqlite`), tests (`node:test`), hachage du mot de passe (`node:crypto`), TypeScript exécuté sans compilateur ; aucune dépendance npm ; version épinglée dans le projet, seul risque relevé : `node:sqlite` (decision-3).
- `hébergement B1` (`l'ordinateur du pilote`, `port 443, DynDNS, Let's Encrypt`) : Horora'a joignable depuis Internet sans tiers qui voie les tâches, 0 € ; le fournisseur DynDNS ne voit que l'adresse IP ; l'ordinateur reste allumé ; première production (SECURITY.md, règle 8). Le client ACME, une dépendance ou environ 300 lignes, se tranche à l'ouverture du jalon (decision-3).
- `stockage des pièces jointes` (`disque du poste`, `5 Go`) : à côté de la base, fichiers nommés par leur empreinte (decision-4).
- `openspec` (`outil du poste`, `1.14.3`) : la forme des specs vérifiée par controle-spec ; installé par le pilote seul, télémétrie et mise à jour réseau coupées ; n'entre pas dans le produit.

## decision-1, 2026-10-29, Kit v0 adopté

**Contexte.** porte-kit. Dépôt Horora'a vide, sans commit ni code : `origine = "neuf"`. Projet-école, premier banc d'essai du Kit (decision-fabrication-19).
**Décision.** Le pilote adopte le Kit v0 de la fabrication ; l'intégrateur l'installe de 23:14 à 23:16 le 2026-10-29, chronomètre lancé après la lecture de la procédure et des modèles, lecture non chronométrée.
**Rejeté.** Rester sans harnais.
**Coût.** La durée ci-dessus ; retour arrière : rester à la version précédente, ici sans harnais.
**Reflet.** `harnais.toml`, `harnais.lock`, AGENTS.md, CLAUDE.md, pilotage/, openspec/, scripts/, .githooks/, .claude/, reflexion/journal-pilotage.md ; étiquette `kit-v0`.


## decision-2, 2026-10-30, `ajouter-une-tache` engagé, option (b)

**Contexte.** porte-engagement. Entretien en quatre tours, épreuve d'intention réécrite après le tour 4 et signée par le pilote ; proposition (a) parking, (b) minimale, (c) avec compréhension libre par un modèle de langue (question-5).
**Décision.** Option (b) : les tournures fixes, aucune tâche envoyée à un service tiers, avec toutes les recommandations de l'étude. Les huit points de détail sont tranchés « oui » tels qu'écrits dans proposal.md. Budgets retenus : la confirmation d'un ajout en moins d'une seconde ; l'application ouverte en moins de deux secondes sur le téléphone en 4G ; aucune tâche envoyée à un service tiers. Invariants retenus : chaque tâche a un seul endroit ; une phrase dite n'est jamais perdue, au pire dans la boîte d'entrée mot pour mot ; une tâche cochée n'est jamais effacée par la coche. Le sondage FTS5 de design.md est fait par l'étude avant l'écriture des tâches.
**Rejeté.** (a), le parking : le Kit resterait sans premier jalon. (c) : chaque phrase partirait chez un fournisseur, contre le budget « aucune tâche envoyée à un service tiers » ; elle revient avec « parler », ou si plus d'une phrase sur cinq n'est pas comprise.
**Coût.** La référence des durées du projet, notée 1 ; aucune tâche n'est encore mesurée.
**Reflet.** openspec/changes/ajouter-une-tache/ ; à l'archivage, SPEC.md (mots, index, budgets, invariants) ; ROADMAP.md (jalon-1).

## decision-3, 2026-10-30, la pile : Node 24 sans dépendance, hébergé sur l'ordinateur du pilote

**Contexte.** question-2 et design.md d'`ajouter-une-tache` : A1 Node 24 ou A2 .NET 8 pour le langage, B1 l'ordinateur du pilote ou B2 un serveur loué pour l'hébergement.
**Décision.** A1 et B1, les recommandations de l'étude ; les choix C de design.md suivent sa recommandation : client web installable sans cadre, phrase comprise par le serveur, SQLite, cookie d'appareil, tests `node:test`.
**Rejeté.** A2 : .NET 8 sort du support le 10 novembre 2026 et .NET 10 serait une installation. B2 : l'hébergeur a le disque, donc la possibilité de lire les tâches ; repli si l'ordinateur ne peut pas rester allumé, à reconsidérer à « dater ».
**Coût.** Zéro dépendance npm, 0 € ; l'ordinateur reste allumé ; le pilote vérifie que sa box ouvre le port 443 avant l'ouverture du jalon.
**Reflet.** Registre des dépendances ci-dessus ; openspec/changes/ajouter-une-tache/design.md ; à l'ouverture du jalon : CONTRAT.md, la zone et le rôle développeur (AGENTS.md, harnais.toml), scripts/check.ps1, pilotage/SECURITY.md.

## decision-4, 2026-10-30, `joindre-des-fichiers` engagé, option (b)

**Contexte.** porte-engagement. Entretien signé ; proposition (a) parking, (b) minimale, (c) avec aperçu des PDF et documents (question-6).
**Décision.** Option (b) avec toutes les recommandations de l'étude : fichiers gardés et rendus sans être lus ; les trois points de détail tranchés « oui » ; budgets 25 Mo par fichier et 5 Go en tout. Se fait et s'archive après `ajouter-une-tache`.
**Rejeté.** (a), le parking. (c) : Horora'a lirait le contenu de fichiers venus de l'extérieur, contre la règle 4 de SECURITY.md.
**Coût.** Environ 0,4 fois `ajouter-une-tache` ; de la place sur le disque du poste.
**Reflet.** openspec/changes/joindre-des-fichiers/ ; ROADMAP.md (jalon-2) ; à l'archivage, SPEC.md.

## decision-5, 2026-10-30, « utilisateur » pour la personne qui se sert du produit

**Contexte.** question-4 : « pilote » désignait à la fois la personne qui se sert d'Horora'a et celle qui pilote le harnais.
**Décision.** Option (a) : le mot « Utilisateur » entre dans « Les mots » de SPEC.md ; les scénarios des deux changements disent « l'utilisateur » ; « pilote » reste le mot du harnais. La vision, écrite par le pilote, n'est pas retouchée.
**Rejeté.** (b), un seul mot pour les deux.
**Coût.** Un renommage dans les deltas, sans changement de comportement.
**Reflet.** pilotage/SPEC.md, section 2 ; openspec/changes/*/specs/.
