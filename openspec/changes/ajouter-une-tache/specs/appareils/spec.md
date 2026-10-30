# Spec Delta

## Purpose

Les téléphones et ordinateurs de l'utilisateur où Horora'a est installé : comment l'installer, l'ouvrir une première fois, y rester, et couper un appareil perdu.

## ADDED Requirements

### Requirement: Installer l'application
L'application DOIT (MUST) pouvoir s'installer depuis Horora'a lui-même, sans magasin d'applications, en une icône sur l'écran d'accueil du téléphone et sur l'ordinateur, et s'ouvrir en plein écran sans barre de navigateur.

#### Scenario: Installation sur le téléphone (test-36)
- **WHEN** l'utilisateur ouvre l'adresse d'Horora'a sur son téléphone et choisit de l'installer
- **THEN** une icône Horora'a est sur l'écran d'accueil, et un appui ouvre l'application en plein écran

### Requirement: Ouvrir un appareil par le mot de passe
L'application DOIT (MUST) demander le mot de passe à la première ouverture sur un appareil, et ne rien montrer des tâches tant qu'il n'est pas juste.

#### Scenario: Mot de passe juste (test-37)
- **WHEN** l'utilisateur ouvre l'application sur un nouvel appareil et donne le bon mot de passe
- **THEN** il voit ses tâches

#### Scenario: Mot de passe faux (test-38)
- **WHEN** quelqu'un donne un mauvais mot de passe
- **THEN** un message dit que le mot de passe est faux, et aucune tâche, aucun libellé de projet ni de liste n'est visible

### Requirement: Rester connecté
L'application DOIT (MUST) s'ouvrir sans redemander le mot de passe sur un appareil déjà ouvert, sans limite de temps, tant que l'appareil n'a pas été coupé.

#### Scenario: Ouverture un mois après (test-39)
- **WHEN** l'utilisateur rouvre l'application sur son téléphone un mois après sa dernière utilisation
- **THEN** il voit ses tâches sans donner de mot de passe

### Requirement: Couper les autres appareils
L'application DOIT (MUST) offrir « déconnecter tous les autres appareils » ; chaque autre appareil redemande alors le mot de passe à sa prochaine ouverture et ne montre plus rien avant.

#### Scenario: Téléphone perdu (test-40)
- **WHEN** l'utilisateur choisit « déconnecter tous les autres appareils » sur l'ordinateur, puis quelqu'un ouvre l'application sur le téléphone perdu
- **THEN** le téléphone demande le mot de passe et ne montre aucune tâche ; l'ordinateur reste ouvert

### Requirement: Ouvrir depuis Internet
L'application DOIT (MUST) s'ouvrir et enregistrer les tâches depuis tout réseau relié à Internet, en 4G comme en Wi-Fi.

#### Scenario: En 4G (test-41)
- **WHEN** l'utilisateur, hors de chez lui, en 4G, dit une tâche
- **THEN** la tâche est enregistrée et la confirmation s'affiche
