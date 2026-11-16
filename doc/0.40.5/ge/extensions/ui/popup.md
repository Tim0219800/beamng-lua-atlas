# `ui_popup`

*File: `lua/ge/extensions/ui/popup.lua` · VM: Game Engine (GE) · 234 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_popup`: `extensions.load("ui_popup")`, then the global `ui_popup`

GE extension that opens the UI tutorial popups (UI hook OpenTutorialPopup). A popup is described by a content folder (by default /gameplay/tutorials/pages/<id>/) containing content.json (title, text, image, rows, Vue component) or content.html. The module reads these files, translates the texts and sends the list of entries to the UI. It also offers predefined popups (driving assists, challenge selection, contract, drag).

## Example

```lua
ui_popup.openPopupById('v2/dragStripTimeslipIntro')
ui_popup.openPopupsByIds({'dragTreeStages','dragTreeCountdown'}, {root='/gameplay/tutorials/pages/v2/'})
ui_popup.closeTutorialPopup()
```

## Notes

- In openDragTimeslipTutorialPopup, the variable `slip` is never defined (nil global): entry.slip stays nil. Also, if the content 'v2/dragStripTimeslipIntro' is not found, entry is nil and the list {entry} is empty.
- For a content.json whose vueComponent is DragTimeslipTutorialPopup, entry.slip comes from options.slip or from gameplay_drag_dragBridge.createTimeslipData(). For ApmOnboardingPopup, entry.startingMoney (default 0) and entry.endMoney (default 10000) come from the options.
- If content.json exists, content.html is ignored. Relative images are resolved relative to the popup folder; a path starting with '/' is kept as is.
- The option options.context allows translating title/text via core_locales.contextTranslate; the rows texts always use _tr.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_popup.closeTutorialPopup()` | Closes the displayed tutorial popup (UI hook CloseTutorialPopup). | 104 |
| `ui_popup.collectPopupIdsFromRoot(root)` | Recursively scans a root and returns the names of subfolders containing content.json or content.html, sorted alphabetically. | 109 |
| `ui_popup.openAllPopupsFromRoot(options)` | Opens all popups found under a root (useful to preview everything). | 138 |
| `ui_popup.openContractSignPopup(options, additionalIds)` | Opens the contract signing popup (Vue component ContractSign), with configurable title, text, player name, amount and image, then any additional popups. | 193 |
| `ui_popup.openDragTimeslipTutorialPopup(options, additionalIds)` | Opens the drag timeslip intro ('v2/dragStripTimeslipIntro') optionally followed by other popups. See the note on the slip variable bug. | 171 |
| `ui_popup.openDrivingAssistsPopup(options)` | Opens the "driving assists" popup (Vue component GearboxSelect, id 'drivingAssists'). | 152 |
| `ui_popup.openOptionalChallengeSelectionPopup(options)` | Opens the optional challenge selection popup (Vue component OptionalChallengeSelect). | 162 |
| `ui_popup.openPopupById(id, options)` | Reads then opens a single popup. | 85 |
| `ui_popup.openPopupEntries(entries, options)` | Sends already built entries to the UI via guihooks.trigger('OpenTutorialPopup', {popups = entries}). | 77 |
| `ui_popup.openPopupsByIds(ids, options)` | Reads several popups (skipping those not found) and opens them together, in the given order. | 91 |
| `ui_popup.readPopupEntryById(id, options)` | Reads a popup's content: content.json (priority) or content.html, and returns an entry {id, type='info', isPopup=true, title, text, image, aspectRatio, vueComponent, topics, rows...} or {id, content, ...} for HTML. | 15 |
| `ui_popup.resolveAssetPath(basePath, assetPath)` | Builds a resource path: returns assetPath as is if it starts with '/', otherwise basePath concatenated with assetPath. | 7 |
| `ui_popup.showDragTreeStagesPopup(options)` | Opens in series the popups dragStripStageCar, dragTreeStages, dragTreeCountdown and dragStripTimeslipIntro. | 218 |

### Parameter details

#### `ui_popup.closeTutorialPopup()`

Closes the displayed tutorial popup (UI hook CloseTutorialPopup).

- **returns**: boolean Always true.

#### `ui_popup.collectPopupIdsFromRoot(root)`

