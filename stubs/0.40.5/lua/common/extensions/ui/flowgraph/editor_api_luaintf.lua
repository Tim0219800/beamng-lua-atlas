---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Couche d'interface Lua vers l'éditeur de nœuds C++ (Engine.fge, un éditeur de graphes de type « imgui-node-editor »). Le fichier renvoie une fonction qui reçoit une table M (celle de ui_flowgraph_editor) et y ajoute : constructeurs d'identifiants (NodeIdPtr, LinkIdPtr, PinIdPtr), enums (StyleColor_*, StyleVar_*, PinKind_*, FlowDirection_*, IconType_*, Dirty_*), et wrappers des fonctions fge (éditeur courant, styles, nœuds, pins, liens, sélection, création/suppression, navigation, raccourcis, menus contextuels, conversion écran/canevas). Ce n'est pas une extension chargeable en soi.
--- Accès : `require("extensions/ui/flowgraph/editor_api_luaintf")` (fichier sous extensions/ mais pas une extension classique)
---@class ui_flowgraph_editor_api_luaintf
ui_flowgraph_editor_api_luaintf = {}

--- Accepte la suppression de l'élément interrogé. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param deleteDependencies boolean|nil Supprime aussi les dépendances, true par défaut.
---@return boolean  Résultat de fge.AcceptDeletedItem.
function ui_flowgraph_editor_api_luaintf.AcceptDeletedItem(deleteDependencies) end

--- Ouvre le canevas de l'éditeur de nœuds (fge.Begin) et neutralise l'échelle d'UI ImGui le temps de l'édition. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param id string Identifiant ImGui du canevas.
---@param size ImVec2|nil Taille, (0,0) par défaut.
---@param readOnly boolean|nil Lecture seule, false par défaut.
---@return any  Résultat de fge.Begin.
function ui_flowgraph_editor_api_luaintf.Begin(id, size, readOnly) end

--- Démarre la section de création interactive de liens/nœuds. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param color ImVec4|nil Couleur, blanc par défaut.
---@param thickness number|nil Épaisseur, 1.0 par défaut.
---@return boolean  Résultat de fge.BeginCreate.
function ui_flowgraph_editor_api_luaintf.BeginCreate(color, thickness) end

--- Ferme le canevas (fge.End) et restaure l'échelle d'UI. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return any  Résultat de fge.End.
function ui_flowgraph_editor_api_luaintf.End() end

--- Anime un flux sur un lien. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param linkId any Id du lien.
---@param direction integer|nil FlowDirection_Forward par défaut.
function ui_flowgraph_editor_api_luaintf.Flow(linkId, direction) end

--- Déprécié : logue une erreur ; remplit links (indexé depuis 0) avec les ids sélectionnés. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param links table Tableau rempli.
---@param size integer Non utilisé.
---@return integer  Nombre de liens.
function ui_flowgraph_editor_api_luaintf.GetSelectedLinks(links, size) end

--- Déprécié : logue une erreur ; remplit nodes (indexé depuis 0) avec les ids sélectionnés. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param nodes table Tableau rempli.
---@param size integer Non utilisé.
---@return integer  Nombre de nœuds.
function ui_flowgraph_editor_api_luaintf.GetSelectedNodes(nodes, size) end

--- Déclare un lien entre deux pins. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param id any Id du lien.
---@param startPinId any Pin de départ.
---@param endPinId any Pin d'arrivée.
---@param color ImVec4|nil Couleur, blanc par défaut.
---@param thickness number|nil Épaisseur, 1.0 par défaut.
---@param isShortcut boolean|nil Lien raccourci, false par défaut.
---@param shortCutLabel string|nil Libellé du raccourci.
---@return any  Résultat de fge.Link.
function ui_flowgraph_editor_api_luaintf.Link(id, startPinId, endPinId, color, thickness, isShortcut, shortCutLabel) end

--- Crée un objet LinkId initialisé à 0. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return userdata  LinkId.
function ui_flowgraph_editor_api_luaintf.LinkIdPtr() end

--- Centre la vue sur tout le contenu. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param duration number|nil Durée de l'animation, -1.0 par défaut.
function ui_flowgraph_editor_api_luaintf.NavigateToContent(duration) end

--- Centre la vue sur la sélection. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param zoomIn boolean|nil Zoome, false par défaut.
---@param duration number|nil Durée, -1.0 par défaut.
function ui_flowgraph_editor_api_luaintf.NavigateToSelection(zoomIn, duration) end

--- Crée un objet NodeId initialisé à 0. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return userdata  NodeId.
function ui_flowgraph_editor_api_luaintf.NodeIdPtr() end

--- Crée un objet PinId initialisé à 0. (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@return userdata  PinId.
function ui_flowgraph_editor_api_luaintf.PinIdPtr() end

--- Dépile des couleurs de style de l'éditeur (1 par défaut). (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param count integer|nil Nombre à dépiler, 1 si nil.
function ui_flowgraph_editor_api_luaintf.PopStyleColor(count) end

--- Dépile des variables de style de l'éditeur (1 par défaut). (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param count integer|nil Nombre à dépiler, 1 si nil.
function ui_flowgraph_editor_api_luaintf.PopStyleVar(count) end

--- Renvoie l'identifiant numérique d'un objet pointeur NodeId/LinkId/PinId (appelle obj:id()). (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param obj userdata Objet NodeId, LinkId ou PinId.
---@return integer  Identifiant.
function ui_flowgraph_editor_api_luaintf.PtrToId(obj) end

--- Sélectionne un lien (id 0 si nil). (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param linkId any|nil Id du lien.
---@param append boolean|nil Ajoute à la sélection, false par défaut.
function ui_flowgraph_editor_api_luaintf.SelectLink(linkId, append) end

--- Sélectionne un nœud (id 0 si nil). (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param nodeId any|nil Id du nœud.
---@param append boolean|nil Ajoute à la sélection, false par défaut.
function ui_flowgraph_editor_api_luaintf.SelectNode(nodeId, append) end

--- Définit l'éditeur courant (M.ctx et fge.SetCurrentEditor). (assignée dynamiquement)
---Source : lua/common/extensions/ui/flowgraph/editor_api_luaintf.lua:dyn
---@param ctx userdata Contexte d'éditeur créé par CreateEditor.
function ui_flowgraph_editor_api_luaintf.SetCurrentEditor(ctx) end

