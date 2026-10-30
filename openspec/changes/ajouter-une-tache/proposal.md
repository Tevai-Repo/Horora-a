# Proposition

> Réécrite le 2026-10-30 après le tour 4 de l'entretien (l'application entière). La version du matin est remplacée.

## Why

Le pilote veut une seule place pour toutes ses tâches, du fromage de la liste de courses au bug d'un sous-projet d'ORION, qu'il peut dire en une phrase sur son téléphone ou son ordinateur, ou créer comme dans une application de tâches ordinaire, et retrouver rangée au bon endroit (vision-1, vision-2, vision-3 en partie). Rien n'existe : c'est le premier des cinq changements qui dessinent l'application (question-entretien-53 : saisir, ranger, joindre, dater, parler), et il pose la hiérarchie, l'écran et l'accès sur lesquels les quatre autres s'appuieront.

## What Changes

- Une application installée sur le téléphone et sur l'ordinateur, sans magasin, en plein écran (question-entretien-17).
- Un mot de passe demandé une fois par appareil, puis plus jamais ; « déconnecter tous les autres appareils » (question-entretien-16, 18, 19). Accessible partout où il y a Internet (question-entretien-10).
- Une hiérarchie : la boîte d'entrée, des listes libres, des projets qui ont chacun une seule liste et des sous-projets sans limite de profondeur, chacun avec la sienne (question-entretien-46, 49). Chaque projet et chaque liste a un **libellé** affiché et un **identifiant** unique qui ne sert qu'à la phrase (question-entretien-50, 51).
- Un champ toujours visible où l'on dit une tâche ; les tournures `à <x>`, `dans <x>`, `en haut`, `étiquette <mot>` sont reconnues, x étant un identifiant ou un libellé unique ; le reste est le texte de la tâche (question-entretien-3, 25, 32, 51).
- Sans endroit dit : la boîte d'entrée, quel que soit l'écran ; endroit introuvable ou ambigu : la boîte d'entrée, avec la phrase entière (question-entretien-13 à 15, 26). Sans `en haut` : en bas (question-entretien-6). Une ligne confirme où la tâche est rangée (question-entretien-12).
- Les gestes d'une application ordinaire (question-entretien-48) : un bouton **+** qui crée une tâche dans la liste affichée ; **modifier** le texte, l'étiquette et la liste dans le panneau de détail ; **glisser** pour changer la position ; **cocher** pour marquer faite, et revoir les faites de la liste, les plus récentes en premier (question-entretien-47) ; **supprimer** avec confirmation.
- Sur l'ordinateur, trois parties : l'arborescence, le panneau des tâches, le panneau de détail ; sur le téléphone, les mêmes l'une après l'autre (question-entretien-20 à 24, 27).
- Au plus une étiquette par tâche, libre, en pastille ; un appui filtre la liste affichée (question-entretien-29 à 35).
- Une tâche ajoutée ou modifiée sur un appareil est sur l'autre à la prochaine ouverture ou au rafraîchissement (question-entretien-11).

## Ce que ça ne doit pas devenir

Un outil d'équipe. Et pas dans ce changement, mais après : les dates et rappels (« dater »), l'agent et la voix libre (« parler »), la vue par étiquette, la recherche, renommer et déplacer projets et listes (« ranger »), les pièces jointes (« joindre »).

## Mots

