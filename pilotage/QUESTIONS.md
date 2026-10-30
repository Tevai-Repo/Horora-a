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

### question-2, 2026-10-29, integrateur : langage, zone de code et nom du rôle développeur
- **Bloque** : la carte de propriété d'AGENTS.md, les zones du hook commit-msg, les étapes 2 à 4 de scripts/check.ps1, l'adaptation des fiches de rôle, le premier jalon.
- **Options** : (a) décider au premier changement, quand l'étude aura fermé la frontière ; d'ici là une zone `src/` et un rôle `developpeur`, identifiants de code en anglais, appliqués en attendant, recommandé ; (b) fixer dès maintenant le langage et nommer la zone (`<langage>.md` dans pilotage/roles/, déclaré dans harnais.toml).
- **Réponse** :

### question-3, 2026-10-29, integrateur : formule de l'équipage (decision-2)
- **Bloque** : decision-2 dans DECISIONS.md, le nombre de sessions à ouvrir, qui relit à la porte-fusion.
- **Options** : (a) Duo ; (b) Équipe ; (c) Solo. Pas de recommandation de l'intégrateur : la taille du projet n'est pas encore connue (SPEC.md vide).
- **Réponse** :

## Actées

Aucune.
