---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur partagé d'éléments « posables » pour les outils de route à splines de l'éditeur : placer, sélectionner, glisser et éditer des éléments positionnés le long de l'axe d'une route (par exemple passages piétons, groupes de réparations). Un outil peut porter plusieurs types (kind) ; chacun enregistre sa table « host » avec setHost, et placement, sélection, glissement et poignées sont indexés par type. Le module n'a aucune dépendance à un dossier d'outil non livré. L'état est global au module : un seul outil de route actif à la fois, chaque outil appelle reset() à l'activation et à la désactivation.
--- Accès : extension `editor_toolUtilities_roadPlaceables` : `extensions.load("editor_toolUtilities_roadPlaceables")`, puis la globale `editor_toolUtilities_roadPlaceables`
---@class editor_toolUtilities_roadPlaceables
editor_toolUtilities_roadPlaceables = {}

--- Route un clic sur une poignée : CTRL la supprime (avec entrée d'annulation) ; un clic simple la sélectionne et démarre le glissement le long de la route (un seul clic-glisser la déplace).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:127
---@param groups table Groupes (routes).
---@param gi integer Indice du groupe.
---@param ci integer Indice de l'élément.
---@param ctrlDown boolean CTRL enfoncé.
---@param kind string|nil Type ; sinon survolé ou unique.
---@return string  'deleted', 'selected' ou 'none'.
function editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind) end

--- Éditeur compact ImGui de l'élément sélectionné de type passage piéton (profondeur, étendue latérale, suppression).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:268
---@return boolean  false quand la sélection a disparu (l'hôte réinitialise alors son type de sélection).
function editor_toolUtilities_roadPlaceables.drawEditor() end

--- Dessine poignées et surbrillance des éléments existants, tous types confondus, seulement pour la route sélectionnée ou la route possédant l'élément sélectionné.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:222
---@param groups table Groupes (routes).
---@param selGroup integer|nil Indice de la route sélectionnée.
---@param showSelected boolean true si la sélection globale de l'hôte est actuellement l'un de ces éléments (style sélectionné contre survol).
function editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected) end

--- Lueur de survol et invite pour l'élément sous le curseur cette frame (invite « drag to move, or CTRL to delete »).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:251
---@param groups table Groupes (routes).
---@param gi integer Indice du groupe.
---@param ci integer Indice de l'élément.
---@param kind string|nil Type ; sinon survolé ou unique.
function editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind) end

--- Renvoie la sélection courante.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:83
---@return string|nil  kind.
---@return integer|nil  gi.
---@return integer|nil  ci.
function editor_toolUtilities_roadPlaceables.getSelection() end

--- Aperçu fantôme et clic pour ajouter tant que le mode placement est actif (routes seulement ; visée par rayon caméra contre l'axe, donc aussi sur les sections surélevées). Sélectionne l'élément ajouté.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:147
---@param groups table Groupes (routes).
---@return boolean  true si un élément a été ajouté cette frame.
function editor_toolUtilities_roadPlaceables.handlePlacement(groups) end

--- Glissement le long de la route de la poignée sélectionnée ; la sélection commence le glissement.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:194
---@param groups table Groupes (routes).
---@return boolean  true tant que le module possède la frame (l'hôte saute alors le glissement de nœud/aux par défaut).
function editor_toolUtilities_roadPlaceables.handleSelectDrag(groups) end

--- Vrai si un élément est sélectionné (du type donné si kind est fourni).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:79
---@param kind string|nil Type à tester.
---@return boolean  true si sélection.
function editor_toolUtilities_roadPlaceables.hasSelection(kind) end

--- Vrai pendant un glissement le long de la route.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:78
---@return boolean  true si glissement en cours.
function editor_toolUtilities_roadPlaceables.isDragging() end

--- Indique si le mode placement est actif (pour ce type si kind est donné, sinon pour n'importe lequel). L'outil hôte possède le bouton Add et pilote ces accesseurs.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:76
---@param kind string|nil Type à tester.
---@return boolean  true si en mode placement.
function editor_toolUtilities_roadPlaceables.isPlaceMode(kind) end

--- Efface tout : registre des hôtes, mode placement, sélection et glissement. À appeler dans onActivate et onDeactivate de l'outil hôte.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:86
function editor_toolUtilities_roadPlaceables.reset() end

--- Sélectionne un élément pour qu'une liste de l'hôte puisse le mettre en évidence.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:82
---@param kind string Type de l'élément.
---@param gi integer Indice du groupe (route).
---@param ci integer Indice de l'élément dans le groupe.
function editor_toolUtilities_roadPlaceables.select(kind, gi, ci) end

--- Enregistre l'hôte d'un type d'élément posable. À appeler dans onActivate de l'outil, après reset().
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:58
---@param host table Table hôte avec kind, label, getGroups, isRoad, itemsOf, extentOf, frameAt, tForPoint, clampT, addItem, removeItem, deepCopy, undo, redo, defaultDepthM.
function editor_toolUtilities_roadPlaceables.setHost(host) end

--- Active ou désactive le mode placement pour un type (kind résolu : explicite, survolé ou unique).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:77
---@param on boolean true pour armer.
---@param kind string|nil Type à armer.
function editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind) end

--- Cherche la poignée d'élément la plus proche sous le curseur parmi tous les types (rayon de la caméra contre sphères aux bords de chaussée). Mémorise aussi le type survolé.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:95
---@return integer|nil  gi, indice du groupe.
---@return integer|nil  ci, indice de l'élément.
---@return string|nil  kind.
function editor_toolUtilities_roadPlaceables.underMouse() end

