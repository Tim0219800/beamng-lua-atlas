# `core_settings_terrainQuality`

*Fichier : `lua/ge/extensions/core/settings/terrainQuality.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_terrainQuality` : `extensions.load("core_settings_terrainQuality")`, puis la globale `core_settings_terrainQuality`

Préréglages de qualité du terrain, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Terrain::lodScale et $pref::Terrain::detailScale. Le hook onApply force la mise à jour des textures de tous les TerrainBlock.

## Remarques

- Niveaux : Lowest, Low, Normal, High (pas de Ultra). Une valeur plus petite de lodScale donne plus de détail.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_terrainQuality.onApply()` | Appelé par graphicsQualityGroup quand une valeur a changé. Parcourt les objets de classe TerrainBlock (scenetree.findClassObjects) et appelle updateAllTextures() sur chacun s'il existe. *(interne)* *(hook)* | 39 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | lodScale / detailScale : Lowest 2.0 / 0.5, Low 1.5 / 0.75, Normal 1.0 / 1, High 0.75 / 1.5. |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/terrainQuality.lua`.*
