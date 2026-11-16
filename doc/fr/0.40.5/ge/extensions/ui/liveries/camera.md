# `ui_liveries_camera`

*Fichier : `lua/ge/extensions/ui/liveries/camera.lua` · VM : Game Engine (GE) · 467 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_camera` : `extensions.load("ui_liveries_camera")`, puis la globale `ui_liveries_camera`

Pilote la caméra de l'éditeur de livrées : vues prédéfinies autour du véhicule (haut, gauche, droite, arrière, avant), cadrage de la caméra sur l'angle d'un décalque, et mode « transformation » où la caméra passe en caméra libre ou en orbite pendant le placement d'un décalque. Les mouvements sont exécutés dans des jobs (core_jobsystem) car la caméra a besoin d'une image pour se mettre à jour. Utilisé par l'interface de livrées via ui_liveries_camera.

## Remarques

- Un job de caméra en cours est annulé dès qu'une nouvelle demande arrive (activeRequestId sert à ignorer les jobs périmés).
- setView émet l'évènement UI « liveries_camera_viewApplied » avec { view = id } après un délai fixe de 0,35 s, car l'orbite n'a pas de callback de fin (voir core/cameraModes/orbit.lua).
- Les rotations d'orbite sont des vec3 en degrés (yaw, pitch, roll) : top (90,-90,0), left (-90,0,0), right (90,0,0), back (0,0,0), front (180,0,0).
- Un décalque est considéré « orthographique » si sa direction de caméra est à moins de 0,98 de produit scalaire d'un des six axes (top, left, right, back, front) ; il est alors cadré sur la vue prédéfinie correspondante.
- En mode transformation, si le placement à la souris est actif (editor_api_dynamicDecals.isUseMousePos), la caméra reste en orbite ; sinon elle passe en caméra libre.
- Le déplacement de la caméra libre est multiplié par 0,1 quand ui_liveries_decal.getSmallIncrements() est vrai.
- Le code contient un commentaire TODO indiquant que captureCameraName est probablement une protection devenue inutile.

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_camera.activateOrbitMode()` | Passe en caméra de jeu et active la caméra orbite du joueur 0. | 157 |
| `ui_liveries_camera.ensureTransformOrbitMode()` | Force la caméra en orbite pendant une transformation. Si elle était libre, annule les jobs, arrête le mouvement et, pour un décalque existant, remet l'orbite sur son angle. | 383 |
| `ui_liveries_camera.getViews()` | Renvoie la liste des vues prédéfinies pour l'interface. | 137 |
| `ui_liveries_camera.moveLeftRight(value, filterType, player)` | Entrée d'axe gauche/droite pendant une transformation. En caméra libre, déplace latéralement ; en orbite, fait tourner le lacet (rotate_yaw). Sans effet hors transformation. | 456 |
| `ui_liveries_camera.orbitToLayer(layerUid)` | Cadre la caméra orbite sur un décalque : vue prédéfinie si le décalque est orthographique, sinon rotation de l'orbite sur l'angle du décalque sans toucher à la distance. | 246 |
| `ui_liveries_camera.panToLayer(layerUid)` | Place la caméra libre à la position et à l'orientation mémorisées dans le décalque (camPosition, camDirection convertis dans le repère monde du véhicule). | 232 |
| `ui_liveries_camera.panUpDown(value, filterType, player)` | Entrée d'axe haut/bas pendant une transformation. En caméra libre, monte (valeur positive) ou descend (valeur négative) ; en orbite, fait tourner le tangage (rotate_pitch). Sans effet hors transformation. | 438 |
| `ui_liveries_camera.previewLayer(layerUid)` | Prévisualise un décalque : vue prédéfinie s'il est orthographique, sinon restaure l'angle exact (caméra libre : pose du décalque ; orbite active : rotation directe ; autre caméra : passage en orbite). | 265 |
| `ui_liveries_camera.setView(viewId)` | Applique une vue prédéfinie : repasse en caméra de jeu en mode orbite, règle la rotation par défaut du véhicule puis réinitialise la caméra, dans un job. Déclenche liveries_camera_viewApplied à la fin. | 145 |
| `ui_liveries_camera.setup()` | Démarre le module : mémorise la rotation d'orbite par défaut actuelle du véhicule du joueur pour la restaurer plus tard. Sans effet si déjà démarré. | 112 |
| `ui_liveries_camera.startTransform()` | Démarre le mode transformation pour un nouveau décalque : mémorise la caméra courante, puis garde l'orbite (placement souris) ou passe en caméra libre. Sans effet si une transformation est déjà active. | 329 |
| `ui_liveries_camera.startTransformAtLayer(layerUid)` | Démarre le mode transformation sur un décalque existant : mémorise la caméra courante, puis cadre le décalque en orbite (placement souris) ou en caméra libre. | 300 |
| `ui_liveries_camera.stopTransform()` | Termine la transformation : annule les jobs, arrête les mouvements et rotations, repasse en caméra de jeu, restaure la caméra et la rotation d'orbite mémorisées, puis réinitialise la caméra. | 404 |
| `ui_liveries_camera.teardown()` | Arrête le module : termine la transformation en cours (stopTransform), annule le job de caméra, et restaure la rotation d'orbite par défaut mémorisée par setup. Sans effet si le module n'est pas démarré. | 121 |
| `ui_liveries_camera.toggleTransformCameraMode()` | Bascule pendant une transformation entre caméra libre et caméra orbite. | 387 |

