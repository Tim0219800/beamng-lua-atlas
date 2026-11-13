---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_fire_fire_C
local flowgraph_nodes_vehicle_fire_fire_C = {}

--- Met `done = false` (champ inutilisé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:52
function flowgraph_nodes_vehicle_fire_fire_C:_executionStarted() end

--- Appelé au chargement du projet ; restaure les réglages du nœud depuis `nodeData`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:77
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_vehicle_fire_fire_C:_onDeserialized(nodeData) end

--- Appelé à la sauvegarde du projet ; copie les réglages du nœud dans la table `res`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:73
---@param res table Table de sauvegarde à remplir.
function flowgraph_nodes_vehicle_fire_fire_C:_onSerialize(res) end

--- Affichage ImGui des propriétés du nœud dans le panneau de l'éditeur ; renvoie une chaîne décrivant la modification faite, ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:38
function flowgraph_nodes_vehicle_fire_fire_C:drawCustomProperties() end

--- Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:67
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_fire_fire_C:drawMiddle(builder, style) end

--- Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:26
function flowgraph_nodes_vehicle_fire_fire_C:init() end

--- Envoie l'action `interactFire` avec la fonction sélectionnée au véhicule `vehId`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua:56
function flowgraph_nodes_vehicle_fire_fire_C:workOnce() end

