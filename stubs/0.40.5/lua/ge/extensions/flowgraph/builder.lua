---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/builder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de builder créée par require('...flowgraph/builder')(opts).
---@class flowgraph_builder
local flowgraph_builder = {}

--- Commence un nœud : réinitialise l'en-tête, empile NodePadding, appelle BeginNode et passe à l'étape 'begin'.
---Source : lua/ge/extensions/flowgraph/builder.lua:55
---@param nodeID integer id du nœud dans l'éditeur
function flowgraph_builder:Begin(nodeID) end

--- Appelle Input ou Output selon pin.direction ('in' ou 'out').
---Source : lua/ge/extensions/flowgraph/builder.lua:156
---@param pin table pin avec champ direction
function flowgraph_builder:BeginPinDynamic(pin) end

--- Termine le nœud : passe à l'étape 'end', appelle node:customDrawEnd(self) s'il existe, EndNode, dessine la texture d'en-tête arrondie, la ligne de séparation et les rectangles de debug, puis revient à 'invalid'.
---Source : lua/ge/extensions/flowgraph/builder.lua:68
---@param node table nœud flowgraph dessiné
function flowgraph_builder:End(node) end

--- Ferme l'en-tête et passe à l'étape 'content'.
---Source : lua/ge/extensions/flowgraph/builder.lua:133
function flowgraph_builder:EndHeader() end

--- Termine le pin d'entrée courant (EndPin).
---Source : lua/ge/extensions/flowgraph/builder.lua:151
function flowgraph_builder:EndInput() end

--- Termine le pin de sortie courant (EndPin).
---Source : lua/ge/extensions/flowgraph/builder.lua:193
function flowgraph_builder:EndOutput() end

--- Appelle ui_flowgraph_editor.EndPin().
---Source : lua/ge/extensions/flowgraph/builder.lua:406
function flowgraph_builder:EndPin() end

--- Appelle EndInput ou EndOutput selon pin.direction.
---Source : lua/ge/extensions/flowgraph/builder.lua:164
---@param pin table pin avec champ direction
function flowgraph_builder:EndPinDynamic(pin) end

--- Ouvre la zone d'en-tête avec la couleur donnée.
---Source : lua/ge/extensions/flowgraph/builder.lua:128
---@param color ImVec4 couleur d'en-tête
function flowgraph_builder:Header(color) end

--- Ouvre (si besoin) la zone d'entrées et commence un pin d'entrée.
---Source : lua/ge/extensions/flowgraph/builder.lua:137
---@param pin table pin à dessiner (utilise pin.id)
function flowgraph_builder:Input(pin) end

--- Passe à l'étape 'middle' (zone centrale du nœud, pour drawMiddle).
---Source : lua/ge/extensions/flowgraph/builder.lua:172
function flowgraph_builder:Middle() end

--- Ouvre (si besoin) la zone de sorties et commence un pin de sortie.
---Source : lua/ge/extensions/flowgraph/builder.lua:179
---@param pin table pin à dessiner
function flowgraph_builder:Output(pin) end

--- Appelle ui_flowgraph_editor.BeginPin(pin.id, kind).
---Source : lua/ge/extensions/flowgraph/builder.lua:386
---@param pin table pin à dessiner
---@param kind integer PinKind_Input ou PinKind_Output
function flowgraph_builder:Pin(pin, kind) end

--- Change l'étape de dessin : ferme les groupes de l'ancienne étape en mesurant leurs rectangles, puis ouvre ceux de la nouvelle. Pour 'output', ajoute un padding pour arrondir à la grille.
---Source : lua/ge/extensions/flowgraph/builder.lua:206
---@param stage string 'begin', 'header', 'content', 'input', 'middle', 'output', 'end' ou 'invalid'
---@return boolean  false si l'étape est déjà la courante, sinon true
function flowgraph_builder:SetStage(stage) end

--- Mémorise la largeur attendue des pins de sortie, utilisée pour aligner le nœud sur la grille.
---Source : lua/ge/extensions/flowgraph/builder.lua:198
---@param width number largeur en pixels
function flowgraph_builder:expectOutPinWidth(width) end

--- Initialise l'état (stage 'invalid', tailles à 0, texture d'en-tête art/imgui_node_header_alt.png) et empile les styles NodeBorder/NodeRounding.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/builder.lua:36
function flowgraph_builder:init() end

--- Dessine un pin d'entrée factice (dummy de 12 px de haut) servant à aligner les nœuds qui n'ont aucune entrée visible.
---Source : lua/ge/extensions/flowgraph/builder.lua:417
---@param pin table pin d'alignement (sa direction est forcée à 'in')
function flowgraph_builder:makeAlignmentPin(pin) end

--- Mémorise la largeur attendue de l'en-tête (texte + icônes).
---Source : lua/ge/extensions/flowgraph/builder.lua:202
---@param width number largeur en pixels
function flowgraph_builder:setExpectedHeaderSize(width) end

