---@meta
-- tim19Atlas stub generated from lua/ge/extensions/license.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Queries the state of the BeamNG.tech (research) and commercial licenses through the C++ objects ResearchVerifier and CommercialVerifier, with a per-session cache. Used to filter BeamNG.tech-only input map and action files (paths containing "_beamng.tech") when the license is not valid. For a modder, it is mostly useful to know whether the game is running with a tech/commercial license.
--- Access: extension `license`: `extensions.load("license")`, then the global `license`
---@class license
license = {}

--- Same rule for action files.
---Source: lua/ge/extensions/license.lua:40
---@param path string Action file path.
---@return boolean
function license.isAllowedActionsPath(path) end

--- Tells whether it is relevant to load this input map: always true with a valid tech license, otherwise false if the path contains "_beamng.tech".
---Source: lua/ge/extensions/license.lua:34
---@param path string Input map file path.
---@return boolean
function license.isAllowedInputmapPath(path) end

--- Returns whether the license is commercial (CommercialVerifier.isCommercialLicense).
---Source: lua/ge/extensions/license.lua:19
---@return boolean  false without a verifier or without a license.
function license.isCommercial() end

--- Returns whether the BeamNG.tech license is verified (ResearchVerifier.isTechLicenseVerified).
---Source: lua/ge/extensions/license.lua:9
---@return boolean  false without a verifier or without a license.
function license.isValid() end

--- Sends the tech license state to the UI via guihooks (TechLicenseState).
---Source: lua/ge/extensions/license.lua:29
function license.requestState() end

