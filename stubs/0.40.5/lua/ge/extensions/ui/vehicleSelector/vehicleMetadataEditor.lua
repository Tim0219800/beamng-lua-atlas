---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ébauche d'éditeur de métadonnées de véhicule pour le sélecteur. Le module est quasi vide : sa seule fonction renvoie des valeurs fixes. Sa référence dans les dépendances de ui_vehicleSelector_general est commentée.
--- Accès : extension `ui_vehicleSelector_vehicleMetadataEditor` : `extensions.load("ui_vehicleSelector_vehicleMetadataEditor")`, puis la globale `ui_vehicleSelector_vehicleMetadataEditor`
---@class ui_vehicleSelector_vehicleMetadataEditor
ui_vehicleSelector_vehicleMetadataEditor = {}

--- Renvoie des métadonnées factices de véhicule (nom, description, type), quel que soit l'argument.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua:4
---@param data any Ignoré.
---@return table  {name, description, type} avec des valeurs par défaut fixes.
function ui_vehicleSelector_vehicleMetadataEditor.getVehicleMetadataDetails(data) end

