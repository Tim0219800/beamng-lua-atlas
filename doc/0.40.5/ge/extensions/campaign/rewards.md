# `campaign_rewards`

*Fichier : `lua/ge/extensions/campaign/rewards.lua` · VM : Game Engine (GE) · 142 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_rewards` : `extensions.load("campaign_rewards")`, puis la globale `campaign_rewards`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal)` |  | 17 |
| `campaign_rewards.getScenarioReward(scenarioData, eventName)` |  | 119 |
| `campaign_rewards.iterateRewardsConst(player, callback)` |  | 10 |
| `campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal)` | TODO(AK): Make rewards.lua have a validation step on the campaign json information | 53 |
| `campaign_rewards.processUserSelection(scenarioKey, selectionIndex)` |  | 97 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `pendingUserChoices` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/rewards.lua`.*
