# `flowgraph_nodes_environment_getCloud`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/getCloud.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/getCloud")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Clouds » (catégorie repeat_instant, tags environment/weather/cloud). Lit les paramètres d'un objet nuage via core_environment. Entrée : objectId (number, optionnel). Sorties : coverage (couverture du ciel), exposure (luminosité), windSpeed (vitesse de défilement de la texture), height (hauteur). Sans objectId, utilise les nuages par défaut : seules coverage (getCloudCover) et windSpeed (getWindSpeed) sont disponibles, exposure et height valent 0.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame, remplit les sorties depuis core_environment (getCloud*ByID si objectId, sinon valeurs par défaut). | 24 |

## Appels vers le moteur (C++)

- `core_environment.` `getCloudCover`, `getCloudCoverByID`, `getCloudExposureByID`, `getCloudHeightByID`, `getCloudWindByID`, `getWindSpeed`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/getCloud.lua`.*
