---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Assembly Spline » de l'éditeur du monde : on trace une spline et l'outil y place automatiquement des meshes TSStatic issus d'un « kit d'assemblage » (dossier assets/meshes/props/assembly_kit/), par ex. des barrières ou des rails dont les éléments se raccordent par des ancres 'nail.*'. Il s'enregistre comme mode d'édition (icône gyroscope), possède une fenêtre ImGui 'assemblySpline', gère la sérialisation des splines dans la session de l'éditeur, l'import depuis des TSStatic existants (menu clic droit de l'arbre de scène « Convert to Assembly Spline » ou polygone de sélection), le verrouillage/cuisson (bake) et le terraformage. La logique est répartie entre splineMgr, molecule, populate, distribution et import.
--- Accès : extension `editor_assemblySpline` : `extensions.load("editor_assemblySpline")`, puis la globale `editor_assemblySpline`
---@class editor_assemblySpline
editor_assemblySpline = {}

--- Appelle fn sur chaque objet scène de la spline d'id donné (délègue à pop.eachObject). Rien si la spline n'existe plus.
---Source : lua/ge/extensions/editor/assemblySpline.lua:109
---@param id integer Id de la spline.
---@param fn function Callback appliqué à chaque objet.
function editor_assemblySpline.eachObjectById(id, fn) end

--- Hook appelé en quittant la carte : supprime toutes les assembly splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assemblySpline.lua:1768
function editor_assemblySpline.onClientEndMission() end

--- Hook appelé après rechargement avec les données de onSerialize : recrée les splines, réadopte les objets conservés, reconstruit la table id->index, les kits de meshes et les molécules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assemblySpline.lua:161
---@param data table|nil Splines sérialisées.
function editor_assemblySpline.onDeserialized(data) end

--- Hook appelé chaque frame par l'éditeur : gère les mises à jour différées d'import, met à jour les splines sales, affiche la fenêtre de l'outil, le dessin de polygone de sélection, les entrées souris/clavier sur les nœuds et le rendu debugDraw des splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assemblySpline.lua:1646
function editor_assemblySpline.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : crée le mode d'édition assemblySplineEditMode, enregistre la fenêtre et ajoute l'entrée de menu « Convert to Assembly Spline » à l'arbre de scène (valide si au moins 2 TSStatic compatibles sont sélectionnés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assemblySpline.lua:1748
function editor_assemblySpline.onEditorInitialized() end

--- Hook de sérialisation d'extension (avant rechargement Lua) : sérialise toutes les splines puis les supprime de la scène.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/assemblySpline.lua:142
---@return table  Tableau de splines sérialisées.
function editor_assemblySpline.onSerialize() end

--- Verrouille ou déverrouille la assembly spline d'id donné et la reconstruit immédiatement (utilisé aussi par la Master Spline pour ses enfants liés, et par la cuisson). Verrouiller force d'abord la mise à jour d'une spline sale. Ne fait rien si l'id est introuvable.
---Source : lua/ge/extensions/editor/assemblySpline.lua:99
---@param id integer Id de la spline.
---@param isLocked boolean true pour verrouiller (isEnabled = false).
function editor_assemblySpline.setLockedById(id, isLocked) end

--- Définit l'index du nœud sélectionné (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/assemblySpline.lua:139
---@param idx integer Index (à partir de 1).
function editor_assemblySpline.setSelectedNodeIdx(idx) end

--- Définit l'index de la spline sélectionnée (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/assemblySpline.lua:136
---@param idx integer Index (à partir de 1).
function editor_assemblySpline.setSelectedSplineIdx(idx) end

