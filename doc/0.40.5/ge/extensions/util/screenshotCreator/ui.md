# `util_screenshotCreator_ui`

*Fichier : `lua/ge/extensions/util/screenshotCreator/ui.lua` · VM : Game Engine (GE) · 864 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_ui` : `extensions.load("util_screenshotCreator_ui")`, puis la globale `util_screenshotCreator_ui`

Fenêtre ImGui « Vehicle Screenshot Creator (WIP) » du créateur de vignettes de véhicules. Elle sert de façade aux autres modules util_screenshotCreator_* : boutons pour lancer un travail (« Run selected models », « Run selected defaults », « Run current config », Stop avec barre de progression), ouverture du niveau showroom_v2_lighting_simple, onglets Output, Lighting, Debug (mode de cadrage et surcouches), Node outpainting, Models selection, Manual controls et Last run review. Elle gère aussi les outils de balisage du marquage de parking (champ thumbnailLayer, nécessite l'éditeur du monde), le masquage des applications d'interface, la coupure de la conduite pendant les réglages et la restauration de l'état de la session à la fermeture de la fenêtre.

## Exemple

```lua
extensions.load('util_screenshotCreator_ui')
util_screenshotCreator_ui.openWindow()
```

## Remarques

- La fenêtre n'affiche des commandes que si le véhicule du joueur provient d'un fichier de config .pc ; sinon un message d'erreur est affiché.
- openWindow charge util_screenshotCreator_settings si besoin, initialise les modules de l'éditeur (editor_main.initializeModules) et applique l'environnement de capture (settings.applyEnvironment, effectif dans le showroom seulement).
- Pendant un travail (job.isRunning), les onglets sont grisés ; le cadre de caméra n'est dessiné que si « Include margin in screenshot » est coché.
- À la fermeture de la fenêtre (ou au déchargement), restoreSessionState réactive la conduite, réaffiche les applications d'interface, rétablit la résolution de la fenêtre et restaure l'environnement si aucun travail ne tourne.
- « Generate missing thumbnails only » ne saute que les fichiers existants : une vignette vide n'est pas considérée comme manquante. « Reload UI when run is finished » appelle reloadUI() à la fin d'un travail.
- onDeserialized accepte d'anciens états où les réglages de settings et nodeOutpaint étaient stockés ici (resolutionPtr, fieldOfView…) et les migre.

**Dépendances (chargées avant) :** `ui_imgui`, `editor_main`, `core_camera`, `core_vehicles`, `core_gamestate`, `freeroam_freeroam`, `util_screenshotCreator_settings`, `util_screenshotCreator_job`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_shippedConfigs`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_ui.onDeserialized(data)` | Hook appelé après rechargement avec l'état sérialisé ; restaure l'interface et migre d'anciens formats. *(interne)* *(hook)* | 833 |
| `util_screenshotCreator_ui.onExtensionUnloaded()` | Hook de déchargement : exécute restoreSessionState (conduite, applications d'interface, résolution, environnement). *(interne)* *(hook)* | 158 |
| `util_screenshotCreator_ui.onSerialize()` | Hook de sérialisation avant rechargement : renvoie windowOpen, generateMissingThumbnailsOnly, reloadUIOnJobFinished, drivingEnabled, uiAppsVisible, cameraSpeed, runDone, reviewData, framingModeId, previousFov et isCameraSet. *(interne)* *(hook)* | 809 |
| `util_screenshotCreator_ui.onUpdate()` | Hook appelé à chaque frame : consomme l'indicateur de fin de travail, dessine les surcouches 3D et la fenêtre ImGui avec ses onglets, et met à jour le pinceau de nodeOutpaint. Quand la fenêtre est fermée, restaure l'état de la session une seule fois. *(interne)* *(hook)* | 687 |
| `util_screenshotCreator_ui.openWindow()` | Ouvre la fenêtre du créateur de captures (charge les réglages si nécessaire, initialise l'éditeur et applique l'environnement). | 785 |

### Détail des paramètres

#### `util_screenshotCreator_ui.onDeserialized(data)`

Hook appelé après rechargement avec l'état sérialisé ; restaure l'interface et migre d'anciens formats.

- `data` (*table|nil*) : État sérialisé.

#### `util_screenshotCreator_ui.onSerialize()`

Hook de sérialisation avant rechargement : renvoie windowOpen, generateMissingThumbnailsOnly, reloadUIOnJobFinished, drivingEnabled, uiAppsVisible, cameraSpeed, runDone, reviewData, framingModeId, previousFov et isCameraSet.

- **renvoie** : table État de l'interface.

#### `util_screenshotCreator_ui.openWindow()`

Ouvre la fenêtre du créateur de captures (charge les réglages si nécessaire, initialise l'éditeur et applique l'environnement).

- **renvoie** : boolean false si util_screenshotCreator_settings n'a pas pu être chargé, sinon true.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : ui_imgui, editor_main, core_camera, core_vehicles, core_gamestate, freeroam_freeroam et util_screenshotCreator_settings, job, lightingSetup, thumbnailConfig, framingManager, modelSelection, nodeOutpaint, shippedConfigs. |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`
- `scenetree.` `findObject`, `findObjectById`

**Charge les extensions :** `util_screenshotCreator_settings`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/ui.lua`.*
