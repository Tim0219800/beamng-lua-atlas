---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/export.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Export » de l'outil Dynamic Decals. Deux blocs : « Export Skin » (nom du véhicule du joueur + nom de skin, appelle api.exportSkin pour générer textures, matériau et JBeam) et « Export Textures » (nom, dossier, par défaut /art/dynamicDecals/export/textures, puis api.exportTextures en PNG). Affiche les chemins de sortie et avertit si un fichier existe déjà.
--- Accès : extension `editor_dynamicDecals_export` : `extensions.load("editor_dynamicDecals_export")`, puis la globale `editor_dynamicDecals_export`
---@class editor_dynamicDecals_export
editor_dynamicDecals_export = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/export.lua:191
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_export.editorPreferenceValueChanged(path, value) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/export.lua:185
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_export.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère l'API et docs, prépare la liste des formats (dds, png) pour ImGui, calcule les chemins d'export, enregistre la section « Export » (ordre 25) et sa page de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/export.lua:196
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_export.setup(tool_in) end

