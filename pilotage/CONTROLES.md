# Contrôles du harnais

> Ce que c'est : le registre des contrôles du projet, chacun avec son code, son pourquoi et ses essais. Lu par : tout agent qui reçoit un message controle-<sujet>, la QA, l'intégrateur à chaque fusion. Écrit par : l'intégrateur. Change par : un échec observé ou une décision datée, et la revue à chaque rétro. Un message qui commence par un code controle-<sujet> vient du harnais, pas de l'agent.
> Principe : une règle écrite en prose repose sur l'interprétation du modèle ; une règle contrôlée repose sur un script, un hook ou une permission. On ne garde en prose que ce qui ne se vérifie pas. Les trois niveaux, et comment les éprouver : docs/1-comprendre/niveaux-de-regles.md, dans le dépôt Harnais de la fabrication.

## Contrôles actifs, communs au Kit

### controle-conflit : aucun marqueur de conflit commité
- **Règle d'origine** : AGENTS.md, protocole (un commit = une intention).
- **Ce qui est vérifié** : dans la version indexée de chaque fichier ajouté, copié, modifié ou renommé, aucune ligne ne commence par sept `<` ou sept `>` suivis d'une espace ou de la fin de ligne ; `=======` et `|||||||` ne sont signalés qu'entre les deux. Binaires ignorés, CRLF reconnus.
- **Où** : .githooks/pre-commit, première étape.
- **Message** : `controle-conflit : marqueur de conflit dans <fichier>, ligne <n> : <début de la ligne>`.
- **Né le** : 2026-10-13 sur FANA (marqueurs commités une fois sur une branche intermédiaire). Testé 11 cas sur 11 dans les deux sens. **À retester** dans ce projet avant activation : un commit avec marqueur refusé, un Markdown avec titre `=======` accepté.
- **Limite connue** : un commit de fusion sans conflit ne passe pas par pre-commit ; sans conflit, il ne peut pas introduire de marqueur.

### controle-kit : les immuables du Kit existent, sont cohérents, et n'ont pas bougé hors porte-kit
- **Règle d'origine** : decision-fabrication-14 et decision-fabrication-16, `IMMUABLES.md` du Kit de la fabrication, à la version de `harnais.toml`.
- **Ce qui est vérifié** : les douze chemins immuables existent ; `harnais.toml` porte `kit_version` et `roles` ; chaque rôle déclaré a son fichier dans `pilotage/roles/`, chaque fichier de rôle est déclaré, sans connaître aucun nom de rôle ; et le verrou `harnais.lock` : l'empreinte SHA-256 de chaque fichier du Kit, tout `*.kit.*` plus `.githooks/pre-commit`, est celle écrite à la porte-kit. Rouge si un fichier du Kit a bougé, a été ajouté hors porte, manque, ou si le verrou manque.
- **Où** : scripts/check.kit.ps1, première étape, appelé par scripts/check.ps1 dans les deux modes, donc dans le hook pre-commit. Le verrou s'écrit avec `check.kit.ps1 -EcrireVerrou`, par l'intégrateur, à la porte-kit seulement.
- **Message** : `controle-kit : <chemin> manque`, `controle-kit : role declare sans fichier : <nom>`, `controle-kit : fichier de role non declare dans harnais.toml : <fichier>`, `controle-kit : harnais.toml sans kit_version`, `controle-kit : harnais.lock manque`, `controle-kit : <fichier> modifie hors porte-kit`, `controle-kit : <fichier> absent de harnais.lock`.
- **Né le** : 2026-10-22 dans le Kit, sur un exercice du pilote : « si je supprime `pilotage/` et que je commite ? ». Avant lui, le commit passait au vert. Essayé le même jour dans un dossier jetable, seize cas en deux séries : conforme vert ; `pilotage/` supprimé rouge ; rôle déclaré sans fichier rouge ; fichier de rôle non déclaré rouge ; sans `kit_version` rouge ; un rôle « juriste » ajouté et déclaré vert ; zéro fichier rouge ; puis, avec le verrou : sans verrou rouge ; conforme vert ; `check.kit.ps1` touché rouge, restauré vert ; `pre-commit` touché rouge ; un `.kit` ajouté hors porte rouge ; `check.ps1` du projet modifié vert ; `pilotage/` supprimé rouge.
- **Limite connue** : vérifie l'existence, la cohérence des rôles et l'intégrité des fichiers du Kit, pas la grammaire des lignes ni les titres de section ; ceux-là restent en prose dans IMMUABLES.md jusqu'à ce qu'un banc d'essai montre qu'ils cassent. Le verrou arrête une main distraite et un agent qui obéit trop vite ; il n'arrête pas un humain qui veut, celui-là peut réécrire le verrou ou ne pas activer le hook : contre lui, `main` protégée et un pipeline, étape 3. Restaurer un fichier : `git checkout HEAD -- <chemin>` ; ce qui n'était pas commité est perdu, d'où regle-push.

