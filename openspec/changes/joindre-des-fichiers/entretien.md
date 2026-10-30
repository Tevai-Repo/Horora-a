# Entretien

> Temps 1 de l'étude. Les fichiers font foi : ce qui a été dit ici ne vit pas dans la conversation. Fin quand la frontière est vide.

## Le besoin, en trois lignes

- Ce qui gêne, ou ce qu'on veut pouvoir faire : dans le détail d'une tâche, coller des images et déposer des fichiers, puis les revoir là, sur le téléphone comme sur l'ordinateur.
- Le signe que c'est réglé : je colle une capture d'écran dans le détail d'une tâche sur l'ordinateur ; sur le téléphone, en ouvrant la même tâche, je vois l'image.
- Ce que la demande ne doit pas devenir : un espace de stockage de documents, ni un éditeur de fichiers.

Besoin tiré par l'étude de question-entretien-36 de `ajouter-une-tache` ; à confirmer par le pilote (question-entretien-1).

## Faits vérifiés sans question

- Né de `ajouter-une-tache`, question-entretien-36 et question-entretien-37 : deux changements dans le même premier jalon, celui-ci après l'autre.
- Dépend de `ajouter-une-tache` : la tâche, son panneau de détail, le panneau des tâches et l'étiquette y sont définis.
- Le panneau de détail de `ajouter-une-tache` n'a rien à saisir ; ce changement y ajoute les pièces jointes.
- SECURITY.md, règle 4 : aucune exécution de contenu venant de données lues par le logiciel. Le modèle de menace, face produit, n'est pas écrit.
- Aucun budget écrit (SPEC.md, section 5) : la place de stockage n'a pas de cadre.

## Tours

### Tour 1

- **question-entretien-1** Le besoin ci-dessus, tiré de votre demande, est-il juste ? ➡ recommandé : oui.
  Réponse : oui, le 2026-10-30 (« Signé pour les doubles points, oui. ») — confirmée.

Reprises de `ajouter-une-tache`, posées et répondues là-bas le 2026-10-30, numéros d'origine :

- **question-entretien-38** Le mot : « Pièce jointe », une image ou un fichier attaché à une tâche ; ajouté à « Les mots » à l'archivage.
  Réponse : acceptée par défaut le 2026-10-30.
- **question-entretien-39** Le panneau de détail montre en plus les pièces jointes : une image en aperçu, un autre fichier par son nom et sa taille ; un appui ouvre l'image en grand ou télécharge le fichier.
  Réponse : acceptée par défaut le 2026-10-30.
- **question-entretien-40** Tout type de fichier accepté ; Horora'a n'en exécute ni n'en lit aucun, il les garde et les rend tels quels ; aperçu pour PNG, JPEG, GIF, WebP seulement.
  Réponse : acceptée par défaut le 2026-10-30.
- **question-entretien-41** 25 Mo au plus par fichier, 5 Go au total ; au-delà, refus avec un message qui dit la limite, la tâche reste intacte.
  Réponse : acceptée par défaut le 2026-10-30.
- **question-entretien-42** Sur le téléphone, un bouton « Joindre » : appareil photo, photos ou fichiers. Sur l'ordinateur, coller une image, glisser un fichier, ou ce bouton.
  Réponse : acceptée par défaut le 2026-10-30.
- **question-entretien-43** Retirer une pièce jointe, dès ce changement, avec confirmation.
  Réponse : acceptée par défaut le 2026-10-30.
- **question-entretien-44** Dans le panneau des tâches, un trombone et le nombre de pièces jointes à côté de l'étiquette.
  Réponse : acceptée par défaut le 2026-10-30.

Frontière vide le 2026-10-30.

## Épreuve d'intention

1. Le besoin redit : dans le panneau de détail d'une tâche, joindre des images et des fichiers, en collant, en glissant ou par un bouton « Joindre » ; les revoir en aperçu ou les télécharger sur l'autre appareil ; les retirer ; 25 Mo par fichier, 5 Go en tout.
2. La phrase de vision qu'il sert : aucune directement ; vision-1 pour « téléphone et ordinateur » et « sécurisé ».
3. Le principe qu'il tend : « Tâche : une chose à faire, en une ligne » (« Les mots ») devient une fiche avec des documents ; et « sécurisé » de vision-1 : des fichiers venus de l'extérieur, peut-être confidentiels, gardés et ouverts depuis des appareils connectés sans limite de temps.
4. Ce qu'on observera après, mesurable : pendant les quatre premières semaines, au moins une pièce jointe ajoutée par semaine, et chacune rouverte sur l'autre appareil identique à l'original (même taille, même aperçu).
5. Ce qui ferait revenir en arrière : aucune pièce jointe ajoutée en un mois ; ou la moitié des 5 Go atteinte en moins de six mois, signe que l'outil devient un espace de stockage.

Signée par le pilote le : 2026-10-30, « Signé pour les doubles points, oui. », lecture de l’étude « signé pour les deux, besoin oui » confirmée par le pilote le même jour (« oui tu peux signer les deux points »).
