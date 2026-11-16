---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx/ssao.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Screen-space ambient occlusion (SSAO, with bent normals / GTAO). On import, creates the object "SSAOPostFx" (PostEffectSSAO) if missing, then sets its bentNormals property from the PostFXSpecularOcclusionEnabled setting, and creates "SSAOVizPostFx" to visualize #ssaoMask. The module keeps the current contrast and radius in memory and passes them to the object.
--- Access: global `ssaoModule`
---@class ssaoModule
ssaoModule = {}

--- Sets $SSAOPostFx::Enable to true and restores the default contrast (2) and radius (1.5).
---Source: lua/ge/client/postFx/ssao.lua:35
function ssaoModule.applyDefaults() end

--- Returns the stored contrast.
---Source: lua/ge/client/postFx/ssao.lua:44
---@return number  Current contrast.
function ssaoModule.getContrast() end

--- Returns the stored radius.
---Source: lua/ge/client/postFx/ssao.lua:45
---@return number  Current radius.
function ssaoModule.getRadius() end

--- Enables or disables a debug effect (GTAOBentNormalsVizPostFx, created on demand) that displays the bent normals map #gtaoOutput. No cost while it is disabled.
---Source: lua/ge/client/postFx/ssao.lua:49
---@param enabled boolean true to show, false to hide.
function ssaoModule.setBentNormalDebugEnabled(enabled) end

--- Stores the SSAO contrast and applies it to SSAOPostFx (the object's setContrast method). Ignored if the value cannot be converted to a number.
---Source: lua/ge/client/postFx/ssao.lua:15
---@param value number|string New contrast.
function ssaoModule.setContrast(value) end

--- Stores the SSAO radius and applies it to SSAOPostFx. Ignored if the value is not numeric.
---Source: lua/ge/client/postFx/ssao.lua:25
---@param value number|string New radius (scene unit, inferred from code).
function ssaoModule.setRadius(value) end