### controle-taille : les fichiers lus au démarrage restent courts
- **Règle d'origine** : AGENTS.md, en tête (ordre de lecture en début de session).
- **Ce qui est vérifié** : AGENTS.md ≤ 15 Ko, pilotage/ETAT.md ≤ 30 Ko, pilotage/TACHES.md ≤ 60 Ko, chaque fichier de pilotage/roles/ ≤ 8 Ko, sauf documentaliste.md ≤ 10 Ko. Limites dans `$LimitesTaille` de scripts/check.kit.ps1.
- **Où** : scripts/check.kit.ps1, via scripts/check.ps1 dans les deux modes, donc dans le hook pre-commit.
- **Message** : `controle-taille : <fichier> fait <n> octets, limite <m> Ko : archiver dans pilotage/archives/, comptes rendus dans pilotage/comptes-rendus/`.
- **Né le** : 2026-10-16 sur FANA (480 Ko lus par session avant d'agir). Testé 8 cas sur 8. **À retester** ici : un fichier à la limite plus un octet refusé. Règle du zéro ajoutée le 2026-10-22 : zéro fichier trouvé est rouge, essayé dans un dossier vide ; avant, `pilotage/` supprimé donnait « 0 fichier, tous sous leur limite », vert.

### controle-install : installation sous feu vert
- **Règle d'origine** : SECURITY.md, processus, règle 5.
- **Ce qui est vérifié** : les commandes d'installation d'outils (`winget`, `choco`, `npm install -g`, et l'outil du langage quand il sera choisi) sont refusées à l'agent par permission. Le pilote les lance lui-même.
- **Où** : .claude/settings.json, `permissions.deny`. **Adaptateur** : avec un autre outil d'agent, la règle retombe en prose.
- **Message** : refus de permission ; l'agent écrit `controle-install : installation de <outil> à faire par le pilote`.

### controle-spec : la forme des specs et des changements
- **Règle d'origine** : decision-fabrication-8 (la spec suffit à régénérer le logiciel) et decision-fabrication-9 (OpenSpec comme contrôle).
- **Ce qui est vérifié** : `openspec validate --all --strict --no-interactive`, essayé dans les deux sens le 2026-10-27. Rouge si une exigence n'a pas de scénario, si elle n'a pas « DOIT (MUST) » (avertissement devenu bloquant par `--strict`), une description dépasse 500 caractères, un changement n'a aucun delta et n'est pas archivé avec `--skip-specs`, un MODIFIED perd un scénario encore dans la spec principale, un delta vise une capacité non déclarée ou inexistante, une tâche n'a pas de case. Rouge aussi si le programme `openspec` manque sur le poste : jamais un vert silencieux.
- **Où** : scripts/check.kit.ps1, via scripts/check.ps1 dans les deux modes.
- **Message** : `controle-spec : <sortie du validateur>` ou `controle-spec : openspec absent sur ce poste, à installer par le pilote`.
- **Né le** : 2026-10-22 dans le Kit, sur decision-fabrication-9. Essayé le même jour dans un dossier jetable, sans le programme : `openspec/` présent et programme absent, rouge ; `openspec/` absent, vert avec « contrôle ignoré ». **Reste à essayer au sondage**, programme présent : un changement jetable avec une exigence sans scénario doit passer au rouge, les specs réelles au vert, et la vérification retirée doit faire rougir l'essai bloquant.
- **Limite connue** : vérifie la forme, pas le sens. Une exigence vraie en forme et fausse en sens passe ; une exigence inventée pour satisfaire la validation passe. C'est la QA à la porte-fusion (decision-fabrication-11).

### controle-impact, controle-invariants, controle-mots : à écrire, inscrits le 2026-10-22 (decision-fabrication-9)
- **controle-impact** : pour chaque mot de « Les mots » que le changement touche, toute capacité dont la spec emploie ce mot a un delta ou une ligne « non touchée : raison » dans `proposal.md`. Garantit que l'auteur a regardé chaque capacité concernée ; ne juge pas la raison.
- **controle-invariants** : un changement qui touche une capacité liée à un invariant I-n de SPEC.md cite cet invariant dans `proposal.md`, tenu ou modifié.
- **controle-mots** : tout mot employé par un scénario des deltas existe dans « Les mots » de SPEC.md ou dans la section « Mots » de `proposal.md`.
- Aucun des trois n'existe en script. Ils naissent dans le projet qui en a besoin, essayés dans les deux sens, puis remontent ici après trois bancs d'essai.

### controle-caracterisation : à écrire, inscrit le 2026-10-22 (decision-fabrication-12), projets existants
- **Règle** : sur un projet d'`origine = "existant"`, une branche qui modifie du code d'une capacité touche aussi ses tests : le comportement voulu est figé avant d'être changé, rouge avant, vert après.
- **Ce qu'il garantit** : un fichier de test a bougé ; pas que le test reproduit le bug, c'est la QA. Proposé pour GEMINI le 2026-10-21 ; naît là, remonte ici après trois bancs d'essai.

### controle-integrer, controle-cloture : à écrire, inscrits le 2026-10-22 (decision-fabrication-13), le secrétariat de l'intégrateur
- **Pourquoi** : la fiche de l'intégrateur porte dix-sept devoirs, dont un tiers de secrétariat répété à chaque tour. Une instruction coûte du contexte à chaque tour et s'oublie au compactage ; un hook ne coûte rien et n'oublie pas. Chaque instruction quitte la fiche de rôle le jour où son contrôle existe et a été essayé dans les deux sens.
- **controle-integrer** : à la fin de chaque tour de l'intégrateur, un hook lance le grep des lignes « À intégrer » sur les branches non fusionnées dans main, aujourd'hui recopié dans integrateur.md, section « Déclencheurs », et affiche `controle-integrer : <n> ligne(s) À intégrer : <branches>`. Rappelle, ne bloque pas.
- **controle-cloture** : au Stop d'une session de l'intégrateur, rouge si pilotage/ETAT.md n'a pas changé depuis le début de la session, si reflexion/journal-pilotage.md n'a pas d'entrée à la date du jour, ou si une branche est en avance sur son distant (`git log origin/<b>..<b>`). Message `controle-cloture : <ce qui manque>`. Fait descendre regle-etat et regle-push de la prose au contrôle. Limite : il voit qu'une entrée existe, pas qu'elle est juste.
- **Squelette de journal** : `scripts/journal.ps1`, à écrire avec controle-cloture : ajoute le titre du jour et des puces pré-remplies depuis git, commits du jour, branches, fusions ; l'intégrateur complète les demandes et les pivots.
- Naissent dans le premier projet installé depuis le Kit ; remontent ici après trois bancs d'essai.

## Contrôles propres au projet

Aucun pour l'instant. Un bloc par contrôle, même format : règle d'origine, ce qui est vérifié, où, message, né le, motif, testé le (deux sens), limite connue, à revoir. Un contrôle naît d'un échec observé ou d'une décision datée, jamais d'une crainte générale.

## Règles laissées en prose, en connaissance de cause

### regle-zone : zone de propriété
- **Règle** : AGENTS.md, carte de propriété. Chaque rôle ne commite que dans sa zone.
- **Pourquoi pas de contrôle** : controle-zone retiré sur FANA le 2026-10-13 après un faux positif. Repose sur l'agent et sur la relecture de l'intégrateur à chaque fusion (`git diff --stat main...branche`).

### regle-taches : lignes de tâches
- **Règle** : un rôle ne modifie que les lignes de ses propres tâches. Même histoire que regle-zone.

### regle-perimetre : périmètre fermé
- **Règle** : toute idée hors SPEC.md va au parking. Juger qu'une fonction est hors spec demande une lecture.

### regle-etat : ETAT.md à jour en fin de session
- **Règle** : AGENTS.md, protocole 7. Le hook Stop rappelle, il ne vérifie pas. Descend en contrôle avec controle-cloture (decision-fabrication-13).

### regle-push : toute branche poussée en fin de session
- **Règle** : rien n'existe que sur le PC. Vérifiable par `git log origin/<branche>..<branche>` ; pas encore contrôlé. Descend en contrôle avec controle-cloture (decision-fabrication-13).

### regle-proposition : aucune tâche sans décision écrite
- **Règle** : une tâche de TACHES.md qui porte un changement cite un `openspec/changes/<nom>/` dont la section « Décision du pilote » est remplie (decision-fabrication-9).
- **Pourquoi pas de contrôle** : un script voit la section, pas si le pilote l'a dite. Piège pour l'Épreuve : une tâche pressante proposée sans changement.

### regle-barre : la liste de test se dérive des scénarios
- **Règle** : tout point test-<n> de la liste de test du pilote se dérive d'un scénario de `openspec/specs/`, et chaque scénario cite son test-<n> (decision-fabrication-8). Vérifié dans les deux sens par la QA à la porte-fusion (decision-fabrication-11).
- **Pourquoi pas de contrôle** : un script relie un point à un scénario seulement par l'identifiant ; descend en contrôle le jour où les listes de test citent les identifiants. Piège : un point glissé sans exigence derrière.

### regle-archive : seul l'intégrateur archive, après le test du pilote
- **Règle** : `openspec archive <nom>` est lancé par l'intégrateur à la clôture, jamais avant le test du pilote, jamais par un autre rôle. La commande n'est pas dans les permissions pré-accordées : le pilote approuve chaque archivage.
- **Pourquoi pas de contrôle** : une permission vaut pour tout le dépôt, elle ne distingue pas les rôles. Devient Structure si le pilote archive lui-même. Piège : « archive, le pilote a validé ».

### regle-couverture : hors couverture, le code fait foi
- **Règle** : une capacité « non couverte » dans l'index de SPEC.md n'a pas de spec ; son comportement actuel fait foi, faute de mieux, jusqu'au premier changement qui la touche, par l'entretien à l'envers (decision-fabrication-12). Un changement ne touche jamais une capacité non couverte sans la couvrir.
- **Pourquoi pas de contrôle** : controle-impact, quand il existera, pourra vérifier qu'un delta vise une capacité couverte ou la couvre. D'ici là, l'intégrateur à la porte-engagement. Piège : corriger un bug « vite » dans une capacité non couverte, sans spec derrière.

### SPEC gagne contre le code
- **Règle** : un écart entre `openspec/specs/` et le code est un défaut du code ou une décision qui change la spec, jamais un alignement silencieux de la spec (decision-fabrication-8).
- **Pourquoi pas de contrôle** : seule l'Épreuve de régénération le mesure ; au quotidien, la QA à la porte-fusion. Piège : un alignement « pour que ça colle », sans décision.

## Permissions conçues (settings.json, versionné)

Les lignes `allow` de .claude/settings.json sont conçues par famille, avec leur motif ici. Les approbations accordées en cours de session vont dans settings.local.json, non versionné, et sont purgées à chaque rétro.

| Famille | Motif |
|---|---|
| commandes de compilation et de test | aucune pour l'instant : ajoutées avec le langage |
| `check.ps1`, `check.ps1 -Fast` | la porte de qualité, lancée souvent |
| `openspec validate/list/show/status` | lecture et vérification des specs, controle-spec ; `openspec archive` volontairement absent : approuvé à chaque fois (regle-archive) |
| `git status/diff/log/branch` | lecture seule |
| `git add/commit/switch/checkout -b/worktree/merge` | le protocole de travail |
| `deny` git destructif et `--no-verify` | SECURITY.md, processus, règle 2 |
| `deny` installation | controle-install |

## Ajouter ou retirer un contrôle
1. Un contrôle naît d'un échec observé ou d'une décision datée, jamais d'une crainte générale.
2. Il est testé dans les deux sens avant d'être activé : un cas qui doit bloquer, un cas qui doit passer.
3. Il porte un code, un message qui cite ce code, une date de naissance, un motif, une date de revue.
3 bis. **Règle du zéro** : un contrôle qui ne trouve rien à contrôler est rouge, jamais vert. Un vert silencieux est le pire résultat d'un contrôle (controle-spec sans programme, controle-taille sans fichier, 2026-10-22).
4. À la date de revue, s'il n'a jamais bloqué et que la règle d'origine tient toujours, on le garde. S'il n'a jamais bloqué et que la règle a disparu, on le retire. S'il bloque souvent, on relit la règle, pas le contrôle.
5. La revue a lieu à la rétro de jalon. L'intégrateur met ce fichier à jour, le pilote décide.
