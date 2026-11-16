# `flowgraph_nodes_environment_getScatterySky`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/getScatterySky.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/getScatterySky")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get ScatterSky » (catégorie provider, tags environment/tod). Lit les paramètres actuels du ciel ScatterSky via core_environment. Sorties : skyBrightness (luminosité globale) et, cachées, les fichiers de gradient (string) : colorizeGradientFile (couleur du ciel), sunScaleGradientFile (soleil), ambientScaleGradientFile (ambiance), fogScaleGradientFile (brouillard), nightGradientFile (ambiance de nuit), nightFogGradientFile (brouillard de nuit).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame, lit les sept valeurs depuis core_environment et les écrit sur les sorties. | 26 |

## Appels vers le moteur (C++)

- `core_environment.` `getAmbientScaleGradientFile`, `getColorizeGradientFile`, `getFogScaleGradientFile`, `getNightFogGradientFile`, `getNightGradientFile`, `getSkyBrightness`, `getSunScaleGradientFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/getScatterySky.lua`.*
