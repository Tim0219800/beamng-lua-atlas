---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orchestrateur de la session du mode photo. Il ouvre et ferme la session : pause de la simulation (demande de pause « ui_pause_photomode »), vue solo en écran partagé, capture puis restauration des états caméra / scène / effets / rendu avancé / node grabber, caméra libre de session, drapeau global photoModeOpen. Il gère aussi les profils de route (pause, garage), la session persistante (réglage photomodePersistentSession), le mode de surface du panneau, la confirmation de sortie et la charge utile (route payload) envoyée à l'interface Vue.
--- Accès : extension `ui_photomode_session` : `extensions.load("ui_photomode_session")`, puis la globale `ui_photomode_session`
---@class ui_photomode_session
---@field dependencies table<integer, string> Extensions chargées avant : ui_photomode_shared, _camera, _scene, _flash, _effects, _advancedRender, _capture, _presets, core_settings_graphic.
ui_photomode_session = {}

--- Démarre la session du mode photo (pause, caméra libre, états de restauration, suppressions du monde). Ignorée si une session est déjà active.
---Source : lua/ge/extensions/ui/photomode/session.lua:540
---@param options table|nil options.profile : "pause" (défaut) ou "garage".
---@return boolean  true si la session a démarré, false si elle était déjà active.
function ui_photomode_session.beginPhotomodeSession(options) end

--- Calcule les capacités affichées par l'interface : profil actif, contrôles masqués, sections, features (upload, steam, openShareUrl, overlays, resolutionPresets, motionBlurCapture, advancedRenderTuning, developerTools…), build (shipping/developer) et état du rendu avancé. Les features du profil actif prévalent.
---Source : lua/ge/extensions/ui/photomode/session.lua:271
---@return table  Table de capacités.
function ui_photomode_session.buildCapabilities() end

--- Annule la sortie en attente (bouton « retour » du dialogue) et réactive l'entrée caméra cachée si elle l'était.
---Source : lua/ge/extensions/ui/photomode/session.lua:484
function ui_photomode_session.cancelExitConfirmation() end

--- Confirme la sortie : active le contournement de confirmation puis navigue vers la route mémorisée avec extensions.ui_router.navigate.
---Source : lua/ge/extensions/ui/photomode/session.lua:495
---@return boolean|any  false si aucune navigation en attente, sinon le résultat de ui_router.navigate.
function ui_photomode_session.confirmExit() end

--- Lit et consomme le drapeau de contournement de la confirmation de sortie (utilisé par la garde de route du mode photo).
---Source : lua/ge/extensions/ui/photomode/session.lua:434
---@return boolean  true si le contournement était armé (il est alors désarmé).
function ui_photomode_session.consumeExitConfirmationBypass() end

--- Termine la session : termine la capture en cours, sauvegarde l'état persistant si activé, restaure scène, effets, rendu avancé, caméra, node grabber, vue solo, suppressions et pause, puis réinitialise les presets temporaires. Ne fait rien si tout est déjà inactif.
---Source : lua/ge/extensions/ui/photomode/session.lua:578
---@return boolean  true si une fermeture a été faite, false si la session était déjà inactive.
function ui_photomode_session.endPhotomodeSession() end

--- Renvoie le mode de surface du panneau, "hidden" ou "settings" ("hidden" si la valeur stockée est invalide).
---Source : lua/ge/extensions/ui/photomode/session.lua:415
---@return string  "hidden" ou "settings".
function ui_photomode_session.getPanelSurfaceMode() end

--- Construit la charge utile envoyée à l'interface : contractVersion, sessionActive, capabilities, capture, persistentSession, panelSurfaceMode, mediaActions, resolutionPresets, suppressions.
---Source : lua/ge/extensions/ui/photomode/session.lua:362
---@return table  Charge utile de route du mode photo.
function ui_photomode_session.getRoutePayload() end

--- Appelée au chargement de l'extension : efface les bookmarks (caméra, caméra relative, environnement, rendu avancé) et réinitialise l'état local de session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/session.lua:625
function ui_photomode_session.handleExtensionLoaded() end

