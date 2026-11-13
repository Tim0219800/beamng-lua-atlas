---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/news.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Vehicle Livery Creator - News » (nom public de l'outil Dynamic Decals) : message de bienvenue, lien vers le fil du forum BeamNG et historique des versions (1.1.0, 1.0.1, 1.0.0, textes en dur). Elle s'ouvre automatiquement quand la version de l'outil (tool.version) dépasse celle stockée dans la préférence `dynamicDecalsTool.general.version`, ou tant que « do not show again » n'est pas coché.
--- Accès : extension `editor_dynamicDecals_news` : `extensions.load("editor_dynamicDecals_news")`, puis la globale `editor_dynamicDecals_news`
---@class editor_dynamicDecals_news
editor_dynamicDecals_news = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/news.lua:160
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_news.editorPreferenceValueChanged(path, value) end

--- Enregistre la préférence bool `dynamicDecalsTool.news.doNotShowAgain` (défaut false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/news.lua:154
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_news.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère helper, déclare la fenêtre éditeur (640x640) et enregistre le dessin de la fenêtre via tool.registerOnEditorGuiFn.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/news.lua:145
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_news.setup(tool_in) end

--- Ouvre la fenêtre de news.
---Source : lua/ge/extensions/editor/dynamicDecals/news.lua:164
function editor_dynamicDecals_news.showWindow() end

