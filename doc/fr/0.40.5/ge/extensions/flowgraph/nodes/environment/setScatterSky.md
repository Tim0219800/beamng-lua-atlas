# `flowgraph_nodes_environment_setScatterSky`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua` · VM : Game Engine (GE) · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setScatterSky")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set ScatterSky » (catégorie dynamic_instant). Règle la luminosité du ciel (skyBrightness) et les textures de gradient du ScatterSky (colorize, sunScale, ambientScale, fogScale, night, nightFog ; pins string cachés). Les valeurs d'origine sont mémorisées au démarrage et restaurées à l'arrêt (data.restoreScatterSky).

## Remarques

- Après application, le nœud relit puis réécrit l'heure (getTimeOfDay/setTimeOfDay) pour forcer la mise à jour du ciel.
- Les pins gradient sont tous appliqués même s'ils sont vides (valeur nil).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Mémorise la luminosité et les six fichiers de gradient actuels. | 30 |
| `C:_executionStopped()` | Restaure les valeurs mémorisées si data.restoreScatterSky est vrai. | 42 |
| `C:init(mgr)` | Définit data.restoreScatterSky = true. | 26 |
| `C:setScatterSkyParameters()` | Appelle les setters core_environment (setSkyBrightness, set*GradientFile) puis réapplique l'heure courante. | 65 |
| `C:work()` | En mode repeat, applique les paramètres à chaque frame. | 59 |
| `C:workOnce()` | Applique les paramètres une fois. | 55 |

## Appels vers le moteur (C++)

- `core_environment.` `getAmbientScaleGradientFile`, `getColorizeGradientFile`, `getFogScaleGradientFile`, `getNightFogGradientFile`, `getNightGradientFile`, `getSkyBrightness`, `getSunScaleGradientFile`, `getTimeOfDay`, `setAmbientScaleGradientFile`, `setColorizeGradientFile`, `setFogScaleGradientFile`, `setNightFogGradientFile`, `setNightGradientFile`, `setSkyBrightness`, `setSunScaleGradientFile`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua`.*
