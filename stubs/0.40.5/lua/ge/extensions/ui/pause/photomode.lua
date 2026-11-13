---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/photomode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Façade du mode photo intégré au menu pause. Elle ne contient pas de logique : elle charge les huit modules ui_photomode_* (session, camera, scene, effects, advancedRender, capture, preview, presets) et leur redirige environ soixante fonctions via une table FORWARDED_FUNCTIONS. Elle relaie aussi les hooks moteur (métadonnées de capture, pré-rendu, update, fin de capture) vers les bons sous-modules.
--- Accès : extension `ui_pause_photomode` : `extensions.load("ui_pause_photomode")`, puis la globale `ui_pause_photomode`
---@class ui_pause_photomode
---@field dependencies string[] Liste des extensions ui_photomode_* chargées avant ce module.
ui_pause_photomode = {}

--- Hook appelé lors de la collecte des métadonnées d'une capture ; délègue à ui_photomode_preview.collectScreenshotMetadata.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/photomode.lua:84
---@param ... any Arguments transmis tels quels.
---@return any  Valeur renvoyée par le sous-module.
function ui_pause_photomode.onCollectScreenshotMetadata(...) end

--- Hook de chargement ; délègue à ui_photomode_session.handleExtensionLoaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/photomode.lua:100
---@param ... any Arguments transmis.
function ui_pause_photomode.onExtensionLoaded(...) end

--- Hook de déchargement ; délègue à ui_photomode_session.handleExtensionUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/photomode.lua:104
---@param ... any Arguments transmis.
function ui_pause_photomode.onExtensionUnloaded(...) end

--- Hook appelé avant le rendu ; délègue à ui_photomode_capture.handlePreRender.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/photomode.lua:88
---@param ... any Arguments transmis.
function ui_pause_photomode.onPreRender(...) end

--- Hook appelé quand toutes les captures demandées sont terminées ; délègue à ui_photomode_capture.onScreenshotAllDone.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/photomode.lua:96
---@param ... any Arguments transmis.
function ui_pause_photomode.onScreenshotAllDone(...) end

--- Hook appelé à chaque frame ; délègue à ui_photomode_preview.handleUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/photomode.lua:92
---@param ... any Arguments transmis.
function ui_pause_photomode.onUpdate(...) end

