# `gameplay_sites_location`

*Fichier : `lua/ge/extensions/gameplay/sites/location.lua` · VM : Game Engine (GE) · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/location")` (fichier sous extensions/ mais pas une extension classique)

Classe « Location » d'un jeu de sites (fichier *.sites.json) : un point nommé de la carte avec une position, un rayon et une couleur. Sert à marquer des lieux (départ, arrivée, point d'intérêt) dans les scénarios, missions et le trafic. Le module renvoie un constructeur : require('/lua/ge/extensions/gameplay/sites/location')(sites, name, forceId).

## Exemple

```lua
local loc = require('/lua/ge/extensions/gameplay/sites/location')(sitesObj, 'Garage')
loc:set(vec3(0,0,0), 8)
local info = loc:findClosestRoadInfo()
```

## Remarques

- Rayon par défaut 5 m ; drawMode par défaut 'faded' ; sortOrder par défaut 999999.
- onDeserialized fixe le rayon via set(...) puis le réécrit avec « data.radius or 5 » ; si data.radius vaut nil, set() met d'abord radius à nil avant la correction.
- findClosestRoadInfo nécessite le module global map (renvoie nil sinon).

## Classe `C`

Objet location. Champs : sites, id, name, color (vec3), pos (vec3), radius, customFields (gameplay/util/customFields).

Le module renvoie un constructeur : `local obj = require("gameplay_sites_location")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug(drawMode, clr)` | Dessine une sphère de debug (et le nom si le mode n'est pas 'faded'). En mode 'highlight', dessine aussi la route la plus proche. Rien au-delà de la distance de visualisation (300 m, ou la préférence de l'éditeur). | 45 |
| `C:findClosestRoadInfo()` | Cherche le segment de route le plus proche via map.findClosestRoad et renvoie le point projeté sur ce segment, avec le rayon interpolé. Les nœuds a et b sont permutés pour que a soit le plus proche. | 81 |
| `C:init(sites, name, forceId)` | Constructeur appelé par le module. Prend un identifiant unique de l'objet sites si forceId est absent, nom par défaut « Location <id> ». | 8 |
| `C:onDeserialized(data)` | Restaure name, color, position, rayon et champs personnalisés depuis une table sérialisée. | 32 |
| `C:onSerialize()` | Renvoie une table sérialisable (name, pos, radius, color, oldId, customFields). | 20 |
| `C:set(pos, radius)` | Définit la position et le rayon de la location. | 40 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/location.lua`.*
