# Horora'a — Règles du projet

> Installé depuis le Kit v0 le 2026-10-29 (decision-1). Taille limite : 15 Ko (controle-taille). Les champs marqués « à décider » attendent une réponse du pilote dans pilotage/QUESTIONS.md.

Fichier maître, lu par tout outil d'agent (Claude Code l'importe via CLAUDE.md). Lire dans cet ordre en début de session : ce fichier, pilotage/ETAT.md, pilotage/TACHES.md, puis ton fichier de rôle dans pilotage/roles/. Ces quatre fichiers ont une taille limitée (controle-taille). Ne lis pas au démarrage pilotage/archives/ ni pilotage/comptes-rendus/ : on y cherche sur besoin. Ton rôle t'est donné par le premier message du pilote dans la session (« Tu es l'agent <rôle> »). Sans rôle annoncé, demande-le avant toute action.

## Vision
À écrire par le pilote dans pilotage/SPEC.md, section 1 (vision-1 à vision-3), première action après l'installation ; recopiée ici en deux à quatre lignes ensuite. Projet neuf : aucun code n'existe avant la spec. Périmètre : pilotage/SPEC.md fait foi.

## Principes non négociables
- **Périmètre fermé.** Toute idée hors de SPEC.md et de openspec/specs/ va dans le parking de ROADMAP.md, jamais dans le code. Un besoin entre par un changement, openspec/changes/`<nom>`/ : entretien, proposition, deltas, décision du pilote, puis tâches ; jamais par une tâche directe.
- **La spec suffit.** N'importe quel agent, dans n'importe quel langage, sans une ligne du code d'avant, refait le logiciel en entier depuis SPEC.md et openspec/specs/. Pas le même code, pas le même écran, pas le même octet : le même usage pour l'utilisateur, prouvé par la même liste de test ; chaque scénario cite le point qu'il sert (decision-fabrication-8, decision-fabrication-20).
- **Rien n'est fini sans preuve.** Une tâche est close quand `scripts/check.ps1` complet est vert, que la preuve d'exécution du projet (à décider avec le premier jalon : application lancée, service démarré ou test joué) est faite, et que le commit est fait. Un jalon est clos en plus après test manuel du pilote.
- **Sécurité.** pilotage/SECURITY.md s'applique à tout agent, sans exception.
- **Neutralité d'outil.** La coordination passe par les fichiers et git, jamais par une fonction propre à un outil d'agent. Les messages entre sessions déclenchent ; ils ne remplacent jamais une mise à jour de fichier.
- **Légèreté justifiée.** Chaque dépendance a une ligne au registre de DECISIONS.md (SECURITY.md, processus, règle 3). Les autres principes propres au projet viendront avec SPEC.md, chacun adossé à un contrôle ou à une règle de CONTROLES.md.

## Langue
Tout en français : réponses, commentaires, documents, messages de commit. Identifiants de code en anglais (appliqué en attendant, question-2).

## Carte de propriété (multi-agents)
| Zone | Propriétaire | Autres agents |
|---|---|---|
| src/ (à créer ; nom et découpage de la zone à décider, question-2) | developpeur | lecture seule |
| pilotage/CONTRAT.md | integrateur | proposent, n'éditent pas |
| pilotage/ETAT.md, ROADMAP.md, DECISIONS.md, SPEC.md, CONTROLES.md, branche main | integrateur | lecture seule |
| openspec/specs/ (la vérité produit, une capacité par dossier) | integrateur, par `openspec archive` seulement | lecture seule ; la spec gagne contre le code (decision-fabrication-8) |
| openspec/changes/`<nom>`/ : entretien, proposal, specs, design | etude jusqu'à la porte-engagement, puis integrateur (section « Décision du pilote », tasks.md) | lecture seule |
| openspec/changes/`<nom>`/tasks.md | integrateur crée ; chaque développeur coche ses cases | comme TACHES.md : chacun ses lignes |
| openspec/changes/archive/ | integrateur | lecture seule, figé |
| pilotage/TACHES.md | tous | chacun n'édite que les lignes de ses tâches |
| pilotage/comptes-rendus/ | tous | chacun n'écrit que les sections de ses tâches |
| pilotage/archives/ | integrateur | lecture seule, fichiers figés |
| pilotage/etudes/ | etude (la fiche de son sujet, sans commit) | lecture seule ; l'intégrateur commite la fiche avec la décision du pilote |
| tests/, pilotage/test-manuel-`<jalon>`.md | qa | ajoutent via la QA ; le pilote remplit les zones de réponse des listes de test |
| scripts/, .githooks/, AGENTS.md | integrateur | lecture seule |
| pilotage/QUESTIONS.md | pilote (les réponses) | tout agent ajoute une question avec ses options et ce qu'elle bloque ; l'intégrateur transforme une réponse en décision ou en tâche et déplace le bloc dans « Actées » ; personne ne répond à la place du pilote |
| reflexion/ | pilote | **interdit en lecture à tous les agents de projet.** Trois exceptions : l'intégrateur ajoute une entrée factuelle à reflexion/journal-pilotage.md en fin de session, avant le commit, sans relire le dossier ; une séance tenue sans intégrateur, mère ou étude seule, laisse la même entrée, par le rôle qui l'a tenue (decision-fabrication-15) ; tout agent, sur la demande explicite « note ce moment » du pilote, ajoute un bloc Observation en fin de reflexion/journal-pilotage.md ; la mère (pilotage/roles/mere.md) lit reflexion/ mais ne touche à rien d'autre |

