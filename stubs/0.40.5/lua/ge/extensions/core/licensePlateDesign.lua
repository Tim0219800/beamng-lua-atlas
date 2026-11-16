---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/licensePlateDesign.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_licensePlateDesign`: loads the definition of a license plate design and converts it to the current format (version 3, type 'licenseplate', *.sktemplate.json files). It also translates the old JSON formats (versions 0 to 2, with diffuse/bump/text/characterLayout fields and printf-type patterns %d %c %l) into text trees with variables {plate}, {line1}, {seg1}... A modder uses it to read a plate design, whether old or new.
--- Access: extension `core_licensePlateDesign`: `extensions.load("core_licensePlateDesign")`, then the global `core_licensePlateDesign`
---@class core_licensePlateDesign
core_licensePlateDesign = {}

--- Loads a plate design from a JSON file (old or *.sktemplate.json) and returns a table in version 3 format: { name, version = 3, type = 'licenseplate', format = { [key] = { size, background, emboss, finish, root, segments/limit/limit2, normal } }, vars = { plate = {...} } }. The old formats are converted, the new ones are completed with the formats of the old file if it exists.
---Source: lua/ge/extensions/core/licensePlateDesign.lua:279
---@param path string|nil Virtual path of the design file; nil or empty string returns nil.
---@return table|nil  Version 3 design, or nil if the file is not found or unreadable (warning in the log).
function core_licensePlateDesign.loadDesign(path) end

