---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileSorting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tri centralisé des tuiles du sélecteur de gameplay. Fournit quatre modes (Name, System, GameplayAutomatic, Date), la conversion des valeurs de l'UI ('name', 'automatic', 'date', 'system') vers ces modes et un repli sur 'Name' pour toute valeur invalide (avec un log d'avertissement).
--- Accès : extension `ui_gameplaySelector_tileSorting` : `extensions.load("ui_gameplaySelector_tileSorting")`, puis la globale `ui_gameplaySelector_tileSorting`
---@class ui_gameplaySelector_tileSorting
---@field SORT_MODE_TO_UI table<string, string> Correspondance inverse, calculée au chargement.
---@field SYSTEM_ORDER table<string, integer> Rang de chaque système de gameplay pour le tri.
---@field UI_TO_SORT_MODE table<string, string> Correspondance valeur UI -> mode interne (name, automatic, date, system).
---@field VALID_SORT_MODES string[] {'Name', 'System', 'GameplayAutomatic', 'Date'}.
ui_gameplaySelector_tileSorting = {}

--- Convertit une valeur de l'UI en mode interne ; 'Name' si nil, non-chaîne ou inconnue (avec avertissement).
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:246
---@param uiValue string|nil 'name', 'automatic', 'date' ou 'system'.
---@return string  Mode interne.
function ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue) end

--- Renvoie la fonction de comparaison d'un mode. Mode invalide ou inconnu : log d'avertissement et repli sur 'Name'.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:227
---@param sortMode string 'Name', 'System', 'GameplayAutomatic' ou 'Date'.
---@return function  function(a, b) -> boolean utilisable par table.sort.
function ui_gameplaySelector_tileSorting.getSortFunction(sortMode) end

--- Indique si le mode de tri existe.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:242
---@param sortMode string Mode interne.
---@return boolean  true si valide.
function ui_gameplaySelector_tileSorting.isValidSortMode(sortMode) end

--- Comparateur par date décroissante ; sans date en dernier ; nom en cas d'égalité.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:282
---@param a table Tuile ou item (champ date).
---@param b table Tuile ou item.
---@return boolean  true si a doit précéder b.
function ui_gameplaySelector_tileSorting.sortByDate(a, b) end

--- Comparateur multicritère : clusters, système, auxiliaire, order, nom.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:278
---@param a table Tuile ou item (isClustered, system, isAuxiliary, order, name).
---@param b table Tuile ou item.
---@return boolean  true si a doit précéder b.
function ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b) end

--- Comparateur alphabétique, l'élément « Autre » étant toujours en dernier.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:270
---@param a table Tuile ou item.
---@param b table Tuile ou item.
---@return boolean  true si a doit précéder b.
function ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b) end

--- Comparateur par ordre de système, puis par nom à système égal.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:274
---@param a table Tuile ou item (champ system).
---@param b table Tuile ou item (champ system).
---@return boolean  true si a doit précéder b.
function ui_gameplaySelector_tileSorting.sortBySystem(a, b) end

--- Trie group.tiles sur place avec le mode donné.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:287
---@param group table Groupe contenant une liste tiles.
---@param sortMode string Mode interne.
function ui_gameplaySelector_tileSorting.sortGroup(group, sortMode) end

--- Trie la liste de tuiles sur place (table.sort) avec le mode interne donné.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:265
---@param tiles table[] Tuiles à trier (modifiée).
---@param sortMode string Mode interne.
function ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode) end

--- Trie la liste de tuiles sur place à partir d'une valeur de l'UI.
---Source : lua/ge/extensions/ui/gameplaySelector/tileSorting.lua:260
---@param tiles table[] Tuiles à trier (modifiée).
---@param uiSortValue string|nil Valeur de tri de l'UI.
function ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue) end

