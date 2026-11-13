---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roadTracking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet de suivi de route d'un véhicule. Champs principaux : vehId, pos/dirVec/vel (vec3), speed, n1/n2 (noms des nœuds de la route), linkData, speedLimit, speedRatio, alignment (≈1 si parallèle à la route), roadOffset, roadXnorm/roadYnorm (0 à 1), halfWidth, isOnRoad, isNearRoad, isPublicRoad, isOneWay, isReverse, legalSide, faults, timers, collisionIds, collisionCount, currSignal, signalAction, signalFault.
---@class gameplay_traffic_roadTracking
local gameplay_traffic_roadTracking = {}

--- Calcule la position du véhicule sur le segment n1-n2 : position longitudinale et latérale normalisée, demi-largeur interpolée, alignement, décalage par rapport à la ligne centrale, et isOnRoad.
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:109
---@return boolean  true si le segment actuel reste valide ; false si le véhicule en est sorti ou que la direction a changé (il faut alors rechercher un nouveau segment).
function gameplay_traffic_roadTracking:calcVehOnRoad() end

--- Initialise l'objet : mesure l'emprise du véhicule (initialNodePosBB), calcule vehBasicRadius (demi-largeur ou demi-longueur minimale), fixe les seuils de vitesse, puis appelle refresh.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:16
---@param vehId integer Id du véhicule à suivre.
function gameplay_traffic_roadTracking:init(vehId) end

--- Restaure la configuration depuis la table produite par onSerialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:338
---@param data table Données issues de onSerialize.
function gameplay_traffic_roadTracking:onDeserialized(data) end

--- Sérialise la configuration (vehId, speedLimitFloor, speedLimitCoef, highFrequency, fullStats).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:328
---@return table  Table de données sérialisables.
function gameplay_traffic_roadTracking:onSerialize() end

--- Mise à jour par frame : actualise véhicule et route, cumule les collisions, puis fait évoluer les scores de faute (excès de vitesse, mauvais sens/côté, conduite imprudente) et suit les signaux de circulation (feu rouge, stop) pour renseigner signalAction et signalFault.
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:193
---@param dt number Delta temps en secondes.
function gameplay_traffic_roadTracking:onUpdate(dt) end

--- Remet à zéro toutes les tables et valeurs (fautes, timers, collisions, route), recalcule le côté légal (conduite à droite ou à gauche selon map.getRoadRules()), puis, si le véhicule est dans map.objects, met à jour le véhicule et la route courante.
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:38
function gameplay_traffic_roadTracking:refresh() end

--- Remet à leurs valeurs neutres les valeurs de suivi actives (ratio de vitesse, alignement, décalage, fautes, timers, signal, collisions).
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:68
function gameplay_traffic_roadTracking:resetValues() end

--- Cherche le meilleur segment de route (map.findBestRoad) pour la position et la direction actuelles, met à jour limite de vitesse, sens unique, route publique et ligne centrale (d'après la chaîne de voies '+'/'-'), oriente n1->n2 dans le sens de marche, puis appelle calcVehOnRoad. Si aucune route proche : isNearRoad = false et reset des valeurs.
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:152
function gameplay_traffic_roadTracking:updateCurrentRoad() end

--- Met à jour la position au sol (centre de l'OOBB abaissé de la demi-hauteur), la direction, la vitesse (m/s) et isReverse (vitesse d'au moins 1 m/s dans le sens opposé à l'avant du véhicule).
---Source : lua/ge/extensions/gameplay/traffic/roadTracking.lua:97
function gameplay_traffic_roadTracking:updateVehicle() end

