---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/hdr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Creates, on the first frame, the HDR post-processing effect chain (auto/local exposure): PostEffectBrightPass (AfterPostFX rendering at 0.5 scale) with its children PostEffectDownScale, PostEffectLuminance and PostEffectCombinePass, plus PostEffectLocalExposure (0.25 scale) whose exposure bias in EV comes from the GraphicEVCompensation setting. Not used directly by a modder; global: render_hdr.
--- Access: extension `render_hdr`: `extensions.load("render_hdr")`, then the global `render_hdr`
---@class render_hdr
render_hdr = {}

--- After Lua reload: restores the initialized flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/hdr.lua:61
---@param data table Table returned by onSerialize.
function render_hdr.onDeserialized(data) end

--- Hook of the game's first update: creates (if absent) the HDR post-processing objects described above and applies the GraphicEVCompensation exposure bias (setting, in EV, 0 by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/hdr.lua:9
function render_hdr.onFirstUpdate() end

--- Before Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/hdr.lua:57
---@return table  {initialized = true}
function render_hdr.onSerialize() end

