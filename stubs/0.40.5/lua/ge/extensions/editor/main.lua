---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cœur du World Editor : définit la globale `editor` (editor = M). Il charge toutes les extensions de lua/ge/extensions/editor/ (celles qui contiennent « M.onEditor » ou « M.onExtension », sauf editor_main), initialise les modules editor/api/*, gère les préférences (settings/editor/preferences.json), l'état (settings/editor/currentState.json) et l'activation/désactivation de l'éditeur (caméra libre, action maps, CEF masqué, layout, audio). Les autres extensions d'éditeur ajoutent leurs fonctions à la table `editor`.
--- Accès : extension `editor_main` : `extensions.load("editor_main")`, puis la globale `editor_main`
---@class editor_main
---@field active boolean Vrai quand l'éditeur est actif (ouvert).
---@field additionalActionMaps table Action maps supplémentaires empilées à l'activation et dépilées à la désactivation de l'éditeur.
---@field allExtensionNames table<integer, string> Noms courts de toutes les extensions d'éditeur trouvées sur disque.
---@field dependencies table<integer, string> {"core_camera"}.
---@field extensionNames table<integer, string> Noms (editor_xxx) des extensions d'éditeur actuellement chargées.
---@field initialized boolean Vrai quand les extensions d'éditeur sont chargées et initialisées.
---@field preferencesRegistry any Registre des préférences (editor/api/preferencesRegistry).
---@field safeMode boolean|nil Vrai si l'éditeur a été lancé en mode sans échec.
editor_main = {}

--- Charge et initialise les modules editor/api/* (gui, core, assets, camera, dataBlock, decal, gizmo, material, navigation, object, roadRiver, sketch, terrain, forest, proceduralContentGenerator), puis émet onEditorModulesInitialized. Sans effet si déjà fait.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:294
function editor_main.initializeModules() end

--- Indique si l'éditeur est actif.
---Source : lua/ge/extensions/editor/main.lua:594
---@return boolean  editor.active.
function editor_main.isEditorActive() end

--- Charge une extension d'éditeur à chaud : enregistre ses préférences, puis appelle ses onEditorRegisterApi, onEditorInitialized et onEditorActivated.
---Source : lua/ge/extensions/editor/main.lua:140
---@param name string Nom de l'extension, par ex. « editor_monOutil ».
---@return table|nil  La table de l'extension, ou nil si le chargement a échoué.
function editor_main.loadEditorExtension(name) end

--- Charge plusieurs extensions d'éditeur d'un coup (préférences enregistrées avant, puis hooks RegisterApi/Initialized/Activated pour chacune).
---Source : lua/ge/extensions/editor/main.lua:171
---@param names table<integer, string> Noms des extensions.
function editor_main.loadEditorExtensions(names) end

--- Lit settings/editor/extensions.json dans editor.extensionsSettings (table vide si absent).
---Source : lua/ge/extensions/editor/main.lua:85
function editor_main.loadExtensionsSettings() end

--- Recharge les préférences depuis settings/editor/preferences.json, définit editor.setPreference/getPreference et migre les anciennes préférences.
---Source : lua/ge/extensions/editor/main.lua:74
function editor_main.loadPreferences() end

--- Lit le fichier d'état de l'éditeur (avertit si la version du format diffère).
---Source : lua/ge/extensions/editor/main.lua:368
---@param filePath string|nil Fichier source ; settings/editor/currentState.json par défaut.
---@return table  L'état lu, ou une table vide.
function editor_main.loadState(filePath) end

--- Écrit un message de niveau Info dans le log, tag « editor ».
---Source : lua/ge/extensions/editor/main.lua:50
---@param msg string Message.
function editor_main.log(msg) end

--- Message de niveau Debug, tag « editor ».
---Source : lua/ge/extensions/editor/main.lua:54
---@param msg string Message.
function editor_main.logDebug(msg) end

--- Message de niveau Error, tag « editor ».
---Source : lua/ge/extensions/editor/main.lua:58
---@param msg string Message.
function editor_main.logError(msg) end

--- Alias de log (niveau Info, tag « editor »).
---Source : lua/ge/extensions/editor/main.lua:50
---@param msg string Message.
function editor_main.logInfo(msg) end

--- Message de niveau Warning, tag « editor ».
---Source : lua/ge/extensions/editor/main.lua:62
---@param msg string Message.
function editor_main.logWarn(msg) end

--- Appelé à la fin d'un niveau : sauvegarde l'état, réaffiche les apps (ShowApps), propose de sauvegarder si modifié, puis shutdown().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:623
function editor_main.onClientEndMission() end

--- Appelé au démarrage d'un niveau : remet initialized et modulesInitialized à false et réapplique l'état actif courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:608
function editor_main.onClientStartMission() end

--- Appelé après un rechargement Lua : restaure active/dirty/headless/mode d'édition et expose les données dans editor_main.serializedData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:733
---@param data table Table renvoyée par onSerialize.
function editor_main.onDeserialized(data) end

--- Appelé à la sortie du jeu : met editor.active à false et sauvegarde l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:678
function editor_main.onExit() end

--- Hook de chargement. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:683
function editor_main.onExtensionLoaded() end

--- Appelé au déchargement : editor.shutdown().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:686
function editor_main.onExtensionUnloaded() end

--- Appelé à la première mise à jour : réactive l'éditeur s'il l'était avant le rechargement, et l'ouvre automatiquement si le jeu a été lancé avec -worldEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:747
function editor_main.onFirstUpdate() end

--- Appelé avant la sortie du jeu. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:620
function editor_main.onPreExit() end

--- Appelé avant la fermeture de la fenêtre du jeu : editor.checkDirtyAndSave() si disponible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:614
function editor_main.onPreWindowClose() end

--- Appelé avant un rechargement Lua : sauvegarde caméra, état actif, dirty, headless, mode d'édition, positions des fenêtres et préférence cleanExit ; désactive l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:690
---@return table  Données restituées à onDeserialized.
function editor_main.onSerialize() end

--- Appelé chaque frame : traite la requête d'activation/désactivation (affiche l'image de chargement editorSplash.png pendant 3 frames, puis applique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/main.lua:634
function editor_main.onUpdate() end

--- Écrit editor.extensionsSettings dans settings/editor/extensions.json.
---Source : lua/ge/extensions/editor/main.lua:89
function editor_main.saveExtensionsSettings() end

--- Écrit les préférences dans settings/editor/preferences.json.
---Source : lua/ge/extensions/editor/main.lua:81
function editor_main.savePreferences() end

--- Sauvegarde l'état de l'éditeur : émet onEditorSaveState(state) puis écrit le JSON. Sans effet si l'éditeur n'a pas été initialisé dans cette session.
---Source : lua/ge/extensions/editor/main.lua:356
---@param filePath string|nil Fichier cible ; settings/editor/currentState.json par défaut.
function editor_main.saveState(filePath) end

--- Demande l'activation ou la désactivation de l'éditeur ; appliquée dans onUpdate après quelques frames de splash.
---Source : lua/ge/extensions/editor/main.lua:587
---@param activate boolean true pour ouvrir, false pour fermer.
---@param safeMode boolean|nil true pour démarrer en mode sans échec.
function editor_main.setEditorActive(activate, safeMode) end

--- Ferme l'éditeur, émet onEditorShutdown, décharge toutes les extensions d'éditeur et remet initialized/active à false.
---Source : lua/ge/extensions/editor/main.lua:598
function editor_main.shutdown() end

--- Inverse l'état actif de l'éditeur (via setEditorActive).
---Source : lua/ge/extensions/editor/main.lua:674
---@param safeMode boolean|nil Mode sans échec à l'ouverture.
function editor_main.toggleActive(safeMode) end

--- Décharge une extension d'éditeur chargée : appelle son onEditorDeactivated puis onEditorShutdown, puis extensions.unload.
---Source : lua/ge/extensions/editor/main.lua:213
---@param extName string Nom de l'extension chargée.
function editor_main.unloadEditorExtension(extName) end

---@type any
editor = nil
