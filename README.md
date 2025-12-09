# T3 25 SCI25 A  

## Cahier des charges  

### 1. Présentation du projet

#### 1.1. Nom du jeu
Polar Extreme

#### 1.2. Type de jeu
Jeu de gestion en 2D vue de dessus (Rimworld like)

### 2. Contexte & objectifs

#### 2.1. Objectifs
Comprendre les enjeux scientifiques, humains et environnementaux liés à l’implantation et à la gestion d’une station de recherche en Antarctique, un milieu extrême hostile.  

- **Comprendre l’environnement de l'Antarctique**
  Identifier les caractéristiques géographiques, climatiques et les contraintes de vie liées à ce milieu extrême et isolé.  

- **Relever les défis techniques et logistiques**
  Analyser les enjeux de conception, de construction et de gestion durable d'une station scientifique en Antarctique.  

- **Explorer les dimensions humaines**
  Comprendre les impacts psychologiques, culturels et sociaux de la vie en communauté dans un environnement isolé et multiculturel.  

#### 2.2. Contraintes
- Date début : 3 septembre 2025
- Date fin : 19 décembre 2025
- Equipe de 4 personnes

### 3. Description du gameplay

#### 3.1. Vue & style
- 2D
- Vue de dessus
- Pixel art 

#### 3.2. Mécaniques principales
- Gestion d'une base polaire passant par
  - Construction / amélioration de bâtiments
  - Engagement de scientifiques (pnjs) permettant l'exploitation de ces bâtiments
  - Construction de chemins permettant de relier ces batîments et d'y conduire les scientifiques
- Production d'une monnaie / score appelée **Science** via la construction et la gestion de bâtiments
- Limite de temps avec score final

#### 3.3. Durée de vie
- 30 minutes de jeu pour une première partie
- 2 fins possibles :
  - Arriver à la fin du temps imparti : victoire & score
  - Base s'effondre avant la fin du temps imparti : défaite & 0 point

### 4. Spécifications techniques

#### 4.1. Moteur de jeu
Godot 4 (GDScript)

#### 4.2. Plateformes visées
- Windows
- Linux

### 5. Direction artistique

#### 5.1. Graphismes
- Pixel art 32px
- Couleurs dominantes : blanc & bleu

#### 5.2. Interface utilisateur
- UI moyennement chargée
- Souris + clavier (possibilité de jouer uniquement souris)

#### 5.3. Inspirations visuelles
- Rimworld

## Explications avancées des mécaniques 

### Menu du jeu
- 3 options disponibles :
  - Nouvelle partie
  - Paramètres
  - Quitter
- Si possible : 4eme option pour voir les scores sur un site web

### Paramètres
- Résolution
- Plein écran
- VSync
- Volume
  - Effets sonores
  - Musiques
- Sélection avec clic droit ou clic gauche

### En jeu

#### Interface utilisateur
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

#### Construction d'un bâtiment

Quand le joueur veut créer un batîment, le menu de construction les affichera répartis en 3 catégories :
- Recherche
  - Laboratoire de glaciologie
  - Laboratoire de physique de l'atmosphère
  - Laboratoire de magnétisme & sismologie
  - Laboratoire de biologie humaine
  - Mine de glace
  - Serre
- Vie quotidienne
  - Chambres
  - Cuisines
  - Salle à manger
  - Toilettes
  - Douches
  - Salle de repos
  - Salle de sport
- Technique
  - Tri des déchets
  - Recyclage de l'eau
  - Centrale électrique 

#### Projets de recherche  
- Chaque projet = taux de risque  
  - Plus de risque = plus de récompenses, mais plus de chance de flop  
- **Jauge de risques** :  
  - Chaque lancement de projet = probabilité d’échec plus ou moins forte  
  - En cas d'échec : impact sur bien-être des scientifiques et/ou impact sur l'écologie
- **Tableau des projets en cours** :  
  - Affiché sur le côté gauche de la zone de jeu (déroulant)
  - A la fin du projet, bouton pour récupérer les récompenses

#### Bien-être   
- Jauge de bien-être :  
  - Influence sur l’efficacité des projets  
  - Comprise entre 0 et 200%
- Beaucoup de bâtiments ont une influence sur le bien-être et la productivité  

#### Jauges et compteurs principaux
- **Science**  
  - Affichée en haut à gauche  
  - Production dépend des projets actifs  
  - Arbre de progression : débloque de nouveaux bâtiments ou augmente les limites  
- **Bien-être**
  - Déterminé par de nombreux facteurs : qualité des batîments, surpopulation, propreté, etc...
  - Influe sur la productivité de "science"  
- **Productivité**  
  - Nombre d’unités de science produites par secondes
- **Écologie**  
  - Respect de l'environnement par achat de bâtiments et lancement de projets + ou - éco-responsables
  - Ajoute un bonus / malus de points à la fin de la partie

## Crédits
  - Godot Engine : https://godotengine.org/license
