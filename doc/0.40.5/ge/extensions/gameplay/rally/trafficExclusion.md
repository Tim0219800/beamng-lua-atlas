# `gameplay_rally_trafficExclusion`

*Fichier : `lua/ge/extensions/gameplay/rally/trafficExclusion.lua` · VM : Game Engine (GE) · 271 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_trafficExclusion` : `extensions.load("gameplay_rally_trafficExclusion")`, puis la globale `gameplay_rally_trafficExclusion`

Calcule des zones sphériques d'exclusion du trafic IA le long des spéciales de rallye, puis les applique au navgraph (`map.setTrafficExclusionZones` + `map.reset`) pour que le trafic ne circule pas sur le parcours. Les zones viennent de la driveline (drivelineV3) de chaque mission `rallyStage`, échantillonnée tous les 1,5 x rayon, et, pour une boucle, d'un fichier optionnel `trafficGatedRoads.grzones.json` du dossier de la mission. Rayon par défaut : 10 m.

## Exemple

```lua
gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, 12)
-- ...plus tard
gameplay_rally_trafficExclusion.clearTrafficExclusion()
```

## Remarques

- Seules les missions de type `rallyStage` produisent des zones ; les autres types donnent un avertissement « Unsupported mission type ». Les sections de route (rallyRoadSection) retrouvées via extractMissionIdsFromRallyLoop sont donc ignorées à la création des zones.
- Si aucune mission n'est donnée à createZones, la mission courante de l'éditeur de rallye (editor_rallyEditor.getMissionId) est utilisée.
- applyForRallyLoop et clearTrafficExclusion appellent map.reset(), qui recharge le navgraph : opération coûteuse.
- Les fonctions loadRacePath, createZonesForRallyStage et applyForMissionIds sont du code mort (commenté ou local non utilisé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, radius)` | Applique l'exclusion de trafic pour une boucle : retrouve les missions via extractMissionIdsFromRallyLoop, crée les zones, ajoute les sphères du fichier optionnel trafficGatedRoads.grzones.json (champ spheres avec pos {x,y,z} et radius), puis appelle map.setTrafficExclusionZones et map.reset(). | 211 |
| `gameplay_rally_trafficExclusion.clearTrafficExclusion()` | Supprime toutes les zones d'exclusion (map.clearTrafficExclusionZones) et recharge le navgraph (map.reset). | 258 |
| `gameplay_rally_trafficExclusion.createZones(missions, radius)` | Construit la liste de zones d'exclusion pour des missions de rallye. Pour chaque mission `rallyStage`, charge la driveline et échantillonne ses points tous les 1,5 x radius. | 101 |
| `gameplay_rally_trafficExclusion.extractMissionIdsFromRallyLoop(mission)` | Lit mission.fgVariables d'une mission de boucle et renvoie les ids des missions utilisées, dans l'ordre : pour chaque étape 1 à 4, la section de route (`stageN_rallyRoadSection`) puis la spéciale (`stageN_rallyStage`), enfin `return_rallyRoadSection`. Les valeurs ont le format « Nom (id) » ; `<none>` est ignoré. | 151 |
| `gameplay_rally_trafficExclusion.getDefaultRadius()` | Renvoie le rayon par défaut des zones. | 268 |

### Détail des paramètres

#### `gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, radius)`

Applique l'exclusion de trafic pour une boucle : retrouve les missions via extractMissionIdsFromRallyLoop, crée les zones, ajoute les sphères du fichier optionnel trafficGatedRoads.grzones.json (champ spheres avec pos {x,y,z} et radius), puis appelle map.setTrafficExclusionZones et map.reset().

- `loopMission` (*table*) : Mission boucle.
- `radius` (*number|nil*) : Rayon des zones issues des spéciales ; défaut 10.
- **renvoie** : table[] Zones appliquées ({pos, radius}) ; table vide si loopMission est nil.

#### `gameplay_rally_trafficExclusion.createZones(missions, radius)`

Construit la liste de zones d'exclusion pour des missions de rallye. Pour chaque mission `rallyStage`, charge la driveline et échantillonne ses points tous les 1,5 x radius.

- `missions` (*table[]|nil*) : Missions (objets de gameplay_missions_missions). Si vide ou nil, utilise la mission de l'éditeur de rallye.
- `radius` (*number|nil*) : Rayon des zones en mètres ; défaut 10.
- **renvoie** : table[] Liste de {pos = vec3, radius = number} ; vide si rien n'est disponible.

#### `gameplay_rally_trafficExclusion.extractMissionIdsFromRallyLoop(mission)`

Lit mission.fgVariables d'une mission de boucle et renvoie les ids des missions utilisées, dans l'ordre : pour chaque étape 1 à 4, la section de route (`stageN_rallyRoadSection`) puis la spéciale (`stageN_rallyStage`), enfin `return_rallyRoadSection`. Les valeurs ont le format « Nom (id) » ; `<none>` est ignoré.

- `mission` (*table*) : Mission de type boucle (avec fgVariables).
- **renvoie** : string[] Ids de missions ; vide si fgVariables est absent.

#### `gameplay_rally_trafficExclusion.getDefaultRadius()`

Renvoie le rayon par défaut des zones.

- **renvoie** : number 10 (mètres).

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/trafficExclusion.lua`.*
