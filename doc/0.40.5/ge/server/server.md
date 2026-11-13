# `server`

*Fichier : `lua/ge/server/server.lua` · VM : Game Engine (GE) · 424 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `server`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `server.createGame(levelPath, customLoadingFunction)` |  | 405 |
| `server.destroy(p)` |  | 376 |
| `server.fadeoutLoadingScreen(skipStart)` |  | 338 |
| `server.setLevelOffset(x, y, z)` |  | 61 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `loadingProgress` | any |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onClientCustomObjectSpawning` — écouté par 2 module(s)
- `onLoadingScreenFadeout` — écouté par 7 module(s)
- `onPlayerCameraReady` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `MenuHide`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`
- `Sim.` `deserializeObjectsFromFile`
- `TorqueScriptLua.` `exec`
- `be:` `decalManagerLoad`, `deleteDataBlocks`, `physicsDestroyWorld`, `physicsInitWorld`, `physicsStartSimulation`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/server/server.lua`.*
