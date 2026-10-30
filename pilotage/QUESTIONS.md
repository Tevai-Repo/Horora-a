# Questions au pilote

> Ce que c'est : ce qu'on attend du pilote. Lu par : le pilote, l'intégrateur, la Vigie. Écrit par : tout agent ajoute une question, le pilote écrit sous « Réponse », l'intégrateur transforme une réponse en décision (DECISIONS.md), en tâche (TACHES.md) ou en entrée de parking (ROADMAP.md), puis déplace le bloc dans « Actées » avec la référence. Change par : une question posée, une réponse, un actage. Une question par bloc, numérotée dans l'ordre d'arrivée. Ne jamais répondre à la place du pilote. Chaque question dit ce qu'elle bloque et propose des options, avec une recommandation quand l'agent en a une.

Format d'un bloc :

```
### question-<n>, <date>, <rôle qui pose> : <titre court>
- **Bloque** : <tâche, jalon, rétro, ou « rien, confort »>
- **Options** : (a) … recommandé ; (b) …
- **Réponse** :
```

## Ouvertes

### question-1, 2026-10-29, integrateur : ce que fait Horora'a, pour qui, et à qui il livre
- **Bloque** : la ligne `description` de harnais.toml et la Vision d'AGENTS.md ; rien d'autre, la vision elle-même s'écrit dans SPEC.md, section 1.
- **Options** : (a) une phrase de description, recopiée de vision-1 une fois SPEC.md écrit ; `livre_a = ["Fabrication"]`, projet-école et premier banc d'essai du Kit (decision-fabrication-19), appliqué en attendant, recommandé ; (b) une autre destination, à nommer.
- **Réponse** :

### question-3, 2026-10-29, integrateur : formule de l'équipage
- **Bloque** : la décision d'équipage dans DECISIONS.md, le nombre de sessions à ouvrir, qui relit à la porte-fusion.
- **Options** : (a) Duo ; (b) Équipe ; (c) Solo. Pas de recommandation de l'intégrateur : la taille du projet n'est pas encore connue (SPEC.md vide).
- **Réponse** :

## Actées

### question-2, 2026-10-29, integrateur : langage, zone de code et nom du rôle développeur
- **Bloque** : la carte de propriété d'AGENTS.md, les zones du hook commit-msg, les étapes 2 à 4 de scripts/check.ps1, l'adaptation des fiches de rôle, le premier jalon.
- **Options** : (a) décider au premier changement, quand l'étude aura fermé la frontière ; d'ici là une zone `src/` et un rôle `developpeur`, identifiants de code en anglais, appliqués en attendant, recommandé ; (b) fixer dès maintenant le langage et nommer la zone (`<langage>.md` dans pilotage/roles/, déclaré dans harnais.toml).
- **Réponse** : « A1 et B1, et oui au sondage », dit à l'intégrateur le 2026-10-30, renvoyant à design.md d'`ajouter-une-tache`. Actée : decision-3 ; la zone et le nom du rôle développeur se fixent à l'ouverture du jalon.

### question-4, 2026-10-30, integrateur : « pilote » désigne deux rôles
- **Bloque** : rien tout de suite ; l'entretien de la première capacité, dont les scénarios nommeront la personne qui ajoute une tâche.
- **Options** : (a) ajouter à « Les mots » un mot pour la personne qui se sert du produit, par exemple « utilisateur », et garder « pilote » pour le harnais, recommandé ; (b) garder « pilote » dans les deux sens, puisque c'est la même personne.
- **Réponse** : (a). Actée : decision-5.

### question-5, 2026-10-30, etude : engager `ajouter-une-tache` (porte-engagement)
- **Bloque** : le premier jalon, ses tâches, et `joindre-des-fichiers` qui en dépend ; demande aussi question-2 (langage) avant les tâches.
- **Options** : (a) ne rien faire, laisser au parking ; (b) la minimale, ce que l'entretien a retenu, tournures fixes, aucune tâche envoyée à un service tiers, recommandé ; (c) (b) plus la compréhension libre de la phrase par un modèle de langue, environ 1,4 fois (b), chaque phrase envoyée à un fournisseur. Avec l'option, trancher les huit points de détail et les budgets et invariants proposés, chacun avec sa recommandation dans la proposition.
- **Changement** : openspec/changes/ajouter-une-tache/ (proposal.md, specs taches, hierarchie, appareils, design.md). **Réécrit le 2026-10-30 après le tour 4 de l'entretien, « l'application entière », rouvert par le pilote** : projets emboîtés sans jalon, une liste par projet, identifiant de phrase, bouton +, modifier, glisser, cocher, supprimer. La nouvelle épreuve d'intention attend sa signature dans entretien.md ; la réponse « (a) » ci-dessous a été écrite avant la réouverture, le pilote la confirme ou la corrige.
- **Réponse** : (a), écrite avant la réouverture, quand la question portait par erreur le numéro 4, renumérotée par l'intégrateur ; corrigée par le pilote le 2026-10-30 : « j'ai signé l'entretien d'ajouter-une-tache ; je choisis (b) pour les deux engagements avec les recommandations ». Actée : decision-2.

### question-6, 2026-10-30, etude : engager `joindre-des-fichiers` (porte-engagement)
- **Bloque** : les pièces jointes ; s'engage après question-5, se fait après `ajouter-une-tache`.
- **Options** : (a) ne rien faire, laisser au parking ; (b) la minimale, ce que l'entretien a retenu, fichiers gardés et rendus sans être lus, environ 0,4 fois `ajouter-une-tache`, recommandé ; (c) (b) plus l'aperçu des PDF et documents, environ 0,7 fois, Horora'a lit des fichiers extérieurs (SECURITY.md, règle 4, à réécrire). Avec l'option, trancher les trois points de détail de la proposition.
- **Changement** : openspec/changes/joindre-des-fichiers/ (entretien signé le 2026-10-30, proposal.md, spec pieces-jointes).
- **Réponse** : (a), quand la question portait le numéro 5, renumérotée par l'intégrateur ; corrigée par le pilote le 2026-10-30 : (b) avec les recommandations. Actée : decision-4.
