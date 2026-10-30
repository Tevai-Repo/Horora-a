# Spec Delta

## Purpose

Dire une tâche en une phrase ou la créer d'un bouton, la voir rangée au bon endroit de la hiérarchie, à la bonne position, avec au plus une étiquette ; la modifier, la cocher, la supprimer ; la retrouver sur chaque appareil.

## ADDED Requirements

### Requirement: Dire une tâche
L'application DOIT (MUST) offrir, sur chaque écran, un champ unique où l'on dit une tâche en une phrase ; la phrase validée devient une tâche dont le texte est la phrase sans ses tournures reconnues.

#### Scenario: Phrase sans endroit, sans réglage (test-1)
- **WHEN** l'utilisateur, en regardant ORION › wane, dit « acheter du fromage »
- **THEN** la tâche « acheter du fromage » est en bas de la boîte d'entrée, et pas dans ORION › wane

#### Scenario: Les mots du temps restent dans le texte (test-2)
- **WHEN** l'utilisateur dit « à ORION, mettre à jour ce soir »
- **THEN** le texte de la tâche est « mettre à jour ce soir », sans date comprise

#### Scenario: Phrase vide (test-3)
- **WHEN** l'utilisateur valide le champ vide
- **THEN** aucune tâche n'est créée et le champ reste ouvert

### Requirement: Ranger la tâche à l'endroit dit
L'application DOIT (MUST) ranger la tâche dans la liste de l'endroit dit par `à <x>` ou `dans <x>`, où x est l'identifiant, ou le libellé quand un seul endroit le porte, d'un projet, d'un sous-projet ou d'une liste libre ; majuscules et accents du libellé ne comptent pas.

#### Scenario: Un sous-projet par son identifiant (test-4)
- **WHEN** l'utilisateur dit « ajoute dans orion-wane, mettre à jour ce soir, en haut » et que `orion-wane` est l'identifiant du sous-projet wane d'ORION
- **THEN** la tâche « mettre à jour ce soir » est la première de la liste de ORION › wane

#### Scenario: La liste du projet par son libellé (test-5)
- **WHEN** l'utilisateur dit « à orion, relire la doc » et qu'un seul projet a le libellé ORION
- **THEN** la tâche est dans la liste d'ORION, hors de ses sous-projets

#### Scenario: Une liste libre (test-6)
- **WHEN** l'utilisateur dit « dans courses, du fromage »
- **THEN** la tâche « du fromage » est dans la liste libre courses

#### Scenario: Libellé porté par plusieurs endroits (test-7)
- **WHEN** ORION et ATLAS ont chacun un sous-projet au libellé « général » et que l'utilisateur dit « dans général, ranger le bureau »
- **THEN** la boîte d'entrée contient « dans général, ranger le bureau », et la confirmation dit « plusieurs endroits s'appellent général, rangée dans la boîte d'entrée »

### Requirement: Renvoyer un endroit introuvable dans la boîte d'entrée
L'application DOIT (MUST) ranger dans la boîte d'entrée, avec la phrase entière comme texte, toute tâche dont l'endroit dit n'existe pas, et le dire dans la confirmation.

#### Scenario: Endroit inconnu (test-8)
- **WHEN** l'utilisateur dit « dans ouane, mettre à jour » et qu'aucun endroit n'a l'identifiant ni le libellé ouane
- **THEN** la boîte d'entrée contient « dans ouane, mettre à jour », et la confirmation dit « ouane introuvable, rangée dans la boîte d'entrée »

### Requirement: Placer la tâche en haut ou en bas
L'application DOIT (MUST) placer la tâche en tête de sa liste quand la phrase contient `en haut`, et en fin de liste sinon.

#### Scenario: En haut (test-9)
- **WHEN** la liste courses contient « pain » et que l'utilisateur dit « dans courses, lait, en haut »
- **THEN** la liste courses montre « lait » puis « pain »

#### Scenario: En bas, sans réglage (test-10)
- **WHEN** la liste courses contient « pain » et que l'utilisateur dit « dans courses, lait »
- **THEN** la liste courses montre « pain » puis « lait »

### Requirement: Confirmer le rangement
L'application DOIT (MUST) afficher, après chaque tâche dite, une ligne qui dit l'endroit et la position de la tâche.

#### Scenario: Confirmation (test-11)
- **WHEN** l'utilisateur dit « dans orion-wane, mettre à jour, en haut »
- **THEN** une ligne dit « Rangée dans ORION › wane, en haut »

### Requirement: Créer une tâche par le bouton
L'application DOIT (MUST) offrir dans le panneau des tâches un bouton **+** qui crée une tâche en bas de la liste affichée, son texte tapé sur place.

#### Scenario: Création dans la liste affichée (test-12)
- **WHEN** l'utilisateur regarde ORION › wane, appuie sur **+**, tape « tester la 4G » et valide
- **THEN** « tester la 4G » est la dernière tâche de ORION › wane

#### Scenario: Texte vide (test-13)
- **WHEN** l'utilisateur appuie sur **+** et valide sans rien taper
- **THEN** aucune tâche n'est créée

