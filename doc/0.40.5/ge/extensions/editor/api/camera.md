# `editor_api_camera`

*Fichier : `lua/ge/extensions/editor/api/camera.lua` · VM : Game Engine (GE) · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_camera` : `extensions.load("editor_api_camera")`, puis la globale `editor_api_camera`

API de caméra de l'éditeur. initialize(editorInstance) installe sur l'objet editor les constantes de type de caméra (CameraType_Game = 1, CameraType_Free = 2), les constantes de vitesse (CameraSpeed_Slowest 5, Slow 35, Slower 70, Normal 100, Faster 130, Fast 165, Fastest 200), l'état currentCameraType / previousCameraType et les fonctions de caméra libre, de repères de caméra (bookmarks stockés dans MissionGroup/CameraBookmarks) et de paramètres de caméra « lisse » (newton). Les fonctions listées sont donc des méthodes de editor, pas du module.

## Exemple

```lua
editor.toggleFreeCamera()
local id = editor.addCameraBookmark("vue du pont")
editor.jumpToCameraBookmark(id)
```

## Remarques

- selectCamera ne fait rien tant que le niveau n'est pas chargé (variable globale levelLoaded).
- Le zoom lisse (fitViewToSelectionSmooth) s'exécute dans un job de 21 pas de 50 ms ; le rayon de vue est borné entre 20 et 16000.
- Incohérence : fitViewToSelection teste editor.selection.objects (pluriel) alors que les autres fonctions testent editor.selection.object (singulier) ; le test sur le pluriel est donc toujours vrai pour « aucun objet » et utilise le gizmo.
- getCameraSpeed(speed) ignore son argument et retourne core_camera.getSpeed().
- setSmoothCameraMove / Rotate n'agissent qu'en caméra libre ; les valeurs « normalisées » de drag sont converties vers la plage 5-20 (1 = 5, 0 = 20).
- isFreeCamera est une fonction locale non exportée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_camera.initialize(editorInstance)` | Appelé par l'éditeur : installe les constantes et fonctions de caméra sur l'instance de l'éditeur. *(interne)* | 323 |

### Détail des paramètres

#### `editor_api_camera.initialize(editorInstance)`

Appelé par l'éditeur : installe les constantes et fonctions de caméra sur l'instance de l'éditeur.

- `editorInstance` (*table*) : Instance de l'éditeur.

## Classe `editor`

Méthodes ajoutées à l'instance de l'éditeur par ce module.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addCameraBookmark(name)` | Ajoute un repère de caméra nommé à la position actuelle de la caméra libre, dans MissionGroup/CameraBookmarks (groupe créé au besoin). | 171 |
| `editor.cameraLookAtPoint(pt)` | Oriente la caméra vers un point du monde. | 45 |
| `editor.clearCameraBookmarks()` | Supprime tous les repères de caméra. | 221 |
| `editor.copyCameraBookmarkToClipboard(obj)` | Copie dans le presse-papiers la position et rotation d'un repère sous forme de texte [x, y, z, qx, qy, qz, qw]. | 210 |
| `editor.deleteCameraBookmark(objectId)` | Supprime un repère de caméra. | 185 |
| `editor.fitViewToSelection(center)` | Place la caméra à 15 m en arrière du centre de la sélection (ou du gizmo) en gardant son orientation de départ puis la tourne vers le centre. | 74 |
| `editor.fitViewToSelectionSmooth()` | Comme fitViewToSelection mais avec une approche animée et une distance adaptée à la taille de la sélection. | 106 |
| `editor.getCamera()` | Retourne la caméra libre (commands.getCamera). | 39 |
| `editor.getCameraBookmarks()` | Retourne le groupe SimGroup contenant les repères (le crée si besoin ; nil sans MissionGroup). | 193 |
| `editor.getCameraSpeed(speed)` | Retourne la vitesse de la caméra libre. | 153 |
| `editor.getObjectLocationText(obj)` | Retourne la position et rotation d'un objet en texte [x, y, z, qx, qy, qz, qw] (usage interne à l'éditeur). | 199 |
| `editor.getSmoothCameraParams()` | Retourne les paramètres de la caméra libre lisse. | 290 |
| `editor.jumpToCameraBookmark(objectId)` | Déplace la caméra à la position et rotation d'un repère. | 237 |
| `editor.pasteCameraBookmarkFromClipboard()` | Applique à la caméra libre le texte de transformation lu dans le presse-papiers (commands.setFreeCameraTransformJson). | 215 |
| `editor.placeCameraAtPlayer()` | Place la caméra à la position du joueur (commands.dropCameraAtPlayer). | 60 |
| `editor.placeCameraAtSelection()` | Place la caméra au centroïde de la sélection d'objets (sans effet si rien n'est sélectionné). | 51 |
| `editor.placePlayerAtCamera()` | Place le véhicule du joueur à la position de la caméra (position seulement). | 65 |
| `editor.selectCamera(type)` | Choisit la caméra de la vue : jeu (commands.setGameCamera) ou libre (commands.setFreeCamera) ; mémorise le type précédent. | 12 |
| `editor.setCameraSpeed(speed)` | Règle la vitesse de la caméra libre (core_camera.setSpeed). | 149 |
| `editor.setSmoothCameraAngularDrag(drag)` | Règle la traînée angulaire de la caméra libre. | 269 |
| `editor.setSmoothCameraAngularDragNormalized(value)` | Règle la traînée angulaire à partir d'une valeur 0-1 (même échelle). | 283 |
| `editor.setSmoothCameraDrag(drag)` | Règle la traînée de translation de la caméra libre. | 262 |
| `editor.setSmoothCameraDragNormalized(value)` | Règle la traînée à partir d'une valeur 0-1 (1 donne 5, 0 donne 20). | 276 |
| `editor.setSmoothCameraMove(value)` | Active ou règle la translation « newton » (inertie) de la caméra libre. | 248 |
| `editor.setSmoothCameraParams(params)` | Applique des paramètres de caméra libre lisse et remet la vitesse angulaire à zéro. | 307 |
| `editor.setSmoothCameraRotate(value)` | Active ou règle la rotation « newton » de la caméra libre. | 255 |
| `editor.toggleFreeCamera()` | Bascule entre la caméra de jeu courante et la caméra libre de l'éditeur. | 30 |

## Appels vers le moteur (C++)

- `Sim.` `findObjectById`, `upcast`
- `obj:` `deleteObject`, `getId`, `getPosition`, `getRotation`, `getTransform`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/camera.lua`.*
