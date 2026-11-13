---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/uiRows.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Formes de lignes ImGui dont sont faits les panneaux des outils d'éditeur : un slider précédé de son bouton de réinitialisation, un libellé devant une rangée de boutons d'option, et un sous-onglet qui se ferme sur une ligne de séparation. Partagé pour que les fenêtres se ressemblent (colonne de 30 px pour le reset, libellés sur 118 px). Utilise la palette 'crystal' et util.beginSubTab/endSubTab.
--- Accès : extension `editor_toolUtilities_uiRows` : `extensions.load("editor_toolUtilities_uiRows")`, puis la globale `editor_toolUtilities_uiRows`
---@class editor_toolUtilities_uiRows
---@field LABEL_COL_W number Largeur de la colonne de libellés (118), pour aligner les rangées de boutons empilées.
editor_toolUtilities_uiRows = {}

--- Icône de réinitialisation à gauche du slider (espace vide si déjà à la valeur par défaut). L'appelant dessine le slider entre beginSliderRow et endSliderRow.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:31
---@param id string Identifiant ImGui de base.
---@param atDefault boolean Vrai : valeur par défaut, pas de bouton.
---@param onReset function Appelée au clic sur le bouton de réinitialisation.
function editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset) end

--- Ouvre un sous-onglet via util.beginSubTab et réinitialise la mémoire de séparateur.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:92
---@param label string Titre.
---@param flags integer|nil Drapeaux ImGui transmis à util.beginSubTab.
---@return boolean  Vrai si l'onglet est ouvert (déduit du code).
function editor_toolUtilities_uiRows.beginSubTab(label, flags) end

--- Referme la ligne de slider (largeur, colonnes, style).
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:45
function editor_toolUtilities_uiRows.endSliderRow() end

--- Ferme un sous-onglet par une ligne de séparation, sauf si la dernière chose dessinée en était déjà une ou s'il n'y a plus de place verticale.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:99
function editor_toolUtilities_uiRows.endSubTab() end

--- Dessine la ligne de fin d'une liste et retient sa position, pour que le sous-onglet qui la contient n'en dessine pas une seconde juste dessous.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:87
function editor_toolUtilities_uiRows.markSep() end

--- Rangée de boutons dont plusieurs peuvent être allumés à la fois, pour un choix qui est un mélange. `has(id)` dit lesquels sont allumés. L'infobulle précise « In the mix » ou non.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:70
---@param opts table Liste d'options { id, tip, icon } ou de triplets positionnels.
---@param id string Préfixe d'identifiant ImGui.
---@param has function has(optId) renvoie vrai si l'option est allumée.
---@param offCol ImVec4 Couleur du bouton éteint.
---@return string|nil  Identifiant de l'option cliquée, nil sinon.
function editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol) end

--- Renvoie l'icône de l'éditeur de ce nom, ou un carré simple si elle est inconnue.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:63
---@param name string Nom dans editor.icons.
---@return any  Icône.
function editor_toolUtilities_uiRows.optIcon(name) end

--- Libellé à gauche d'une rangée de boutons, suivi d'un SameLine à X fixe (au moins la largeur du libellé).
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:53
---@param label string Texte.
---@param tip string|nil Infobulle.
---@param col ImVec4|nil Couleur (greenB par défaut).
function editor_toolUtilities_uiRows.rowLabel(label, tip, col) end

