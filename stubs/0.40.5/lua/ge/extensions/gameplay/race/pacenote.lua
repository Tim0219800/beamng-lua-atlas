---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/pacenote.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Annonce de copilote. Champs : path, id, name, pos (vec3), normal (vec3, défaut (0,1,0)), radius, note (texte), segment (id, -1 si aucun), sortOrder (999999 par défaut), mode, navgraphName.
---@class gameplay_race_pacenote
local gameplay_race_pacenote = {}

--- Dessine la sphère, le texte (note, ou « (nom) » si vide) et les flèches de la normale avec debugDrawer.
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:116
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight' (défaut self._drawMode).
---@param clr number[]|nil Couleur {r,g,b,a} (défaut arc-en-ciel selon sortOrder).
---@param extraText string|nil Texte ajouté au libellé.
function gameplay_race_pacenote:drawDebug(drawMode, clr, extraText) end

--- Constructeur : attribue l'id (forceId ou path:getNextUniqueIdentifier()), le nom par défaut « Pacenote <id> », la position nulle, la note vide et le segment -1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:8
---@param path table Chemin de course propriétaire.
---@param name string|nil Nom.
---@param forceId integer|nil Id imposé.
function gameplay_race_pacenote:init(path, name, forceId) end

--- Indique si un point est dans la sphère de l'annonce (et du bon côté de la normale si hasNormal).
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:59
---@param pos vec3 Point à tester.
---@return boolean  true si dedans.
function gameplay_race_pacenote:inside(pos) end

--- Teste si un des segments reliant les coins d'un véhicule (fromCorners[i] vers toCorners[i]) traverse le plan de l'annonce à l'intérieur de la sphère.
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:69
---@param fromCorners vec3[] Coins à l'image précédente.
---@param toCorners vec3[] Coins à l'image actuelle.
---@return boolean  true si traversé.
---@return number  Plus petit paramètre t (0..1) de traversée, math.huge sinon.
function gameplay_race_pacenote:intersectCorners(fromCorners, toCorners) end

--- Restaure l'annonce (mode manuel) à partir de données sérialisées ; convertit l'id de segment avec oldIdMap.
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:108
---@param data table Données de onSerialize.
---@param oldIdMap table<integer, integer>|nil Correspondance ancien id -> nouvel id.
function gameplay_race_pacenote:onDeserialized(data, oldIdMap) end

--- Sérialise l'annonce : name, pos, radius, normal, oldId, note, segment.
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:95
---@return table  Données JSON.
function gameplay_race_pacenote:onSerialize() end

--- Passe en mode manuel avec position, rayon et normale données (oublie le nom de nœud navgraph).
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:34
---@param pos vec3 Position.
---@param radius number Rayon en mètres.
---@param normal vec3 Normale.
function gameplay_race_pacenote:setManual(pos, radius, normal) end

--- Passe en mode navgraph : prend position et rayon d'un nœud de la carte routière, ou de fallback si le nœud n'existe pas.
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:42
---@param navgraphName string Nom du nœud.
---@param fallback table|nil {pos, radius} utilisé si le nœud est absent.
function gameplay_race_pacenote:setNavgraph(navgraphName, fallback) end

--- Définit la normale de l'annonce si sa longueur dépasse 0,9 (elle est alors normalisée).
---Source : lua/ge/extensions/gameplay/race/pacenote.lua:25
---@param normal vec3|nil Direction ; nil provoque une erreur (voir notes).
function gameplay_race_pacenote:setNormal(normal) end

