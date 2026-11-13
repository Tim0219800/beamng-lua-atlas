---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/isometric.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de cadrage « Fixed isometric » de screenshotCreator : place la caméra à distance fixe (15 m) du centre du véhicule, dans la direction locale (-1, -1, 0.75) normalisée selon les axes de référence du véhicule, regardant le centre. La position est ensuite recentrée de façon orthogonale (jusqu'à 8 itérations) pour que le projeté des points de cadrage soit centré dans la zone utile de l'image, en tenant compte des marges éventuelles. Il s'enregistre via onScreenshotCreatorCollectFramingModes (id « fixedIsometric », ordre 150).
--- Accès : extension `util_screenshotCreator_framing_isometric` : `extensions.load("util_screenshotCreator_framing_isometric")`, puis la globale `util_screenshotCreator_framing_isometric`
---@class util_screenshotCreator_framing_isometric
---@field dependencies table
util_screenshotCreator_framing_isometric = {}

--- Alias de resolve.
---Source : lua/ge/extensions/util/screenshotCreator/framing/isometric.lua:81
---@param context table Voir resolve
---@return table|nil  Voir resolve
---@return string|nil  Message d'erreur
function util_screenshotCreator_framing_isometric.frame(context) end

--- Hook de collecte des modes de cadrage : ajoute à la liste le mode {id = 'fixedIsometric', label = 'Fixed isometric', order = 150, fixedDistance, supportsFixedRotation = false, resolve}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/framing/isometric.lua:131
---@param modes table[] Liste de modes à compléter
function util_screenshotCreator_framing_isometric.onScreenshotCreatorCollectFramingModes(modes) end

--- Calcule la caméra isométrique fixe pour le véhicule du contexte.
---Source : lua/ge/extensions/util/screenshotCreator/framing/isometric.lua:81
---@param context table Contexte : vehicle (obligatoire), configName, resolution, fov/fieldOfView, margin, useFramingMargins
---@return table|nil  {pos, rot, name = 'fixed isometric camera', debugData, framingData} ou nil en cas d'erreur
---@return string|nil  Message d'erreur si context.vehicle est absent
function util_screenshotCreator_framing_isometric.resolve(context) end

