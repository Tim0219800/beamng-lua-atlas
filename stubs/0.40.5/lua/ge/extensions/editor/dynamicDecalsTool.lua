---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecalsTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre principale de l'outil Dynamic Decals de l'éditeur (peinture de décalcomanies sur le véhicule). Charge ses 33 sous-modules via M.dependencies (api editor_api_dynamicDecals, widgets, layerStack, inspector, brushes, gizmo, vehicleColorPalette, loadSave, layerTypes_*, etc.) et sert de hub : les sous-modules s'enregistrent auprès de lui par setup(tool) avec registerSection, registerToolbarToolItem, registerToolbarActionItem, registerEditorOnUpdateFn et registerOnEditorGuiFn. Expose aussi l'interface publique appelée par les actions clavier/souris (applyDecal, undo/redo, changeDecalSize/Rotation, verrouillage profondeur/normale, mode pinceau, calque chemin).
--- Accès : extension `editor_dynamicDecalsTool` : `extensions.load("editor_dynamicDecalsTool")`, puis la globale `editor_dynamicDecalsTool`
---@class editor_dynamicDecalsTool
---@field dependencies string[] Liste des extensions chargées avant ce module.
---@field directoryPath string Dossier des données : "/art/dynamicDecals/".
---@field doApiUpdate boolean Si true (défaut), l'outil appelle la mise à jour de l'API chaque frame ; modifiable par une case de debug.
---@field toolMode integer Mode courant (decal par défaut).
---@field toolModes table<string, integer> none=0, decal=1, brushStroke=2, path=3.
---@field version integer[] Version {1,1,0} de l'outil.
editor_dynamicDecalsTool = {}

--- Interface publique du pinceau : pose un décalque, un point de chemin, un trait de pinceau ou un décalque de masque selon le mode courant.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:883
---@param value integer 1 à l'appui, autre (0) au relâchement
function editor_dynamicDecalsTool.applyDecal(value) end

--- Fait tourner le décalque courant.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:910
---@param clockwise boolean Sens horaire
---@param mod number|nil Multiplicateur du pas (défaut 1)
function editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod) end

--- Agrandit ou réduit le décalque courant.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:909
---@param increase boolean true pour agrandir
---@param mod number|nil Multiplicateur du pas (défaut 1)
function editor_dynamicDecalsTool.changeDecalSize(increase, mod) end

--- Hook de l'API appelé quand un calque est déplacé : rafraîchit le calque parent de destination s'il est sélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:939
---@param from integer Position d'origine
---@param fromParentUid any Parent d'origine
---@param to integer Position de destination
---@param toParentUid any Parent de destination
function editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid) end

--- Hook de l'API : quand un calque est modifié, recopie ses données dans la sélection de l'inspecteur s'il y est affiché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:930
---@param layerUid string|integer Identifiant du calque modifié (type déduit du code)
function editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid) end

--- Active/désactive le trait de pinceau ; à la désactivation, ajoute un calque de trait (api.addBrushStrokeLayer).
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:955
---@param value integer 1 pour activer
function editor_dynamicDecalsTool.enableBrushStroke(value) end

--- Active/désactive le mode calque chemin.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:963
---@param value integer 1 pour activer
function editor_dynamicDecalsTool.enablePathLayer(value) end

--- Termine le calque chemin en cours.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:967
function editor_dynamicDecalsTool.finishPathLayer() end

--- Uid du calque dont le masque est édité, ou nil.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:997
---@return any|nil
function editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid() end

--- Taille d'icône (entier, 20 par défaut).
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:981
---@return number
function editor_dynamicDecalsTool.getIconSize() end

--- Taille d'icône sous forme d'ImVec2.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:985
---@return ImVec2
function editor_dynamicDecalsTool.getIconSizeVec2() end

--- Défilement vertical courant de la fenêtre principale.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:989
---@return number
function editor_dynamicDecalsTool.getMainScrollY() end

