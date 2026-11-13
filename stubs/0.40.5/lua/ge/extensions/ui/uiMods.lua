---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiMods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournit à l'interface (Vue) la liste des mods d'UI, des apps UI et des listes d'images, et surveille les changements de fichiers pour prévenir l'UI en direct (rechargement à chaud). Il suit aussi des révisions de fichiers d'exécution (« runtime ») servis à l'UI pour le développement. onFilesChanged déclenche les évènements UiModsChanged, UiAppsChanged, UiImageListChanged et UiRuntimeFileChanged, et rappelle sendUIModules() quand /ui/modModules/ change.
--- Accès : extension `ui_uiMods` : `extensions.load("ui_uiMods")`, puis la globale `ui_uiMods`
---@class ui_uiMods
ui_uiMods = {}

--- Incrémente la révision d'un chemin pour forcer un rechargement manuel. Renvoie 0 si le service d'exécution n'est pas configuré ou si path n'est pas une chaîne.
---Source : lua/ge/extensions/ui/uiMods.lua:341
---@param path string Chemin du fichier.
---@return integer  Nouvelle révision.
function ui_uiMods.bumpUiRuntimeRevision(path) end

--- Liste les images d'un dossier (récursif), triées par nom, en associant l'image normale et sa variante _blur. Le dossier est ajouté à la surveillance.
---Source : lua/ge/extensions/ui/uiMods.lua:108
---@param path string Dossier virtuel du jeu ; les '\' sont normalisés en '/'.
---@return {normal: string|nil, blur: string|nil}[]  Entrées d'images ; {} si le chemin est vide.
function ui_uiMods.getImageList(path) end

--- Renvoie, depuis extensions.ui_apps.getUIAppsData(), une copie filtrée des métadonnées des apps UI (appName, directive, folder, appJsonPath, jsSource, vueFile, types, category, version, essential, devonly, official, preview = première prévisualisation, etc.). Table vide si ui_apps est indisponible.
---Source : lua/ge/extensions/ui/uiMods.lua:53
---@return table<string, table>  Apps par nom.
function ui_uiMods.getUiApps() end

--- Liste les fichiers d'exécution servis (sous les dossiers `includes`, de type suivi, et non intégrés au bundle sauf les styles).
---Source : lua/ge/extensions/ui/uiMods.lua:347
---@param withMtime boolean|nil Si true, ajoute `mtime` à chaque entrée (et mémorise les mtimes).
---@return {path: string, mtime: number|nil}[]  Fichiers servis ; {} si non configuré.
function ui_uiMods.getUiRuntimeFileList(withMtime) end

--- Renvoie la table chemin -> numéro de révision des fichiers d'exécution (référence directe, pas une copie).
---Source : lua/ge/extensions/ui/uiMods.lua:336
---@return table<string, integer>  Révisions.
function ui_uiMods.getUiRuntimeRevisions() end

--- Parcourt /ui/ui-vue/mods et regroupe les fichiers par mod (premier dossier sous mods/).
---Source : lua/ge/extensions/ui/uiMods.lua:31
---@return table<string, {path: string, files: string[]}>  Par nom de mod : dossier et chemins relatifs des fichiers.
function ui_uiMods.getVueMods() end

--- Hook appelé au chargement de l'extension : passe le mode de déchargement en « manual ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiMods.lua:7
function ui_uiMods.onExtensionLoaded() end

--- Hook appelé par le moteur quand des fichiers changent. Pour chaque fichier : appelle sendUIModules() pour /ui/modModules/, déclenche UiModsChanged pour /ui/ui-vue/mods/, UiAppsChanged (avec files et apps concernées) pour /ui/modules/apps/, UiImageListChanged pour les dossiers d'images surveillés, et UiRuntimeFileChanged {path, rev, change} pour les fichiers d'exécution servis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiMods.lua:274
---@param files table[] Liste d'objets {filename, type} (type « deleted » pour une suppression).
function ui_uiMods.onFilesChanged(files) end

--- Configure le service de fichiers d'exécution de l'UI : dossiers inclus, exclus, extensions suivies (statExts) et extensions de style (styleExts). Ignoré si cfg n'est pas une table ou si cfg.includes est vide.
---Source : lua/ge/extensions/ui/uiMods.lua:208
---@param cfg table { includes = string[], excludes = string[]|nil, statExts = string[]|nil, styleExts = string[]|nil }
function ui_uiMods.setUiRuntimeBundled(cfg) end

