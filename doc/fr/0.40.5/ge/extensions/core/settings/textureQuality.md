# `core_settings_textureQuality`

*Fichier : `lua/ge/extensions/core/settings/textureQuality.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_textureQuality` : `extensions.load("core_settings_textureQuality")`, puis la globale `core_settings_textureQuality`

Préréglages de qualité des textures, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Video::textureReductionLevel et $pref::Reflect::refractTexScale. Le hook onApply recharge les textures.

## Remarques

- Niveaux : Lowest, Low, Normal seulement.
- Le code précise que reloadTextures() peut être une opération lente.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_settings_textureQuality.onApply()` | Appelé par graphicsQualityGroup quand une valeur a changé. Appelle reloadTextures(). *(interne)* *(hook)* | 24 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | textureReductionLevel / refractTexScale : Lowest 2 / 0.5, Low 1 / 0.75, Normal 0 / 1. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/textureQuality.lua`.*
