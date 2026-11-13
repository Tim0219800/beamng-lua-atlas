---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_customPartsConfigProvider_C
local flowgraph_nodes_vehicle_customPartsConfigProvider_C = {}

--- Appelé au chargement du projet ; restaure les réglages du nœud depuis `nodeData`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:235
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:_onDeserialized(nodeData) end

--- Appelé à la sauvegarde du projet ; copie les réglages du nœud dans la table `res`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:225
---@param res table Table de sauvegarde à remplir.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:_onSerialize(res) end

--- Affichage ImGui des propriétés du nœud dans le panneau de l'éditeur ; renvoie une chaîne décrivant la modification faite, ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:44
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:drawCustomProperties() end

--- Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:214
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:drawMiddle(builder, style) end

--- Constructeur ; vide modèles/configs et crée `partConfig = {parts = {}, vars = {}}`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:25
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:init() end

--- Affiche un tableau éditable de paires clé/valeur (`field` = 'parts' avec valeurs string, ou 'vars' avec valeurs number), avec tri, ajout et suppression.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:122
---@param name string Titre affiché.
---@param field string 'parts' ou 'vars'.
---@param tpe string 'string' ou 'number' : type des valeurs.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:showKVPairs(name, field, tpe) end

--- Reconstruit `sortedKeys` (clés de `parts` et `vars` triées alphabétiquement).
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:197
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:sortKeys() end

--- Copie `partConfig` et `model` sur les pins de sortie `config` et `model`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:220
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:work() end

