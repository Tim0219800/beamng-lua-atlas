---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/browser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Dynamic Decals Tool - Browser » de l'outil de livrées dynamiques de l'éditeur : un point central à onglets (Textures, Brushes, Fonts…) où d'autres modules enregistrent leur contenu avec registerBrowserTab. Les assets se glissent-déposent vers les widgets du système de decals. Le module est initialisé par l'outil principal via setup(tool).
--- Accès : extension `editor_dynamicDecals_browser` : `extensions.load("editor_dynamicDecals_browser")`, puis la globale `editor_dynamicDecals_browser`
---@class editor_dynamicDecals_browser
editor_dynamicDecals_browser = {}

--- Hook appelé quand une préférence change : ne fait rien actuellement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:43
---@param path string chemin de la préférence
---@param value any nouvelle valeur
function editor_dynamicDecals_browser.editorPreferenceValueChanged(path, value) end

--- Masque la fenêtre du navigateur.
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:80
function editor_dynamicDecals_browser.hideWindow() end

--- Indique si la fenêtre est visible.
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:84
---@return boolean  visibilité
function editor_dynamicDecals_browser.isWindowVisible() end

--- Dessine la fenêtre et sa barre d'onglets en appelant le guiFn de chaque onglet. Enregistrée par setup() comme callback d'éditeur « browser ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:20
function editor_dynamicDecals_browser.onGui() end

--- Ajoute un onglet au navigateur et retrie la liste par ordre.
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:71
---@param name string titre de l'onglet
---@param guiFn function fonction ImGui dessinant le contenu de l'onglet
---@param order number|nil rang de tri, 1000 par défaut
function editor_dynamicDecals_browser.registerBrowserTab(name, guiFn, order) end

--- Hook de préférences de l'éditeur : ne fait rien actuellement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:37
---@param prefsRegistry table registre de préférences
function editor_dynamicDecals_browser.registerEditorPreferences(prefsRegistry) end

--- Initialise le module : récupère les extensions editor_api_dynamicDecals, editor_dynamicDecals_textures et editor_dynamicDecals_docs, enregistre la fenêtre (800x400), le callback d'interface « browser » et la page de documentation « Browser ».
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:60
---@param tool_in table outil de decals dynamiques (fournit registerOnEditorGuiFn)
function editor_dynamicDecals_browser.setup(tool_in) end

--- Affiche la fenêtre du navigateur.
---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:76
function editor_dynamicDecals_browser.showWindow() end

