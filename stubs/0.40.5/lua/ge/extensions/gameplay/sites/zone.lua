---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/zone.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet zone. Champs : sites, id, name, color, vertices (liste de {pos, radius, index, next, prev}), center, labelPos, aabb {xMin..zMax, invalid}, top / bot ({pos, normal, active}), fenceDown, fenceHeight, usePlanes, customFields, locations et parkingSpots (remplis par finalizeSites).
---@class gameplay_sites_zone
local gameplay_sites_zone = {}

--- Test rapide x/y contre la boîte englobante (z ignoré).
---Source : lua/ge/extensions/gameplay/sites/zone.lua:197
---@param point vec3 Point à tester.
---@return boolean  false si hors boîte ou aabb invalide.
function gameplay_sites_zone:aabbCheck(point) end

--- Insère un sommet (à la fin ou à l'index donné) et recalcule les données dérivées.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:72
---@param pos vec3 Position du sommet.
---@param index integer|nil Position d'insertion (défaut : à la fin).
function gameplay_sites_zone:addVertex(pos, index) end

--- Crée automatiquement des plans horizontaux 5 m au-dessus du sommet le plus haut et 5 m en dessous du plus bas, centrés sur la zone.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:143
---@param ignoreTop boolean|nil Ne pas créer le plan haut.
---@param ignoreBot boolean|nil Ne pas créer le plan bas.
function gameplay_sites_zone:autoPlanes(ignoreTop, ignoreBot) end

--- À appeler après modification des plans top/bot ; relance processVertices.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:132
function gameplay_sites_zone:changedPlanes() end

--- Teste si un point est dans le polygone (x/y) et entre les plans.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:252
---@param point vec3 Point à tester.
---@return boolean  true si dans la zone.
function gameplay_sites_zone:containsPoint2D(point) end

--- Teste si un véhicule est dans la zone, d'après sa boîte englobante de spawn : centre seul en mode basic, sinon les quatre coins du bas/haut utilisés (points 0, 3, 4 et 7) doivent tous être dans la zone.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:275
---@param veh userdata Objet véhicule (getSpawnWorldOOBB).
---@param basic boolean|nil Tester seulement le centre.
---@return boolean  true si contenu.
function gameplay_sites_zone:containsVehicle(veh, basic) end

--- Dessine la zone en debug (clôture translucide, nom, plans selon le mode). Ne dessine que si la caméra est assez proche.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:291
---@param drawMode string|nil 'none', 'faded', 'normal' ou 'highlight'.
---@param clr table|nil Couleur {r,g,b}.
---@param customHeight number|nil Hauteur de clôture personnalisée.
---@param customDown number|nil Profondeur de clôture personnalisée.
---@param nearCam boolean|nil Ne dessiner que les segments proches de la caméra.
---@param drawDistance number|nil Distance de dessin.
function gameplay_sites_zone:drawDebug(drawMode, clr, customHeight, customDown, nearCam, drawDistance) end

--- Dessine un panneau de clôture (deux triangles, double face) entre deux points.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/zone.lua:393
---@param from vec3 Début du segment.
---@param to vec3 Fin du segment.
---@param clrI table ColorI (son champ a est écrasé).
---@param down number|nil Décalage vers le bas (défaut 0).
---@param up number|nil Hauteur (défaut 5).
---@param usePlanes boolean|nil Borner la clôture par les plans actifs.
---@param nearCam boolean|nil Limiter à la proximité de la caméra avec fondu.
---@param drawDistance number|nil Distance de dessin (défaut 30).
---@param shapeAlpha number|nil Opacité 0..1 (défaut 0,5).
function gameplay_sites_zone:drawFence(from, to, clrI, down, up, usePlanes, nearCam, drawDistance, shapeAlpha) end

--- Dessine le contour de la zone sur la minimap de l'interface (lignes blanches).
---Source : lua/ge/extensions/gameplay/sites/zone.lua:380
---@param td any Objet de dessin de la minimap (méthode line), déduit du code.
function gameplay_sites_zone:drawMinimap(td) end

--- Dessine un plan (haut ou bas) par des lignes reliant son point d'ancrage aux sommets projetés, et sa normale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/zone.lua:369
---@param plane table Plan {pos, normal, active}.
---@param clrF any Couleur ColorF.
function gameplay_sites_zone:drawPlane(plane, clrF) end

--- Constructeur. sites peut être nil (identifiant -1). Valeurs par défaut : fenceDown 0, fenceHeight 5, plans inactifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/sites/zone.lua:7
---@param sites table|nil Objet sites parent.
---@param name string|nil Nom ; défaut « Zone <id> ».
---@param forceId integer|nil Identifiant imposé.
function gameplay_sites_zone:init(sites, name, forceId) end

--- Remplace les sommets par une version échantillonnée tous les maxStep mètres (au minimum 1), recalée sur la hauteur du terrain.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:446
---@param maxStep number|nil Pas maximal en mètres ; défaut 3, plancher 1.
function gameplay_sites_zone:makeHighResolutionFence(maxStep) end

--- Restaure la zone depuis les données et appelle processVertices.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:51
---@param data table Données de onSerialize.
function gameplay_sites_zone:onDeserialized(data) end

--- Sérialise nom, sommets, couleur, champs personnalisés et plans top/bot.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:26
---@return table  Données JSON-compatibles.
function gameplay_sites_zone:onSerialize() end

--- Indique si un point se trouve entre les plans actifs (un plan inactif est ignoré).
---Source : lua/ge/extensions/gameplay/sites/zone.lua:167
---@param point vec3 Point à tester.
---@return boolean  true si entre les plans.
function gameplay_sites_zone:pointBetweenPlanes(point) end

--- Précalculs : boîte englobante (aabb), centre, position du libellé, chaînage des sommets, extension de l'aabb par les plans. Si un plan n'est pas actif, la borne z correspondante est infinie.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:83
function gameplay_sites_zone:processVertices() end

--- Distance d'intersection d'un rayon avec la « clôture » (murs verticaux le long du contour, bornés par fenceDown/fenceHeight ou par les plans).
---Source : lua/ge/extensions/gameplay/sites/zone.lua:214
---@param rayPos vec3 Origine du rayon.
---@param rayDir vec3 Direction du rayon.
---@return number  Distance du plus proche impact, math.huge si aucun.
function gameplay_sites_zone:rayIntersectsZone(rayPos, rayDir) end

--- Supprime le sommet d'index donné et recalcule.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:77
---@param index integer Index du sommet.
function gameplay_sites_zone:removeVertex(index) end

--- Teste que les deux plans sont actifs et que leurs normales pointent respectivement vers le haut (top) et vers le bas (bot).
---Source : lua/ge/extensions/gameplay/sites/zone.lua:137
---@return boolean  true si valides.
function gameplay_sites_zone:validPlanes() end

--- Projette verticalement (axe z) un sommet sur un plan. Renvoie le sommet inchangé si le plan est inactif ou aligné avec l'axe z (erreur journalisée).
---Source : lua/ge/extensions/gameplay/sites/zone.lua:181
---@param vertex vec3 Point à projeter.
---@param plane table Plan {pos, normal, active}.
---@return vec3  Point d'intersection.
function gameplay_sites_zone:vertexPlaneIntersection(vertex, plane) end

--- Aire du polygone en m² (formule du lacet, x/y). 0 si moins de 3 sommets.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:476
---@return number  Aire en m².
function gameplay_sites_zone:zoneArea() end

