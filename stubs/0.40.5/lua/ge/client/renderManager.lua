---@meta
-- tim19Atlas stub generated from lua/ge/client/renderManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prepares the off-screen render format: creates the RenderFormatToken "AL_FormatToken" (color R8G8B8A8, depth $GFXFormatDefaultDepth or D24S8, aaLevel 0, disabled at the start), the state block "AL_FormatTokenState" (inherits from PFX_DefaultStateBlock, sampler SamplerClampPoint) and the PostEffect "AL_FormatCopy" (passthrough to $backbuffer). This token is enabled/disabled by the light managers.
--- Access: `require("client/renderManager")`
---@class client_renderManager
local client_renderManager = {}

--- Creates and registers the RenderFormatToken object "AL_FormatToken" (disabled) with AL_FormatCopy as the copy and resolve effect.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/renderManager.lua:7
function client_renderManager.initRenderManager() end

return client_renderManager
