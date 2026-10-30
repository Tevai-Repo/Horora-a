# Contrat entre zones

> Ce que c'est : les interfaces et garanties entre zones, qui ne changent pas sans décision. Lu par : les développeurs, la QA et l'étude avant de coder ou de chiffrer. Écrit par : l'intégrateur. Change par : une décision du pilote, à l'ouverture d'un jalon. Figé par jalon. Un agent qui a besoin d'un changement le demande à l'intégrateur (question dans pilotage/QUESTIONS.md, ou ligne « [Demande] » dans son compte rendu). **Version : 0 (avant jalon-0), écrite le 2026-10-29.** Chaque garantie porte un identifiant (G-`<module>`-`<n>`) ; coupé par module dès qu'il dépasse 20 Ko, avec un index ici.

## Conventions

- Comment les zones se parlent : rien pour l'instant, aucune zone de code n'existe.
- **Changement cassant = fusion couplée** : quand une interface change de forme, les branches des deux zones sont fusionnées dans la même passe, jamais l'une sans l'autre.
- **Ajout sans casse = fusion ordonnée** : le côté qui fournit est fusionné avant le côté qui appelle.

## Ce qui ne change pas sans décision

Rien pour l'instant.

## Modules

Rien pour l'instant : un module par zone, avec ses types, ses garanties G-`<module>`-`<n>` et le partage des responsabilités, à l'ouverture du premier jalon qui en crée.
