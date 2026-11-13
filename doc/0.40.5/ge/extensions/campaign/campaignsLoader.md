# `campaign_campaignsLoader`

*Fichier : `lua/ge/extensions/campaign/campaignsLoader.lua` · VM : Game Engine (GE) · 393 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_campaignsLoader` : `extensions.load("campaign_campaignsLoader")`, puis la globale `campaign_campaignsLoader`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_campaignsLoader.checkSaveExists(title, savesEnabled)` |  | 308 |
| `campaign_campaignsLoader.getCampaignFilenames()` | public interface | 45 |
| `campaign_campaignsLoader.getCampaignScenarios()` |  | 85 |
| `campaign_campaignsLoader.getList()` |  | 61 |
| `campaign_campaignsLoader.loadCampaign(campaignfile)` |  | 12 |
| `campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename)` |  | 364 |
| `campaign_campaignsLoader.saveCampaign(campaign)` |  | 346 |
| `campaign_campaignsLoader.splitFieldByToken(field, token)` |  | 134 |
| `campaign_campaignsLoader.start(newCampaign, endCallback)` | this function is called when the user selects a campaign to play from the UI | 249 |
| `campaign_campaignsLoader.startByFolder(path, endCallback)` |  | 279 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `campaignModules` | table |  |
| `onInit` | any |  ⚠ référence `onInit` non définie dans le fichier (vaut probablement nil) |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSaveCampaign` — écouté par 5 module(s)

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/campaignsLoader.lua`.*
