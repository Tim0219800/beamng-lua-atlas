---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détermine dans quels groupes (sections de la grille) une config de véhicule apparaît selon le mode « Grouper par » du sélecteur : Type, Brand, Country, Config Type, Derby Class, Body Style, Source, ainsi que Years (par décennie) et Value (par tranche de prix). Ajoute aussi les groupes spéciaux Favoris et Récents. Utilisé par ui_vehicleSelector_tiles.
--- Accès : extension `ui_vehicleSelector_tileGrouping` : `extensions.load("ui_vehicleSelector_tileGrouping")`, puis la globale `ui_vehicleSelector_tileGrouping`
---@class ui_vehicleSelector_tileGrouping
---@field groupModeFunctions table<string, function> Fonctions (valeur) -> groupName, groupOrder pour les modes non basés sur une plage : Type, Brand, Country, Config Type, Derby Class, Body Style, Source.
---@field isRange table<string, boolean> Modes de groupement par plage : Years et Value.
ui_vehicleSelector_tileGrouping = {}

--- Lit une propriété sur la config, ou à défaut sur le modèle (core_vehicles.getModel).
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:102
---@param config table Config (avec model_key).
---@param prop string Nom de propriété.
---@return any  Valeur ou nil.
function ui_vehicleSelector_tileGrouping.getConfigOrModelPropValue(config, prop) end

--- Renvoie la fonction de groupement d'un mode non basé sur une plage.
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:151
---@param groupMode string Mode de groupement.
---@return function|nil  Fonction ou nil.
function ui_vehicleSelector_tileGrouping.getGroupModeFunction(groupMode) end

--- Renvoie la liste des groupes d'une config pour un mode de regroupement, avec les groupes Favoris et Récents si applicable. La valeur absente est classée dans « Autre ».
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:115
---@param config table Config du véhicule.
---@param groupMode string Mode de groupement (Type, Brand, Years, Value, ...).
---@param displayData table Options d'affichage (showFavouritesMode, showRecentMode).
---@return table[]  Liste de {groupName, groupOrder, isFavouriteGroup?, isRecentGroup?}.
function ui_vehicleSelector_tileGrouping.getGroupsForConfig(config, groupMode, displayData) end

--- Renvoie la fonction qui découpe une valeur en groupes pour Years ou Value.
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:156
---@param groupMode string 'Years' ou 'Value'.
---@return function|nil  Fonction ou nil.
function ui_vehicleSelector_tileGrouping.getRangeGroupingFunction(groupMode) end

--- Indique si le mode groupe par plage (Years, Value).
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:146
---@param groupMode string Mode de groupement.
---@return boolean  true pour Years et Value.
function ui_vehicleSelector_tileGrouping.isRangeGroupMode(groupMode) end

