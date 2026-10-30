# Journal de pilotage

## 2026-10-29, integrateur : installation du Kit v0

- Demande du pilote : installer le Kit dans ce dépôt, depuis ..\kit-v0\ seulement, en intégrateur, sur une machine neuve.
- Trouvé : dépôt sans commit, contenant une copie brute de kit/projet-dev/, identique octet pour octet à la source ; distant GitHub présent ; openspec 1.14.3 déjà installé, télémétrie coupée ; core.hooksPath déjà à .githooks.
- Fait : copie brute retirée et arborescence installée depuis ..\kit-v0\kit\projet-dev ; modèles renommés et remplis de ce qui est connu ; openspec init --tools none, config.yaml et schemas/harnais/ copiés, schéma validé ; harnais.toml (origine neuf) ; harnais.lock écrit (2 fichiers du Kit) ; check.ps1 complet vert au premier passage.
- Pivots : aucun.
- Questions posées : question-1 (description, livre_a), question-2 (langage, zone, rôle développeur), question-3 (formule d'équipage) ; aucune réponse à ce jour, options recommandées appliquées en attendant pour 1 et 2.
- Temps : de 23:14 à 23:16 le 2026-10-29, chronomètre lancé après la lecture de la procédure et des modèles, lecture non chronométrée.
- Blocages par un contrôle : aucun.
- Écarts relevés entre la procédure et le Kit : les liens vers docs/ de la fabrication (exemple-gemini, lexique, niveaux-de-regles) n'existent pas dans ..\kit-v0\ ; le README de roles/ n'a pas été copié ; controle-spec est vert sur zéro spec, prévu par openspec/README.md du Kit mais en tension avec la règle du zéro.
- Livré : commit « harnais(pilotage): Kit v0 installé », étiquette kit-v0.
