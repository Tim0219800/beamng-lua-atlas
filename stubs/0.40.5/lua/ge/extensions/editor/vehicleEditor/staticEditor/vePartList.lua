---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Part List » du Static Editor de l'éditeur de véhicule. Elle liste les parties JBeam disponibles du véhicule chargé (ou seulement les parties actives, case « Active »), avec colonnes Name, Filename et Last modified, tri par colonne et recherche texte (nom ou fichier). Cliquer une ligne sélectionne la partie (vEditor.selectedPart) et ouvre les fenêtres Part Tree et Part Text View ; double-clic sur une colonne copie le nom de la partie ou le nom du fichier dans le presse-papiers ; clic droit ouvre le dossier du fichier.
--- Accès : extension `editor_vehicleEditor_staticEditor_vePartList` : `extensions.load("editor_vehicleEditor_staticEditor_vePartList")`, puis la globale `editor_vehicleEditor_staticEditor_vePartList`
---@class editor_vehicleEditor_staticEditor_vePartList
---@field menuEntry string Texte de l'entrée du menu Apps : « Part List ».
editor_vehicleEditor_staticEditor_vePartList = {}

--- Hook appelé après un rechargement Lua : restaure vEditor.selectedPart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:244
---@param data table table produite par onSerialize
function editor_vehicleEditor_staticEditor_vePartList.onDeserialized(data) end

--- Hook de l'éditeur appelé à chaque frame : construit la liste de parties au premier passage (ou après changement du filtre Active), puis dessine la fenêtre, le tableau trié/filtré et le menu contextuel. Ne fait rien sans véhicule chargé dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:52
function editor_vehicleEditor_staticEditor_vePartList.onEditorGui() end

--- Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:233
function editor_vehicleEditor_staticEditor_vePartList.onEditorInitialized() end

--- Hook appelé avant un rechargement Lua : sauvegarde la partie sélectionnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:238
---@return table  {selectedPart = string|nil}
function editor_vehicleEditor_staticEditor_vePartList.onSerialize() end

--- Affiche la fenêtre « Part List » (editor.showWindow).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:229
function editor_vehicleEditor_staticEditor_vePartList.open() end

