# Décisions

> Ce que c'est : ce qui a été décidé, et pourquoi. Lu par : tout agent quand une règle compte, le documentaliste, la mère à la rétro. Écrit par : l'intégrateur, après la décision du pilote. Change par : ajout seulement. Une entrée par décision, numérotée, datée, immuable : une décision changée en reçoit une nouvelle qui cite l'ancienne. Cinq rubriques en gras, toujours dans cet ordre (decision-fabrication-10) : **Contexte**, **Décision**, **Rejeté**, **Coût**, **Reflet**, la dernière disant dans quel fichier la décision est appliquée. Une rubrique non écrite dit « Non écrit ». Un seul fichier jusqu'à vingt décisions ; au-delà, un fichier par décision avec un index. Un changement engagé après la porte-engagement a sa décision ici, avec « Reflet : openspec/changes/<nom>/ ».

## Registre des dépendances

Une ligne par dépendance, lue par controle-deps quand le projet l'a : `` - `<nom>` (`<type>`, `<version>`) : <pourquoi, et son coût> ``.

- `openspec` (`outil du poste`, `1.14.3`) : la forme des specs vérifiée par controle-spec ; installé par le pilote seul, télémétrie et mise à jour réseau coupées ; n'entre pas dans le produit.

## decision-1, 2026-10-29, Kit v0 adopté

**Contexte.** porte-kit. Dépôt Horora'a vide, sans commit ni code : `origine = "neuf"`. Projet-école, premier banc d'essai du Kit (decision-fabrication-19).
**Décision.** Le pilote adopte le Kit v0 de la fabrication ; l'intégrateur l'installe de 23:14 à 23:16 le 2026-10-29, chronomètre lancé après la lecture de la procédure et des modèles, lecture non chronométrée.
**Rejeté.** Rester sans harnais.
**Coût.** La durée ci-dessus ; retour arrière : rester à la version précédente, ici sans harnais.
**Reflet.** `harnais.toml`, `harnais.lock`, AGENTS.md, CLAUDE.md, pilotage/, openspec/, scripts/, .githooks/, .claude/, reflexion/journal-pilotage.md ; étiquette `kit-v0`.

La decision-2, formule de l'équipage, attend la question-3.
