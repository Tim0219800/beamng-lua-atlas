---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/vehicleTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de « portes » pour véhicule (par exemple l'entrée d'un garage ou d'un atelier) en mode jeu. Chaque porte est une paire d'objets de scène (zone, icône) : quand la boîte englobante du véhicule du joueur recouvre une zone, l'icône monte légèrement, un écran 3D facultatif s'affiche pendant 5 s avec un son d'ordinateur de carrière, et le marqueur devient interactif. Le module renvoie {create, cluster}.
--- Accès : extension `gameplay_markers_vehicleTrigger` : `extensions.load("gameplay_markers_vehicleTrigger")`, puis la globale `gameplay_markers_vehicleTrigger`
---@class gameplay_markers_vehicleTrigger
gameplay_markers_vehicleTrigger = {}

--- Transforme chaque POI vehicleTrigger en un cluster distinct et l'ajoute à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:216
---@param pois table[] POI avec markerInfo.vehicleTrigger.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_vehicleTrigger.cluster(pois, allClusters) end

--- Fabrique un marqueur de portes (instance de C).
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:208
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_vehicleTrigger.create(...) end

--- Marqueur de portes pour véhicule.
---@class gameplay_markers_vehicleTrigger_C
local gameplay_markers_vehicleTrigger_C = {}

--- Retire les icônes, cache les écrans et efface la liste des portes.
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:171
function gameplay_markers_vehicleTrigger_C:clearObjects() end

--- Nettoie les objets existants (n'en crée pas).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:144
function gameplay_markers_vehicleTrigger_C:createObjects() end

--- Dessine un cercle sur la minimap à la position de chaque icône de porte.
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:202
---@param td table Données de dessin (non utilisées).
function gameplay_markers_vehicleTrigger_C:drawOnMinimap(td) end

--- Passe invisible, rend les icônes transparentes et cache les écrans.
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:148
function gameplay_markers_vehicleTrigger_C:hide() end

--- Initialise visible = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:19
function gameplay_markers_vehicleTrigger_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:195
---@param visible boolean Ignoré.
function gameplay_markers_vehicleTrigger_C:instantFade(visible) end

--- Si canInteract et qu'une porte recouvre le véhicule, ajoute les données (elemData) du cluster aux éléments interactifs.
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:187
---@param interactData table Données de frame avec canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_vehicleTrigger_C:interactInPlayMode(interactData, interactableElements) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:198
---@param value boolean Ignoré.
function gameplay_markers_vehicleTrigger_C:setHidden(value) end

--- Pour chaque porte, retrouve l'objet de zone et l'objet d'icône dans la scène, calcule la boîte de la zone, cache l'écran associé et crée l'icône (id <cluster.id>-vtIcon-<idx>).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:23
---@param cluster table Cluster issu de cluster().
function gameplay_markers_vehicleTrigger_C:setup(cluster) end

--- Repasse visible.
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:166
function gameplay_markers_vehicleTrigger_C:show() end

--- Chaque frame : teste le recouvrement OBB/OBB avec le véhicule, gère le minuteur et l'affichage des écrans, anime hauteur et opacité des icônes, dessine un trait, met à jour isInAreaChanged et anyOverlap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:79
---@param data table Données de frame : veh, bbCenter, bbHalfAxis0..2, camPos, bigMapActive, dt.
function gameplay_markers_vehicleTrigger_C:update(data) end

