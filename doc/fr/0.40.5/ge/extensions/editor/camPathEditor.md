# `editor_camPathEditor`

*Fichier : `lua/ge/extensions/editor/camPathEditor.lua` · VM : Game Engine (GE) · 2496 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_camPathEditor` : `extensions.load("editor_camPathEditor")`, puis la globale `editor_camPathEditor`

Éditeur de chemins de caméra du World Editor (fenêtre « Path Camera Tool », mode d'édition « Edit Camera Paths »). Il édite les chemins gérés par core_paths : chaque chemin est une liste de marqueurs {pos, rot, time, fov, positionSmooth, trackPosition, trackOffset, bullettime, cut, movingStart, movingEnd…} triés par temps. On peut créer/charger/sauver/supprimer un chemin, ajouter des marqueurs (Shift + clic gauche en mode édition, ou « + Add Marker » à la position de la caméra), régler les temps (Even Speed, Set Duration, Reverse, Relax Timings, Auto-smooth), orienter la caméra façon FPV (bank/aim), prévisualiser, lier le chemin à un replay (core_replay) et le jouer (core_paths.playPath), éventuellement en fermant l'éditeur. Il dessine les chemins (splines, frustums de caméra, sphères de marqueurs) et des surcouches de cadrage (règle des tiers, 16:9, 9:16). Dépend de core_camera.

## Exemple

```lua
extensions.load('editor_camPathEditor')
-- sélectionner un chemin existant dans l'éditeur :
editor_camPathEditor.selectPath(core_paths.getPaths()[1])
```

## Remarques

- Bug : le module affecte M.onExtensionLoaded = onExtensionLoaded, mais aucune variable locale onExtensionLoaded n'est définie : le champ vaut nil (hook inexistant, sans effet).
- onUpdate est vide (« currently unused but kept for future functionality »).
- Décalage de suivi de véhicule : curseurs X (droite/gauche), Y (avant/arrière), Z (haut/bas) de -5 à +5 m, affichés quand un marqueur suit le véhicule joueur (trackPosition). getTrackingOffset() le renvoie à core/cameraModes/path.lua, qui l'utilise quand aucun marqueur n'a de trackOffset propre.
- Chaque marqueur ajouté par addMarker a : time = temps du dernier marqueur + 2 s (ou position du replay si « Use with Replay » est coché), positionSmooth = 0.5, bullettime = 1, movingStart = movingEnd = true, fov de la caméra courante, trackPosition recopié du marqueur précédent. Si le temps du replay est identique à celui du dernier marqueur, ce dernier passe en cut = true.
- Tri des marqueurs : par temps ; à temps égal, un marqueur « cut » passe avant (sortMarkers). L'indice du marqueur sélectionné est recalculé après chaque tri (setDirty).
- Relax Timings (facteur 0,5) rapproche les temps intérieurs d'une répartition proportionnelle aux distances ; Even Speed répartit les temps pour une vitesse constante en ignorant les segments « cut » ; Auto-smooth combine adoucissement du cap, vitesse constante, limite de vitesse angulaire et active movingStart/movingEnd sur tous les marqueurs.
- L'aperçu de rendu dans une fenêtre dédiée (« cameraPathPreviewWindow ») est enregistré mais son contenu est commenté dans onEditorGui.
- Résolution des splines dessinées selon la distance : 0,1 / 0,2 / 0,25 / 0,5 m ; dessin limité à 600 m de rayon (drawDistance).
- Le champ M.currentPath contient le chemin actuellement édité (nil si aucun).

**Dépendances (chargées avant) :** `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_camPathEditor.getTrackingOffset()` | Fournit à core/cameraModes/path le décalage de suivi du véhicule réglé dans l'éditeur. | 2476 |
| `editor_camPathEditor.onClientStartMission()` | Appelé au début d'un niveau/mission : désélectionne le chemin courant (selectPath(nil)). *(interne)* *(hook)* | 2471 |
| `editor_camPathEditor.onEditorGui()` | Dessine la fenêtre « Path Camera Tool » (menu File : New, Load, Save, Delete, Render Options ; choix du chemin, replay, liste et propriétés des marqueurs, outils de timing, FOV, suivi, boutons Play, Play (Close Editor) et Stop) et les chemins de caméra dans le monde. Appelé à chaque frame par l'éditeur. *(interne)* *(hook)* | 2020 |
| `editor_camPathEditor.onEditorInitialized()` | Enregistre le mode d'édition camPathEditMode (icône, actionMap « CamPathEditor », raccourci Shift + clic gauche = « Add new marker ») et les fenêtres « pathCameraTool » (200x400) et « cameraPathPreviewWindow » (600x400). *(interne)* *(hook)* | 2453 |
| `editor_camPathEditor.onPreRender()` | Appelé avant le rendu : si l'éditeur est actif en mode « Edit Camera Paths », mémorise le ratio d'aspect de la fenêtre et dessine la surcouche de cadrage. *(interne)* *(hook)* | 2433 |
| `editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame, actuellement vide. *(interne)* *(hook)* | 2429 |
| `editor_camPathEditor.selectPath(path)` | Sélectionne un chemin de caméra : met à jour M.currentPath, désélectionne le marqueur, et charge le replay associé (path.replay) s'il existe et diffère du replay chargé ; sinon arrête le replay en cours. | 127 |

### Détail des paramètres

#### `editor_camPathEditor.getTrackingOffset()`

Fournit à core/cameraModes/path le décalage de suivi du véhicule réglé dans l'éditeur.

- **renvoie** : table|nil {x = droite/gauche, y = avant/arrière, z = haut/bas} en mètres, ou nil si les trois valeurs sont à 0

#### `editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame, actuellement vide.

- `dtReal` (*number*) : Delta temps réel en secondes
- `dtSim` (*number*) : Delta temps de simulation
- `dtRaw` (*number*) : Delta temps brut

#### `editor_camPathEditor.selectPath(path)`

Sélectionne un chemin de caméra : met à jour M.currentPath, désélectionne le marqueur, et charge le replay associé (path.replay) s'il existe et diffère du replay chargé ; sinon arrête le replay en cours.

- `path` (*table|nil*) : Chemin core_paths, ou nil pour désélectionner

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_camera'} : extensions chargées avant celle-ci. |
| `onExtensionLoaded` | nil | Référence à une variable locale jamais définie : vaut nil (voir notes). ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawText`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/camPathEditor.lua`.*
