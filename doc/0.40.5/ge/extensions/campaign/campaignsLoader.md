# `campaign_campaignsLoader`

*File: `lua/ge/extensions/campaign/campaignsLoader.lua` · VM: Game Engine (GE) · 393 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `campaign_campaignsLoader`: `extensions.load("campaign_campaignsLoader")`, then the global `campaign_campaignsLoader`

Campaign loader: finds the /campaigns/*.json files whose header.type is "campaign", loads them (with mod info and preview image), validates and prepares a campaign, starts it (or resumes a save) and manages saves in /saves/campaigns/ (slotN.json files with header.type "campaignSave"). The campaign modules are campaign_campaigns, campaign_comics, campaign_rewards, campaign_dealer and campaign_photoSafari (M.campaignModules).

## Notes

- Saving: saveCampaign launches the hook onSaveCampaign(callback); each module calls the callback with (global alias, data); the result is written as JSON with a header {version = 1, type = 'campaignSave', title}. Nothing is saved if meta.enableSaves is false.
- A save matches a campaign by its title (meta.title).
- resumeSavedCampaign calls onResumeCampaign on each saved module via _G (except campaign_campaigns, resumed last with campaign_campaigns.resumeCampaign).
- Bug: M.onInit = onInit exports a variable not defined in this file (nil).
- Bug: startByFolder calls campaign_campaigns.start, which is not exported by campaigns.lua (it exports startCampaign); the call fails. Use campaign_campaignsLoader.start instead.
- Bug: processCampaignStartInternal tests "if campaign then stop() " with globals not defined in this file; only a validation failure (unreachable since validate always returns true) would make it return nil.
- splitFieldByToken builds the pattern "([^"..token..".]+)": the dot is always excluded in addition to the given token.
- start waits for the current level to end (scenetree.MissionGroup) before launching the campaign, via endActiveGameMode and triggerDelayedStartGenerator.

## Functions

| Function | Description | Line |
|---|---|---|
| `campaign_campaignsLoader.checkSaveExists(title, savesEnabled)` | Returns the save file name matching a campaign title, or nil. | 308 |
| `campaign_campaignsLoader.getCampaignFilenames()` | Lists the JSON files in /campaigns/ (1 level) whose header.type == 'campaign'. Returns {} if the folder does not exist. | 45 |
| `campaign_campaignsLoader.getCampaignScenarios()` | Returns the cached list scenariosInAllCampaigns (empty in this file: never filled here; generateCampaignScenariosList exists but is not called). | 85 |
| `campaign_campaignsLoader.getList()` | Loads all the campaigns found with loadCampaign and returns them; cooperates with util_asyncBulkLoader if a bulk load is in progress. | 61 |
| `campaign_campaignsLoader.loadCampaign(campaignfile)` | Reads a campaign's JSON and adds sourceFile, sourcePath, official, modID/modName/modTitle ("BeamNG" / "BeamNG.drive" values if it is not a mod) and previews (.jpg image from the campaign folder). | 12 |
| `campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename)` | Rereads a save file, calls onResumeCampaign of each module concerned again, then campaign_campaigns.resumeCampaign. | 364 |
| `campaign_campaignsLoader.saveCampaign(campaign)` | Saves the campaign state (see notes) in /saves/campaigns/; reuses the existing file with the same title, otherwise takes the next "slotN.json". | 346 |
| `campaign_campaignsLoader.splitFieldByToken(field, token)` | Splits a string by a token character (also excluding the dot) and returns the pieces. | 134 |
| `campaign_campaignsLoader.start(newCampaign, endCallback)` | Starts a campaign chosen in the interface. If a level is loaded, waits for it to close; otherwise unloads the automatic extensions, loads those of the scenario, the quick race and the campaign, prepares the campaign, then resumes an existing save or calls campaign_campaigns.startCampaign. | 249 |
| `campaign_campaignsLoader.startByFolder(path, endCallback)` | Finds the campaign whose sourcePath is path and starts it. | 279 |

### Parameter details

#### `campaign_campaignsLoader.checkSaveExists(title, savesEnabled)`

Returns the save file name matching a campaign title, or nil.

- `title` (*string*) : Campaign title.
- `savesEnabled` (*boolean*) : If false, returns nil without searching anything.
- **returns**: string|nil Path of the save.

#### `campaign_campaignsLoader.getCampaignFilenames()`

Lists the JSON files in /campaigns/ (1 level) whose header.type == 'campaign'. Returns {} if the folder does not exist.

- **returns**: string[] Paths of the campaign files.

#### `campaign_campaignsLoader.getCampaignScenarios()`

Returns the cached list scenariosInAllCampaigns (empty in this file: never filled here; generateCampaignScenariosList exists but is not called).

- **returns**: string[] Scenario paths.

#### `campaign_campaignsLoader.getList()`

Loads all the campaigns found with loadCampaign and returns them; cooperates with util_asyncBulkLoader if a bulk load is in progress.

- **returns**: table[] List of campaigns.

#### `campaign_campaignsLoader.loadCampaign(campaignfile)`

Reads a campaign's JSON and adds sourceFile, sourcePath, official, modID/modName/modTitle ("BeamNG" / "BeamNG.drive" values if it is not a mod) and previews (.jpg image from the campaign folder).

- `campaignfile` (*string*) : Path of the campaign's JSON file.
- **returns**: table Enriched campaign data.

#### `campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename)`

Rereads a save file, calls onResumeCampaign of each module concerned again, then campaign_campaigns.resumeCampaign.

- `campaign` (*table*) : Processed campaign to resume.
- `saveFilename` (*string*) : Path of the save file.

#### `campaign_campaignsLoader.saveCampaign(campaign)`

Saves the campaign state (see notes) in /saves/campaigns/; reuses the existing file with the same title, otherwise takes the next "slotN.json".

- `campaign` (*table*) : Processed campaign ({meta, state}); meta.enableSaves and meta.title are read.

#### `campaign_campaignsLoader.splitFieldByToken(field, token)`

Splits a string by a token character (also excluding the dot) and returns the pieces.

- `field` (*string*) : String to split.
- `token` (*string*) : Separator token.
- **returns**: string[] Pieces.

#### `campaign_campaignsLoader.start(newCampaign, endCallback)`

Starts a campaign chosen in the interface. If a level is loaded, waits for it to close; otherwise unloads the automatic extensions, loads those of the scenario, the quick race and the campaign, prepares the campaign, then resumes an existing save or calls campaign_campaigns.startCampaign.

- `newCampaign` (*table*) : Campaign (from loadCampaign).
- `endCallback` (*function|nil*) : Stored as endCampaignCallback.

#### `campaign_campaignsLoader.startByFolder(path, endCallback)`

Finds the campaign whose sourcePath is path and starts it.

- `path` (*string*) : Source folder of the campaign.
- `endCallback` (*function|nil*) : End callback.

## Fields

| Field | Type | Description |
|---|---|---|
| `campaignModules` | string[] | Extension modules loaded for a campaign. |
| `onInit` | nil | Always nil: reference to a variable not defined in the file. ⚠ reference `onInit` not defined in the file (probably nil) |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSaveCampaign` — listened to by 5 module(s)

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/campaign/campaignsLoader.lua`.*