--- Appelée au déchargement de l'extension : termine la session, efface les bookmarks et réinitialise l'état local.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/session.lua:633
function ui_photomode_session.handleExtensionUnloaded() end

--- Indique si une capture est en cours (délègue à ui_photomode_capture).
---Source : lua/ge/extensions/ui/photomode/session.lua:385
---@return boolean  true si une capture est en cours.
function ui_photomode_session.isCaptureInProgress() end

--- Renvoie la variable globale isDebugEnabled (voir bug dans les notes).
---Source : lua/ge/extensions/ui/photomode/session.lua:510
---@return boolean|nil  Valeur de la globale isDebugEnabled.
function ui_photomode_session.isDebugEnabled() end

--- Lit le réglage photomodePersistentSession (si activé, les réglages de la session sont mémorisés à la fermeture et réappliqués à la prochaine ouverture).
---Source : lua/ge/extensions/ui/photomode/session.lua:389
---@return boolean  true si la session persistante est activée.
function ui_photomode_session.isPersistentSessionEnabled() end

--- Indique si une session de mode photo est active.
---Source : lua/ge/extensions/ui/photomode/session.lua:381
---@return boolean  Valeur de S.sessionActive.
function ui_photomode_session.isPhotomodeSessionActive() end

--- Hook appelé à l'entrée dans une route du mode photo (routeName en argument) ; journalise seulement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/session.lua:532
---@param routeName string Nom de la route.
function ui_photomode_session.onPhotomodeRouteEnter(routeName) end

--- Hook appelé à la sortie d'une route du mode photo ; journalise seulement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/session.lua:536
---@param routeName string Nom de la route.
function ui_photomode_session.onPhotomodeRouteLeave(routeName) end

--- Mémorise la navigation de sortie demandée et affiche un dialogue de confirmation (texte différent si la session persistante est activée). Ne fait rien de plus si une confirmation est déjà en attente.
---Source : lua/ge/extensions/ui/photomode/session.lua:442
---@param route table|any Route visée (utilise route.name si context.routeName est absent).
---@param params any Paramètres de la route à mémoriser.
---@param context table|nil {routeName?, options?} .
---@return boolean  false si aucun nom de route valide, sinon true.
function ui_photomode_session.requestExitConfirmation(route, params, context) end

--- Définit la globale isDebugEnabled, propage le réglage à l'API screenshot (setDebugTracingEnabled) et journalise.
---Source : lua/ge/extensions/ui/photomode/session.lua:514
---@param value any Activé uniquement si value == true.
function ui_photomode_session.setDebugEnabled(value) end

--- Active ou désactive les entrées de la caméra photo cachée en empilant/dépilant l'action map "PhotoModeCamera". Sans effet si l'état ne change pas.
---Source : lua/ge/extensions/ui/photomode/session.lua:97
---@param enabled boolean Activé uniquement si enabled == true.
---@return boolean  Toujours true.
function ui_photomode_session.setHiddenCameraInputEnabled(enabled) end

--- Change le mode de surface du panneau ; refuse les valeurs autres que "hidden" et "settings".
---Source : lua/ge/extensions/ui/photomode/session.lua:420
---@param mode string "hidden" ou "settings".
---@return table  {ok=boolean, mode=string}.
function ui_photomode_session.setPanelSurfaceMode(mode) end

--- Écrit le réglage de session persistante ; à la désactivation, efface l'état persistant mémorisé, puis notifie l'interface des réglages.
---Source : lua/ge/extensions/ui/photomode/session.lua:396
---@param value boolean|any Nouvelle valeur (normalisée en booléen).
---@return table  {ok=boolean, enabled=boolean}.
function ui_photomode_session.setPersistentSessionEnabled(value) end

--- Journalise un message de debug de capture : « scope » suivi du payload sérialisé (JSON).
---Source : lua/ge/extensions/ui/photomode/session.lua:523
---@param scope string|nil Libellé ("capture" par défaut).
---@param payload any Données à ajouter.
function ui_photomode_session.traceCaptureDebug(scope, payload) end

