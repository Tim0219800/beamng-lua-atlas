---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/resolution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide pour lire et changer la résolution de la fenêtre du jeu via GFXDevice. getVideoModeSnapshot renvoie la largeur, la hauteur et le mode d'affichage courants ; setWindowedResolution force une résolution précise en mode fenêtré (pas sans bordure). Pratique pour les captures d'écran à taille fixe ou les tests d'interface.
--- Accès : extension `util_resolution` : `extensions.load("util_resolution")`, puis la globale `util_resolution`
---@class util_resolution
util_resolution = {}

--- Lit le mode vidéo courant de GFXDevice.
---Source : lua/ge/extensions/util/resolution.lua:9
---@return table|nil  {width, height, displayMode} ou nil si GFXDevice.getVideoMode est indisponible
function util_resolution.getVideoModeSnapshot() end

--- Passe la fenêtre en mode « Window » à la résolution donnée (GFXDevice.setVideoMode).
---Source : lua/ge/extensions/util/resolution.lua:30
---@param width number Largeur en pixels
---@param height number Hauteur en pixels
function util_resolution.setWindowedResolution(width, height) end

