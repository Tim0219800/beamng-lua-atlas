# `editor_toolUtilities_daeExport`

*Fichier : `lua/ge/extensions/editor/toolUtilities/daeExport.lua` · VM : Game Engine (GE) · 422 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_daeExport` : `extensions.load("editor_toolUtilities_daeExport")`, puis la globale `editor_toolUtilities_daeExport`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_daeExport.beginBake()` | Start a bake run, so the next prepDir on each folder empties it again. | 380 |
| `editor_toolUtilities_daeExport.lenTag(L)` | Length -> filesystem/id-safe tag: 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125". | 33 |
| `editor_toolUtilities_daeExport.outDir(folder)` | Where one kit's baked shapes live, released root or working root. Takes the folder name alone. | 407 |
| `editor_toolUtilities_daeExport.prepDir(dir)` |  | 390 |
| `editor_toolUtilities_daeExport.writeDae(path, part, matName, gid)` | Serialize `part` and write it to the VFS `path` as a plain static shape. Returns true on success. | 342 |
| `editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize)` | Serialize a multi-LOD + collision shape (see colladaDocLODs) and write it to the VFS `path`. Returns true on success. | 365 |
| `editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz)` | Serialize a list of material `parts` (each with .material) and write them to the VFS `path` as one multi-material static<br> shape. gid is the geometry/node id base. (ox,oy,oz) (optional) is a local origin subtracted from every vertex so the shape<br> stays near its own origin (place the TSStatic at that origin). Returns true on success. | 373 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `procRoot` | string | Public interface. |
| `wipRoot` | string |  |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/daeExport.lua`.*