- Supprimé : `Jalon` : un jalon est un sous-projet (question-entretien-46) ; vision-3, qui dit « dans le jalon wane », est à relire par le pilote.
- Modifié : `Projet` : un ensemble de tâches qui a sa liste et peut contenir des sous-projets, chacun avec la sienne ; par exemple ORION.
- Modifié : `Liste` : l'ensemble ordonné des tâches d'un seul endroit : la liste d'un projet, une liste libre à la racine, ou la boîte d'entrée.
- Modifié : `Hiérarchie` : l'arbre boîte d'entrée, listes libres, projets et sous-projets emboîtés, chacun avec sa liste ; chaque tâche a un seul endroit.
- Ajouté : `Sous-projet` : un projet dans un projet.
- Ajouté : `Liste libre` : une liste à la racine, hors de tout projet, comme la liste de courses.
- Ajouté : `Libellé` : le nom affiché d'un projet ou d'une liste, libre.
- Ajouté : `Identifiant` : le nom court d'un projet ou d'une liste, lettres sans accent, chiffres et tirets, unique dans l'application, qui ne sert qu'à la phrase.
- Ajouté : `Faite` : l'état d'une tâche cochée ; elle quitte la liste et reste dans les faites de sa liste.
- Ajouté : `Arborescence` : la hiérarchie affichée, à gauche sur l'ordinateur.
- Ajouté : `Panneau des tâches` : les tâches de l'endroit choisi, dans leur ordre.
- Ajouté : `Panneau de détail` : tout ce qu'on sait d'une tâche choisie, et où on la modifie.
- Ajouté : `Étiquette` : un mot court posé sur une tâche, au plus un, visible dans le panneau des tâches, qui sert de filtre.
- Ajouté : `Appareil` : un téléphone ou un ordinateur où l'application est installée et ouverte par le mot de passe.

## Capacités

### Nouvelles
- `taches` : dire ou créer une tâche, la ranger, la placer, l'étiqueter, la filtrer, la modifier, la cocher, la supprimer, en voir le détail, la retrouver sur l'autre appareil.
- `hierarchie` : créer projets, sous-projets et listes libres avec libellé et identifiant ; afficher l'arborescence et les tâches d'un endroit ; rouvrir au bon endroit.
- `appareils` : installer l'application, ouvrir un appareil, rester connecté, couper les autres appareils.

La ligne « Tâches » de l'index de SPEC.md devient trois lignes à l'archivage.

### Modifiées
Aucune : aucune spec n'existe.

### Non touchées, avec la raison
Aucune : aucune spec n'existe.

## Invariants liés

Aucun n'est écrit (SPEC.md, section 6). L'étude en relève trois que l'entretien suppose, à écrire par le pilote s'il les veut :
- Chaque tâche a un seul endroit, une liste (« Hiérarchie »).
- Une phrase dite n'est jamais perdue : au pire, elle est dans la boîte d'entrée, mot pour mot (question-entretien-13, 15).
- Une tâche cochée n'est jamais effacée par la coche : seule la suppression, confirmée, efface (question-entretien-47).

## Options

Aucun budget n'est écrit (SPEC.md, section 5) : la part de marge ne se chiffre pas. L'étude propose trois budgets, à décider avec l'option : la confirmation d'un ajout en moins d'une seconde ; l'application ouverte en moins de deux secondes sur le téléphone en 4G ; aucune tâche envoyée à un service tiers. Aucune tâche du projet n'est mesurée : les durées se comparent entre options et seront recalées sur la première tâche faite. Par rapport à la proposition du matin, (b) a grossi d'environ 40 % (les cinq gestes, les faites, les identifiants).

### (a) Ne rien faire, laisser au parking
L'utilisateur ne voit rien de neuf. Aucune marge consommée, aucune durée, aucune dépendance. Risque : le Kit reste sans premier jalon, et le pilote garde ses outils actuels.

### (b) La minimale : ce que l'entretien a retenu, tournures fixes
L'utilisateur voit tout ce que dit « What Changes ». Budgets proposés : la confirmation et l'ouverture tiennent sans service extérieur ; aucune tâche ne sort. Durée : la référence, notée 1. Dépendances nouvelles : un hébergement joignable par Internet, une technologie d'application installable (design.md, à trancher dans question-2) ; chacune au registre de DECISIONS.md. CONTRAT : premières zones et premières garanties. Frontière de confiance nouvelle : Internet vers Horora'a, gardée par le mot de passe et les appareils. Risques : un téléphone perdu ouvert reste connecté jusqu'à la coupure ; les tournures fixes trop raides (épreuve d'intention, ligne 5) ; des sous-projets trop profonds qui rendent l'arborescence illisible (épreuve, ligne 5).

