---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileSorting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions de tri des tuiles du sélecteur de véhicules selon le mode « Trier par » : Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h, Config Type. Chaque comparateur départage les égalités par nom, en plaçant « Autre » en dernier.
--- Accès : extension `ui_vehicleSelector_tileSorting` : `extensions.load("ui_vehicleSelector_tileSorting")`, puis la globale `ui_vehicleSelector_tileSorting`
---@class ui_vehicleSelector_tileSorting
ui_vehicleSelector_tileSorting = {}

--- Renvoie le comparateur d'un mode de tri ; par défaut le tri par nom.
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:150
---@param sortMode string Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h ou Config Type.
---@return function  Comparateur (a, b) -> boolean.
function ui_vehicleSelector_tileSorting.getSortFunction(sortMode) end

--- Compare par type de config selon l'ordre prédéfini, puis par nom.
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:171
---@param a table Premier élément.
---@param b table Second élément.
---@return boolean  true si a doit précéder b.
function ui_vehicleSelector_tileSorting.sortByConfigTypeName(a, b) end

--- Compare par nom (Name, name ou label) ; l'élément nommé comme le libellé « Autre » (traduit) est toujours placé en dernier.
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:159
---@param a table Premier élément.
---@param b table Second élément.
---@return boolean  true si a doit précéder b.
function ui_vehicleSelector_tileSorting.sortByNameButOtherAlwaysLast(a, b) end

--- Compare par prix (Value, ou sa borne min si c'est une plage), puis par nom.
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:163
---@param a table Premier élément.
---@param b table Second élément.
---@return boolean  true si a doit précéder b.
function ui_vehicleSelector_tileSorting.sortByValue(a, b) end

--- Compare par année (Years, ou sa borne min), puis par nom ; année absente = math.huge.
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:167
---@param a table Premier élément.
---@param b table Second élément.
---@return boolean  true si a doit précéder b.
function ui_vehicleSelector_tileSorting.sortByYears(a, b) end

--- Trie les tuiles d'un groupe (group.tiles) en place selon le mode de tri.
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:176
---@param group table Groupe avec un champ tiles.
---@param sortMode string Mode de tri.
function ui_vehicleSelector_tileSorting.sortGroup(group, sortMode) end

--- Trie une liste de tuiles en place avec le comparateur du mode.
---Source : lua/ge/extensions/ui/vehicleSelector/tileSorting.lua:154
---@param tiles table[] Tuiles à trier.
---@param sortMode string Mode de tri.
function ui_vehicleSelector_tileSorting.sortTiles(tiles, sortMode) end

