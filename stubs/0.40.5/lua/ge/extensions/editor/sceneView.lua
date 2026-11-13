---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sceneView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vues de scène supplémentaires de l'éditeur : chaque « Scene view N » est une fenêtre ImGui qui affiche le monde via un ImguiRenderViewControl, avec son propre mode (3D, dernière caméra sélectionnée, orthographique), plans near/far, FOV, position/rotation, visibilité des icônes et du gizmo, et masque de debug draw. Dessine aussi une grille de debug. L'état des vues est sauvegardé avec la disposition de l'éditeur (onSerialize/onDeserialized) et restauré à l'initialisation.
--- Accès : extension `editor_sceneView` : `extensions.load("editor_sceneView")`, puis la globale `editor_sceneView`
---@class editor_sceneView
editor_sceneView = {}

--- Mémorise les données sauvegardées jusqu'à ce que l'éditeur soit initialisé (onEditorInitialized les utilise).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneView.lua:438
---@param data table Valeur renvoyée par onSerialize.
function editor_sceneView.onDeserialized(data) end

--- Appelé à chaque image : crée une vue en attente (menu « Add Scene View ») puis dessine chaque fenêtre de vue, ses menus de contrôle (mode, clips, FOV, ortho) et met à jour la caméra de rendu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneView.lua:76
function editor_sceneView.onEditorGui() end

--- Appelé à l'initialisation de l'éditeur : recrée les vues depuis les données désérialisées, puis ajoute le menu « Add Scene View ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneView.lua:406
function editor_sceneView.onEditorInitialized() end

--- Sérialise l'état de toutes les vues (mode, clips, fov, pos, rot, options d'affichage, masque debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneView.lua:417
---@return table  { sceneViews = { [nom] = état } }
function editor_sceneView.onSerialize() end