Recursively scans a root and returns the names of subfolders containing content.json or content.html, sorted alphabetically.

- `root` (*string|nil*) : Root folder (default '/gameplay/tutorials/pages/v2/'); a trailing '/' is added if absent.
- **returns**: string[] Sorted list of identifiers.
- **returns**: string The normalized root.

#### `ui_popup.openAllPopupsFromRoot(options)`

Opens all popups found under a root (useful to preview everything).

- `options` (*table|nil*) : options.root for the root; the other options are passed to openPopupsByIds.
- **returns**: boolean false if no popup found.

#### `ui_popup.openContractSignPopup(options, additionalIds)`

Opens the contract signing popup (Vue component ContractSign), with configurable title, text, player name, amount and image, then any additional popups.

- `options` (*table|nil*) : id, title, text, contractTitle, contractText, userName, money (default 10000), image, root; default texts from the ui.career.tutorial.popup.contractSign.* keys.
- `additionalIds` (*string[]|nil*) : Popups to append.
- **returns**: boolean Result of openPopupEntries.

#### `ui_popup.openDragTimeslipTutorialPopup(options, additionalIds)`

Opens the drag timeslip intro ('v2/dragStripTimeslipIntro') optionally followed by other popups. See the note on the slip variable bug.

- `options` (*table|nil*) : Passed to openPopupEntries.
- `additionalIds` (*string[]|nil*) : Popup identifiers to append.
- **returns**: boolean Result of openPopupEntries.

#### `ui_popup.openDrivingAssistsPopup(options)`

Opens the "driving assists" popup (Vue component GearboxSelect, id 'drivingAssists').

- `options` (*table|nil*) : Not used.
- **returns**: boolean true.

#### `ui_popup.openOptionalChallengeSelectionPopup(options)`

Opens the optional challenge selection popup (Vue component OptionalChallengeSelect).

- `options` (*table|nil*) : Not used.
- **returns**: boolean true.

#### `ui_popup.openPopupById(id, options)`

Reads then opens a single popup.

- `id` (*string*) : Popup identifier.
- `options` (*table|nil*) : See readPopupEntryById.
- **returns**: boolean false if the content is not found.

#### `ui_popup.openPopupEntries(entries, options)`

Sends already built entries to the UI via guihooks.trigger('OpenTutorialPopup', {popups = entries}).

- `entries` (*table[]|nil*) : List of popup entries.
- `options` (*table|nil*) : Not used.
- **returns**: boolean false if the list is empty or nil, otherwise true.

#### `ui_popup.openPopupsByIds(ids, options)`

Reads several popups (skipping those not found) and opens them together, in the given order.

- `ids` (*string[]*) : Popup identifiers.
- `options` (*table|nil*) : See readPopupEntryById.
- **returns**: boolean false if ids is empty/invalid or if no content was found.

#### `ui_popup.readPopupEntryById(id, options)`

Reads a popup's content: content.json (priority) or content.html, and returns an entry {id, type='info', isPopup=true, title, text, image, aspectRatio, vueComponent, topics, rows...} or {id, content, ...} for HTML.

- `id` (*string*) : Popup identifier (subfolder of the root).
- `options` (*table|nil*) : root (default '/gameplay/tutorials/pages/'), context (translation context), slip, startingMoney/startMoney, endMoney/money.
- **returns**: table|nil The entry, or nil if neither file exists.

#### `ui_popup.resolveAssetPath(basePath, assetPath)`

Builds a resource path: returns assetPath as is if it starts with '/', otherwise basePath concatenated with assetPath.

- `basePath` (*string*) : Base folder (with trailing '/').
- `assetPath` (*string|nil*) : Relative or absolute path.
- **returns**: string|nil nil if assetPath is nil or empty.

#### `ui_popup.showDragTreeStagesPopup(options)`

Opens in series the popups dragStripStageCar, dragTreeStages, dragTreeCountdown and dragStripTimeslipIntro.

- `options` (*table|nil*) : options.root (default '/gameplay/tutorials/pages/v2/').
- **returns**: boolean Result of openPopupsByIds.

**UI events (guihooks.trigger):** `CloseTutorialPopup`, `OpenTutorialPopup`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/popup.lua`.*
