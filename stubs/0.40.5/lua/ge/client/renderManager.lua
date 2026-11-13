---@meta
-- tim19Atlas stub generated from lua/ge/client/renderManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prépare le format de rendu hors écran : crée le RenderFormatToken « AL_FormatToken » (couleur R8G8B8A8, profondeur $GFXFormatDefaultDepth ou D24S8, aaLevel 0, désactivé au départ), le state block « AL_FormatTokenState » (hérite de PFX_DefaultStateBlock, échantillonneur SamplerClampPoint) et le PostEffect « AL_FormatCopy » (passthrough vers $backbuffer). Ce token est activé/désactivé par les light managers.
--- Accès : `require("client/renderManager")`
---@class client_renderManager
local client_renderManager = {}

--- Crée et enregistre l'objet RenderFormatToken « AL_FormatToken » (désactivé) avec AL_FormatCopy comme effet de copie et de résolution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/renderManager.lua:7
function client_renderManager.initRenderManager() end

return client_renderManager