### Détail des paramètres

#### `ui_liveries_camera.activateOrbitMode()`

Passe en caméra de jeu et active la caméra orbite du joueur 0.

- **renvoie** : boolean Toujours true.

#### `ui_liveries_camera.ensureTransformOrbitMode()`

Force la caméra en orbite pendant une transformation. Si elle était libre, annule les jobs, arrête le mouvement et, pour un décalque existant, remet l'orbite sur son angle.

- **renvoie** : boolean false si aucune transformation n'est active, sinon true.

#### `ui_liveries_camera.getViews()`

Renvoie la liste des vues prédéfinies pour l'interface.

- **renvoie** : table[] Éléments { id, labelKey, icon } pour top, left, right, back, front.

#### `ui_liveries_camera.moveLeftRight(value, filterType, player)`

Entrée d'axe gauche/droite pendant une transformation. En caméra libre, déplace latéralement ; en orbite, fait tourner le lacet (rotate_yaw). Sans effet hors transformation.

- `value` (*number*) : Valeur d'axe signée.
- `filterType` (*any*) : Type de filtre d'entrée transmis à core_camera.rotate_yaw.
- `player` (*any*) : Joueur transmis à core_camera.rotate_yaw (déduit du code).

#### `ui_liveries_camera.orbitToLayer(layerUid)`

Cadre la caméra orbite sur un décalque : vue prédéfinie si le décalque est orthographique, sinon rotation de l'orbite sur l'angle du décalque sans toucher à la distance.

- `layerUid` (*string*) : Uid d'une couche decal avec pose de caméra.
- **renvoie** : boolean false si la couche est inutilisable.

#### `ui_liveries_camera.panToLayer(layerUid)`

Place la caméra libre à la position et à l'orientation mémorisées dans le décalque (camPosition, camDirection convertis dans le repère monde du véhicule).

- `layerUid` (*string*) : Uid d'une couche de type decal ayant une pose de caméra.
- **renvoie** : boolean false si la couche est introuvable ou sans pose de caméra.

#### `ui_liveries_camera.panUpDown(value, filterType, player)`

Entrée d'axe haut/bas pendant une transformation. En caméra libre, monte (valeur positive) ou descend (valeur négative) ; en orbite, fait tourner le tangage (rotate_pitch). Sans effet hors transformation.

- `value` (*number*) : Valeur d'axe signée.
- `filterType` (*any*) : Type de filtre d'entrée transmis à core_camera.rotate_pitch.
- `player` (*any*) : Joueur transmis à core_camera.rotate_pitch (déduit du code).

#### `ui_liveries_camera.previewLayer(layerUid)`

Prévisualise un décalque : vue prédéfinie s'il est orthographique, sinon restaure l'angle exact (caméra libre : pose du décalque ; orbite active : rotation directe ; autre caméra : passage en orbite).

- `layerUid` (*string*) : Uid d'une couche decal avec pose de caméra.
- **renvoie** : boolean false si la couche est inutilisable.

#### `ui_liveries_camera.setView(viewId)`

Applique une vue prédéfinie : repasse en caméra de jeu en mode orbite, règle la rotation par défaut du véhicule puis réinitialise la caméra, dans un job. Déclenche liveries_camera_viewApplied à la fin.

- `viewId` (*string*) : « top », « left », « right », « back » ou « front ».
- **renvoie** : boolean false (avec avertissement) si la vue est inconnue, sinon true.

#### `ui_liveries_camera.startTransformAtLayer(layerUid)`

Démarre le mode transformation sur un décalque existant : mémorise la caméra courante, puis cadre le décalque en orbite (placement souris) ou en caméra libre.

- `layerUid` (*string*) : Uid du décalque à éditer.
- **renvoie** : boolean false si une transformation est déjà active ou si la couche est inutilisable.

#### `ui_liveries_camera.toggleTransformCameraMode()`

Bascule pendant une transformation entre caméra libre et caméra orbite.

- **renvoie** : boolean false si aucune transformation n'est active, sinon true.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : editor_api_dynamicDecals. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/camera.lua`.*
