---@meta
-- tim19Atlas stub generated from lua/ge/client/lighting/advanced/lightViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks de AL_LightColorVisualize.
---@class client_lighting_advanced_lightViz_aL_LightColorVisualizeCallbacks
local client_lighting_advanced_lightViz_aL_LightColorVisualizeCallbacks = {}

--- Même logique pour AL_LightColorVisualize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting/advanced/lightViz.lua:113
---@return boolean  toujours true
function client_lighting_advanced_lightViz_aL_LightColorVisualizeCallbacks.onEnabled() end

--- Callbacks de AL_LightSpecularVisualize.
---@class client_lighting_advanced_lightViz_aL_LightSpecularVisualizeCallbacks
local client_lighting_advanced_lightViz_aL_LightSpecularVisualizeCallbacks = {}

--- Même logique pour AL_LightSpecularVisualize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting/advanced/lightViz.lua:140
---@return boolean  toujours true
function client_lighting_advanced_lightViz_aL_LightSpecularVisualizeCallbacks.onEnabled() end

--- Callbacks de AL_NormalsVisualize (publiés sous la globale AL_NormalsVisualize).
---@class client_lighting_advanced_lightViz_aL_NormalsVisualizeCallbacks
local client_lighting_advanced_lightViz_aL_NormalsVisualizeCallbacks = {}

--- Même logique pour AL_NormalsVisualize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting/advanced/lightViz.lua:85
---@return boolean  toujours true
function client_lighting_advanced_lightViz_aL_NormalsVisualizeCallbacks.onEnabled() end

--- Callbacks de AL_DepthVisualize (globale AL_DepthVisualizeCallbacks).
---@class client_lighting_advanced_lightViz_al_DepthVisualizeCallbacks
local client_lighting_advanced_lightViz_al_DepthVisualizeCallbacks = {}

--- Désactive le mode de visualisation précédent, mémorise AL_DepthVisualize comme mode courant, retourne true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting/advanced/lightViz.lua:56
---@return boolean  toujours true
function client_lighting_advanced_lightViz_al_DepthVisualizeCallbacks.onEnabled() end

--- Callbacks de AL_VelocityVisualize (texture #VelocityBuffer).
---@class client_lighting_advanced_lightViz_al_VelocityVisualizeCallbacks
local client_lighting_advanced_lightViz_al_VelocityVisualizeCallbacks = {}

--- Même logique pour AL_VelocityVisualize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting/advanced/lightViz.lua:167
---@return boolean  toujours true
function client_lighting_advanced_lightViz_al_VelocityVisualizeCallbacks.onEnabled() end

--- Callbacks de AnnotationVisualize (buffer d'annotations).
---@class client_lighting_advanced_lightViz_annotationVisualizeCallbacks
local client_lighting_advanced_lightViz_annotationVisualizeCallbacks = {}

--- Désactive Engine.Annotation si disponible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting/advanced/lightViz.lua:203
function client_lighting_advanced_lightViz_annotationVisualizeCallbacks.onDisabled() end

--- Si Engine.Annotation existe : sélectionne le mode AnnotationVisualize et active Engine.Annotation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting/advanced/lightViz.lua:195
---@return boolean  toujours true
function client_lighting_advanced_lightViz_annotationVisualizeCallbacks.onEnabled() end

