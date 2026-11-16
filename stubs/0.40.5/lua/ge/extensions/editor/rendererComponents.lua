---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rendererComponents.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor "Renderer Components" window (Debug menu) to adjust rendering effects live: depth of field (DOF), HDR, SSAO, anti-aliasing, motion blur, bloom, screen-space shadows, CloudLayer, and in non-shipping builds Coconut, Cluster Shading and Shadows. Each tab only appears if the corresponding post-effect object exists in the scene. A "Reset All" menu and per-tab reset buttons restore the default values. Relies on core/settings/graphic and client/postFx/ssao.
--- Access: extension `editor_rendererComponents`: `extensions.load("editor_rendererComponents")`, then the global `editor_rendererComponents`
---@class editor_rendererComponents
editor_rendererComponents = {}

--- Hook: on editor activation, initializes the settings if needed and reapplies the DOFPostEffect state (debug mode, enable/disable).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rendererComponents.lua:955
function editor_rendererComponents.onEditorActivated() end

--- Hook: draws the window with a menu bar and tab bar; a tab is only displayed if the post-effect/object exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rendererComponents.lua:866
function editor_rendererComponents.onEditorGui() end

--- Hook: adds the Debug menu entries (Renderer Components, and Cluster Shading outside shipping), registers the window (300x500), initializes the settings and captures the default screen-space shadow values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rendererComponents.lua:944
function editor_rendererComponents.onEditorInitialized() end

