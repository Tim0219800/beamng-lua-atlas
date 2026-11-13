# `setSpawnpoint`

*Fichier : `lua/ge/setSpawnpoint.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `setSpawnpoint`

Mémorise et relit le point d'apparition par défaut choisi pour chaque niveau. Les données sont stockées dans settings/cloud/game-state.json (clé levels[nomNiveau].defaultSpawnPointName, plus lastLevelName). Il est utilisé par spawn.pickSpawnPoint et par le menu de choix de niveau.

## Exemple

```lua
setSpawnpoint.setDefaultSP('spawn_garage', 'gridmap_v2')
print(setSpawnpoint.loadDefaultSpawnpoint('gridmap_v2'))
```

## Remarques

- Dans setDefaultSP, 'levelName:lower() or core_levels.getLevelName(...)' ne peut jamais utiliser le repli : si levelName est nil, l'appel de :lower() provoque déjà une erreur. Il faut toujours fournir levelName.
- Dans loadDefaultSpawnpoint, le message d'erreur utilise 'levelname' (minuscules, variable inexistante) au lieu de 'levelName' : il affiche toujours 'nil'.
- loadDefaultSpawnpoint renvoie toujours une chaîne (vide '' si rien) et non nil : un test 'if result then' est donc toujours vrai (voir spawn.pickSpawnPoint).
- Le logTag du fichier est 'spawn.lua' (copié de spawn.lua), donc les logs apparaissent sous ce nom.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `setSpawnpoint.getLastLevelName()` | Lit lastLevelName dans le fichier de sauvegarde. | 58 |
| `setSpawnpoint.loadDefaultSpawnpoint(levelName)` | Renvoie le nom du point d'apparition par défaut du niveau : celui enregistré par l'utilisateur s'il figure dans la liste spawnPoints du fichier info du niveau et existe dans la scène, sinon defaultSpawnPointName du fichier info du niveau, sinon ''. | 30 |
| `setSpawnpoint.setDefaultSP(defaultSPName, levelName)` | Enregistre dans settings/cloud/game-state.json le point d'apparition par défaut pour un niveau et mémorise ce niveau comme dernier niveau. Loge un avertissement si l'écriture échoue. | 14 |

### Détail des paramètres

#### `setSpawnpoint.getLastLevelName()`

Lit lastLevelName dans le fichier de sauvegarde.

- **renvoie** : string|nil Nom du dernier niveau enregistré par setDefaultSP, nil si absent.

#### `setSpawnpoint.loadDefaultSpawnpoint(levelName)`

Renvoie le nom du point d'apparition par défaut du niveau : celui enregistré par l'utilisateur s'il figure dans la liste spawnPoints du fichier info du niveau et existe dans la scène, sinon defaultSpawnPointName du fichier info du niveau, sinon ''.

- `levelName` (*string|nil*) : Nom du niveau (niveau courant par défaut, via core_levels.getLevelName(getMissionFilename())).
- **renvoie** : string Nom (nom d'éditeur) du point d'apparition, ou '' ; '' aussi si le fichier info du niveau est illisible.

#### `setSpawnpoint.setDefaultSP(defaultSPName, levelName)`

Enregistre dans settings/cloud/game-state.json le point d'apparition par défaut pour un niveau et mémorise ce niveau comme dernier niveau. Loge un avertissement si l'écriture échoue.

- `defaultSPName` (*string*) : Nom (nom d'éditeur) du point d'apparition.
- `levelName` (*string*) : Nom du niveau (converti en minuscules).

## Champs

| Champ | Type | Description |
|---|---|---|
| `settingsFilePath` | string | Chemin du fichier JSON de sauvegarde : 'settings/cloud/game-state.json'. |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/setSpawnpoint.lua`.*
