# Spec Delta

## Purpose

L'arbre où chaque tâche a un seul endroit : la boîte d'entrée, les listes libres, les projets et sous-projets emboîtés, chacun avec sa liste. On le crée, on le parcourt, on y choisit l'endroit dont on veut voir les tâches.

## ADDED Requirements

### Requirement: Créer un projet, un sous-projet ou une liste libre
L'application DOIT (MUST) permettre de créer un projet à la racine, un sous-projet dans un projet, ou une liste libre à la racine, chacun par son libellé ; un projet ou un sous-projet naît avec sa liste, vide.

#### Scenario: Projet puis sous-projet (test-27)
- **WHEN** l'utilisateur crée le projet « ORION », puis le sous-projet « wane » dans ORION
- **THEN** l'arborescence montre ORION avec wane dessous, et chacun a une liste vide

#### Scenario: Libellé vide (test-28)
- **WHEN** l'utilisateur valide la création sans libellé
- **THEN** rien n'est créé

### Requirement: Donner un identifiant de phrase
L'application DOIT (MUST) donner à chaque projet, sous-projet et liste libre un identifiant unique dans l'application, en lettres sans accent, chiffres et tirets, proposé depuis le libellé à la création et modifiable dans ses réglages seulement ; la boîte d'entrée a l'identifiant `boite`.

#### Scenario: Identifiant proposé, sans réglage (test-29)
- **WHEN** l'utilisateur crée le sous-projet « Mise à jour wane » dans ORION sans toucher à l'identifiant
- **THEN** son identifiant est `mise-a-jour-wane`, visible dans ses réglages et nulle part ailleurs

#### Scenario: Identifiant déjà pris (test-30)
- **WHEN** l'utilisateur règle l'identifiant d'une liste libre sur `orion-wane`, déjà porté par un sous-projet
- **THEN** un message refuse et l'identifiant d'avant est gardé

### Requirement: Afficher l'arborescence
L'application DOIT (MUST) montrer la boîte d'entrée en tête avec le nombre de tâches qu'elle contient, puis les projets avec leurs sous-projets emboîtés dessous, puis les listes libres ; à chaque niveau, par ordre alphabétique des libellés.

#### Scenario: Ordre (test-31)
- **WHEN** existent la liste libre courses, les projets ORION et ATLAS, ORION avec les sous-projets wane et alpha, alpha avec le sous-projet tests, et 3 tâches dans la boîte d'entrée
- **THEN** l'arborescence montre : boîte d'entrée (3), ATLAS, ORION, alpha, tests, wane, courses, les sous-projets décalés sous leur projet

### Requirement: Montrer les tâches d'un endroit
L'application DOIT (MUST) montrer, quand on choisit un endroit dans l'arborescence, les tâches de sa liste dans le panneau des tâches, dans leur ordre, et elles seules ; choisir un projet montre sa liste, sans les tâches de ses sous-projets.

#### Scenario: Projet sans ses sous-projets (test-32)
- **WHEN** ORION a « relire la doc » dans sa liste et « mettre à jour » dans wane, et que l'utilisateur choisit ORION
- **THEN** le panneau des tâches montre « relire la doc » seulement

### Requirement: Rouvrir au dernier endroit
L'application DOIT (MUST), sur l'ordinateur, rouvrir sur l'endroit choisi en dernier sur cet appareil, et sur la boîte d'entrée la toute première fois.

#### Scenario: Première ouverture, sans réglage (test-33)
- **WHEN** l'utilisateur ouvre l'application pour la première fois sur l'ordinateur
- **THEN** la boîte d'entrée est choisie

#### Scenario: Ouverture suivante (test-34)
- **WHEN** l'utilisateur a choisi ORION › wane, ferme puis rouvre l'application sur l'ordinateur
- **THEN** ORION › wane est choisi

### Requirement: Parcourir sur le téléphone
L'application DOIT (MUST), sur le téléphone, montrer l'arborescence, le panneau des tâches et le panneau de détail l'un après l'autre en plein écran, s'ouvrir sur l'arborescence, et remonter d'un cran par un bouton retour.

#### Scenario: Descendre puis remonter (test-35)
- **WHEN** l'utilisateur ouvre l'application sur le téléphone, appuie sur ORION › wane, puis sur une tâche, puis deux fois sur retour
- **THEN** il voit l'arborescence, les tâches de wane, le détail, les tâches de wane, l'arborescence
