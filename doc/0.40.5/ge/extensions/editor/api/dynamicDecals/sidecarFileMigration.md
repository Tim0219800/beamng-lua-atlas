# `editor_api_dynamicDecals_sidecarFileMigration`

*File: `lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_dynamicDecals_sidecarFileMigration`: `extensions.load("editor_api_dynamicDecals_sidecarFileMigration")`, then the global `editor_api_dynamicDecals_sidecarFileMigration`

Migration of the "sidecar" files of the dynamic decal textures. Upgrades a sidecar from version 1 to version 2: removes the path field and replaces the (obsolete) sdf type with the boolean isSdfCompatible.

## Notes

- Known texture types: greyscale=0, color=1, sdf=2 (obsolete), fillTexture=3.
- Only the v1 -> v2 migration exists; data of another version is left untouched.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_dynamicDecals_sidecarFileMigration.migrate(data)` | Modifies the table in place: if data.version == 1, upgrades it to version 2 (path = nil, isSdfCompatible = (type == sdf)). | 34 |

### Parameter details

#### `editor_api_dynamicDecals_sidecarFileMigration.migrate(data)`

Modifies the table in place: if data.version == 1, upgrades it to version 2 (path = nil, isSdfCompatible = (type == sdf)).

- `data` (*table*) : Decoded sidecar content

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua`.*
