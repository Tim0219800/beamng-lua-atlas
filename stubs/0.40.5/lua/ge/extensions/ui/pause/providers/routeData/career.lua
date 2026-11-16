---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu data provider for the career screens: progression (digest and suggested APM missions), history (financial, gameplay, milestones, logbook) and history detail. The functions return tables describing the content (panels, Vue components, button rail) that the pause UI displays. The data comes from career_modules_playerAttributes, career_modules_milestones_milestones and career_career.
--- Access: extension `ui_pause_providers_routeData_career`: `extensions.load("ui_pause_providers_routeData_career")`, then the global `ui_pause_providers_routeData_career`
---@class ui_pause_providers_routeData_career
---@field dependencies string[] {"career_career", "career_saveSystem"}
ui_pause_providers_routeData_career = {}

--- Returns the history page data: a rail of four buttons (financial, gameplay, milestones with an indicator if there are unclaimed ones, logbook) and the overview side panels (last 5 entries, milestones digest).
---Source: lua/ge/extensions/ui/pause/providers/routeData/career.lua:150
---@param context table Pause menu context (field read: mode).
---@return table  {mode, heading, rail, focusSidePanelContents}
function ui_pause_providers_routeData_career.getCareerHistoryData(context) end

--- Returns the full view of a history (CareerHistoryDigest component with full = true), with the title provided by career_modules_playerAttributes.getCareerHistoryInfo or a default title.
---Source: lua/ge/extensions/ui/pause/providers/routeData/career.lua:200
---@param context table Pause menu context (field read: mode).
---@param historyType string "financial" or "gameplay".
---@return table  {mode, heading, mainCardClass, mainPanelContent}
function ui_pause_providers_routeData_career.getCareerHistoryDetailData(context, historyType) end

--- Returns the progression page data: title ui.career.landingPage.name, main panel (ProgressDigest, ApmSuggestedMissions) and ProgressDomainInfo side panels for the domains apm, bmra, logistics and freestyle.
---Source: lua/ge/extensions/ui/pause/providers/routeData/career.lua:127
---@param context table Pause menu context (field read: mode).
---@return table  {mode, heading, mainPanelContent, focusSidePanelContents}
function ui_pause_providers_routeData_career.getCareerProgressData(context) end

--- Returns whether the career progression screen is available: false during the career tutorial, otherwise true only if the starting vehicle has been purchased.
---Source: lua/ge/extensions/ui/pause/providers/routeData/career.lua:26
---@return boolean|nil  Availability (may be nil if career_career is absent).
function ui_pause_providers_routeData_career.isCareerProgressAvailable() end

