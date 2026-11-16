---@meta
-- tim19Atlas stub generated from lua/ge/client/lighting/advanced/lightViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks of AL_LightColorVisualize.
---@class client_lighting_advanced_lightViz_aL_LightColorVisualizeCallbacks
local client_lighting_advanced_lightViz_aL_LightColorVisualizeCallbacks = {}

--- Same logic for AL_LightColorVisualize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting/advanced/lightViz.lua:113
---@return boolean  always true
function client_lighting_advanced_lightViz_aL_LightColorVisualizeCallbacks.onEnabled() end

--- Callbacks of AL_LightSpecularVisualize.
---@class client_lighting_advanced_lightViz_aL_LightSpecularVisualizeCallbacks
local client_lighting_advanced_lightViz_aL_LightSpecularVisualizeCallbacks = {}

--- Same logic for AL_LightSpecularVisualize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting/advanced/lightViz.lua:140
---@return boolean  always true
function client_lighting_advanced_lightViz_aL_LightSpecularVisualizeCallbacks.onEnabled() end

--- Callbacks of AL_NormalsVisualize (published under the global AL_NormalsVisualize).
---@class client_lighting_advanced_lightViz_aL_NormalsVisualizeCallbacks
local client_lighting_advanced_lightViz_aL_NormalsVisualizeCallbacks = {}

--- Same logic for AL_NormalsVisualize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting/advanced/lightViz.lua:85
---@return boolean  always true
function client_lighting_advanced_lightViz_aL_NormalsVisualizeCallbacks.onEnabled() end

--- Callbacks of AL_DepthVisualize (global AL_DepthVisualizeCallbacks).
---@class client_lighting_advanced_lightViz_al_DepthVisualizeCallbacks
local client_lighting_advanced_lightViz_al_DepthVisualizeCallbacks = {}

--- Disables the previous visualization mode, remembers AL_DepthVisualize as the current mode, returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting/advanced/lightViz.lua:56
---@return boolean  always true
function client_lighting_advanced_lightViz_al_DepthVisualizeCallbacks.onEnabled() end

--- Callbacks of AL_VelocityVisualize (texture #VelocityBuffer).
---@class client_lighting_advanced_lightViz_al_VelocityVisualizeCallbacks
local client_lighting_advanced_lightViz_al_VelocityVisualizeCallbacks = {}

--- Same logic for AL_VelocityVisualize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting/advanced/lightViz.lua:167
---@return boolean  always true
function client_lighting_advanced_lightViz_al_VelocityVisualizeCallbacks.onEnabled() end

--- Callbacks of AnnotationVisualize (annotation buffer).
---@class client_lighting_advanced_lightViz_annotationVisualizeCallbacks
local client_lighting_advanced_lightViz_annotationVisualizeCallbacks = {}

--- Disables Engine.Annotation if available.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting/advanced/lightViz.lua:203
function client_lighting_advanced_lightViz_annotationVisualizeCallbacks.onDisabled() end

--- If Engine.Annotation exists: selects the AnnotationVisualize mode and enables Engine.Annotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting/advanced/lightViz.lua:195
---@return boolean  always true
function client_lighting_advanced_lightViz_annotationVisualizeCallbacks.onEnabled() end

