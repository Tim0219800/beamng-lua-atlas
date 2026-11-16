# `core_settings_shadowsQuality`

*Fichier : `lua/ge/extensions/core/settings/shadowsQuality.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_shadowsQuality` : `extensions.load("core_settings_shadowsQuality")`, puis la globale `core_settings_shadowsQuality`

Préréglages de qualité des ombres, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Shadows::textureScalar et $pref::Shadows::disable. vehicleTexSizes donne en plus la taille de texture d'ombre des véhicules par niveau.

## Remarques

- Le niveau Disabled met $pref::Shadows::disable à 2 ; les autres niveaux à 0.
- vehicleTexSizes n'est pas appliqué par ce module : c'est une table de données lue ailleurs (graphic.lua).

## Champs

| Champ | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | Niveaux Disabled, Lowest, Low, Normal, High, Ultra. textureScalar : 0.25, 0.25, 0.5, 1.0, 2.0, 4.0. |
| `vehicleTexSizes` | table<string, integer> | Taille de texture d'ombre véhicule par niveau : Disabled 512, Lowest 512, Low 1024, Normal 2048, High 4096, Ultra 8192. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/shadowsQuality.lua`.*
