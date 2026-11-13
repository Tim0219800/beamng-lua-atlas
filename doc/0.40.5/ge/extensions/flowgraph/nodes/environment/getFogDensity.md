# `flowgraph_nodes_environment_getFogDensity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/getFogDensity.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/getFogDensity")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Fog » (catégorie provider, tags environment/tod). Lit les paramètres de brouillard actuels : sorties density (core_environment.getFogDensity) et atmosphereHeight (getFogAtmosphereHeight).

## Remarques

- legacyPins déclare un renommage fog -> density dans _in alors que density est une sortie ici (reste du nœud Set Fog) ; sans effet.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame, écrit la densité et la hauteur atmosphérique du brouillard sur les sorties. | 28 |

## Appels vers le moteur (C++)

- `core_environment.` `getFogAtmosphereHeight`, `getFogDensity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/getFogDensity.lua`.*
