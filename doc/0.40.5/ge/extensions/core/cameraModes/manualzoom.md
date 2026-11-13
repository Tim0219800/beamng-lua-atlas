# `core_cameraModes_manualzoom`

*Fichier : `lua/ge/extensions/core/cameraModes/manualzoom.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/manualzoom")` (fichier sous extensions/ mais pas une extension classique)

Filtre de zoom manuel : modifie le champ de vision (FOV, en degrés) selon MoveManager.zoomIn / zoomOut, borné entre fovMin et fovMax, et affiche le FOV via ui_message quand il change. Utilisé par d'autres modes (onboard, bigMap...). Ne fait rien en session OpenXR. Renvoie un constructeur.

## Remarques

- Vitesse de zoom : 4.5 * dt * (zoomIn - zoomOut) * fov (proportionnelle au FOV courant).
- Valeurs par défaut : fovDefault 80, fovMin 10, fovMax 120, uiTxt « ui.camera.fov ». La page extraite indique init(fovMin, fovMax, uiTxt) mais le code a quatre paramètres, fovDefault en premier.

## Classe `C`

Filtre de zoom. Champs : fov (courant), fovDefault, fovMin, fovMax, uiTxt.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_manualzoom")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(fovDefault, fovMin, fovMax, uiTxt)` | Initialise les bornes et remet le FOV à fovDefault. | 8 |
| `C:reset()` | Remet fov à fovDefault. | 18 |
| `C:update(data)` | Applique le zoom des entrées et écrit data.res.fov. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/manualzoom.lua`.*
