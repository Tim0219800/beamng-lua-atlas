---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/loadSave.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Load/Save » de l'outil Dynamic Decals. Permet d'enregistrer la pile de calques dans un fichier projet `.dyndecals.json` (« Save as... » / « Save ») et d'en charger un (« Load from file ») en mode Overwrite (remplace) ou Append (ajoute). Le dossier par défaut est /art/dynamicDecals/projects/. Le dernier chemin utilisé est conservé lors du rechargement des extensions (onSerialize / onDeserialized).
--- Accès : extension `editor_dynamicDecals_loadSave` : `extensions.load("editor_dynamicDecals_loadSave")`, puis la globale `editor_dynamicDecals_loadSave`
---@class editor_dynamicDecals_loadSave
editor_dynamicDecals_loadSave = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:88
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_loadSave.editorPreferenceValueChanged(path, value) end

--- Renvoie le chemin du dernier fichier projet utilisé (ou le dossier par défaut).
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:145
---@return string  Chemin du projet.
function editor_dynamicDecals_loadSave.getCurrentPorjectFilePath() end

--- Ouvre la boîte de dialogue de fichier (filtre .dyndecals.json) puis appelle api.loadLayerStackFromFile(chemin, mode) et mémorise le chemin.
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:22
function editor_dynamicDecals_loadSave.loadFileDialog() end

--- Hook appelé après rechargement avec les données de onSerialize ; restaure lastProjectFilePath (défaut : dossier des projets).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:141
---@param data table Table renvoyée par onSerialize.
function editor_dynamicDecals_loadSave.onDeserialized(data) end

--- Hook de rechargement des extensions : renvoie {lastProjectFilePath} à conserver.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:135
---@return table  Données à restaurer.
function editor_dynamicDecals_loadSave.onSerialize() end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:82
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_loadSave.registerEditorPreferences(prefsRegistry) end

--- Ouvre la boîte « Enregistrer sous » (confirmation d'écrasement) puis appelle api.saveLayerStackToFile et mémorise le chemin.
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:39
function editor_dynamicDecals_loadSave.saveAsFileDialog() end

--- Appelé par l'outil : récupère API, notification et docs, prépare la liste des modes de chargement, enregistre la section « Load/Save » (ordre 20) et la page de documentation « Save & Load ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/loadSave.lua:117
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_loadSave.setup(tool_in) end