### Requirement: Modifier une tâche
L'application DOIT (MUST) permettre, dans le panneau de détail, de changer le texte, l'étiquette et la liste d'une tâche ; une tâche qui change de liste va en bas de la nouvelle.

#### Scenario: Changer de liste (test-14)
- **WHEN** l'utilisateur ouvre « acheter du fromage » depuis la boîte d'entrée et choisit la liste courses dans le détail
- **THEN** la tâche est la dernière de courses et n'est plus dans la boîte d'entrée

#### Scenario: Texte vidé (test-15)
- **WHEN** l'utilisateur efface tout le texte d'une tâche dans le détail et valide
- **THEN** un message refuse, et le texte d'avant est gardé

### Requirement: Déplacer une tâche dans sa liste
L'application DOIT (MUST) permettre de glisser une tâche dans le panneau des tâches pour changer sa position, et garder cet ordre.

#### Scenario: Glisser en première position (test-16)
- **WHEN** la liste courses montre « pain », « lait », « œufs » et que l'utilisateur glisse « œufs » au-dessus de « pain »
- **THEN** la liste montre « œufs », « pain », « lait », encore après rafraîchissement

### Requirement: Cocher une tâche faite
L'application DOIT (MUST) offrir une case par tâche ; cochée, la tâche quitte le panneau des tâches et apparaît dans les faites de sa liste, les plus récentes en premier, d'où on peut la décocher.

#### Scenario: Cocher (test-17)
- **WHEN** l'utilisateur coche « pain » dans courses
- **THEN** « pain » n'est plus dans la liste courses, et « Faites » de courses la montre en premier avec la date du jour

#### Scenario: Décocher depuis les faites (test-18)
- **WHEN** l'utilisateur ouvre « Faites » de courses et décoche « pain »
- **THEN** « pain » est de nouveau la dernière tâche de courses

### Requirement: Supprimer une tâche
L'application DOIT (MUST) supprimer une tâche après une confirmation, et la laisser en place si la confirmation est refusée.

#### Scenario: Suppression confirmée (test-19)
- **WHEN** l'utilisateur supprime « pain » et confirme
- **THEN** « pain » n'est ni dans courses ni dans ses faites

#### Scenario: Suppression annulée (test-20)
- **WHEN** l'utilisateur supprime « pain » et refuse la confirmation
- **THEN** « pain » est toujours là

### Requirement: Donner une étiquette
L'application DOIT (MUST) donner à la tâche l'étiquette dite par `étiquette <mot>`, au plus une par tâche, que le mot ait déjà servi ou non, et la montrer en pastille à droite du texte dans le panneau des tâches et dans le panneau de détail.

#### Scenario: Étiquette nouvelle (test-21)
- **WHEN** l'utilisateur dit « à orion, corriger le menu, étiquette urgent » et que « urgent » n'a jamais servi
- **THEN** la tâche est dans la liste d'ORION avec la pastille « urgent »

#### Scenario: Sans étiquette, sans réglage (test-22)
- **WHEN** l'utilisateur dit « à orion, corriger le menu »
- **THEN** la tâche n'a pas de pastille

### Requirement: Filtrer par étiquette
L'application DOIT (MUST) ne montrer, après un appui sur une étiquette dans le panneau des tâches, que les tâches de la liste affichée qui la portent, dans leur ordre, et montrer de nouveau toute la liste au second appui.

#### Scenario: Filtre puis retour (test-23)
- **WHEN** la liste d'ORION contient « a » (urgent), « b », « c » (urgent) et que l'utilisateur appuie sur « urgent », puis de nouveau
- **THEN** il voit « a », « c », puis « a », « b », « c »

### Requirement: Montrer le détail d'une tâche
L'application DOIT (MUST) montrer, quand on choisit une tâche, son texte entier, sa place par les libellés, sa position dans la liste, sa date d'ajout et son étiquette.

#### Scenario: Détail (test-24)
- **WHEN** l'utilisateur choisit « mettre à jour ce soir » dans ORION › wane
- **THEN** le panneau de détail montre ce texte, « ORION › wane », « 1re », la date d'ajout et l'étiquette s'il y en a une ; aucun identifiant n'est affiché

### Requirement: Retrouver la tâche sur l'autre appareil
L'application DOIT (MUST) montrer sur chaque appareil, à son ouverture ou au rafraîchissement de la liste, les tâches ajoutées, modifiées ou cochées depuis un autre appareil.

#### Scenario: Du téléphone à l'ordinateur (test-25)
- **WHEN** l'utilisateur dit une tâche pour ORION › wane sur le téléphone, puis rafraîchit ORION › wane sur l'ordinateur
- **THEN** la tâche y est, à la même position

#### Scenario: Ajout sans réseau (test-26)
- **WHEN** l'utilisateur dit une tâche sur le téléphone sans accès à Internet
- **THEN** l'application dit que la tâche n'est pas enregistrée et garde la phrase dans le champ
