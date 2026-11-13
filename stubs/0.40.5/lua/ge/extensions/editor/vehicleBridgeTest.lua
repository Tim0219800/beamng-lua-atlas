---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleBridgeTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite fenêtre de test de `core_vehicleBridge` dans l'éditeur (menu Window > Vehicles > 'Vehicle Bridge Test'). On choisit un véhicule (ID ou liste des BeamNGVehicle), on saisit une clé (par défaut 'ignition') et le bouton 'Get Value!' appelle core_vehicleBridge.requestValue ; la réponse asynchrone s'affiche avec dumps().
--- Accès : extension `editor_vehicleBridgeTest` : `extensions.load("editor_vehicleBridgeTest")`, puis la globale `editor_vehicleBridgeTest`
---@class editor_vehicleBridgeTest
editor_vehicleBridgeTest = {}

--- Reçoit la réponse de core_vehicleBridge.requestValue et stocke tous ses arguments dans une table affichée dans la fenêtre.
---Source : lua/ge/extensions/editor/vehicleBridgeTest.lua:53
---@param ... any Valeurs renvoyées par le bridge pour la clé demandée.
function editor_vehicleBridgeTest.callback(...) end

--- Hook de rendu GUI de l'éditeur : dessine la fenêtre (saisie ID véhicule, combo de véhicules, clé, bouton Get Value!, résultat).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleBridgeTest.lua:13
function editor_vehicleBridgeTest.onEditorGui() end

--- Enregistre la fenêtre 'Vehicle Bridge Test' (400x600), ajoute son entrée de menu (groupe Vehicles) et charge l'extension core_vehicleBridge.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleBridgeTest.lua:44
function editor_vehicleBridgeTest.onEditorInitialized() end

