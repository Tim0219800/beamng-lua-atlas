---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/veToolbar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Barre d'outils de l'éditeur de véhicule (Vehicle Editor). Elle affiche deux onglets, « Static Editor » et « Live Editor » (un clic change vEditor.editorMode), chacun avec des menus Apps et View (layouts de fenêtres, ajout d'une vue). L'onglet Live ajoute un menu Vehicles (faire apparaître un véhicule de type Car ou Truck à la position de la caméra, en retirer un ou tous) et des curseurs Camera Speed et Time of day. Elle gère aussi les fenêtres Save Layout, Delete Layout et Reset Layouts.
--- Accès : extension `editor_vehicleEditor_veToolbar` : `extensions.load("editor_vehicleEditor_veToolbar")`, puis la globale `editor_vehicleEditor_veToolbar`
---@class editor_vehicleEditor_veToolbar
---@field dependencies table<integer, string> {'core_environment'} : extension chargée avant celle-ci.
editor_vehicleEditor_veToolbar = {}

--- Hook de l'éditeur appelé quand la barre d'outils principale doit être dessinée. Dessine la fenêtre « veToolbar » avec les onglets Static/Live, les menus et les fenêtres de layout, puis éventuellement la barre du mode d'édition courant. Sans effet si l'éditeur de véhicule n'est pas actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/veToolbar.lua:262
function editor_vehicleEditor_veToolbar.onEditorGuiToolBar() end

--- Hook de l'éditeur appelé à l'initialisation : construit la liste triée des véhicules de type Car ou Truck (core_vehicles.getVehicleList()), enregistre la fenêtre veToolbar (800x40, outil 'vehicleEditor') et l'affiche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/veToolbar.lua:353
function editor_vehicleEditor_veToolbar.onEditorInitialized() end

