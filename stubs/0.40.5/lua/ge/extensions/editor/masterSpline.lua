---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil Master Spline de l'éditeur de monde (mode d'édition « masterSpline »). Une Master Spline est une courbe maîtresse (nœuds, largeurs, normales) qui pilote une pile de couches, chacune liée à une spline enfant d'un autre outil (mesh, assembly, decal, road, tree) décalée latéralement. Le fichier contient surtout l'interface imgui (fenêtre « masterSpline », poignées de virage, gizmo, terraformage, route automatique, homologation, session) ; les données sont dans masterSpline/splineMgr.lua. Elle sert aux créateurs de niveaux, pas aux véhicules.
--- Accès : extension `editor_masterSpline` : `extensions.load("editor_masterSpline")`, puis la globale `editor_masterSpline`
---@class editor_masterSpline
---@field dependencies string[] Extensions chargées avant celle-ci pour garantir l'ordre de sérialisation : editor_assemblySpline, editor_decalSpline, editor_meshSpline, editor_roadSpline, editor_treeSpline.
editor_masterSpline = {}

--- Hook appelé en quittant la carte : délie et supprime toutes les Master Splines et recalcule la table id vers indice.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline.lua:1922
function editor_masterSpline.onClientEndMission() end

--- Hook de désérialisation : supprime les Master Splines existantes, recrée celles de data, puis recalcule la table id vers indice.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline.lua:203
---@param data table[] Données produites par onSerialize.
function editor_masterSpline.onDeserialized(data) end

--- Hook appelé à chaque image de l'éditeur : optimisation en direct de la spline sélectionnée, reconstruction des splines dirty, puis, si l'outil est actif, fenêtre, caméra panoramique, poignées de virage engineered, événements souris/clavier, terraformage et dessin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline.lua:1788
function editor_masterSpline.onEditorGui() end

--- Hook d'initialisation de l'éditeur : enregistre le mode d'édition « Master Spline » (editor.editModes.masterSpline) et la fenêtre « masterSpline ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline.lua:1908
function editor_masterSpline.onEditorInitialized() end

--- Hook de sérialisation de l'éditeur : sérialise toutes les Master Splines, délie leurs enfants, supprime les Master Splines et recharge la collision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline.lua:183
---@return table[]  Tableau des Master Splines sérialisées.
function editor_masterSpline.onSerialize() end

--- Définit l'indice du nœud sélectionné (sélection croisée entre outils).
---Source : lua/ge/extensions/editor/masterSpline.lua:145
---@param idx integer Indice du nœud (à partir de 1).
function editor_masterSpline.setSelectedNodeIdx(idx) end

--- Définit l'indice de la Master Spline sélectionnée (sélection croisée entre outils).
---Source : lua/ge/extensions/editor/masterSpline.lua:142
---@param idx integer Indice dans la liste (à partir de 1).
function editor_masterSpline.setSelectedSplineIdx(idx) end

