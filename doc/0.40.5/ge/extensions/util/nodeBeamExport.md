# `util_nodeBeamExport`

*Fichier : `lua/ge/extensions/util/nodeBeamExport.lua` · VM : Game Engine (GE) · 125 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_nodeBeamExport` : `extensions.load("util_nodeBeamExport")`, puis la globale `util_nodeBeamExport`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_nodeBeamExport.exportFile(filename)` | Export graph to JSON. If filename is nil, uses suggestFilename() | 97 |
| `util_nodeBeamExport.suggestFilename()` | Suggest a filename under the vehicle base path (fallback: user path) | 70 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/nodeBeamExport.lua`.*
