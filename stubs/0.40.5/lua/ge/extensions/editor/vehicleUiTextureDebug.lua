---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleUiTextureDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug de l'éditeur (menu Window > Vehicles > « Vehicle UI Textures »). Il liste les véhicules, puis les tags de textures UI HTML (écrans CEF dessinés sur les véhicules) actifs du véhicule choisi. Pour un tag, il permet d'ouvrir/fermer la console de la texture, d'exporter la texture en PNG et d'afficher les infos de debug (fps, taille, mode d'usage, URL de départ).
--- Accès : extension `editor_vehicleUiTextureDebug` : `extensions.load("editor_vehicleUiTextureDebug")`, puis la globale `editor_vehicleUiTextureDebug`
---@class editor_vehicleUiTextureDebug
---@field dependencies table<integer, string> {'ui_imgui'} : extension chargée avant celle-ci.
editor_vehicleUiTextureDebug = {}

--- Hook de l'éditeur appelé à chaque frame : dessine les listes déroulantes de véhicule et de tag, les boutons console/dump et les informations de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleUiTextureDebug.lua:62
function editor_vehicleUiTextureDebug.onEditorGui() end

--- Hook de l'éditeur appelé à l'initialisation. Récupère ui_imgui, enregistre la fenêtre 'Vehicle UI Textures' (520x420) et ajoute l'entrée de menu dans le groupe 'Vehicles'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleUiTextureDebug.lua:56
function editor_vehicleUiTextureDebug.onEditorInitialized() end

