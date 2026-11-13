---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/meshQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Préréglages de qualité des maillages (niveau de détail des shapes), consommés par graphicsQualityGroup. Chaque niveau fixe $pref::TS::detailAdjust et $pref::TS::skipRenderDLs.
--- Accès : extension `core_settings_meshQuality` : `extensions.load("core_settings_meshQuality")`, puis la globale `core_settings_meshQuality`
---@class core_settings_meshQuality
---@field qualityLevels table<string, table<string, number>> Niveaux Lowest (detailAdjust 0.5), Low (0.75), Normal (1.0), High (1.5), Ultra (2.0), clé $pref::TS::detailAdjust ; $pref::TS::skipRenderDLs = 0 partout.
core_settings_meshQuality = {}

