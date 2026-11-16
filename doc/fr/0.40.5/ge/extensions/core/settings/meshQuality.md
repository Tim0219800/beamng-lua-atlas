# `core_settings_meshQuality`

*Fichier : `lua/ge/extensions/core/settings/meshQuality.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_settings_meshQuality` : `extensions.load("core_settings_meshQuality")`, puis la globale `core_settings_meshQuality`

Préréglages de qualité des maillages (niveau de détail des shapes), consommés par graphicsQualityGroup. Chaque niveau fixe $pref::TS::detailAdjust et $pref::TS::skipRenderDLs.

## Remarques

- skipRenderDLs vaut 0 à tous les niveaux. Pas de hook onApply.

## Champs

| Champ | Type | Description |
|---|---|---|
| `qualityLevels` | table<string, table<string, number>> | Niveaux Lowest (detailAdjust 0.5), Low (0.75), Normal (1.0), High (1.5), Ultra (2.0), clé $pref::TS::detailAdjust ; $pref::TS::skipRenderDLs = 0 partout. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/settings/meshQuality.lua`.*
