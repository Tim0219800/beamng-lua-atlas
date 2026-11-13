---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/clusteredQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Préréglages de qualité pour l'éclairage « clustered » (lumières locales groupées) et leurs ombres. Chaque niveau (Lowest, Low, Normal, High, Ultra) fixe des propriétés de l'objet moteur global ClusterShading. Utilisé par le système de réglages graphiques (graphic.lua) ; un moddeur peut appeler applyLevel directement.
--- Accès : extension `core_settings_clusteredQuality` : `extensions.load("core_settings_clusteredQuality")`, puis la globale `core_settings_clusteredQuality`
---@class core_settings_clusteredQuality
---@field qualityLevels table<string, table> Préréglages par nom de niveau. Chaque entrée contient minLightScreenSize (taille écran minimale d'une lumière, fraction), lightFlares (boolean), shadowMaxCasters (nombre max de lumières projetant une ombre), shadowFallbackFrames (nombre d'images), shadowOversample (facteur de suréchantillonnage), shadowBubble (facteur). Niveaux : Lowest, Low, Normal, High, Ultra.
core_settings_clusteredQuality = {}

--- Copie le préréglage du niveau demandé dans les propriétés de ClusterShading (minLightScreenSize, lightFlares, shadowMaxCasters, shadowFallbackFrames, shadowOversample, shadowBubble).
---Source : lua/ge/extensions/core/settings/clusteredQuality.lua:50
---@param level string Nom du niveau : Lowest, Low, Normal, High ou Ultra.
function core_settings_clusteredQuality.applyLevel(level) end

