---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/photomode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small photo mode module: lists the PNG overlay images available in ui/modules/photomode/ui-overlays (frames, watermarks) that the UI offers to the user. A modder can drop their own PNGs there to make them available.
--- Access: extension `util_photomode`: `extensions.load("util_photomode")`, then the global `util_photomode`
---@class util_photomode
util_photomode = {}

--- Lists the *.png files in ui/modules/photomode/ui-overlays (non-recursive).
---Source: lua/ge/extensions/util/photomode.lua:7
---@return table[]  List of tables {filename = PNG path}
function util_photomode.getPhotomodeOverlays() end