--- État ouvert d'une section (ou de « Advanced »).
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:827
---@param name string Nom de la section
---@return boolean|nil  nil si la section est inconnue
function editor_dynamicDecalsTool.getSectionOpenState(name) end

--- Nom de la fenêtre imgui d'une section : « Dynamic Decals Tool - <section.windowName> ».
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:146
---@param section table Section avec windowName
---@return string
function editor_dynamicDecalsTool.getSectionWindowName(section) end

--- Verrouille ou libère la profondeur de projection du décalque.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:947
---@param value integer 1 pour verrouiller
function editor_dynamicDecalsTool.lockDepth(value) end

--- Verrouille ou libère la normale de surface utilisée pour la projection.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:951
---@param value integer 1 pour verrouiller
function editor_dynamicDecalsTool.lockSurfaceNormal(value) end

--- Hook de désérialisation : ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:864
---@param data table Données
function editor_dynamicDecalsTool.onDeserialized(data) end

--- Hook de sérialisation du rechargement Lua : renvoie une table vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:859
---@return table  {}
function editor_dynamicDecalsTool.onSerialize() end

--- Hook appelé au changement de véhicule : met à jour les matériaux (settings.updateMaterials).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:975
function editor_dynamicDecalsTool.onVehicleSwitched() end

--- Rétablit l'action annulée et rafraîchit les calques sélectionnés.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:921
function editor_dynamicDecalsTool.redo() end

--- Enregistre une fonction de mise à jour appelée chaque frame par l'outil (clé = name).
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:780
---@param name string Clé unique
---@param onUpdateFn function Appelée avec (dtReal, dtSim, dtRaw)
function editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn) end

--- Enregistre une fonction de dessin supplémentaire exécutée avec l'interface de l'éditeur.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:848
---@param name string Clé unique
---@param guiFn function Fonction de dessin
function editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn) end

--- Enregistre une section de l'interface (et éventuellement une fenêtre dédiée). Les sections sont triées par order ; celles >= 1000 vont dans « Advanced ».
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:801
---@param name string Nom de la section
---@param guiFn function Fonction de dessin, appelée avec un guiId (dans la section comme dans la fenêtre)
---@param order number|nil Position (plus petit = plus haut), défaut 1000
---@param defaultOpen boolean|nil Ouverte par défaut
---@param window table|nil {windowSize = ImVec2} pour créer une fenêtre dédiée avec bouton d'ouverture
---@param buttons table|nil Boutons d'en-tête {icon, tooltip, fn}
function editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons) end

--- Ajoute un élément à la barre d'outils (partie actions), trié par order.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:843
---@param name string
---@param guiFn function Fonction de dessin
---@param order number|nil Défaut 1000
function editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order) end

--- Ajoute un élément à la barre d'outils (partie outils), trié par order.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:838
---@param name string
---@param guiFn function Fonction de dessin
---@param order number|nil Défaut 1000
function editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order) end

--- Supprime le dernier point du chemin en cours.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:971
function editor_dynamicDecalsTool.removeLastPathLayerPoint() end

--- Définit le calque dont le masque est en cours d'édition (nil pour quitter ce mode).
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:993
---@param uid any|nil Uid du calque
function editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid) end

--- Ouvre ou ferme une section par son nom (ouvrir une section avancée ouvre aussi « Advanced »).
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:805
---@param name string Nom de la section
---@param newState boolean Ouvert ou fermé
---@param setScroll boolean|nil Fait défiler jusqu'à la section
function editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll) end

--- Annule la dernière action de l'API dynamicDecals, puis rafraîchit les calques sélectionnés dans editor.selection.dynamicDecalLayer.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:912
function editor_dynamicDecalsTool.undo() end

--- Retire une fonction de mise à jour enregistrée.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:784
---@param name string Clé
function editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name) end

--- Retire une fonction de dessin enregistrée.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:852
---@param name string Clé
function editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name) end

