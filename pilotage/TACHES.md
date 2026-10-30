# Tâches

> Ce que c'est : qui fait quoi, dans quel état. Lu par : tout agent au démarrage, la Vigie. Écrit par : l'intégrateur crée les tâches et les passe à « Fait » ; chaque agent n'édite que les lignes de ses propres tâches. Change par : chaque prise, chaque rendu, chaque fusion. Format : `- [état] jalon-<n>-<rôle>-<n> (<rôle>) [attend <id>, …] description` ; le crochet nomme les tâches dont la fusion est attendue, il est absent quand la tâche n'attend rien. Une tâche **libre** est « À faire » et toutes celles qu'elle cite sont « Fait » (decision-fabrication-17). États : À faire, En cours, À intégrer, Fait, Annulée (sur décision du pilote, avec la référence). La ligne et ses états sont des immuables du Kit.
> Une ligne courte par tâche : ce qu'il faut faire, ce qui la conditionne quand ce n'est pas une autre tâche, puis l'état. Pour un changement engagé après la porte-engagement, une ligne par changement ou par groupe de son `tasks.md`, avec le rôle, la branche et l'état ; les étapes cochées vivent dans `openspec/changes/<nom>/tasks.md`, pas ici (decision-fabrication-9). Le compte rendu détaillé (ce qui a été fait, preuves, mesures, commits, écarts) va dans `pilotage/comptes-rendus/<jalon>.md`, sous un titre `## <id>`, écrit par le rôle qui la porte ; la ligne finit par « compte rendu : comptes-rendus/`<jalon>`.md ». Limite : 60 Ko (controle-taille) ; les jalons clos vont dans pilotage/archives/.

## Jalon 0

Aucune tâche : le premier besoin passe par l'Entonnoir (une session étude), après SPEC.md sections 1, 2, 4 et 7.
