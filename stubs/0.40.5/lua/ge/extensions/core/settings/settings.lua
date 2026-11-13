---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension centrale des réglages du jeu côté GE. Elle tient la table des valeurs courantes (initialisée depuis les valeurs par défaut du module common settings), applique chaque changement via des « option helpers » (setters Lua ou propagation vers CppSettings), enregistre sur disque avec un délai (local, cloud, persona), notifie l'UI (guihooks SettingsChanged) et les extensions (hook onSettingsChanged), gère les langues, et charge ou décharge des extensions selon certains réglages (ui_extApp, core_couplerCameraModifier, mcp_server, workbench_webSocketHandler). C'est le point d'entrée pour lire ou modifier un réglage depuis un mod.
--- Accès : extension `core_settings_settings` : `extensions.load("core_settings_settings")`, puis la globale `core_settings_settings`
---@class core_settings_settings
---@field impl table Module common 'settings' : valeurs par défaut (defaultValues, defaults), chemins de fichiers, cache et valeurs par persona (getPersonaValue, invalidateCache…).
---@field settingsTick function Hook de boucle appelé par le moteur à chaque image (dtReal, dtSim, dtRaw). Vaut nop au repos ; requestSave y met une fonction qui décompte 0.5 s puis sauvegarde.
core_settings_settings = {}

--- Appelé à la fermeture : sauvegarde immédiatement et supprime le fichier des valeurs persona.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/settings.lua:579
function core_settings_settings.exit() end

--- Fin d'initialisation appelée par le moteur : load(true), onFirstUpdateSettings des modules graphic et audio, chargement des réglages de plateforme (PlatformSwitches.settingsJsonPath, déprécié), autorise les sauvegardes, charge telemetry_core.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/settings.lua:539
function core_settings_settings.finalizeInit() end

--- Lit la valeur courante d'un réglage, ou defaultValue si nil. Avec multiseat actif, la valeur peut être surchargée par le persona.
---Source : lua/ge/extensions/core/settings/settings.lua:416
---@param key string Nom du réglage.
---@param defaultValue any Valeur de repli si le réglage est nil.
---@param persona string|table|nil Persona (ignoré si multiseat n'est pas actif).
---@return any  Valeur du réglage.
function core_settings_settings.getValue(key, defaultValue, persona) end

--- Renvoie une copie profonde de toutes les valeurs courantes.
---Source : lua/ge/extensions/core/settings/settings.lua:575
---@return table<string, any>  Copie des réglages.
function core_settings_settings.getValuesCopy() end

--- Initialisation : construit les dictionnaires clés/valeurs des options, charge core_settings_graphic, core_settings_audio et core_settings_multiplayer et fusionne leurs buildOptionHelpers, ajoute un setter propageant vers CppSettings pour chaque réglage connu du C++ (type vérifié), puis lit le fichier de réglages et appelle core_settings_graphic.onInitSettings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/settings.lua:479
---@param reason string|nil Raison de l'init ; 'reload' pour un rechargement de Lua (sinon les valeurs persona sont effacées).
function core_settings_settings.initSettings(reason) end

--- Recharge les réglages depuis les fichiers : monte translations.zip si présent, fusionne les valeurs lues avec les courantes, applique via setState puis core_settings_graphic.load. Journalise la dernière erreur CppSettings si elle existe. Pendant ce temps, les sauvegardes sont bloquées.
---Source : lua/ge/extensions/core/settings/settings.lua:454
---@param ignoreCache boolean|nil Force l'application de toutes les valeurs.
function core_settings_settings.load(ignoreCache) end

--- Charge un JSON de réglages spécifiques à la plateforme et les applique avec setState. Journalise une erreur si le fichier est illisible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/settings.lua:527
---@param platformSettingsPath string|nil Chemin du JSON ; ignoré si nil ou vide.
function core_settings_settings.loadPlatformSettings(platformSettingsPath) end

--- Envoie à l'UI l'évènement guihooks 'SettingsChanged' avec {values, options}.
---Source : lua/ge/extensions/core/settings/settings.lua:57
function core_settings_settings.notifyUI() end

--- Hook de surveillance de fichiers : si les fichiers de réglages local ou cloud ont changé de l'extérieur (et plus de 5 s après la dernière sauvegarde), recharge via load(false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/settings.lua:558
---@param files table[] Liste d'entrées avec un champ filename.
function core_settings_settings.onFilesChanged(files) end

--- Hook premier update. Si communityTranslations vaut 'enable' et que le jeu a été mis à jour depuis une version 0.x avec x < 39, appelle updateTranslations() (défini dans ge/main.lua).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/settings.lua:589
function core_settings_settings.onFirstUpdate() end

--- Recopie dans la table des valeurs le résultat des get() des options (si withValue) et recalcule les modes (getModes) des options qui en ont. Nom hérité de TorqueScript.
---Source : lua/ge/extensions/core/settings/settings.lua:116
---@param withValue boolean Si vrai, relit aussi les valeurs via get().
function core_settings_settings.refreshTSState(withValue) end

--- Programme une sauvegarde différée des réglages (0.5 s) via settingsTick.
---Source : lua/ge/extensions/core/settings/settings.lua:317
function core_settings_settings.requestSave() end

--- Alias de notifyUI (rétrocompatibilité).
---Source : lua/ge/extensions/core/settings/settings.lua:57
function core_settings_settings.requestState() end

--- Remet un réglage à sa valeur par défaut (M.impl.defaultValues) via setValue, si une valeur par défaut existe.
---Source : lua/ge/extensions/core/settings/settings.lua:410
---@param key string Nom du réglage.
function core_settings_settings.resetSettingToDefault(key) end

--- Alias de requestSave : sauvegarde différée, pas immédiate.
---Source : lua/ge/extensions/core/settings/settings.lua:317
function core_settings_settings.save() end

--- Applique une table de réglages : groupes de qualité graphique d'abord, puis le reste par ordre alphabétique, via setValue. Si quelque chose a changé (ou ignoreCache), relit l'état, sauvegarde, et réconcilie les extensions dépendantes (ui_extApp selon externalUI2, core_couplerCameraModifier selon couplerCameraModifier, mcp_server selon enableMcp, workbench_webSocketHandler selon workbenchMobile) puis les langues. Les clés non string sont ignorées avec un avertissement.
---Source : lua/ge/extensions/core/settings/settings.lua:212
---@param newState table<string, any>|nil Réglages à appliquer ; nil = rien.
---@param ignoreCache boolean|nil Si vrai, applique même les valeurs inchangées.
function core_settings_settings.setState(newState, ignoreCache) end

--- Change un réglage : met à jour la valeur, appelle le setter de l'option, et programme la sauvegarde. Avec un persona (et multiseat actif) et une clé spécifique aux personas, écrit dans le fichier persona au lieu des réglages globaux.
---Source : lua/ge/extensions/core/settings/settings.lua:357
---@param key string Nom du réglage.
---@param value any Nouvelle valeur.
---@param ignoreCache boolean|nil Applique même si la valeur est identique. Si une valeur non booléenne est passée ici sans persona, elle est interprétée comme persona.
---@param persona string|table|nil Identifiant de persona, ou table avec un champ id.
---@return boolean|nil  true si l'état a changé ; false si rien ou persona invalide ; nil si appel récursif sur la même clé.
function core_settings_settings.setValue(key, value, ignoreCache, persona) end

