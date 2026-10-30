# Proposition

## Why

Une tâche a souvent besoin de ce qu'on a sous les yeux : une capture d'écran du bug, la photo d'une étiquette, le document à relire. Le pilote veut les coller ou les déposer dans le détail de la tâche et les revoir sur l'autre appareil (entretien.md, question-entretien-1 ; `ajouter-une-tache`, question-entretien-36 et 37).

## What Changes

- Le panneau de détail d'une tâche reçoit des pièces jointes : coller une image ou glisser un fichier sur l'ordinateur, un bouton « Joindre » partout, qui ouvre sur le téléphone l'appareil photo, les photos ou les fichiers (question-entretien-39, 42).
- Une image courante (PNG, JPEG, GIF, WebP) se voit en aperçu et s'ouvre en grand ; tout autre fichier se montre par son nom et sa taille et se télécharge tel quel (question-entretien-39, 40).
- 25 Mo au plus par fichier, 5 Go en tout ; au-delà, refus avec un message qui dit la limite (question-entretien-41).
- Une pièce jointe se retire, après confirmation (question-entretien-43).
- Dans le panneau des tâches, un trombone et le nombre de pièces jointes, à côté de l'étiquette (question-entretien-44).

## Ce que ça ne doit pas devenir

Un espace de stockage de documents, ni un éditeur de fichiers.

## Mots

- Ajouté : `Pièce jointe` : une image ou un fichier attaché à une tâche.
- Modifié : `Tâche` : une chose à faire, en une ligne, avec sa place, au plus une étiquette et ses pièces jointes.

## Capacités

### Nouvelles
- `pieces-jointes` : joindre, voir, télécharger, retirer les images et fichiers d'une tâche, dans les limites de taille.

### Modifiées
Aucune : `taches` n'est pas encore archivée ; ce changement s'archive après `ajouter-une-tache`.

### Non touchées, avec la raison
- `taches` (dans `ajouter-une-tache`) : le panneau de détail et le panneau des tâches gagnent un contenu, sans qu'une de ses exigences change.
- `hierarchie`, `appareils` (dans `ajouter-une-tache`) : rien de leur comportement ne dépend des pièces jointes.

## Invariants liés

Aucun n'est écrit. Celui proposé par `ajouter-une-tache`, « chaque tâche a un seul endroit », est tenu : une pièce jointe appartient à une seule tâche.

## Options

Budgets proposés, à décider avec l'option : 25 Mo par fichier et 5 Go en tout, repris de l'entretien. Aucune tâche du projet n'est mesurée : les durées se comparent à `ajouter-une-tache` (b), notée 1.

### (a) Ne rien faire, laisser au parking
L'utilisateur ne voit rien de neuf. Aucune marge consommée, aucune durée. Risque : les captures et documents restent hors d'Horora'a, dans un autre outil.

### (b) La minimale : ce que l'entretien a retenu
L'utilisateur voit tout ce que dit « What Changes ». Budgets : 0 % du stockage au départ, 25 Mo au plus par geste. Durée : environ 0,4 fois `ajouter-une-tache` (b). Dépendances nouvelles : de la place de stockage chez l'hébergeur, au registre de DECISIONS.md. CONTRAT : une garantie de plus, un fichier rendu identique octet pour octet. Frontière de confiance nouvelle : des fichiers venus de l'extérieur, gardés et rendus sans être ni ouverts ni exécutés (SECURITY.md, règle 4). Risques : un fichier confidentiel lisible depuis un appareil perdu jusqu'à sa coupure ; la place qui se remplit.

### (c) (b), plus l'aperçu des PDF et documents bureautiques
L'utilisateur lit un PDF ou un document sans le télécharger. Budgets : ceux de (b). Durée : environ 0,7 fois `ajouter-une-tache` (b). Dépendances nouvelles : celles de (b), plus un lecteur de documents. Frontière de confiance : Horora'a lit désormais le contenu de fichiers venus de l'extérieur, ce que la règle 4 de SECURITY.md exclut aujourd'hui ; un document piégé devient un risque. Risques : ceux de (b), plus les failles du lecteur.

**Recommandation** : (b), parce qu'elle livre le signe du besoin sans qu'Horora'a lise jamais le contenu d'un fichier.

## Points de détail non tranchés par l'entretien

- Plusieurs fichiers d'un coup : chacun est joint ou refusé à part, avec son message. Recommandé : oui.
- Un fichier joint sans accès à Internet : refusé avec un message, rien n'est joint. Recommandé : oui, comme une tâche dite sans réseau dans `ajouter-une-tache`.
- La limite des 5 Go atteinte : un message le dit à chaque essai ; libérer de la place passe par le retrait. Recommandé : oui.

## Impact

- Dépend de `ajouter-une-tache` : engagé, fait et archivé après lui.
- SECURITY.md, face produit : des fichiers extérieurs gardés ; règle 4 tenue en (b), à réécrire en (c).
- DECISIONS.md : la place de stockage au registre.
- SPEC.md : le mot `Pièce jointe`, la définition de `Tâche`, la capacité `pieces-jointes`, les budgets de taille.

## Décision du pilote

<!-- Remplie par l'intégrateur après la porte-engagement, jamais par l'étude. -->
Date : 2026-10-30 · Option retenue : (b), la minimale, avec toutes les recommandations de l'étude : les trois points de détail « oui », les budgets 25 Mo par fichier et 5 Go en tout · Décision : decision-4 · Reflet : openspec/changes/joindre-des-fichiers/
