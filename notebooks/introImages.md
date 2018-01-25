Réalité augmentée et détection faciale
==================================================


# Mise en place d'environnement de développement

```bash
$> conda create -n facedetection  python=2.7 jupyter numpy  matplotlib opencv
$> source activate  facedetection
$> jupyter notebook
```

# Premiers pas

Le but de ce notebook est de se familiariser avec le traitement d'images en Python.

La premiere chose à faire consiste en charger les libraries qu'on souhaite utiliser (Matplotlib, Numpy et OpenCV):

```python
%matplotlib inline
import matplotlib.pyplot as plt
import numpy as np
import cv2
```

# Charger une image JPG comme une image avec OpenCV

```python
img = cv2.imread('img/facedetecImg.jpg')
```


