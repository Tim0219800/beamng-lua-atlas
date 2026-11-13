---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/oneshotRaceSelector/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_oneshotRaceSelector_core` : `extensions.load("ui_oneshotRaceSelector_core")`, puis la globale `ui_oneshotRaceSelector_core`
---@class ui_oneshotRaceSelector_core
ui_oneshotRaceSelector_core = {}

--- descriptor contract:
---    backendName: string
---    middlePathKey: "tracks" | "routes" - path.keys[1] for the drilldown level
---    levelListTitleKey, middleListTitleKey: translation ids
---    getLevels(): array of level tables
---    findLevel(levelName): optional override; defaults to scanning getLevels()
---    getMiddleItems(level): array of track/route tables for a level
---    middleName(middle): stable key for a track/route within its level
---    levelDisplayName(level), middleDisplayName(middle): already-_tr()'d names
---    levelToTile(level), middleToTile(middle, levelName): grid tile tables
---    getLevelDetails(level), getMiddleDetails(middle, levelName): getDetails() payloads
---Source : lua/ge/extensions/ui/oneshotRaceSelector/core.lua:42
---@param descriptor any
function ui_oneshotRaceSelector_core.createBackend(descriptor) end

---Source : lua/ge/extensions/ui/oneshotRaceSelector/core.lua:23
---@param value any
function ui_oneshotRaceSelector_core.difficultyLabel(value) end

