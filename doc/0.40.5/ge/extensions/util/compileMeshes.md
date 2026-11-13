# `util_compileMeshes`

*Fichier : `lua/ge/extensions/util/compileMeshes.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_compileMeshes` : `extensions.load("util_compileMeshes")`, puis la globale `util_compileMeshes`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_compileMeshes.onExtensionLoaded()` | interface *(hook)* | 238 |
| `util_compileMeshes.work(job)` |  | 51 |

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`, `requestShutdown`
- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `fileExists`, `fileSize`, `findFiles`, `hashFileSHA1`
- `TorqueScriptLua.` `exec`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/compileMeshes.lua`.*
