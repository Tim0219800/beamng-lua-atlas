---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/segment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Segment de course. Champs : path, id, name (« Segment <id> » par défaut), mode ('waypoint' par défaut), from et to (ids de pathnodes, -1 si aucun), capsulePoints, sortOrder, _drawMode.
---@class gameplay_race_segment
local gameplay_race_segment = {}

--- Insère une capsule à l'index donné (à la fin par défaut).
---Source : lua/ge/extensions/gameplay/race/segment.lua:78
---@param pos vec3 Position.
---@param radius number Rayon (m).
---@param name string|nil Nom.
---@param index integer|nil Position d'insertion dans capsulePoints.
function gameplay_race_segment:addCapsule(pos, radius, name, index) end

--- Indique si un point est dans le tronçon de capsule entre les points id et id+1 (distance au segment inférieure au rayon interpolé).
---Source : lua/ge/extensions/gameplay/race/segment.lua:96
---@param point vec3 Point à tester.
---@param id integer Index du premier point du tronçon.
---@return boolean|nil  true si dedans, nil sinon.
function gameplay_race_segment:capsuleContains(point, id) end

--- Revalide le mode après un changement d'extrémité : en mode 'navpath', recalcule le chemin si possible, sinon repasse en 'waypoint'.
---Source : lua/ge/extensions/gameplay/race/segment.lua:43
function gameplay_race_segment:checkMode() end

--- Indique si le véhicule est dans le segment. En mode waypoint : vrai s'il est déjà dans ce segment (state.currentSegments) ou s'il vient de traverser le pathnode de départ. En mode 'capsules' ou 'navpath' : vrai s'il est dans une des capsules.
---Source : lua/ge/extensions/gameplay/race/segment.lua:107
---@param point vec3 Position du véhicule.
---@param state table currentSegments, previousCorners, currentCorners.
---@return boolean  true si dedans.
---@return number|nil  0 en mode capsules/navpath (valeur fixe).
function gameplay_race_segment:contains(point, state) end

--- Dessine le segment (prisme entre les deux nœuds en mode waypoint, capsules et bords sinon) et son nom. Ne dessine rien si le segment est invalide.
---Source : lua/ge/extensions/gameplay/race/segment.lua:176
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight' (défaut self._drawMode).
function gameplay_race_segment:drawDebug(drawMode) end

--- Remplit les capsules avec les nœuds intermédiaires du plus court chemin map.getPath entre les nœuds navgraph from et to (extrémités exclues).
---Source : lua/ge/extensions/gameplay/race/segment.lua:67
function gameplay_race_segment:fillNavpath() end

--- Indique si le véhicule vient de traverser le pathnode d'arrivée (intersectCorners).
---Source : lua/ge/extensions/gameplay/race/segment.lua:139
---@param point vec3 Position (non utilisée).
---@param state table previousCorners, currentCorners.
---@return boolean  true si traversé.
---@return number  Paramètre t de la traversée.
function gameplay_race_segment:finished(point, state) end

--- Indique si les deux pathnodes d'extrémité sont en mode navgraph (donc si un chemin navgraph est possible).
---Source : lua/ge/extensions/gameplay/race/segment.lua:23
---@return boolean  true si possible.
function gameplay_race_segment:getBeNavpath() end

--- Nombre de points de capsule, extrémités comprises (#capsulePoints + 2).
---Source : lua/ge/extensions/gameplay/race/segment.lua:86
---@return integer  Nombre de points.
function gameplay_race_segment:getCapsuleCount() end

--- Point i de la chaîne de capsules : 1 = pathnode from, dernier = pathnode to, sinon un capsulePoint.
---Source : lua/ge/extensions/gameplay/race/segment.lua:87
---@param i integer Index à partir de 1.
---@return table|nil  Pathnode ou capsule {pos, radius, name}.
function gameplay_race_segment:getCapsuleNode(i) end

--- Pathnode de départ.
---Source : lua/ge/extensions/gameplay/race/segment.lua:32
---@return table|nil  Pathnode.
function gameplay_race_segment:getFrom() end

--- Pathnode d'arrivée.
---Source : lua/ge/extensions/gameplay/race/segment.lua:33
---@return table|nil  Pathnode.
function gameplay_race_segment:getTo() end

--- Constructeur : id, nom, mode 'waypoint', from/to à -1, liste de capsules vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/segment.lua:11
---@param path table Chemin de course propriétaire.
---@param name string|nil Nom.
---@param forceId integer|nil Id imposé.
function gameplay_race_segment:init(path, name, forceId) end

--- Indique si les pathnodes from et to existent, ne sont pas marqués missing et sont différents.
---Source : lua/ge/extensions/gameplay/race/segment.lua:240
---@return boolean  true si valide.
function gameplay_race_segment:isValid() end

--- Restaure le segment ; convertit from/to avec oldIdMap, applique le mode puis ajoute les capsules sauvegardées.
---Source : lua/ge/extensions/gameplay/race/segment.lua:160
---@param data table Données de onSerialize.
---@param oldIdMap table<integer, integer>|nil Correspondance ancien id -> nouvel id.
function gameplay_race_segment:onDeserialized(data, oldIdMap) end

--- Sérialise le segment (name, mode, from, to, oldId, capsules).
---Source : lua/ge/extensions/gameplay/race/segment.lua:144
---@return table  Données JSON.
function gameplay_race_segment:onSerialize() end

--- Retire la capsule d'index donné.
---Source : lua/ge/extensions/gameplay/race/segment.lua:82
---@param index integer Index dans capsulePoints.
function gameplay_race_segment:removeCapsule(index) end

--- Définit le pathnode de départ (par id) et revalide le mode.
---Source : lua/ge/extensions/gameplay/race/segment.lua:34
---@param from integer Id du pathnode.
function gameplay_race_segment:setFrom(from) end

--- Change le mode : 'waypoint' vide les capsules ; 'navpath' les remplit depuis le navgraph.
---Source : lua/ge/extensions/gameplay/race/segment.lua:55
---@param mode string Nouveau mode.
function gameplay_race_segment:setMode(mode) end

--- Définit le pathnode d'arrivée (par id) et revalide le mode.
---Source : lua/ge/extensions/gameplay/race/segment.lua:38
---@param to integer Id du pathnode.
function gameplay_race_segment:setTo(to) end

