---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/options.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire côté GE pour la disposition (layout) du menu d'options Vue. Il lit quels fichiers layout.json / layout.dev.json existent dans le dossier utilisateur et peut sauvegarder un layout dans /ui/ui-vue/src/modules/options/runtime/ (donc dans le dossier utilisateur). Utile à un moddeur qui veut surcharger la structure du menu d'options.
--- Accès : extension `ui_options` : `extensions.load("ui_options")`, puis la globale `ui_options`
---@class ui_options
ui_options = {}

--- Liste ceux des fichiers layout.json et layout.dev.json dont le chemin réel se trouve sous le dossier utilisateur (FS:getUserPath).
---Source : lua/ge/extensions/ui/options.lua:16
---@return string[]  Noms de fichiers trouvés ; vide si le dossier utilisateur est inconnu.
function ui_options.getUserFolderLayouts() end

--- Écrit les données JSON dans layout[.key].json sous /ui/ui-vue/src/modules/options/runtime/ via writeFile.
---Source : lua/ge/extensions/ui/options.lua:30
---@param key string|nil Suffixe du fichier (slug sûr) ; nil ou vide pour layout.json.
---@param data string Contenu JSON déjà sérialisé.
---@return boolean  true si l'écriture a réussi, false si data n'est pas une chaîne, si la clé est invalide ou si l'écriture échoue.
function ui_options.saveLayout(key, data) end

