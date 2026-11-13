---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Catalogue des apps d'interface (Vue/JS) installées. getUIAppsData parcourt /ui/modules/apps/ à la recherche de app.json, de app.vue et des variantes app.<directive>.vue, et construit une table indexée par nom d'app (types traduits, aperçus, fichiers vue/js, indicateurs interactive/essential/photomode…). Le module surveille aussi /settings/ui_apps/ et prévient l'interface quand un layout change.
--- Accès : extension `ui_apps` : `extensions.load("ui_apps")`, puis la globale `ui_apps`
---@class ui_apps
ui_apps = {}

--- Construit et renvoie le catalogue des apps disponibles, indexé par appName.
---Source : lua/ge/extensions/ui/apps.lua:214
---@return table<string, table>  Données de chaque app (appName, directive, types, typesTranslated, folder, vueFile, hasAppVue, hasAppJs, interactive, essential, isAuxiliary, photomode, official, previews…).
function ui_apps.getUIAppsData() end

--- Envoie l'événement UI 'UiAppLayoutsChanged' pour que l'interface relise les layouts.
---Source : lua/ge/extensions/ui/apps.lua:222
function ui_apps.notifyLayoutsChanged() end

--- Hook appelé quand des fichiers changent : si un fichier est sous /settings/ui_apps/, programme un rafraîchissement des layouts 0,2 s plus tard.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps.lua:228
---@param files table<integer, table> Liste d'entrées avec un champ filename.
function ui_apps.onFilesChanged(files) end

--- Hook de frame : déclenche notifyLayoutsChanged quand le délai programmé par onFilesChanged est écoulé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps.lua:238
function ui_apps.onUpdate() end

