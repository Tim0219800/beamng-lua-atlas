---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/rewards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcul et attribution des récompenses de scénario de la campagne. À partir de scenarioData.onEvent.onSucceed (ou onFail), getRewards sélectionne les récompenses ; processRewards les ajoute à l'inventaire (core_inventory.addItem avec la clé « $$$_ »..type) et renvoie ce qui a été gagné ainsi que les choix à faire par le joueur (clé « choices »). processUserSelection applique le choix du joueur et envoie les autres options au concessionnaire (campaign_dealer.addToStock).
--- Accès : extension `campaign_rewards` : `extensions.load("campaign_rewards")`, puis la globale `campaign_rewards`
---@class campaign_rewards
---@field pendingUserChoices table<string, table> Choix en attente par clé de scénario, remplis par processRewards.
campaign_rewards = {}

--- Retourne la table des récompenses du scénario : onSucceed si le résultat n'est pas échoué, sinon onFail. Inclut la récompense de la médaille obtenue et toutes les clés qui ne sont pas des médailles.
---Source : lua/ge/extensions/campaign/rewards.lua:17
---@param scenarioKey string Identifiant du scénario (non utilisé dans le calcul).
---@param scenarioData table Données du scénario avec onEvent.onSucceed / onFail.
---@param scenarioResult table Résultat ; le champ failed est lu.
---@param medal string|nil Médaille obtenue.
---@return table|nil  Récompenses, ou nil s'il n'y en a pas.
function campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal) end

--- Fonction prévue pour lire les récompenses d'un événement ; son corps est entièrement commenté dans cette version.
---Source : lua/ge/extensions/campaign/rewards.lua:119
---@param scenarioData table Données du scénario.
---@param eventName string Nom de l'événement.
---@return nil  Toujours nil.
function campaign_rewards.getScenarioReward(scenarioData, eventName) end

--- Appelle callback(clé, valeur) pour chaque entrée de players[player] (table globale non définie dans ce fichier).
---Source : lua/ge/extensions/campaign/rewards.lua:10
---@param player any Clé du joueur dans la table globale players.
---@param callback function Reçoit (clé, valeur).
function campaign_rewards.iterateRewardsConst(player, callback) end

--- Ajoute les récompenses à l'inventaire, mémorise les choix en attente, et retourne une table fusionnant ce qui est gagné (nombres cumulés ou listes) et les choix proposés.
---Source : lua/ge/extensions/campaign/rewards.lua:53
---@param scenarioKey string Identifiant du scénario.
---@param scenarioData table Données du scénario.
---@param scenarioResult table Résultat du scénario.
---@param medal string|nil Médaille obtenue.
---@return table  Récompenses gagnées plus éventuel champ « choices ».
function campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal) end

--- Applique le choix du joueur : ajoute l'élément choisi à l'inventaire et envoie toutes les autres options de la liste au concessionnaire.
---Source : lua/ge/extensions/campaign/rewards.lua:97
---@param scenarioKey string Scénario dont des choix sont en attente.
---@param selectionIndex integer Index (à partir de 1) de l'option retenue.
function campaign_rewards.processUserSelection(scenarioKey, selectionIndex) end

