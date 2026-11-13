# `campaign_dealer`

*Fichier : `lua/ge/extensions/campaign/dealer.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_dealer` : `extensions.load("campaign_dealer")`, puis la globale `campaign_dealer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_dealer.addToStock(itemType, valueObj)` |  | 32 |
| `campaign_dealer.buy(itemType, index)` |  | 98 |
| `campaign_dealer.getStock(itemType)` |  | 61 |
| `campaign_dealer.onDeserialized(data)` | *(hook)* | 108 |
| `campaign_dealer.onResumeCampaign(campaignInProgress, data)` | *(hook)* | 118 |
| `campaign_dealer.onSaveCampaign(saveCallback)` | *(hook)* | 113 |
| `campaign_dealer.onSerialize()` | *(hook)* | 102 |
| `campaign_dealer.removeFromStock(itemType, valueObj)` |  | 68 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `state` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/dealer.lua`.*
