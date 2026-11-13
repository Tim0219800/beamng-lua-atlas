---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/city.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension qui charge le fichier city.sites.json du niveau courant (via gameplay_sites_sitesManager) et offre des requêtes sur ses zones et places de parking : zone de plus haute priorité à une position, valeurs fusionnées de champs personnalisés de zones, et tirage de deux places de parking distantes. La priorité d'une zone est le champ personnalisé 'priority' (0 par défaut). Les sites sont chargés au démarrage du niveau et libérés à la fin.
--- Accès : extension `gameplay_city` : `extensions.load("gameplay_city")`, puis la globale `gameplay_city`
---@class gameplay_city
---@field dependencies table<integer, string> Extensions chargées avant : {"gameplay_sites_sitesManager"}.
gameplay_city = {}

--- Retourne la première zone de plus haute priorité qui contient la position.
---Source : lua/ge/extensions/gameplay/city.lua:30
---@param pos vec3 Position monde.
---@return table|nil  Zone, ou nil si aucun site chargé ou aucune zone.
function gameplay_city.getHighestPrioZone(pos) end

--- Doit renvoyer les valeurs uniques, triées, des champs personnalisés fieldName (avec suffixes '' à '4') de la zone de plus haute priorité à la position. Voir notes : l'implémentation itère sur le résultat de getHighestPrioZone.
---Source : lua/ge/extensions/gameplay/city.lua:47
---@param pos vec3 Position monde.
---@param fieldName string Nom de base du champ personnalisé (ex. 'vehicleGroup').
---@return table  Tableau trié de valeurs ; vide si pos ou fieldName manque.
function gameplay_city.getMergedFieldsFromZones(pos, fieldName) end

--- Tire deux places de parking au hasard dont la distance est au moins minDist, et donne la zone de plus haute priorité de chacune.
---Source : lua/ge/extensions/gameplay/city.lua:61
---@param minDist number|nil Distance minimale en mètres (300 par défaut).
---@param startName string|nil Nom imposé pour la place de départ, s'il existe.
---@return string|nil  Nom de la place de départ.
---@return string  Nom de la place d'arrivée.
---@return string  Nom de la zone de départ.
---@return string  Nom de la zone d'arrivée.
function gameplay_city.getRandomParkingSpots(minDist, startName) end

--- Retourne l'objet sites actuellement chargé.
---Source : lua/ge/extensions/gameplay/city.lua:112
---@return table|nil  Objet sites, ou nil.
function gameplay_city.getSites() end

--- Regroupe les zones contenant la position par priorité.
---Source : lua/ge/extensions/gameplay/city.lua:13
---@param pos vec3 Position monde.
---@return table<number, table[]>  Dictionnaire priorité -> liste de zones (la clé -math.huge existe toujours, avec une liste vide).
---@return number  Plus haute priorité trouvée (-math.huge si aucune).
function gameplay_city.getZonesByPrioForPosition(pos) end

--- Charge un fichier de sites via sitesManager.loadSites. Sans argument, charge city.sites.json du niveau courant (sauf si déjà chargé).
---Source : lua/ge/extensions/gameplay/city.lua:97
---@param file string|nil Chemin du fichier .sites.json.
function gameplay_city.loadSites(file) end

--- Hook appelé à la fin d'un niveau : appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/city.lua:124
---@param levelPath string Chemin du niveau.
function gameplay_city.onClientEndMission(levelPath) end

--- Hook appelé au démarrage d'un niveau : charge les sites par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/city.lua:120
---@param levelPath string Chemin du niveau.
function gameplay_city.onClientStartMission(levelPath) end

--- Oublie les sites chargés (sites = nil).
---Source : lua/ge/extensions/gameplay/city.lua:116
function gameplay_city.reset() end

