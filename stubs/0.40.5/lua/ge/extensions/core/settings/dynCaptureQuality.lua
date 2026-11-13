---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/dynCaptureQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Préréglages de qualité des captures dynamiques des véhicules : reflets dynamiques (cubemap) et rétroviseurs dynamiques. Chaque fonction applique un niveau en écrivant les variables $pref::BeamNGVehicle::dynamicReflection::* ou dynamicMirrors::* dans VariableRegistry. Le commentaire du code dit qu'il restaure les réglages Normal/High/Ultra de la 0.39.
--- Accès : extension `core_settings_dynCaptureQuality` : `extensions.load("core_settings_dynCaptureQuality")`, puis la globale `core_settings_dynCaptureQuality`
---@class core_settings_dynCaptureQuality
---@field mirrorLevels table<string, table> Par niveau : enabled (boolean), textureSize (128 à 1024), detail (0 à 0.75), distance (50 à 300). Pas de facesPerUpdate.
---@field reflectionLevels table<string, table> Par niveau : enabled (boolean), textureSize (128 à 1024), facesPerUpdate (1 ou 2), detail (0 à 0.75), distance (50 à 300).
core_settings_dynCaptureQuality = {}

--- Applique un niveau de rétroviseurs dynamiques : écrit enabled, textureSize, detail et distance dans $pref::BeamNGVehicle::dynamicMirrors::*.
---Source : lua/ge/extensions/core/settings/dynCaptureQuality.lua:36
---@param level string Clé de mirrorLevels (Disabled, Lowest, Low, Normal, High, Ultra).
function core_settings_dynCaptureQuality.applyMirrors(level) end

--- Applique un niveau de reflets dynamiques : écrit enabled, textureSize, facesPerUpdate, detail et distance dans $pref::BeamNGVehicle::dynamicReflection::*.
---Source : lua/ge/extensions/core/settings/dynCaptureQuality.lua:26
---@param level string Clé de reflectionLevels (Disabled, Lowest, Low, Normal, High, Ultra).
function core_settings_dynCaptureQuality.applyReflection(level) end

