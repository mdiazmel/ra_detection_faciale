Réalité augmentée et détection faciale
=========================================

Ce projet à pour objective la mise en ouvre d'un système de détection faciale 
pour des applications de réalité augmentée. Parmi ces applications on peut 
compter par exemple, les applications du type "face swapping" ou la modification
de caractéristiques aux visages détectés pour la création de personages (du type
les filtres de Snapshat). Les élèves devront appliquer diverses techniques de 
traitement d'image comme par exemple la détection de points d'intérêt, la 
détection de visages, la calibration de cameras et les graphiques par ordinateur.
La mise en ouvre des bonnes pratiques de programmation dans des langages comme 
Matlab, Python ou C++ est fortement conseillé.

# Installer l'environnement dans son ordinateur
  
Réaliser les pas à continuation pour installer l'environnement dans son ordinateur.

  * Installer [git](https://git-scm.com/download/) 
   
  * Installer [Anaconda](https://www.anaconda.com/download/)

  * Si vous travaillez sous ***Windows***, lancer l'application **Git bash**.

  * Depuis la fenêtre de commandes de **Git bash**, cloner le dépôt git contenant le code source :
   
   ```bash
      $> git clone https://github.com/mdiazmel/ra_detection_faciale.git
      $> cd ra_detection_faciale/
   ```

  * Ensuite, créer un environnement Conda nommé *facedetection* :
   
   ```bash
      $> conda create -n facedetection  python=2.7 jupyter numpy  matplotlib opencv
   ```

  * Activer son environnement *facedetection* et lancer le **notebook jupyter**

   ```bash
      $> source activate  facedetection
      $> jupyter notebook
   ```

Vous pouvez commencer à travailler !




