# `gameplay_missions_startTrigger`

*Fichier : `lua/ge/extensions/gameplay/missions/startTrigger.lua` · VM : Game Engine (GE) · 192 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_startTrigger` : `extensions.load("gameplay_missions_startTrigger")`, puis la globale `gameplay_missions_startTrigger`

Transforme le champ `startTrigger` d'une mission en liste de « locations » (zones de démarrage) et regroupe les zones proches en clusters pour la carte. Seul le type « coordinates » (niveau + position + rayon) produit réellement une location ; « league » et « none » n'en produisent aucune (nop). Utilisé par gameplay_missions_missions (getLocations) et par les marqueurs de missions.

## Exemple

```lua
local clusters = gameplay_missions_startTrigger.getMissionClusters(30)
for _, c in ipairs(clusters) do print(c.clusterId, c.level, c.pos, c.radius, dumps(c.missionIds)) end
```

## Remarques

- Champs obligatoires par type : level -> {level} ; coordinates -> {level,pos,radius} ; league -> {level} ; none -> {}.
- Une location est une table {type='coordinates', level, pos=vec3, rot=quat, radius, check=defaultLocationCheck, displayMarker=defaultLocationDisplayMarker}. rot vaut quat(0,0,0,1) par défaut.
- getMissionClusters met le résultat en cache par rayon de fusion (clé -1 si mergeRadius vaut nil) ; le cache est vidé par onAnyMissionChanged.
- Pour un cluster d'une seule mission, clusterId = id de la mission et missionIds est une liste {id}. Pour un cluster de plusieurs missions, clusterId est la concaténation des ids et missionIds = tableKeys(...) (ordre non garanti).
- Le rayon d'un cluster fusionné est max(rayon + distance au centre) - 1.
- Dans defaultLocationDisplayMarker, `canBeStarted` est fixé à true en dur (l'appel à gameplay_missions_missionManager.canBeStarted est commenté) : le marqueur est donc vert dès que le joueur est dans la zone.
- getMissionClusters modifie les tables de locations renvoyées par gameplay_missions_missions.getLocations en y ajoutant id, missionId et _qtId (déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission)` | Teste si le joueur est dans la zone de démarrage : même niveau, position et rayon définis, et distance au centre <= rayon. | 16 |
| `gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition)` | Dessine avec debugDrawer le marqueur d'une zone de démarrage : cylindre au sol de rayon `radius` et mât de 5 m. Rouge hors zone, vert à l'intérieur. | 21 |
| `gameplay_missions_startTrigger.getMissionClusters(mergeRadius)` | Regroupe en clusters toutes les locations « coordinates » de toutes les missions, niveau par niveau, grâce à un quadtree. Deux zones se regroupent si leurs disques se chevauchent (rayon de fusion fixe si mergeRadius est donné). | 127 |
| `gameplay_missions_startTrigger.onAnyMissionChanged()` | Hook émis par missionManager quand une mission change d'état : vide le cache des clusters. *(interne)* *(hook)* | 187 |
| `gameplay_missions_startTrigger.parseMission(mission)` | Crée la liste des locations d'une mission à partir de mission.startTrigger. Vérifie le type et les champs obligatoires. | 62 |

### Détail des paramètres

#### `gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission)`

Teste si le joueur est dans la zone de démarrage : même niveau, position et rayon définis, et distance au centre <= rayon.

- `location` (*table*) : Location {level, pos, radius}.
- `level` (*string*) : Identifiant du niveau courant (minuscules).
- `playerPosition` (*vec3*) : Position du joueur.
- `mission` (*table*) : Mission concernée (non utilisée).
- **renvoie** : boolean true si le joueur est dans la zone.

#### `gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition)`

Dessine avec debugDrawer le marqueur d'une zone de démarrage : cylindre au sol de rayon `radius` et mât de 5 m. Rouge hors zone, vert à l'intérieur.

- `location` (*table*) : Location {pos, radius}.
- `playerPosition` (*vec3*) : Position du joueur.

#### `gameplay_missions_startTrigger.getMissionClusters(mergeRadius)`

Regroupe en clusters toutes les locations « coordinates » de toutes les missions, niveau par niveau, grâce à un quadtree. Deux zones se regroupent si leurs disques se chevauchent (rayon de fusion fixe si mergeRadius est donné).

- `mergeRadius` (*number|nil*) : Rayon (m) utilisé à la place du rayon propre de chaque location ; nil = rayons des missions.
- **renvoie** : table Liste de clusters {type, level, pos, rot, radius, check, displayMarker, missionIds, clusterId}.

#### `gameplay_missions_startTrigger.parseMission(mission)`

Crée la liste des locations d'une mission à partir de mission.startTrigger. Vérifie le type et les champs obligatoires.

- `mission` (*table*) : Mission dont le champ startTrigger existe (supposé vérifié par l'appelant).
- **renvoie** : table Liste de locations (vide en cas d'erreur ou pour les types league/none).
- **renvoie** : string|nil Message d'erreur (type invalide ou champs manquants), nil si tout va bien.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/startTrigger.lua`.*
