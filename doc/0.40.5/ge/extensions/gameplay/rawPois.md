# `gameplay_rawPois`

*Fichier : `lua/ge/extensions/gameplay/rawPois.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rawPois` : `extensions.load("gameplay_rawPois")`, puis la globale `gameplay_rawPois`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rawPois.clear()` |  | 11 |
| `gameplay_rawPois.getRawPoiGeneration()` |  | 188 |
| `gameplay_rawPois.getRawPoiListByLevel(levelIdentifier)` |  | 75 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onModManagerReady` | any |  |
| `showMissionMarkersToggled` | any |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetRawPoiListForLevel` — écouté par 15 module(s)
- `onGetRawPoiListForTutorial` — écouté par 4 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rawPois.lua`.*
