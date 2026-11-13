# `util_resaveMaterials`

*Fichier : `lua/ge/extensions/util/resaveMaterials.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_resaveMaterials` : `extensions.load("util_resaveMaterials")`, puis la globale `util_resaveMaterials`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_resaveMaterials.onExtensionLoaded()` | interface *(hook)* | 62 |
| `util_resaveMaterials.work(job)` |  | 25 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `TorqueScriptLua.` `exec`
- `obj:` `delete`, `getClassName`, `getName`
- `scenetree.` `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/resaveMaterials.lua`.*
