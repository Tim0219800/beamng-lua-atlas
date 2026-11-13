---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Settings » (ordre 1040) de l'outil Dynamic Decals. Permet d'activer/désactiver l'API de decals, de choisir la position du curseur (UV) ou la souris, la couche UV (0 ou 1), les matériaux et les meshes du véhicule joueur qui reçoivent les decals, et la résolution des textures. Maintient la table nom de matériau <-> indice utilisée par les autres modules.
--- Accès : extension `editor_dynamicDecals_settings` : `extensions.load("editor_dynamicDecals_settings")`, puis la globale `editor_dynamicDecals_settings`
---@class editor_dynamicDecals_settings
editor_dynamicDecals_settings = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/settings.lua:204
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_settings.editorPreferenceValueChanged(path, value) end

--- Renvoie les noms des matériaux actuellement activés (indices d'api.getMaterialIndices()).
---Source : lua/ge/extensions/editor/dynamicDecals/settings.lua:246
---@return string[]  Liste de noms de matériaux.
function editor_dynamicDecals_settings.getUsedMaterialNames() end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/settings.lua:198
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_settings.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : prépare les listes (couches UV, résolutions), initialise les indices de résolution depuis l'API si elle est prête, met à jour les matériaux, lance le job de lecture des meshes et enregistre la section « Settings ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/settings.lua:213
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_settings.setup(tool_in) end

--- Relit api.getShapeMaterialNames() pour le véhicule joueur et reconstruit les tables nom->indice et indice->nom.
---Source : lua/ge/extensions/editor/dynamicDecals/settings.lua:28
function editor_dynamicDecals_settings.updateMaterials() end

