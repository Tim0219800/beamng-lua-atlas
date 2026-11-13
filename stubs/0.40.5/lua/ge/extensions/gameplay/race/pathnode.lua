---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/pathnode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Point de passage de course. Les angles passés à getSideTransforms sont en radians.
---@class gameplay_race_pathnode
local gameplay_race_pathnode = {}

--- Convertit le résultat d'un lancer de rayon en transformation d'objet de décor : position décalée de zOff le long de la normale du sol, échelle, rotation selon alignMode.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:248
---@param hit table|nil Résultat de Engine.castRay (pt, norm).
---@param pRot quat Rotation de décalage.
---@param zOff number Décalage selon la normale du sol (m).
---@param scl vec3 Échelle.
---@param side string 'l' ou 'r'.
---@param alignMode string 'terrain', 'pathnode' ou 'absolute'.
---@return table|nil  {pos, scl, rot, side}, nil si pas d'impact.
function gameplay_race_pathnode:convertRayHitToTransform(hit, pRot, zOff, scl, side, alignMode) end

--- Dessine sphère, libellé (préfixe '*' si useAsSplit, entre parenthèses si invisible), champs personnalisés numériques (si la préférence de l'éditeur raceEditor.general.showCustomFields est active) et flèches de normale.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:174
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight' (défaut self._drawMode).
---@param clr number[]|nil Couleur {r,g,b,a}.
---@param extraText string|nil Texte ajouté au libellé.
function gameplay_race_pathnode:drawDebug(drawMode, clr, extraText) end

--- Centre et largeur de la zone utile du pathnode une fois retirés les remplissages latéraux sidePadding.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:168
---@return vec3  Centre décalé.
---@return number  Largeur utile (m).
function gameplay_race_pathnode:getPaddedCenter() end

--- Position de départ de récupération associée (path.startPositions.objects[recovery]).
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:87
---@return table|nil  startPosition ou nil.
function gameplay_race_pathnode:getRecovery() end

--- Position de départ de récupération en marche arrière (reverseRecovery).
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:90
---@return table|nil  startPosition ou nil.
function gameplay_race_pathnode:getReverseRecovery() end

--- Point de route associé.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:301
---@return table|nil  Point de route.
function gameplay_race_pathnode:getRoutePoint() end

--- Calcule deux transformations de décor, à gauche et à droite du pathnode, en lançant des rayons vers le sol de chaque côté (rayon de 10 m). Renvoie une table vide si le pathnode n'a pas de normale.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:269
---@param posOffset vec3 Décalage de position (x, y latéral, z hauteur).
---@param rotOffset vec3 Rotation d'Euler de décalage, symétrique entre les côtés.
---@param sclOffset vec3 Échelle.
---@param alignMode string|nil 'terrain' (défaut), 'pathnode' ou 'absolute'.
---@return table  {transformGauche, transformDroite} (chacun peut être nil sans impact).
function gameplay_race_pathnode:getSideTransforms(posOffset, rotOffset, sclOffset, alignMode) end

--- Point de route statique.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:309
---@return table|nil  Point de route.
function gameplay_race_pathnode:getStaticRoutePoint() end

--- Constructeur : id, nom par défaut « Pathnode <id> », mode manuel, valeurs par défaut des champs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:7
---@param path table Chemin de course propriétaire.
---@param name string|nil Nom.
---@param forceId integer|nil Id imposé.
function gameplay_race_pathnode:init(path, name, forceId) end

--- Indique si un point est dans la sphère (et devant le plan de la normale si hasNormal).
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:78
---@param pos vec3 Point à tester.
---@return boolean  true si dedans.
function gameplay_race_pathnode:inside(pos) end

--- Teste si un segment reliant les coins d'un véhicule traverse le pathnode : le plan de la normale dans la sphère si hasNormal, sinon la sphère elle-même.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:94
---@param fromCorners vec3[] Coins à l'image précédente.
---@param toCorners vec3[] Coins à l'image actuelle.
---@return boolean  true si traversé.
---@return number  Plus petit paramètre t (0..1), math.huge sinon.
function gameplay_race_pathnode:intersectCorners(fromCorners, toCorners) end

--- Restaure le pathnode à partir de données sérialisées ; convertit les ids de récupération avec oldIdMap.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:148
---@param data table Données de onSerialize.
---@param oldIdMap table<integer, integer>|nil Correspondance ancien id -> nouvel id.
function gameplay_race_pathnode:onDeserialized(data, oldIdMap) end

--- Sérialise le pathnode (nom, mode, échelle, position, rayon, normale, navgraphName, recovery, visible, useAsSplit, sidePadding, customFields).
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:128
---@return table  Données JSON.
function gameplay_race_pathnode:onSerialize() end

--- Passe en mode manuel avec position, rayon et normale données.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:47
---@param pos vec3 Position.
---@param radius number Rayon (m).
---@param normal vec3|nil Normale (optionnelle).
function gameplay_race_pathnode:setManual(pos, radius, normal) end

--- Change l'échelle du rayon navgraph et recalcule le rayon en mode navgraph.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:71
---@param scl number|nil Échelle (défaut 1).
function gameplay_race_pathnode:setNavRadiusScale(scl) end

--- Passe en mode navgraph : position et rayon (× navRadiusScale) du nœud de la carte routière, ou de fallback si le nœud n'existe pas. Efface la normale.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:55
---@param navgraphName string Nom du nœud.
---@param fallback table|nil {pos, radius} utilisé si le nœud est absent.
function gameplay_race_pathnode:setNavgraph(navgraphName, fallback) end

--- Définit la normale (longueur > 0,9 requise, puis normalisée, hasNormal true) ; sinon l'efface.
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:33
---@param normal vec3|nil Direction de passage.
function gameplay_race_pathnode:setNormal(normal) end

--- Mémorise le point de route associé (suivi du véhicule).
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:294
---@param rp table Point de route.
function gameplay_race_pathnode:setRoutePoint(rp) end

--- Mémorise le point de route statique (non modifié par le suivi du véhicule).
---Source : lua/ge/extensions/gameplay/race/pathnode.lua:305
---@param rp table Point de route.
function gameplay_race_pathnode:setStaticRoutePoint(rp) end

