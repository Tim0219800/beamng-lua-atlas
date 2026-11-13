---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/inventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_inventory` : inventaire simple de la campagne/scénarios. Stocke par type (clé en MAJUSCULES) soit un compteur numérique (argent), soit une liste d'objets (véhicules, pièces). Fournit des fonctions pour ajouter, retirer et lire des éléments, et interprète les blocs `onEvent` des fichiers de campagne (récompenses ou pertes selon la médaille obtenue).
--- Accès : extension `core_inventory` : `extensions.load("core_inventory")`, puis la globale `core_inventory`
---@class core_inventory
---@field itemsTable table<string, number|table[]> Inventaire : type (MAJUSCULES) -> compteur ou liste d'objets.
core_inventory = {}

--- Ajoute à l'inventaire : somme d'un nombre ou insertion d'un objet (sans doublon). Ignoré si itemType ou valueObj est nil/false.
---Source : lua/ge/extensions/core/inventory.lua:29
---@param itemType string Type d'objet (converti en majuscules), par convention préfixé '$$$_'.
---@param valueObj number|table Quantité à ajouter, ou objet (ex. {model, config, color}).
function core_inventory.addItem(itemType, valueObj) end

--- Lit un type. Pour un compteur renvoie sa valeur (0 si absent) ; pour une liste renvoie une copie de l'élément dont itemId est égal à itemId.
---Source : lua/ge/extensions/core/inventory.lua:85
---@param itemType string Type exact (déjà en majuscules).
---@param itemId any Valeur du champ itemId recherchée (liste seulement).
---@return number|table|nil  Quantité, copie de l'élément, ou nil si non trouvé dans une liste.
function core_inventory.getItem(itemType, itemId) end

--- Copie profonde de la liste d'un type ; crée une liste vide pour ce type si absente (effet de bord).
---Source : lua/ge/extensions/core/inventory.lua:101
---@param itemType string Type exact (déjà en majuscules).
---@return table  Copie de la liste (ou du compteur numérique s'il s'agit d'un nombre).
function core_inventory.getItemList(itemType) end

--- Hook de restauration : ne fait rien (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/inventory.lua:196
---@param data table Données de onSerialize (non utilisées).
function core_inventory.onDeserialized(data) end

--- Hook de reprise de campagne : remplace itemsTable par les données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/inventory.lua:185
---@param campaignInProgress any Campagne en cours (non utilisé).
---@param data table Données sauvegardées.
function core_inventory.onResumeCampaign(campaignInProgress, data) end

--- Hook de sauvegarde de campagne : appelle saveCallback(alias de l'extension, copie de itemsTable).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/inventory.lua:180
---@param saveCallback function Fonction (nomExtension, données).
function core_inventory.onSaveCampaign(saveCallback) end

--- Hook de sérialisation avant rechargement des extensions : renvoie une copie de itemsTable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/inventory.lua:190
---@return table  Inventaire.
function core_inventory.onSerialize() end

--- Applique un bloc 'onEvent' de campagne : clés 'add' directes (type -> valeur ou liste) et bloc 'remove' (par médaille ou inconditionnel).
---Source : lua/ge/extensions/core/inventory.lua:129
---@param onEventData table|nil Bloc onEvent ; nil = rien.
---@param earnedMedal string|nil 'bronze', 'silver' ou 'gold' : sélectionne le sous-bloc de 'remove'.
function core_inventory.processOnEvent(onEventData, earnedMedal) end

--- Retire de l'inventaire : soustrait un nombre ou supprime l'objet dont model et config correspondent.
---Source : lua/ge/extensions/core/inventory.lua:58
---@param itemType string Type d'objet (converti en majuscules).
---@param valueObj number|table Quantité à retirer, ou objet avec model et config.
function core_inventory.removeItem(itemType, valueObj) end

