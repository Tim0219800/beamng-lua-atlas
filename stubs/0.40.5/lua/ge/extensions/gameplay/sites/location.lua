---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/location.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet location. Champs : sites, id, name, color (vec3), pos (vec3), radius, customFields (gameplay/util/customFields).
---@class gameplay_sites_location
local gameplay_sites_location = {}

--- Dessine une sphère de debug (et le nom si le mode n'est pas 'faded'). En mode 'highlight', dessine aussi la route la plus proche. Rien au-delà de la distance de visualisation (300 m, ou la préférence de l'éditeur).
---Source : lua/ge/extensions/gameplay/sites/location.lua:45
---@param drawMode string|nil 'none', 'faded', 'normal' ou 'highlight' ; par défaut self._drawMode.
---@param clr table|nil Couleur {r,g,b} ; par défaut la couleur de la location.
function gameplay_sites_location:drawDebug(drawMode, clr) end

--- Cherche le segment de route le plus proche via map.findClosestRoad et renvoie le point projeté sur ce segment, avec le rayon interpolé. Les nœuds a et b sont permutés pour que a soit le plus proche.
---Source : lua/ge/extensions/gameplay/sites/location.lua:81
---@return table|nil  {name_a, name_b, a, b, distance, pos, radius} ou nil si aucune route / map absent.
function gameplay_sites_location:findClosestRoadInfo() end

--- Constructeur appelé par le module. Prend un identifiant unique de l'objet sites si forceId est absent, nom par défaut « Location <id> ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/location.lua:8
---@param sites table Objet sites parent (fournit getNextUniqueIdentifier).
---@param name string|nil Nom affiché.
---@param forceId integer|nil Identifiant imposé (utilisé à la désérialisation).
function gameplay_sites_location:init(sites, name, forceId) end

--- Restaure name, color, position, rayon et champs personnalisés depuis une table sérialisée.
---Source : lua/ge/extensions/gameplay/sites/location.lua:32
---@param data table Table produite par onSerialize.
function gameplay_sites_location:onDeserialized(data) end

--- Renvoie une table sérialisable (name, pos, radius, color, oldId, customFields).
---Source : lua/ge/extensions/gameplay/sites/location.lua:20
---@return table  Données JSON-compatibles.
function gameplay_sites_location:onSerialize() end

--- Définit la position et le rayon de la location.
---Source : lua/ge/extensions/gameplay/sites/location.lua:40
---@param pos vec3 Position monde (copiée).
---@param radius number Rayon en mètres.
function gameplay_sites_location:set(pos, radius) end