### (c) (b), plus la compréhension libre de la phrase
L'utilisateur parle comme à quelqu'un, sans tournures à apprendre (vision-3 entière, hormis l'agent). Budgets proposés : « aucune tâche envoyée à un service tiers » consommé en entier, chaque phrase part chez un fournisseur de modèle de langue ; la confirmation dépend de sa réponse, au-delà d'une seconde selon le réseau. Durée : environ 1,4 fois (b). Dépendances nouvelles : celles de (b), plus un fournisseur de modèle de langue, payant à l'usage, et sa clé. Frontière de confiance nouvelle : Horora'a vers ce fournisseur. Risques : une phrase mal comprise rangée au mauvais endroit sans le dire ; coût ; l'invariant « jamais perdue » plus dur à tenir. Le pilote a placé « parler » en cinquième changement (question-entretien-53) : (c) l'avancerait.

**Recommandation** : (b), parce qu'elle livre le signe du besoin sans faire sortir une seule tâche, et que l'épreuve d'intention dit déjà quand passer à la compréhension libre : plus d'une phrase sur cinq non comprise.

## Points de détail non tranchés par l'entretien

Ils changent un scénario ; l'étude recommande, le pilote tranche avec l'option.
- Majuscules et accents : « orion », « Orion » et « ORION » désignent le même libellé ; l'identifiant est toujours en minuscules sans accent. Recommandé : oui.
- Un libellé dit dans la phrase qui correspond à plusieurs endroits (deux listes « général ») : la tâche va dans la boîte d'entrée avec la phrase entière, et la confirmation dit « plusieurs endroits s'appellent général ». Recommandé : oui ; l'identifiant lève l'ambiguïté.
- Un identifiant déjà pris : refusé à la création avec un message, et un autre proposé. Recommandé : oui.
- Deux `étiquette <mot>` dans une phrase : la première est l'étiquette, la seconde reste dans le texte. Recommandé : oui.
- Une tâche dont on change la liste dans le détail : elle va en bas de la nouvelle liste. Recommandé : oui.
- Une tâche cochée par erreur : elle se décoche depuis les faites de la liste et revient en bas. Recommandé : oui.
- Une tâche dite sans accès à Internet : refusée avec un message, la phrase reste dans le champ (specs/taches, test-26). Recommandé : oui ; la garder sur l'appareil pour l'envoyer plus tard va au parking.
- Le mot de passe : choisi à la toute première ouverture d'Horora'a ; oublié, il se remplace depuis un appareil encore connecté. Recommandé : oui ; sans appareil connecté, la remise passe par l'hébergement, hors de l'application.

## Sondage

FTS5 dans `node:sqlite`, fait par l'étude le 2026-10-30 : disponible (Node 24.15.0, SQLite 3.51.3, ENABLE_FTS5 ; une table fts5 répond à MATCH). Méthode : script jetable d'une dizaine de lignes, hors dépôt, supprimé ; 2 minutes. Détail dans design.md, question ouverte 4.

## Impact

- ROADMAP.md : quatre jalons à venir, dans l'ordre, « ranger », « joindre » (changement déjà ouvert), « dater », « parler » (question-entretien-53) ; le prototype jetable de la vue par étiquette avant la spec de « ranger » (question-entretien-52).
- SPEC.md : « Jalon » sort, vision-3 à relire, mots, index des capacités, budgets et invariants s'ils sont retenus ; section 7 : les dates et rappels ne sont pas hors périmètre.
- CONTRAT.md : première version, à l'ouverture du jalon ; zones et langage selon question-2 et design.md.
- SECURITY.md : face produit à écrire, modèle de menace (appareil perdu, mot de passe deviné, accès par Internet) ; règle 8 : l'hébergement est la première production.
- DECISIONS.md : hébergement et technologie au registre des dépendances.
- `joindre-des-fichiers` dépend de ce changement ; son panneau de détail s'ajoute à celui-ci.

## Décision du pilote

<!-- Remplie par l'intégrateur après la porte-engagement, jamais par l'étude. -->
Date : 2026-10-30 · Option retenue : (b), la minimale, avec toutes les recommandations de l'étude : les huit points de détail « oui », les trois budgets et les trois invariants proposés ; pile A1 et B1 de design.md (decision-3) ; épreuve d'intention signée après le tour 4 · Décision : decision-2 · Reflet : openspec/changes/ajouter-une-tache/
