---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/panCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_panCamera` : `extensions.load("editor_toolUtilities_panCamera")`, puis la globale `editor_toolUtilities_panCamera`
---@class editor_toolUtilities_panCamera
editor_toolUtilities_panCamera = {}

--- Hand the editor's free camera back.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:52
function editor_toolUtilities_panCamera.close() end

--- Host registers a fn() -> points (current selection) so toggle-on / open frames what you're looking at.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:29
---@param opts any
function editor_toolUtilities_panCamera.configure(opts) end

--- Per-frame drive (RMB-drag pan + wheel zoom). `blocked` suppresses movement during the tool's own modal interactions
---  (polygon drawing, node/gizmo drag, placement...).
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:71
---@param blocked any
function editor_toolUtilities_panCamera.drive(blocked) end

--- Go-to routing: when the pan camera (or a host's own use of the tool camera) is driving, fly IT to `points` and report
---  handled; otherwise let the caller do its normal free-camera jump.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:63
---@param points any
function editor_toolUtilities_panCamera.gotoPoints(points) end

---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:33
function editor_toolUtilities_panCamera.isOn() end

--- Take over the camera and go top-down: frame the current selection if there is one, else just tilt to top-down where the
---  camera already is.
---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:39
function editor_toolUtilities_panCamera.open() end

---Source : lua/ge/extensions/editor/toolUtilities/panCamera.lua:57
function editor_toolUtilities_panCamera.toggle() end

