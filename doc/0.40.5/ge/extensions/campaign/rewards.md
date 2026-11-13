# `campaign_rewards`

*Fichier : `lua/ge/extensions/campaign/rewards.lua` · VM : Game Engine (GE) · 142 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_rewards` : `extensions.load("campaign_rewards")`, puis la globale `campaign_rewards`

Calcul et attribution des récompenses de scénario de la campagne. À partir de scenarioData.onEvent.onSucceed (ou onFail), getRewards sélectionne les récompenses ; processRewards les ajoute à l'inventaire (core_inventory.addItem avec la clé « $$$_ »..type) et renvoie ce qui a été gagné ainsi que les choix à faire par le joueur (clé « choices »). processUserSelection applique le choix du joueur et envoie les autres options au concessionnaire (campaign_dealer.addToStock).

## Remarques

- Les clés de médaille sont reconnues par statistics_statistics.getMedalRanking(clé) >= 0 ; les autres clés de rewards sont toujours accordées.
- Dans processRewards, « choices » doit être un tableau (sinon erreur journalisée) et est mémorisé dans M.pendingUserChoices[scenarioKey].
- Bug : iterateRewardsConst lit une globale « players » qui n'est définie nulle part dans ce fichier ; la fonction échoue ou ne parcourt rien si elle n'existe pas ailleurs.
- getScenarioReward est vide : tout son corps est commenté et elle retourne toujours nil.
- processUserSelection traite seulement la première clé de pendingUserChoices[scenarioKey] puis retourne ; l'index sélectionné est 1-based, et les autres entrées de la liste partent au concessionnaire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal)` | Retourne la table des récompenses du scénario : onSucceed si le résultat n'est pas échoué, sinon onFail. Inclut la récompense de la médaille obtenue et toutes les clés qui ne sont pas des médailles. | 17 |
| `campaign_rewards.getScenarioReward(scenarioData, eventName)` | Fonction prévue pour lire les récompenses d'un événement ; son corps est entièrement commenté dans cette version. | 119 |
| `campaign_rewards.iterateRewardsConst(player, callback)` | Appelle callback(clé, valeur) pour chaque entrée de players[player] (table globale non définie dans ce fichier). | 10 |
| `campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal)` | Ajoute les récompenses à l'inventaire, mémorise les choix en attente, et retourne une table fusionnant ce qui est gagné (nombres cumulés ou listes) et les choix proposés. | 53 |
| `campaign_rewards.processUserSelection(scenarioKey, selectionIndex)` | Applique le choix du joueur : ajoute l'élément choisi à l'inventaire et envoie toutes les autres options de la liste au concessionnaire. | 97 |

### Détail des paramètres

#### `campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal)`

Retourne la table des récompenses du scénario : onSucceed si le résultat n'est pas échoué, sinon onFail. Inclut la récompense de la médaille obtenue et toutes les clés qui ne sont pas des médailles.

- `scenarioKey` (*string*) : Identifiant du scénario (non utilisé dans le calcul).
- `scenarioData` (*table*) : Données du scénario avec onEvent.onSucceed / onFail.
- `scenarioResult` (*table*) : Résultat ; le champ failed est lu.
- `medal` (*string|nil*) : Médaille obtenue.
- **renvoie** : table|nil Récompenses, ou nil s'il n'y en a pas.

#### `campaign_rewards.getScenarioReward(scenarioData, eventName)`

Fonction prévue pour lire les récompenses d'un événement ; son corps est entièrement commenté dans cette version.

- `scenarioData` (*table*) : Données du scénario.
- `eventName` (*string*) : Nom de l'événement.
- **renvoie** : nil Toujours nil.

#### `campaign_rewards.iterateRewardsConst(player, callback)`

Appelle callback(clé, valeur) pour chaque entrée de players[player] (table globale non définie dans ce fichier).

- `player` (*any*) : Clé du joueur dans la table globale players.
- `callback` (*function*) : Reçoit (clé, valeur).

#### `campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal)`

Ajoute les récompenses à l'inventaire, mémorise les choix en attente, et retourne une table fusionnant ce qui est gagné (nombres cumulés ou listes) et les choix proposés.

- `scenarioKey` (*string*) : Identifiant du scénario.
- `scenarioData` (*table*) : Données du scénario.
- `scenarioResult` (*table*) : Résultat du scénario.
- `medal` (*string|nil*) : Médaille obtenue.
- **renvoie** : table Récompenses gagnées plus éventuel champ « choices ».

#### `campaign_rewards.processUserSelection(scenarioKey, selectionIndex)`

Applique le choix du joueur : ajoute l'élément choisi à l'inventaire et envoie toutes les autres options de la liste au concessionnaire.

- `scenarioKey` (*string*) : Scénario dont des choix sont en attente.
- `selectionIndex` (*integer*) : Index (à partir de 1) de l'option retenue.

## Champs

| Champ | Type | Description |
|---|---|---|
| `pendingUserChoices` | table<string, table> | Choix en attente par clé de scénario, remplis par processRewards. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/rewards.lua`.*
