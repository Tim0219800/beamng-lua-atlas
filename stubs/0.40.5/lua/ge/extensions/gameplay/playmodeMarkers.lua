---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/playmodeMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les marqueurs de jeu en freeroam/carrière (missions, parkings, zones, stations-service, etc.). Il regroupe les POI bruts de gameplay_rawPois en clusters par type de marqueur (fabriques dans gameplay/markers/<type>.lua), crée à la demande l'objet marqueur d'un cluster, et fournit les deux rendus d'icônes (BeamNGWorldIconsRenderer) du monde et de la grande carte. Un kd-tree 2D sert à retrouver les clusters visibles autour d'une position.
--- Accès : extension `gameplay_playmodeMarkers` : `extensions.load("gameplay_playmodeMarkers")`, puis la globale `gameplay_playmodeMarkers`
---@class gameplay_playmodeMarkers
---@field dependencies string[] {'gameplay_rawPois'}, extension chargée avant.
---@field validPlaymodeMarkersStates table<string, boolean> États de jeu où les marqueurs sont actifs : freeroam et career. Modifiable pour en ajouter.
gameplay_playmodeMarkers = {}

--- Vide les clusters, le kd-tree et supprime les objets des marqueurs créés.
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:49
function gameplay_playmodeMarkers.clear() end

--- Id du rendu d'icônes de la grande carte 'bigmapIconRenderer' (créé si besoin).
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:102
---@return integer  Id d'objet.
function gameplay_playmodeMarkers.getBigmapRendererId() end

--- Objet du rendu d'icônes de la grande carte (créé si besoin).
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:106
---@return userdata|nil  Objet de la scène.
function gameplay_playmodeMarkers.getBigmapRendererObj() end

--- Id de l'objet BeamNGWorldIconsRenderer 'markerIconRenderer' (créé si besoin).
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:94
---@return integer  Id d'objet.
function gameplay_playmodeMarkers.getIconRendererId() end

--- Objet du rendu d'icônes du monde (créé si besoin).
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:98
---@return userdata|nil  Objet de la scène.
function gameplay_playmodeMarkers.getIconRendererObj() end

--- Renvoie l'objet marqueur du cluster ; le crée au premier appel (cluster.create(), createObjects, setup).
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:178
---@param cluster table Cluster issu de getPlaymodeClusters.
---@return table  Objet marqueur.
function gameplay_playmodeMarkers.getMarkerForCluster(cluster) end

--- Liste triée par id des clusters de marqueurs du niveau courant (calculée puis mise en cache). Chaque cluster doit avoir id, visibilityPos et visibilityRadius, sinon une erreur est loguée.
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:153
---@return table[]  Clusters.
function gameplay_playmodeMarkers.getPlaymodeClusters() end

--- kd-tree 2D (kdtreebox2d) des clusters, indexé par boîte englobant visibilityPos ± visibilityRadius.
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:164
---@return table  Objet kd-tree construit.
function gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree() end

--- Indique si l'état de jeu courant est dans validPlaymodeMarkersStates.
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:196
---@return boolean  true si les marqueurs sont autorisés.
function gameplay_playmodeMarkers.isStateWithPlaymodeMarkers() end

--- Hook de fin de niveau : vide clusters et marqueurs, supprime les rendus d'icônes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:205
function gameplay_playmodeMarkers.onClientEndMission() end

--- Hook de début de niveau : crée les deux rendus d'icônes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:79
function gameplay_playmodeMarkers.onClientStartMission() end

--- Hook avant rechargement Lua : mêmes nettoyages que onClientEndMission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:211
function gameplay_playmodeMarkers.onSerialize() end

