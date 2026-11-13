# `gameplay_sites_sitesManager`

*Fichier : `lua/ge/extensions/gameplay/sites/sitesManager.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_sites_sitesManager` : `extensions.load("gameplay_sites_sitesManager")`, puis la globale `gameplay_sites_sitesManager`

Extension qui recense les fichiers *.sites.json de chaque niveau, les charge en objets « sites » (lieux, zones, places de parking) et les met en cache. Les scénarios, missions et le trafic passent par elle pour obtenir les sites d'une carte. Garde un cache par chemin de fichier, vidé à la fin de la mission.

## Exemple

```lua
local sites = gameplay_sites_sitesManager.loadSites(gameplay_sites_sitesManager.getCurrentLevelSitesFileByName('parking'))
```

## Remarques

- getCurrentLevelSitesFileByName compare le nom à celui du fichier privé de ses 11 derniers caractères (« .sites.json » + 1 : string.sub(siteName, 0, -12)) ; le nom passé doit donc être sans extension.
- getCurrentLevelSitesFiles ignore son paramètre « name ».
- getBestParkingSpotForVehicleFromList renvoie la dernière place de la liste en dernier recours (et plante si la liste est vide).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_sites_sitesManager.getAllLevelSites()` | Parcourt les niveaux (core_levels.getList) et reconstruit la table des fichiers *.sites.json par niveau (clé = nom de niveau en minuscules). Journalise le nombre de fichiers trouvés. | 13 |
| `gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots)` | Renvoie la première place où le véhicule rentre (vehicleFits) et qui n'est occupée par aucun véhicule (hasAnyVehicles), sinon la dernière de la liste. | 121 |
| `gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name)` | Trouve le fichier sites du niveau courant dont le nom (sans « .sites.json ») correspond. | 112 |
| `gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name)` | Liste des fichiers sites du niveau courant (getCurrentLevelIdentifier). | 108 |
| `gameplay_sites_sitesManager.getSitesFilesByLevel()` | Renvoie la table niveau -> liste de fichiers sites (la construit si besoin). | 104 |
| `gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache)` | Charge un fichier .sites.json et renvoie l'objet sites (désérialisé et finalisé). Utilise le cache si présent, sauf force. Ajoute site.dir et site.filename. | 30 |
| `gameplay_sites_sitesManager.onClientEndMission()` | Hook appelé à la fin de la mission : vide le cache des sites. *(interne)* *(hook)* | 62 |
| `gameplay_sites_sitesManager.onClientStartMission()` | Hook appelé au début d'une mission/niveau : mémorise le niveau courant. *(interne)* *(hook)* | 58 |
| `gameplay_sites_sitesManager.onDeserialized(data)` | Restaure l'état après un rechargement Lua. *(interne)* *(hook)* | 89 |
| `gameplay_sites_sitesManager.onModManagerReady()` | Hook appelé quand le gestionnaire de mods est prêt : construit la liste des fichiers sites. *(interne)* *(hook)* | 54 |
| `gameplay_sites_sitesManager.onSerialize()` | Sérialise la liste des fichiers, le niveau courant et le cache pour le rechargement Lua. Renvoie nil si rien n'est en cache. *(interne)* *(hook)* | 73 |

### Détail des paramètres

#### `gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots)`

Renvoie la première place où le véhicule rentre (vehicleFits) et qui n'est occupée par aucun véhicule (hasAnyVehicles), sinon la dernière de la liste.

- `vehId` (*integer|nil*) : Véhicule ; par défaut le véhicule du joueur 0.
- `parkingSpots` (*table[]*) : Liste d'objets parkingSpot.
- **renvoie** : table Place choisie.

#### `gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name)`

Trouve le fichier sites du niveau courant dont le nom (sans « .sites.json ») correspond.

- `name` (*string*) : Nom du fichier sans extension.
- **renvoie** : string|nil Chemin complet ou nil.

#### `gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name)`

Liste des fichiers sites du niveau courant (getCurrentLevelIdentifier).

- `name` (*any*) : Inutilisé.
- **renvoie** : string[] Chemins, table vide si aucun.

#### `gameplay_sites_sitesManager.getSitesFilesByLevel()`

Renvoie la table niveau -> liste de fichiers sites (la construit si besoin).

- **renvoie** : table<string, string[]> Fichiers par niveau.

#### `gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache)`

Charge un fichier .sites.json et renvoie l'objet sites (désérialisé et finalisé). Utilise le cache si présent, sauf force. Ajoute site.dir et site.filename.

- `filepath` (*string*) : Chemin du fichier .sites.json.
- `force` (*boolean|nil*) : Recharge même si en cache.
- `ignoreCache` (*boolean|nil*) : Ne pas stocker le résultat dans le cache.
- **renvoie** : table|nil Objet sites, ou nil si le fichier est illisible (erreur journalisée).

#### `gameplay_sites_sitesManager.onDeserialized(data)`

Restaure l'état après un rechargement Lua.

- `data` (*table|nil*) : Données de onSerialize.

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/sitesManager.lua`.*
