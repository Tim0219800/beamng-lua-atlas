---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/popup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension that opens the UI tutorial popups (UI hook OpenTutorialPopup). A popup is described by a content folder (by default /gameplay/tutorials/pages/<id>/) containing content.json (title, text, image, rows, Vue component) or content.html. The module reads these files, translates the texts and sends the list of entries to the UI. It also offers predefined popups (driving assists, challenge selection, contract, drag).
--- Access: extension `ui_popup`: `extensions.load("ui_popup")`, then the global `ui_popup`
---@class ui_popup
ui_popup = {}

--- Closes the displayed tutorial popup (UI hook CloseTutorialPopup).
---Source: lua/ge/extensions/ui/popup.lua:104
---@return boolean  Always true.
function ui_popup.closeTutorialPopup() end

--- Recursively scans a root and returns the names of subfolders containing content.json or content.html, sorted alphabetically.
---Source: lua/ge/extensions/ui/popup.lua:109
---@param root string|nil Root folder (default '/gameplay/tutorials/pages/v2/'); a trailing '/' is added if absent.
---@return string[]  Sorted list of identifiers.
---@return string  The normalized root.
function ui_popup.collectPopupIdsFromRoot(root) end

--- Opens all popups found under a root (useful to preview everything).
---Source: lua/ge/extensions/ui/popup.lua:138
---@param options table|nil options.root for the root; the other options are passed to openPopupsByIds.
---@return boolean  false if no popup found.
function ui_popup.openAllPopupsFromRoot(options) end

--- Opens the contract signing popup (Vue component ContractSign), with configurable title, text, player name, amount and image, then any additional popups.
---Source: lua/ge/extensions/ui/popup.lua:193
---@param options table|nil id, title, text, contractTitle, contractText, userName, money (default 10000), image, root; default texts from the ui.career.tutorial.popup.contractSign.* keys.
---@param additionalIds string[]|nil Popups to append.
---@return boolean  Result of openPopupEntries.
function ui_popup.openContractSignPopup(options, additionalIds) end

--- Opens the drag timeslip intro ('v2/dragStripTimeslipIntro') optionally followed by other popups. See the note on the slip variable bug.
---Source: lua/ge/extensions/ui/popup.lua:171
---@param options table|nil Passed to openPopupEntries.
---@param additionalIds string[]|nil Popup identifiers to append.
---@return boolean  Result of openPopupEntries.
function ui_popup.openDragTimeslipTutorialPopup(options, additionalIds) end

--- Opens the "driving assists" popup (Vue component GearboxSelect, id 'drivingAssists').
---Source: lua/ge/extensions/ui/popup.lua:152
---@param options table|nil Not used.
---@return boolean  true.
function ui_popup.openDrivingAssistsPopup(options) end

--- Opens the optional challenge selection popup (Vue component OptionalChallengeSelect).
---Source: lua/ge/extensions/ui/popup.lua:162
---@param options table|nil Not used.
---@return boolean  true.
function ui_popup.openOptionalChallengeSelectionPopup(options) end

--- Reads then opens a single popup.
---Source: lua/ge/extensions/ui/popup.lua:85
---@param id string Popup identifier.
---@param options table|nil See readPopupEntryById.
---@return boolean  false if the content is not found.
function ui_popup.openPopupById(id, options) end

--- Sends already built entries to the UI via guihooks.trigger('OpenTutorialPopup', {popups = entries}).
---Source: lua/ge/extensions/ui/popup.lua:77
---@param entries table[]|nil List of popup entries.
---@param options table|nil Not used.
---@return boolean  false if the list is empty or nil, otherwise true.
function ui_popup.openPopupEntries(entries, options) end

--- Reads several popups (skipping those not found) and opens them together, in the given order.
---Source: lua/ge/extensions/ui/popup.lua:91
---@param ids string[] Popup identifiers.
---@param options table|nil See readPopupEntryById.
---@return boolean  false if ids is empty/invalid or if no content was found.
function ui_popup.openPopupsByIds(ids, options) end

--- Reads a popup's content: content.json (priority) or content.html, and returns an entry {id, type='info', isPopup=true, title, text, image, aspectRatio, vueComponent, topics, rows...} or {id, content, ...} for HTML.
---Source: lua/ge/extensions/ui/popup.lua:15
---@param id string Popup identifier (subfolder of the root).
---@param options table|nil root (default '/gameplay/tutorials/pages/'), context (translation context), slip, startingMoney/startMoney, endMoney/money.
---@return table|nil  The entry, or nil if neither file exists.
function ui_popup.readPopupEntryById(id, options) end

--- Builds a resource path: returns assetPath as is if it starts with '/', otherwise basePath concatenated with assetPath.
---Source: lua/ge/extensions/ui/popup.lua:7
---@param basePath string Base folder (with trailing '/').
---@param assetPath string|nil Relative or absolute path.
---@return string|nil  nil if assetPath is nil or empty.
function ui_popup.resolveAssetPath(basePath, assetPath) end

--- Opens in series the popups dragStripStageCar, dragTreeStages, dragTreeCountdown and dragStripTimeslipIntro.
---Source: lua/ge/extensions/ui/popup.lua:218
---@param options table|nil options.root (default '/gameplay/tutorials/pages/v2/').
---@return boolean  Result of openPopupsByIds.
function ui_popup.showDragTreeStagesPopup(options) end

