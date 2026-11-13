---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/veMain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Noyau du Vehicle Editor (éditeur de véhicule, modes statique et live). L'extension s'enregistre aussi comme globale `vEditor` : elle y stocke le véhicule courant (vEditor.vehicle, vEditor.vdata, vEditor.vehData, vEditor.vehiclePos), les nœuds/poutres sélectionnés et les menus. Elle charge automatiquement toutes les extensions `ve*.lua` des dossiers vehicleEditor/, staticEditor/ et liveEditor/, construit les menus à partir de leur `menuEntry`/`open`, et émet chaque frame le hook `onVehicleEditorRenderJBeams` pour que les outils de debug dessinent avec debugDrawer.
--- Accès : extension `editor_veMain` : `extensions.load("editor_veMain")`, puis la globale `editor_veMain`
---@class editor_veMain
---@field dependencies table<integer, string> Extensions chargées avant : {'core_vehicle_manager'}.
editor_veMain = {}

--- Restaure vEditor.editorMode depuis data.editorMode. Nom non standard (le hook d'extension est onDeserialized).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:427
---@param data table Table renvoyée par onSerialize.
function editor_veMain.onDeserialize(data) end

--- Hook de l'éditeur appelé quand un outil headless est activé/désactivé. Si toolName correspond à l'éditeur véhicule courant (vehicleEditorStatic/vehicleEditorLive), prépare l'éditeur (setupEditor) et marque vEditor.editorActive, ou retire l'action map 'VehicleEditor'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:318
---@param enabled boolean true si l'outil est activé.
---@param toolName string Nom de l'outil headless.
function editor_veMain.onEditorHeadlessChange(enabled, toolName) end

--- Appelé par l'éditeur en mode headless pour dessiner la barre de menu : menus File (Exit Vehicle Editor...), View (Reset Layout) et indicateurs FPS / GpuWait / Poly.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:405
function editor_veMain.onEditorHeadlessMainMenuBar() end

--- Appelé quand l'éditeur est initialisé : ajoute l'entrée 'Vehicle Editor' (groupe Vehicles) au menu Window.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:310
function editor_veMain.onEditorInitialized() end

--- Quand le champ color, colorPalette0 ou colorPalette1 d'un BeamNGVehicle est modifié dans l'inspecteur, convertit la couleur et applique la peinture via core_vehicle_partmgmt.setConfigPaints.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:341
---@param selectedIds table<integer, integer> IDs des objets sélectionnés.
---@param fieldName string Nom du champ modifié.
---@param fieldValue string Nouvelle valeur (chaîne de couleur).
---@param arrayIndex any Index de tableau du champ (non utilisé).
function editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Appelé chaque frame avant le rendu. Si aucun véhicule n'est suivi, initialise vEditor depuis le véhicule joueur (be:getPlayerVehicleID(0)). Sinon met à jour vEditor.vehiclePos puis émet le hook `onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:251
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_veMain.onPreRender(dtReal, dtSim, dtRaw) end

--- Sérialisation avant rechargement Lua : renvoie {editorMode = vEditor.editorMode}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:421
---@return table  Données à restaurer.
function editor_veMain.onSerialize() end

--- Appelé à la destruction d'un véhicule : remet à nil vEditor.vehicle, vehData, vdata, nodeCIDToName et vehiclePos (sans vérifier de quel véhicule il s'agit).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:333
function editor_veMain.onVehicleDestroyed() end

--- Appelé au changement de véhicule joueur : recharge les données (vEditor.vehData, vdata, nodeCIDToName, vehicle) pour newVehicle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/veMain.lua:314
---@param oldVehicle integer ID de l'ancien véhicule.
---@param newVehicle integer ID du nouveau véhicule.
---@param player integer Index du joueur.
function editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Sauvegarde la disposition de fenêtres courante du Vehicle Editor via editor_layoutManager.saveCurrentWindowLayout.
---Source : lua/ge/extensions/editor/veMain.lua:417
function editor_veMain.saveCurrentWindowLayout() end

--- Active le Vehicle Editor s'il est inactif (active l'éditeur monde, le mode headless, charge les apps), sinon le quitte (deactivateEditor(false)) en désactivant core_vehicle_manager.setDebug.
---Source : lua/ge/extensions/editor/veMain.lua:302
function editor_veMain.toggleActive() end

