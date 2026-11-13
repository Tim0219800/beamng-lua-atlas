---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/lightingQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Préréglages de qualité d'éclairage, consommés par graphicsQualityGroup. Chaque niveau fixe le gestionnaire de lumière, le filtrage des ombres, le spéculaire, le normal mapping, le parallax, les vrais reflets d'eau et le groupe de qualité des shaders, via des clés $pref::*. Le hook onApply change le gestionnaire de lumière actif.
--- Accès : extension `core_settings_lightingQuality` : `extensions.load("core_settings_lightingQuality")`, puis la globale `core_settings_lightingQuality`
---@class core_settings_lightingQuality
---@field qualityLevels table<string, table<string, any>> Niveaux Lowest, Low, High, Ultra. Clés : $pref::lightManager, $pref::Shadows::filterMode, $pref::Video::disablePixSpecular, $pref::Video::disableNormalmapping, $pref::Video::disableParallaxMapping, $pref::Water::disableTrueReflections, $pref::Video::ShaderQualityGroup.
core_settings_lightingQuality = {}

--- Appelé par graphicsQualityGroup quand une valeur a changé. Lit $pref::lightManager ; si getActiveLightManager() est déjà égal, ne fait rien, sinon appelle setLightManager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/lightingQuality.lua:49
function core_settings_lightingQuality.onApply() end

