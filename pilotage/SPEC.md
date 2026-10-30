# Horora'a — Spécification v0

> Ce que c'est : pour qui, avec quels mots, dans quelles limites le produit existe. Lu par : l'étude, les développeurs, la QA, le pilote. Écrit par : l'intégrateur, après la porte-engagement. Change par : un changement archivé après le test du pilote. Statut : installée le 2026-10-29 ; sections 1, 2, 4 et 7 dictées par le pilote le 2026-10-30, tapées par le laboratoire d'Harnais sur son ordre, le pilote n'étant pas devant son poste. Le comportement du produit vit dans `openspec/specs/`, une capacité par dossier ; ce fichier dit le reste : la vision, les mots, les principes, l'index des capacités, les budgets, les invariants, le hors périmètre. La spec suffit : n'importe quel agent, dans n'importe quel langage, sans une ligne du code d'avant, refait le logiciel en entier ; pas le même code, pas le même écran, pas le même octet, le même usage pour l'utilisateur (decision-fabrication-8, decision-fabrication-20). Les bibliothèques tierces et les données ne sont pas le code source : la spec dit ce qu'elle attend des unes et le schéma des autres. Elle gagne contre le code : un écart est un défaut du code ou une décision qui change la spec. Toute fonctionnalité hors de ce document et des specs est hors périmètre tant qu'une décision ne l'y ajoute pas. Sur un projet existant, l'index des capacités se remplit en premier, relevé depuis les écrans et jamais depuis le code, et chaque capacité reçoit sa spec le jour où un changement la touche (decision-fabrication-12).

## 1. Vision

- vision-1 : Un gestionnaire de tâches pour une seule personne, le pilote, sécurisé, aussi facile à ouvrir sur son téléphone que sur son ordinateur.
- vision-2 : Chaque tâche a sa place dans une hiérarchie définie, du « fromage sur la liste de courses » au « bug à corriger dans tel jalon de tel projet », avec une liste par projet en cours.
- vision-3 : On lui parle comme à quelqu'un, à la voix depuis le téléphone ou depuis un agent, « ajoute à ORION, dans le jalon wane, mettre à jour ce soir, en haut de la liste », et il range au bon endroit.

## 2. Les mots

| Mot | Ce qu'il désigne |
|---|---|
| Tâche | une chose à faire, en une ligne, avec sa place |
| Liste | l'ensemble ordonné des tâches d'un même endroit ; la liste de courses en est une |
| Projet | un ensemble de listes et de jalons, par exemple ORION |
| Jalon | une étape d'un projet, qui a sa liste |
| Hiérarchie | l'arbre projet, jalon, liste, tâche, où chaque chose a un seul endroit |
| Note rapide | une tâche dite vite pour ne pas oublier, rangée plus tard si besoin |
| En haut | la position d'une tâche à faire avant les autres |

## 3. Principes de conception

Rien pour l'instant.

## 4. Les capacités

| Capacité | Spec | Ce qu'elle couvre | Couverture |
|---|---|---|---|
| Ajouter une tâche | à venir | dire une tâche et où elle va, projet, jalon, liste, position ; la retrouver là | couverte dès sa spec |

Une capacité **couverte** obéit à « la spec gagne contre le code ». Une capacité **non couverte** n'a pas de spec : le code fait foi, faute de mieux, jusqu'au premier changement qui la touche (regle-couverture, decision-fabrication-12). Sur un projet neuf, la colonne ne contient que des capacités couvertes.

## 5. Budgets

Rien pour l'instant.

## 6. Invariants

Rien pour l'instant.

## 7. Hors périmètre

- Plusieurs utilisateurs, partage, travail d'équipe : le logiciel est pour une seule personne.
- Une technologie imposée d'avance : le pilote n'en a pas en tête, la spec n'en choisit pas.
