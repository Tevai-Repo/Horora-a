# Horora'a — Spécification v0

> Ce que c'est : pour qui, avec quels mots, dans quelles limites le produit existe. Lu par : l'étude, les développeurs, la QA, le pilote. Écrit par : l'intégrateur, après la porte-engagement. Change par : un changement archivé après le test du pilote. Statut : installée le 2026-10-29 ; sections 1, 2, 4 et 7 dictées par le pilote le 2026-10-30, tapées par le laboratoire d'Harnais sur son ordre, le pilote n'étant pas devant son poste ; corrigées le 2026-10-30 sur les remarques de l'étude, décidées par le pilote ; puis après le tour 4 de l'entretien `ajouter-une-tache` (projets emboîtés, plus de jalon), décidé par le pilote, tapé par le laboratoire. Le comportement du produit vit dans `openspec/specs/`, une capacité par dossier ; ce fichier dit le reste : la vision, les mots, les principes, l'index des capacités, les budgets, les invariants, le hors périmètre. La spec suffit : n'importe quel agent, dans n'importe quel langage, sans une ligne du code d'avant, refait le logiciel en entier ; pas le même code, pas le même écran, pas le même octet, le même usage pour l'utilisateur (decision-fabrication-8, decision-fabrication-20). Les bibliothèques tierces et les données ne sont pas le code source : la spec dit ce qu'elle attend des unes et le schéma des autres. Elle gagne contre le code : un écart est un défaut du code ou une décision qui change la spec. Toute fonctionnalité hors de ce document et des specs est hors périmètre tant qu'une décision ne l'y ajoute pas. Sur un projet existant, l'index des capacités se remplit en premier, relevé depuis les écrans et jamais depuis le code, et chaque capacité reçoit sa spec le jour où un changement la touche (decision-fabrication-12).

## 1. Vision

- vision-1 : Un gestionnaire de tâches pour une seule personne, le pilote, sécurisé, aussi facile à ouvrir sur son téléphone que sur son ordinateur.
- vision-2 : Chaque tâche a sa place dans une hiérarchie définie, du « fromage sur la liste de courses » au « bug à corriger dans tel sous-projet de tel projet », chaque projet et sous-projet ayant sa liste.
- vision-3 : On lui parle comme à quelqu'un, à la voix depuis le téléphone ou depuis un agent, « ajoute à ORION, dans wane, mettre à jour ce soir, en haut de la liste », et il range au bon endroit.

## 2. Les mots

| Mot | Ce qu'il désigne |
|---|---|
| Utilisateur | la personne qui se sert d'Horora'a, une seule (decision-5) |
| Tâche | une chose à faire, en une ligne, avec sa place |
| Liste | l'ensemble ordonné des tâches d'un seul endroit : la liste d'un projet, une liste libre à la racine comme la liste de courses, ou la boîte d'entrée |
| Projet | un ensemble de tâches qui a sa liste et peut contenir des sous-projets, chacun avec la sienne ; par exemple ORION |
| Sous-projet | un projet dans un projet ; ce qu'on appelait jalon |
| Hiérarchie | l'arbre boîte d'entrée, listes libres, projets et sous-projets emboîtés, chacun avec sa liste ; chaque tâche a un seul endroit |
| Libellé | le nom affiché d'un projet ou d'une liste, libre |
| Identifiant | le nom court d'un projet ou d'une liste, lettres sans accent, chiffres et tirets, unique dans l'application ; ne sert qu'à la phrase et à la voix |
| Boîte d'entrée | la liste hors projet où tombe toute tâche dite sans place ; c'est l'endroit d'une note rapide avant son rangement |
| Note rapide | une tâche dite vite pour ne pas oublier, qui tombe dans la boîte d'entrée et se range plus tard |
| En haut | la position d'une tâche à faire avant les autres |

## 3. Principes de conception

Rien pour l'instant.

## 4. Les capacités

| Capacité | Spec | Ce qu'elle couvre | Couverture |
|---|---|---|---|
| Tâches | à venir | dire une tâche et où elle va, projet, sous-projet ou liste, par identifiant ou libellé, en haut ou en bas, ou la boîte d'entrée ; la créer d'un bouton ; la retrouver là, la modifier, la cocher faite | couverte dès sa spec |

Une capacité **couverte** obéit à « la spec gagne contre le code ». Une capacité **non couverte** n'a pas de spec : le code fait foi, faute de mieux, jusqu'au premier changement qui la touche (regle-couverture, decision-fabrication-12). Sur un projet neuf, la colonne ne contient que des capacités couvertes.

## 5. Budgets

Rien pour l'instant.

## 6. Invariants

Rien pour l'instant.

## 7. Hors périmètre

- Plusieurs utilisateurs, partage, travail d'équipe : le logiciel est pour une seule personne.
- Une technologie imposée d'avance : le pilote n'en a pas en tête, la spec n'en choisit pas.

Pas refusés, mais plus tard, par des changements à venir dans ROADMAP.md : les dates et les rappels, la compréhension libre de la phrase, l'agent et la voix libre.
