---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/renderViews.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prise de captures d'écran depuis une caméra virtuelle indépendante (RenderView) : on donne position, rotation, résolution, FOV et masques d'objets, le module crée une vue de rendu nommée, attend une courte durée, sauvegarde l'image sur disque (PNG, éventuellement réduite) puis détruit la vue. Utile pour des miniatures, aperçus de véhicules ou masques. Pendant la capture il masque CEF, imgui et les marqueurs de gameplay. Global : render_renderViews.
--- Accès : extension `render_renderViews` : `extensions.load("render_renderViews")`, puis la globale `render_renderViews`
---@class render_renderViews
render_renderViews = {}

--- Crée une RenderView selon les options, programme un job qui masque l'UI, sauvegarde l'image dans options.filename, détruit la vue, restaure l'UI et l'AA, puis appelle le callback.
---Source : lua/ge/extensions/render/renderViews.lua:78
---@param options table {pos: vec3, rot: quat, filename: string, resolution?: vec3 (px), downscaleFactor?: number, fov?: number°, nearPlane?: number m, farClip?: number m, renderViewName?: string, renderViewMaskBit?: integer, usePostEffects?: boolean, clearColor?: ColorF (déduit du code), objectTypeWhitelistMask?/objectTypeBlacklistMask?/shadowCasterObjectTypeWhitelistMask?/shadowCasterObjectTypeBlacklistMask?: integer, focusObjects?: object[], manualEV?: number, currentExposure?: number, copyMainViewExposure?: boolean, allowAntialiasing?: boolean, screenshotDelay?: number s}
---@param callback function|nil function(success: boolean) appelée à la fin.
function render_renderViews.takeScreenshot(options, callback) end

