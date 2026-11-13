# `ui_pause_photomode`

*Fichier : `lua/ge/extensions/ui/pause/photomode.lua` · VM : Game Engine (GE) · 109 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_photomode` : `extensions.load("ui_pause_photomode")`, puis la globale `ui_pause_photomode`

Façade du mode photo intégré au menu pause. Elle ne contient pas de logique : elle charge les huit modules ui_photomode_* (session, camera, scene, effects, advancedRender, capture, preview, presets) et leur redirige environ soixante fonctions via une table FORWARDED_FUNCTIONS. Elle relaie aussi les hooks moteur (métadonnées de capture, pré-rendu, update, fin de capture) vers les bons sous-modules.

## Exemple

```lua
ui_pause_photomode.requestScreenshot(...)  -- appelle ui_photomode_capture.requestScreenshot
```

## Remarques

- Les fonctions redirigées sont générées dynamiquement au chargement (M[nom] = function(...) return _G[cible][nom](...) end) ; elles ne figurent donc pas dans la liste statique du .md. Exemples : getCameraState, setCameraFov, setEffectsState, requestScreenshot, listPresets, applyPreset, beginPhotomodeSession, endPhotomodeSession, getRoutePayload. Leur signature est celle de la fonction cible.
- Le sous-module cible de chaque fonction : session (états de session/panneau/debug, routes), camera (caméra, bookmarks caméra, FOV, vitesse, roll, exposition), scene (scène, bookmarks d'environnement), effects, advancedRender, capture (captures, résolution), preview (aperçu, partage), presets (préréglages).

**Dépendances (chargées avant) :** `ui_photomode_session`, `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_effects`, `ui_photomode_advancedRender`, `ui_photomode_capture`, `ui_photomode_preview`, `ui_photomode_presets`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_photomode.onCollectScreenshotMetadata(...)` | Hook appelé lors de la collecte des métadonnées d'une capture ; délègue à ui_photomode_preview.collectScreenshotMetadata. *(interne)* *(hook)* | 84 |
| `ui_pause_photomode.onExtensionLoaded(...)` | Hook de chargement ; délègue à ui_photomode_session.handleExtensionLoaded. *(interne)* *(hook)* | 100 |
| `ui_pause_photomode.onExtensionUnloaded(...)` | Hook de déchargement ; délègue à ui_photomode_session.handleExtensionUnloaded. *(interne)* *(hook)* | 104 |
| `ui_pause_photomode.onPreRender(...)` | Hook appelé avant le rendu ; délègue à ui_photomode_capture.handlePreRender. *(interne)* *(hook)* | 88 |
| `ui_pause_photomode.onScreenshotAllDone(...)` | Hook appelé quand toutes les captures demandées sont terminées ; délègue à ui_photomode_capture.onScreenshotAllDone. *(interne)* *(hook)* | 96 |
| `ui_pause_photomode.onUpdate(...)` | Hook appelé à chaque frame ; délègue à ui_photomode_preview.handleUpdate. *(interne)* *(hook)* | 92 |

### Détail des paramètres

#### `ui_pause_photomode.onCollectScreenshotMetadata(...)`

Hook appelé lors de la collecte des métadonnées d'une capture ; délègue à ui_photomode_preview.collectScreenshotMetadata.

- `...` (*any*) : Arguments transmis tels quels.
- **renvoie** : any Valeur renvoyée par le sous-module.

#### `ui_pause_photomode.onExtensionLoaded(...)`

Hook de chargement ; délègue à ui_photomode_session.handleExtensionLoaded.

- `...` (*any*) : Arguments transmis.

#### `ui_pause_photomode.onExtensionUnloaded(...)`

Hook de déchargement ; délègue à ui_photomode_session.handleExtensionUnloaded.

- `...` (*any*) : Arguments transmis.

#### `ui_pause_photomode.onPreRender(...)`

Hook appelé avant le rendu ; délègue à ui_photomode_capture.handlePreRender.

- `...` (*any*) : Arguments transmis.

#### `ui_pause_photomode.onScreenshotAllDone(...)`

Hook appelé quand toutes les captures demandées sont terminées ; délègue à ui_photomode_capture.onScreenshotAllDone.

- `...` (*any*) : Arguments transmis.

#### `ui_pause_photomode.onUpdate(...)`

Hook appelé à chaque frame ; délègue à ui_photomode_preview.handleUpdate.

- `...` (*any*) : Arguments transmis.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Liste des extensions ui_photomode_* chargées avant ce module. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/photomode.lua`.*
