# `campaign_comics`

*File: `lua/ge/extensions/campaign/comics.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `campaign_comics`: `extensions.load("campaign_comics")`, then the global `campaign_comics`

Shows a comic (sequence of panels) in the campaign interface. playComic builds the list of panels from comicData then opens the UI screen "campaign.comic"; when the Spine animation is finished, the provided callback is called. The GUI audio channel is played during the display.

## Notes

- comicData: {path = folder, order = list, backgroundSound = ...}. Each entry of order is either a string (panel name) or a table {comic = name, sound = ...}. Each panel becomes "path/name/".
- The code that muted the other audio channels is commented out ("buggy"), but reset() still restores lastVolumes if it is set; in practice lastVolumes stays empty.
- If comicData is nil, playComic returns without showing anything and without calling the callback.

## Functions

| Function | Description | Line |
|---|---|---|
| `campaign_comics.onScenarioChange(sc)` | Scenario change hook: if sc is nil or its state is "pre-start", restores the stored audio volumes. *(internal)* *(hook)* | 68 |
| `campaign_comics.onSpineAnimationFinished()` | Hook called by the interface at the end of the Spine animation: runs the stored callback (only once), restores the volumes and stops the AudioChannelGui channel (stop with parameter 1). *(internal)* *(hook)* | 56 |
| `campaign_comics.playComic(comicData, comicFinishedCallback)` | Prepares the panels, starts the AudioChannelGui audio channel and navigates to the "campaign.comic" screen with the list of panels. Stores the end callback. | 18 |

### Parameter details

#### `campaign_comics.onScenarioChange(sc)`

Scenario change hook: if sc is nil or its state is "pre-start", restores the stored audio volumes.

- `sc` (*table|nil*) : Current scenario; its state field is read.

#### `campaign_comics.playComic(comicData, comicFinishedCallback)`

Prepares the panels, starts the AudioChannelGui audio channel and navigates to the "campaign.comic" screen with the list of panels. Stores the end callback.

- `comicData` (*table*) : Description of the comic: path, order, backgroundSound.
- `comicFinishedCallback` (*function|nil*) : Called once the comic is finished; nop if absent.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/campaign/comics.lua`.*
