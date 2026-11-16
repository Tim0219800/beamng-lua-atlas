# `gameplay_sites_sites`

*Fichier : `lua/ge/extensions/gameplay/sites/sites.lua` · VM : Game Engine (GE) · 233 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/sites")` (fichier sous extensions/ mais pas une extension classique)

Classe « Sites » : conteneur d'un fichier *.sites.json. Regroupe trois listes triées (locations, zones, parkingSpots), des index par tag et des arbres spatiaux (kd-trees) pour les requêtes par position. Le module renvoie un constructeur ; on l'obtient en général via gameplay_sites_sitesManager.loadSites. Après chargement, finalizeSites() calcule les liens zone/lieu/place et les index.

## Exemple

```lua
local sites = gameplay_sites_sitesManager.loadSites(path)
local list = sites:getRadialParkingSpots(pos, 0, 50)
for _, e in ipairs(list) do print(e.ps.name, math.sqrt(e.squaredDistance)) end
```

## Remarques

- Le compteur d'identifiants _uid est local au module et partagé par tous les objets sites : les identifiants sont uniques globalement, pas par fichier.
- onDeserialized vide locations et zones mais pas parkingSpots avant de recharger.
- Les requêtes radiales travaillent en 2D (z ignoré) ; les distances renvoyées sont au carré.
- Les requêtes spatiales (getRadial*, getClosestParkingSpot, getZonesForPosition) ne fonctionnent qu'après finalizeSites().

## Classe `C`

Objet sites. Champs : name, description, id, locations / zones / parkingSpots (gameplay/util/sortedList, avec .sorted et .objects), tags, sortedTags, tagsToZones, tagsToLocations, quadtreeLocations, quadtreeZones, quadtreeParkingSpots, dir, filename.

Le module renvoie un constructeur : `local obj = require("gameplay_sites_sites")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug()` | Dessine en debug toutes les locations, zones et places de parking. | 26 |
| `C:finalizeSites()` | À appeler après chargement. Génère les places multiples, trie, construit les index de noms et de tags, rattache les locations et places aux zones qui les contiennent (test 2D) et construit les kd-trees. | 59 |
| `C:getClosestParkingSpot(pos)` | Place de parking la plus proche de pos (kd-tree 3D). | 173 |
| `C:getNextUniqueIdentifier()` | Incrémente et renvoie le compteur global d'identifiants d'objets de sites. | 11 |
| `C:getRadialLocations(pos, minRadius, maxRadius)` | Liste les locations dont la distance 2D à pos est comprise entre minRadius et maxRadius. | 135 |
| `C:getRadialParkingSpots(pos, minRadius, maxRadius)` | Liste les places de parking dont la distance 2D à pos est comprise entre minRadius et maxRadius. | 155 |
| `C:getTagsForZonesAtPosition(pos)` | Réunit les tags de toutes les zones qui contiennent pos. | 209 |
| `C:getZonesForPosition(pos)` | Zones dont le contour 2D contient pos. | 178 |
| `C:init(name)` | Constructeur : crée les trois listes triées et un nom par défaut « Sites ». | 16 |
| `C:onDeserialized(data, oldIdMap)` | Recharge le jeu de sites depuis une table sérialisée (les « \n » littéraux de la description deviennent de vrais retours à la ligne). | 45 |
| `C:onSerialize()` | Sérialise name, description, les trois listes, dir et filename. | 32 |
| `C:zonesForPositionIterator(pos, ctx)` | Itérateur générique sur les zones contenant pos, à utiliser dans un for : for id, zone in sites:zonesForPositionIterator(pos) do. Évite d'allouer une table ; ctx peut être réutilisé. | 201 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/sites.lua`.*
