# `util_tileBake`

*Fichier : `lua/ge/extensions/util/tileBake.lua` · VM : Game Engine (GE) · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_tileBake` : `extensions.load("util_tileBake")`, puis la globale `util_tileBake`

Dev-only: bakes distant-city tile proxies. Buckets every static mesh + big forest item in
 the level into 200m tiles, packs each tile into one mesh, GPU-bakes it to a shared atlas and
 writes a tile glTF (via the C++ bakeTileToGltf). Feed the output to DevTools/instalod to make
 the simplified LODs. Load via:  extensions.load('util/tileBake')
 Output: /temp/tileBake/<level>/tile_<tx>_<ty>/  (atlas PNGs + tile_<tx>_<ty>.gltf + tile.json)

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_tileBake.onClientPostStartMission()` | re-run on (re)load when a level is already up *(hook)* | 136 |
| `util_tileBake.onExtensionLoaded()` | *(hook)* | 136 |
| `util_tileBake.onUpdate()` | *(hook)* | 144 |

## Appels vers le moteur (C++)

- `obj:` `getField`, `getScale`, `getTransform`, `getWorldBox`, `isSubClassOf`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/tileBake.lua`.*
