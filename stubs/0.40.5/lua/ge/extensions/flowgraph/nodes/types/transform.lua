---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/transform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_types_transform_C
local flowgraph_nodes_types_transform_C = {}

--- Force la réécriture des sorties au démarrage (changed = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:317
function flowgraph_nodes_types_transform_C:_executionStarted() end

--- Force la réécriture des sorties au prochain démarrage (changed = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:341
function flowgraph_nodes_types_transform_C:_executionStopped() end

--- Restaure l'état du nœud depuis les données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:459
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_types_transform_C:_onDeserialized(nodeData) end

--- Écrit l'état du nœud dans la table de sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:448
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_types_transform_C:_onSerialize(res) end

--- Dessine une boîte pleine (triangles) et ses arêtes noires à partir d'un coin et de trois vecteurs d'arête.
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:392
---@param corner vec3 Coin de départ de la boîte.
---@param x vec3 Premier vecteur d'arête.
---@param y vec3 Deuxième vecteur d'arête.
---@param z vec3 Troisième vecteur d'arête.
---@param clr color Couleur des faces.
function flowgraph_nodes_types_transform_C:drawAxisBox(corner, x, y, z, clr) end

--- Dessine les contrôles du mode gizmo : mode d'affichage, position, rotation (euler en degrés ou quaternion), échelle, couleur, boutons « Copier depuis la sélection », « Position devant la caméra / à la caméra », « Rotation à la caméra », « Descendre sur le terrain ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:166
function flowgraph_nodes_types_transform_C:drawCustom() end

--- Combo du mode (gizmo/fromID) — ajoute ou retire le pin objID — puis drawCustom en mode gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:123
function flowgraph_nodes_types_transform_C:drawCustomProperties() end

--- Dessine les axes X/Y/Z colorés (sphères et lignes) et le volume de prévisualisation selon displayMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:346
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_types_transform_C:drawMiddle(builder, style) end

--- Début d'un glisser du gizmo : mémorise rotation, échelle et position d'origine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:42
function flowgraph_nodes_types_transform_C:gizmoBeginDrag() end

--- Pendant le glisser du gizmo : met à jour position (translation), rotation (rotation, en repère local ou relative au départ) ou échelle (composante par composante) selon le mode du gizmo, et dessine les axes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:48
function flowgraph_nodes_types_transform_C:gizmoDragging() end

--- Fin d'un glisser du gizmo (appelée par editor.updateAxisGizmo) ; met à jour l'état du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:79
function flowgraph_nodes_types_transform_C:gizmoEndDrag() end

--- Appelée quand le nœud est désélectionné : retire le gizmo et revient au mode d'édition objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:113
function flowgraph_nodes_types_transform_C:hideProperties() end

--- Place la position à 15 m devant la caméra, rotation identité, échelle (1,1,1), couleur de marqueur rouge semi-transparente, mode 'gizmo' et displayMode 'halfBox'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:24
function flowgraph_nodes_types_transform_C:init() end

--- Appelée quand le nœud est sélectionné dans l'éditeur : branche le mode d'édition 'flowgraphTransform' avec le gizmo d'axes du World Editor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:85
function flowgraph_nodes_types_transform_C:showProperties() end

--- Synchronise la matrice du gizmo avec position et rotation du nœud (rotation ignorée si le gizmo est en alignement monde).
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:153
function flowgraph_nodes_types_transform_C:updateTransform() end

--- En mode fromID, copie position/rotation/échelle de l'objet objID ; si 'changed', écrit les trois pins de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:321
function flowgraph_nodes_types_transform_C:work() end

