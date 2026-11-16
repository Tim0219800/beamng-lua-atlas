# `freeroam_levelStats`

*Fichier : `lua/ge/extensions/freeroam/levelStats.lua` · VM : Game Engine (GE) · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_levelStats` : `extensions.load("freeroam_levelStats")`, puis la globale `freeroam_levelStats`

Statistiques d'usage des niveaux et des points de départ pour l'interface : compte combien de fois chaque niveau/point de départ a été lancé et quand. Les données sont persistées dans `/settings/cloud/uiStats.json` (table `levels` avec count, lastUsed, spawnPoints, et table `vehicles`). Global : freeroam_levelStats.

## Remarques

- Le point de départ par défaut n'a pas de nom : il est stocké sous le nom interne `__default__` et restitué avec spawnPointName=nil.
- Les dates sont en ISO 8601 UTC (os.date '!%Y-%m-%dT%H:%M:%SZ').
- Chaque recordLevelSpawn réécrit tout le fichier JSON.
- Les listes triées placent en tête l'élément utilisé le plus récemment, puis les autres par nombre de lancements décroissant (à égalité, plus récent d'abord).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_levelStats.getTopLevels()` | Niveaux triés par usage (dernier utilisé en premier, puis par nombre). | 34 |
| `freeroam_levelStats.getTopSpawnPoints(levelName)` | Points de départ d'un niveau triés de la même façon. | 52 |
| `freeroam_levelStats.getUiStats()` | Regroupe topLevels et topSpawnPoints (les points de départ de tous les niveaux, concaténés, sans nom de niveau). | 70 |
| `freeroam_levelStats.recordLevelSpawn(levelName, spawnPointName)` | Incrémente le compteur et la date du niveau et du point de départ, puis sauvegarde le fichier de stats. | 16 |

### Détail des paramètres

#### `freeroam_levelStats.getTopLevels()`

Niveaux triés par usage (dernier utilisé en premier, puis par nombre).

- **renvoie** : table Liste de {levelName, count, lastUsed}.

#### `freeroam_levelStats.getTopSpawnPoints(levelName)`

Points de départ d'un niveau triés de la même façon.

- `levelName` (*string*) : Nom du niveau.
- **renvoie** : table Liste de {spawnPointName|nil, count, lastUsed}.

#### `freeroam_levelStats.getUiStats()`

Regroupe topLevels et topSpawnPoints (les points de départ de tous les niveaux, concaténés, sans nom de niveau).

- **renvoie** : table {topLevels, topSpawnPoints}

#### `freeroam_levelStats.recordLevelSpawn(levelName, spawnPointName)`

Incrémente le compteur et la date du niveau et du point de départ, puis sauvegarde le fichier de stats.

- `levelName` (*string*) : Nom du niveau.
- `spawnPointName` (*string|nil*) : Nom du point de départ ; nil = point par défaut.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/levelStats.lua`.*
