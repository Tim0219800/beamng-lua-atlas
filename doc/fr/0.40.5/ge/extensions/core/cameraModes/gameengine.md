# `core_cameraModes_gameengine`

*Fichier : `lua/ge/extensions/core/cameraModes/gameengine.lua` · VM : Game Engine (GE) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/gameengine")` (fichier sous extensions/ mais pas une extension classique)

Filtre global final (runningOrder 1) qui envoie la pose calculée (data.res) au moteur de rendu : pour la vue principale, setCameraPosRotFovNearClipC (avec OpenXR, combine d'abord la pose prédite du casque) ; pour un contexte supplémentaire (split-screen, flux vidéo), RenderViewManagerInstance:updateViewCamera avec projection orthographique optionnelle (res.ortho). Marque la vue principale 'cameraMotionContinuous' pendant les transitions de la grande carte. Renvoie un constructeur.

## Remarques

- Les vues split-screen plus étroites que 16:9 reçoivent un FOV élargi (33 % de la compensation théorique). Plan lointain fixé à 2000 m pour les vues supplémentaires.
- Ne vérifie pas levelLoaded : core_cameraUpdate ne tourne que niveau chargé.

## Classe `C`

Filtre de sortie vers le moteur.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_gameengine")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | isGlobal = true, runningOrder = 1, isFilter = true, hidden = true. | 12 |
| `C:update(data)` | Pousse data.res vers la vue principale ou vers data.renderView. | 68 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/gameengine.lua`.*
