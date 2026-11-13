---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framing/configured.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de cadrage « Configured camera » de screenshotCreator : utilise une caméra personnalisée enregistrée dans la configuration de vignette du véhicule (par config, sinon par modèle) et la convertit en position/rotation monde à partir des décalages stockés (rewindCameraOffsets). Si aucune caméra configurée n'est utilisable, retombe sur le cadrage procédural. Il s'enregistre dans la liste des modes via le hook onScreenshotCreatorCollectFramingModes (id « configured », ordre 200).
--- Accès : extension `util_screenshotCreator_framing_configured` : `extensions.load("util_screenshotCreator_framing_configured")`, puis la globale `util_screenshotCreator_framing_configured`
---@class util_screenshotCreator_framing_configured
---@field dependencies table
util_screenshotCreator_framing_configured = {}

--- Alias de resolve.
---Source : lua/ge/extensions/util/screenshotCreator/framing/configured.lua:75
---@param context table Voir resolve
---@return table|nil  Voir resolve
---@return string|nil  Message d'erreur
function util_screenshotCreator_framing_configured.frame(context) end

--- Hook de collecte des modes de cadrage : ajoute à la liste le mode {id = 'configured', label = 'Configured camera', order = 200, resolve}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/framing/configured.lua:82
---@param modes table[] Liste de modes à compléter
function util_screenshotCreator_framing_configured.onScreenshotCreatorCollectFramingModes(modes) end

--- Résout la caméra pour le contexte : essaie la caméra configurée, sinon délègue à util_screenshotCreator_framing_procedural.resolve.
---Source : lua/ge/extensions/util/screenshotCreator/framing/configured.lua:75
---@param context table Contexte de cadrage : vehicle (obligatoire), configName, et les champs lus par le cadrage procédural
---@return table|nil  {pos, rot, name, debugData} ou nil en cas d'erreur
---@return string|nil  Message d'erreur
function util_screenshotCreator_framing_configured.resolve(context) end

--- Résout uniquement la caméra configurée par l'utilisateur (config puis modèle) sans repli procédural.
---Source : lua/ge/extensions/util/screenshotCreator/framing/configured.lua:37
---@param context table Contexte de cadrage avec vehicle et configName
---@return table|nil  {pos, rot, name = 'config camera' ou 'model camera', debugData} ou nil si aucune caméra configurée
---@return string|nil  Message d'erreur si le contexte est invalide
function util_screenshotCreator_framing_configured.resolveOverride(context) end

