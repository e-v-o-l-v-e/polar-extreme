# Polar Extreme (T3 25 SCI25 A)

## Équipe

- Claudel Gauthier : développeur back
- Courseaux Lucas : chef d'équipe, dévelopeur back, designer
- Dausse Capucine : dévelopeuse front, designer
- Preiss Ivanoé : développeur back

## 1. Présentation

## 1.2 Concept

Polar Extrême est un jeu sérieux de gestion, en 2D vu du dessus, s'inspirant de Rimworld (entre autre).

Dans Polar Extreme le joueur devient le concepteur et chef d'une base scientifique en Antarctique. Il doit maximiser la production scientifique, tout en prenant en compte l'écosystème. Ce faisant il découvrira, entre autre, le fonctionnement d'une vraie base polaire, et les différents pôles scientifiques.

## 1.2 Objectifs

L'objectif du jeu pour les développeurs.euses est de faire comprendre au joueur les enjeux scientifiques, humains et environnementaux liés à la construction et la gestion d’une station de recherche au pôles sud.

- **Scientifique**
  Découvrir le travail des scientifiques dans une base polaire.

- **Logistique**
  Analyser les enjeux de conception, de construction et de gestion durable et écologique d'une station scientifique en Antarctique, un milieu extrêmement hostile à l'être humain.

- **Humain**
  Comprendre les impacts psychologiques, culturels et sociaux de la vie en communauté dans un environnement isolé et multiculturel.  

## 2. Lancer le jeu.

### 2.1 Linux

Téléchargez et lancez [Polar Extreme Linux](./bin/polar-extreme-linux)

### 2.2 Windows

Téléchargez et lancez [Polar Extreme Windows](./bin/polar-extreme-windows)

## 3. Gameplay

### 3.1 But du Jeu

Le but du jeu pour le joueur est de produire de la science, dans la plus grande quantité possible.

### 3.2 Fin du jeu

Les parties durent 5 minutes par défault pour la démo, les joueurs peuvent continuer à jouer après s'ils le veulent, il y aura un tableau de meilleur score à 5 minutes.


### 3.3 Bâtiments

Les batiments se répartissent en 2 catégories : **Scientifique** et **Utilitaire**.
Les bâtiments scientifiques servent à produire de la science et à lancer des projets octroyant diverses récompenses.
Les bâtiments utilitaire servent à héberger et nourir les scientifiques, à produire de l'éléctricité, et à d'autres tâches n'ayant pas de lien direct avec la production de science.

Le joueur doit placer ses batiments en fonction du terrain et des besoins.
Les bâtiments doivent être reliés par des chemins pour permettre aux scientifiques de se déplacer sereinement.

### 3.4 Science

### 3.4.1 Bâtiments

Chaque bâtiment scientifique peut produire de la science de manière passive, si des scientifiques y sont assignés. La quantité de science produite augmente proportionellement au nombre de scientifique dans le bâtiment.

### 3.4.2 Projets

Des projets peuvent être lancés dans les bâtiments scientifiques. Pour lancer un projet le joueur doit y consacrer un nombre de scientifique variables. Chaque projets peut donner
  - un montant certain de science (affecté par le bien-être)
  - une augmentation de la productivité du bâtiments
  - une augmentation du nombre possible de scientifiques dans le batiments
  - une certaine quantité de pollution
  - une amélioration de l'impact écologique du batiment.

### 3.5 Bien-Être

Les scientifiques sont des êtres humains, ainsi leur santé impacte-t-elle grandement leur productivité et la qualité de leur travail, nous avons donc implémenté une jauge de bien-être. Lorsqu'elle est dans le positif cela veut dire que les scientifiques vont bien, ils sont donc plus productifs et cela augmente la science qu'ils créent. Lorsqu'elle est dans le négatif c'est l'inverse.

### 3.6 Pollution

Une autre jauge à prendre en compte est celle de pollution. Une base polaire ne doit pas détruire l'écosystème dans lequel elle se trouve, malheuresement l'activité humaine est problématique pour l'environnement, ainsi certains projets et bâtiments vont polluer et faire monter cette jauge. Si trop haute elle augmente la probabilité d'évenements climatiques dangeureux pour la base et les scientifiques. Elle affecte aussi la jauge de bien-être. Le joueur devra faire attention à cette jauge en choisissant les projets qu'il lance.

## 4. Spécifications Techniques

### 4.1 Moteur

Le jeu a été codé sous Godot 4 en GDScript.

### 4.2 Plateformes

Le jeu est disponible sous les plateformes suivantes :
- Windows
- Linux
- (Web & Android)

### 4.3 Input

Le jeu se joue à la souris.

### 4.4 Interface Utilisateur

TODO: mettre image à jour
![UI](assets/ui_readme.png) 

- En haut à gauche : 
  - Compteur de Science + accès au déblocage de nouveaux bâtiments (≃ arbre de compétence)
- A gauche :
  - Accès à la liste des projets
  - Accès à la gestion des scientifiques
- En bas au milieu:
  - Menu de construction des bâtiments débloqués & chemins
- En bas à droite : 
  - Menu paramètres (aussi accessible avec Echap)
- En haut à droite :
  - Jauge d'indice écologique
  - Jauge de bien-être global des scientifiques

# Crédits

  - Godot Engine : https://godotengine.org/license
  - Effets sonores fournis par Pixabay (https://pixabay.com)
