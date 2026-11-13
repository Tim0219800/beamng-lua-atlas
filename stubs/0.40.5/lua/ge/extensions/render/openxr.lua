---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/openxr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interface Lua de la réalité virtuelle OpenXR (casque VR). Pilote le moteur C++ (objet global OpenXR) : activation/désactivation avec une boîte de dialogue de bienvenue, état de session reçu du moteur (stateChanged), recentrage, gestion des erreurs, et une fenêtre ImGui de debug (réglages d'affichage 2D, UI CEF dans le casque, ancrage, mode debug, résolutions, FOV, IPD). L'extension se décharge toute seule à la désactivation. Global : render_openxr.
--- Accès : extension `render_openxr` : `extensions.load("render_openxr")`, puis la globale `render_openxr`
---@class render_openxr
---@field cefDialogOpen boolean|nil true tant que la boîte de dialogue de bienvenue est ouverte.
---@field dependencies string[] {'core_camera'}
---@field state table État OpenXR reçu du moteur : systemName ('?' par défaut), enabled, sessionRunning, sessionState, renderedWidth/Height, recommendedWidth/Height, supportedWidth/Height, supportedLayers, fov0hz/fov0vt/fov1hz/fov1vt, ipd (m), currentRefreshRate/targetRefreshRate…
---@field stateString string 'disabled' (défaut), 'welcome' ou 'enabled'.
render_openxr = {}

--- Recentre la vue VR. Sans argument, recentre une fois (OpenXR.centerNow) ; avec une valeur, active/désactive le recentrage continu quand value > 0.2 (OpenXR.centerContinuous).
---Source : lua/ge/extensions/render/openxr.lua:328
---@param value number|nil Valeur analogique d'une action d'entrée (déduit du code).
function render_openxr.center(value) end

--- Fermeture de la boîte de dialogue de bienvenue (appelée par ses boutons) : enable=true active OpenXR, sinon le désactive.
---Source : lua/ge/extensions/render/openxr.lua:162
---@param enable boolean Choix de l'utilisateur.
function render_openxr.closeWelcome(enable) end

--- Appelé par le moteur en cas d'erreur OpenXR : logue l'erreur et affiche un toast d'erreur avec la traduction `ui.openXR.errors.<err>`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/openxr.lua:340
---@param err string Identifiant d'erreur (clé de traduction).
function render_openxr.errorDetected(err) end

--- Indique si une session OpenXR est en cours.
---Source : lua/ge/extensions/render/openxr.lua:336
---@return boolean  M.state.sessionRunning ou false.
function render_openxr.isSessionRunning() end

--- Hook d'initialisation : passe l'extension en déchargement manuel et charge les réglages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/openxr.lua:157
function render_openxr.onInit() end

--- Hook avant rendu : appelle la fonction de mise à jour courante (onUpdate quand OpenXR est activé, sinon rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/openxr.lua:36
---@param ... any dtReal, dtSim, dtRaw (déduit du code).
function render_openxr.onPreRender(...) end

--- Hook de changement de réglages : relit les réglages OpenXR, redémarre OpenXR si le mode debug change pendant une session, et régénère la courbure de l'UI (OpenXR.generateUiCurvature) si OpenXR est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/openxr.lua:143
function render_openxr.onSettingsChanged() end

--- Change l'état de l'interface OpenXR : 'welcome' ouvre la boîte de dialogue, 'enabled' active OpenXR.setEnable(true) (retombe sur 'disabled' en cas d'échec), 'disabled' le coupe et décharge l'extension ; toute autre valeur est une erreur (désactive). Enregistre une action joueur « set VR state … ».
---Source : lua/ge/extensions/render/openxr.lua:289
---@param stateString string 'welcome', 'enabled' ou 'disabled'.
function render_openxr.setStateUI(stateString) end

--- Appelé par le moteur C++ à chaque changement d'état OpenXR : met à jour M.state (le target refresh rate garde le maximum vu ; une fréquence infinie est ramenée à 0), synchronise stateString avec enabled et notifie l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/openxr.lua:98
---@param state table Nouvel état OpenXR.
function render_openxr.stateChanged(state) end

--- Fait avancer l'état : disabled -> welcome ; welcome -> enabled ; enabled -> disabled.
---Source : lua/ge/extensions/render/openxr.lua:321
function render_openxr.toggle() end

--- Envoie 'OpenXRStateChanged' à l'UI si un champ suivi a changé, ou si forced (alors logue aussi l'état).
---Source : lua/ge/extensions/render/openxr.lua:82
---@param forced boolean|nil Forcer l'envoi.
function render_openxr.updateUI(forced) end

