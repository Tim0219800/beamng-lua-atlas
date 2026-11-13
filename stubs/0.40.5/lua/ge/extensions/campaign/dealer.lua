---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/dealer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Concessionnaire de la campagne : tient un stock (M.state.stock) indexé par type d'objet en majuscules. Un stock est soit une liste de tables (véhicules {model, config}), soit un nombre cumulé. Sauvegardé et restauré avec la campagne (onSaveCampaign / onResumeCampaign). La fonction buy est vide (non implémentée).
--- Accès : extension `campaign_dealer` : `extensions.load("campaign_dealer")`, puis la globale `campaign_dealer`
---@class campaign_dealer
---@field state table État sauvegardé : {stock = table<string, table|number>}.
campaign_dealer = {}

--- Ajoute un objet (table, sans doublon selon existItem) ou une quantité (nombre) au stock du type donné. Crée l'entrée si besoin.
---Source : lua/ge/extensions/campaign/dealer.lua:32
---@param itemType string Type du stock (converti en majuscules).
---@param valueObj table|number Objet à ajouter ou quantité.
function campaign_dealer.addToStock(itemType, valueObj) end

--- Prévue pour acheter un objet du stock ; le corps est vide dans cette version.
---Source : lua/ge/extensions/campaign/dealer.lua:98
---@param itemType string Type de stock.
---@param index integer Position de l'objet (déduit du nom).
function campaign_dealer.buy(itemType, index) end

--- Retourne une copie profonde du stock d'un type (crée une liste vide si absent).
---Source : lua/ge/extensions/campaign/dealer.lua:61
---@param itemType string Type de stock, tel qu'enregistré (majuscules).
---@return table|number  Copie du stock.
function campaign_dealer.getStock(itemType) end

--- Hook appelé après désérialisation ; ne fait que journaliser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/dealer.lua:108
---@param data table Données désérialisées (non utilisées).
function campaign_dealer.onDeserialized(data) end

--- Hook de reprise de campagne : remplace M.state par data.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/dealer.lua:118
---@param campaignInProgress any Campagne en cours (non utilisé).
---@param data table État sauvegardé.
function campaign_dealer.onResumeCampaign(campaignInProgress, data) end

--- Hook de sauvegarde de la campagne : appelle saveCallback(M.__globalAlias__, copie de l'état).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/dealer.lua:113
---@param saveCallback function Reçoit (alias global du module, données).
function campaign_dealer.onSaveCampaign(saveCallback) end

--- Hook de sérialisation : retourne une copie profonde de M.state.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/dealer.lua:102
---@return table  Copie de l'état.
function campaign_dealer.onSerialize() end

--- Retire du stock la première entrée dont model et config correspondent (valeur table) ou soustrait la quantité (valeur nombre).
---Source : lua/ge/extensions/campaign/dealer.lua:68
---@param itemType string Type du stock (converti en majuscules).
---@param valueObj table|number Objet {model, config} à retirer ou quantité.
function campaign_dealer.removeFromStock(itemType, valueObj) end

