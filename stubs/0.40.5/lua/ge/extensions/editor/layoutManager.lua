---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/layoutManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des dispositions (layouts) de fenêtres de l'éditeur. Chaque layout est un dossier settings/<outil>/layouts/<nom>/ contenant windowsState.json ; le layout courant est settings/<outil>/windowsState.json. Les positions ImGui sont lues/écrites dans settings/imgui.ini (ou settings/default_imgui.ini pour le layout Default). L'outil vaut « editor » par défaut.
--- Accès : extension `editor_layoutManager` : `extensions.load("editor_layoutManager")`, puis la globale `editor_layoutManager`
---@class editor_layoutManager
editor_layoutManager = {}

--- Supprime tous les fichiers d'un dossier de layout puis le dossier lui-même.
---Source : lua/ge/extensions/editor/layoutManager.lua:55
---@param layoutPath string Chemin du dossier de layout à supprimer.
function editor_layoutManager.deleteWindowLayout(layoutPath) end

--- Liste les dossiers de layouts de settings/<outil>/layouts/.
---Source : lua/ge/extensions/editor/layoutManager.lua:14
---@param toolName string|nil Nom de l'outil ; « editor » si nil.
---@return table<integer, string>  Chemins des dossiers de layouts (FS:directoryList).
function editor_layoutManager.getWindowLayouts(toolName) end

--- Charge l'état courant des fenêtres (settings/<outil>/windowsState.json). Si editor.needsDefaultImguiIniLoad est vrai, charge default_imgui.ini une fois, sinon imgui.ini.
---Source : lua/ge/extensions/editor/layoutManager.lua:37
---@param toolName string|nil Nom de l'outil ; « editor » si nil.
function editor_layoutManager.loadCurrentWindowLayout(toolName) end

--- Charge windowsState.json d'un layout et recharge imgui.ini : default_imgui.ini si le layout est Default, sinon imgui.ini.
---Source : lua/ge/extensions/editor/layoutManager.lua:18
---@param layout string|nil Dossier du layout ; settings/editor/layouts/Default si nil.
---@param toolName string|nil Nom de l'outil passé à editor.loadWindowsState.
function editor_layoutManager.loadWindowLayout(layout, toolName) end

--- Supprime tous les layouts personnalisés (tout sauf Default) de settings/<outil>/layouts puis charge le layout Default.
---Source : lua/ge/extensions/editor/layoutManager.lua:63
---@param toolName string|nil Nom de l'outil ; « editor » si nil.
function editor_layoutManager.resetLayouts(toolName) end

--- Enregistre l'état courant des fenêtres dans settings/<outil>/windowsState.json et sauvegarde imgui.ini.
---Source : lua/ge/extensions/editor/layoutManager.lua:50
---@param toolName string|nil Sert à construire le chemin, mais n'est pas transmis à editor.saveWindowsState.
function editor_layoutManager.saveCurrentWindowLayout(toolName) end

--- Enregistre l'état des fenêtres dans settings/<outil>/layouts/<layoutName>/windowsState.json et sauvegarde imgui.ini.
---Source : lua/ge/extensions/editor/layoutManager.lua:30
---@param layoutName string Nom du layout (nom du dossier).
---@param toolName string|nil Nom de l'outil ; « editor » si nil.
function editor_layoutManager.saveWindowLayout(layoutName, toolName) end

