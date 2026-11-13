# `util_worker`

*Fichier : `lua/ge/extensions/util/worker.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_worker` : `extensions.load("util_worker")`, puis la globale `util_worker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_worker.onExtensionLoaded()` | interface *(hook)* | 115 |
| `util_worker.onJobDone(job, totalRunning)` | *(hook)* | 97 |
| `util_worker.onPreRender(dt)` | *(hook)* | 126 |

## Classe `N`

| Méthode | Description | Ligne |
|---|---|---|
| `N.calibrateESC(w)` |  | 91 |
| `N.compileImposters(w)` |  | 70 |
| `N.compileMesh(w)` |  | 50 |
| `N.renderVehiclePreview(w)` |  | 80 |
| `N.testImage(w)` |  | 60 |
| `N.testMod(w)` |  | 76 |
| `N.testVehiclesPerformances(w)` |  | 85 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `TorqueScriptLua.` `exec`

**Charge les extensions :** `test/renderVehiclePreview`, `util/calibrateESC`, `util/compileImposters`, `util/saveDynamicData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/worker.lua`.*