## Protocole de travail
1. Chaque agent de dev et la QA travaillent dans leur propre worktree git, `.claude/worktrees/<role>/`, sur la branche longue `worktree-<role>`. À l'intérieur, une branche courte par tâche : `agent/<role>/<jalon>-<sujet>`. Personne ne commite sur main sauf l'intégrateur. L'intégrateur, la mère et l'étude travaillent dans le dépôt principal.
2. Prendre une tâche libre, « À faire » dont toutes les tâches du crochet « attend » sont « Fait » (decision-fabrication-17) : passer sa ligne dans TACHES.md de « À faire » à « En cours » avec son nom de rôle.
3. Tâche finie : check.ps1 complet vert, compte rendu dans pilotage/comptes-rendus/`<jalon>`.md, commit, ligne passée à « À intégrer » sur sa branche, puis **message obligatoire à l'intégrateur** quand l'outil le permet, au format fixe « À intégrer : `<id>`, branche `<nom>`, check complet vert, <dépendance, ou « aucune »> ». Sinon, l'agent le dit au pilote, qui relaie. Une tâche passée « À intégrer » sans message n'est pas signalée : la ligne n'existe que sur la branche jusqu'à la fusion.
4. L'intégrateur fusionne, relance check.ps1 sur main, passe la ligne à « Fait », met à jour ETAT.md, puis prévient le rôle concerné (« Fait : `<id>`, fusionnée sur main en `<commit>` ») ; même message quand il modifie CONTRAT.md.
5. Besoin d'un changement de CONTRAT.md : demande à l'intégrateur, on ne modifie pas le contrat soi-même. Question au pilote : un bloc dans pilotage/QUESTIONS.md (ce qu'elle bloque, options, recommandation), jamais une réponse à sa place.
6. Les fichiers font foi. Un message ne remplace jamais une mise à jour de fichier.
7. Fin de session de l'intégrateur : ETAT.md mis à jour obligatoirement. Toute branche est poussée en fin de session (regle-push).
8. Deux tâches qui touchent les mêmes fichiers s'empilent sur une même branche courte et sont fusionnées dans l'ordre ; jamais deux branches parallèles sur un même fichier.
9. Une tâche finie mais dépendante d'une décision en attente reste « En cours », jamais « À intégrer » avec un check rouge ; la ligne dit ce qu'elle attend.
10. Preuves propres au projet : à décider avec le premier jalon, une fois le langage connu ; d'ici là, la sortie de `scripts/check.ps1` dans le compte rendu.
11. **Après tout compactage, relis ton fichier de rôle avant toute action.** Le résumé d'un compactage peut perdre le rôle, ses limites et ses consignes de forme. Sous Claude Code, un hook SessionStart sur `compact` le rappelle (.claude/settings.json).
12. **Sous-agents.** Un agent de rôle peut lancer des sous-agents pour lire, chercher, lancer les contrôles et relire. Un sous-agent n'écrit pas dans TACHES.md, QUESTIONS.md ni ETAT.md, ne commite pas, n'ouvre pas de branche, ne pose pas de question au pilote. S'il modifie du code, c'est dans le worktree et la zone de l'agent qui l'a lancé, un seul à la fois, sous sa responsabilité. L'agent nomme dans son compte rendu ce qu'il a délégué et toute décision revenue d'un sous-agent (decision-fabrication-20).

## Qualité : hooks git versionnés
- Les hooks vivent dans `.githooks/` et s'activent une fois par clone avec `git config core.hooksPath .githooks`.
- `pre-commit` : refuse tout marqueur de conflit dans un fichier indexé (controle-conflit), puis `check.ps1 -Fast` (le formatage du langage y entrera avec le langage). Bloque le commit si rouge.
- `commit-msg` : impose le format de message.
- Le check complet (compilation, tests, audit, quand le langage sera choisi) n'est pas dans le hook car trop lent ; il est obligatoire avant « À intégrer » et avant toute fusion.
- Interdit de contourner un hook (`--no-verify`).
- Un message commençant par `C-` vient d'un contrôle du harnais, pas d'un choix de l'agent. Le pourquoi de chaque contrôle est dans pilotage/CONTROLES.md. Un agent bloqué cite le code dans sa réponse et ne contourne jamais le contrôle. Une règle sans contrôle (préfixe `R-`) repose sur l'agent et sur la relecture de l'intégrateur.

## Commandes
- Vérification complète : `powershell -File scripts/check.ps1`
- Vérification rapide : `powershell -File scripts/check.ps1 -Fast`
- Specs : `openspec list --specs`, `openspec show <capacité> --type spec`, `openspec validate --all --strict` (controle-spec) ; `openspec archive <nom>` par l'intégrateur seul, à la clôture
- Compilation, lancement, test réel : aucun pour l'instant, aucun code n'existe ; ajoutés ici et dans scripts/check.ps1 avec le premier jalon.

## Conventions
- Commits : `<jalon>(<zone>): <description en français>`. Zones : developpeur, qa, pilotage, outillage (hook commit-msg ; à renommer avec la zone, question-2). Hors jalon : `harnais(pilotage): ...`.
- Un commit = une intention. Pas de commit « wip » sur une branche à intégrer.
- Conventions de code : à écrire avec le langage, deux lignes au plus ; le reste dans CONTRAT.md.
