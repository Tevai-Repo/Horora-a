# Spec Delta

## Purpose

Les images et fichiers attachés à une tâche : on les joint depuis le panneau de détail, on les revoit ou les télécharge sur chaque appareil, on les retire.

## ADDED Requirements

### Requirement: Joindre une image ou un fichier
L'application DOIT (MUST) joindre à la tâche affichée dans le panneau de détail une image collée, un fichier glissé, ou ce qu'on choisit par le bouton « Joindre » (sur le téléphone : appareil photo, photos ou fichiers).

#### Scenario: Coller une capture sur l'ordinateur (test-42)
- **WHEN** l'utilisateur colle une capture d'écran dans le panneau de détail de « corriger le menu »
- **THEN** la capture apparaît en aperçu dans ce panneau

#### Scenario: Photo depuis le téléphone (test-43)
- **WHEN** l'utilisateur appuie sur « Joindre » dans le détail d'une tâche et prend une photo
- **THEN** la photo apparaît en aperçu dans ce détail

#### Scenario: Sans accès à Internet (test-44)
- **WHEN** l'utilisateur joint un fichier sans accès à Internet
- **THEN** un message dit que le fichier n'est pas joint, et la tâche n'a rien de plus

### Requirement: Refuser un fichier trop grand
L'application DOIT (MUST) refuser un fichier de plus de 25 Mo, ou qui ferait dépasser 5 Go au total, avec un message qui dit la limite, sans rien changer à la tâche.

#### Scenario: Fichier de 30 Mo (test-45)
- **WHEN** l'utilisateur glisse un fichier de 30 Mo
- **THEN** un message dit « 25 Mo au plus par fichier » et la tâche n'a pas de pièce jointe de plus

#### Scenario: Place pleine (test-46)
- **WHEN** 4,99 Go sont occupés et que l'utilisateur joint un fichier de 20 Mo
- **THEN** un message dit « 5 Go au plus en tout » et rien n'est joint

### Requirement: Voir et télécharger une pièce jointe
L'application DOIT (MUST) montrer une image PNG, JPEG, GIF ou WebP en aperçu et l'ouvrir en grand à l'appui, montrer tout autre fichier par son nom et sa taille et le télécharger à l'appui, identique à l'original, sur tout appareil ouvert.

#### Scenario: Image sur l'autre appareil (test-47)
- **WHEN** l'utilisateur a collé une capture sur l'ordinateur, puis ouvre la même tâche sur le téléphone
- **THEN** il voit la capture en aperçu et, à l'appui, en grand

#### Scenario: Fichier rendu tel quel (test-48)
- **WHEN** l'utilisateur a joint « devis.pdf » de 1,2 Mo, puis appuie dessus sur l'autre appareil
- **THEN** il télécharge un fichier « devis.pdf » de même taille et de même contenu, sans aperçu

### Requirement: Retirer une pièce jointe
L'application DOIT (MUST) retirer une pièce jointe de sa tâche après une confirmation, et la laisser en place si la confirmation est refusée.

#### Scenario: Retrait confirmé (test-49)
- **WHEN** l'utilisateur retire une photo et confirme
- **THEN** la photo n'est plus dans le détail, ni sur l'autre appareil à son rafraîchissement

#### Scenario: Retrait annulé (test-50)
- **WHEN** l'utilisateur retire une photo et refuse la confirmation
- **THEN** la photo est toujours là

### Requirement: Signaler les pièces jointes dans la liste
L'application DOIT (MUST) montrer dans le panneau des tâches, à droite de toute tâche qui a des pièces jointes, un trombone et leur nombre, à côté de l'étiquette.

#### Scenario: Deux pièces jointes (test-51)
- **WHEN** « corriger le menu » a deux pièces jointes et l'étiquette « urgent »
- **THEN** sa ligne montre la pastille « urgent » et un trombone avec 2

#### Scenario: Aucune pièce jointe, sans réglage (test-52)
- **WHEN** une tâche n'a pas de pièce jointe
- **THEN** sa ligne ne montre pas de trombone
