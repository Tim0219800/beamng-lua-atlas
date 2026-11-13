---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/splitScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Écran partagé (multiseat) : crée une vue de rendu par joueur (RenderViewManagerInstance, vues nommées 'splitscreen0', 'splitscreen1'...), calcule la disposition à l'écran avec render_splitScreenLayouts selon le nombre de joueurs et le réglage multiseatLayout<N>, gère les contextes caméra par joueur, les étiquettes de joueurs et le HUD Vue 'multiseat'. L'extension s'active dès son chargement (onExtensionLoaded appelle enable) et se désactive au déchargement. Un moddeur ou une mission peut imposer la liste des joueurs avec setCustomPlayers.
--- Accès : extension `render_splitScreen` : `extensions.load("render_splitScreen")`, puis la globale `render_splitScreen`
---@class render_splitScreen
---@field dependencies string[] Extensions chargées avant : core_playerPersonas, render_playerTags, render_playerCompassMarkers.
render_splitScreen = {}

--- Affiche temporairement un seul joueur en plein écran sans changer la liste des participants ni l'état du HUD. Avec options.mainView = true, utilise la vue principale ; sinon agrandit la vue du joueur avec une caméra 'orbit'. Les étiquettes de joueurs sont supprimées pendant la vue solo.
---Source : lua/ge/extensions/render/splitScreen.lua:482
---@param player integer Indice du joueur (converti par tonumber).
---@param options table|nil {mainView = boolean}.
---@return boolean  false si player n'est pas numérique ou n'est pas dans la liste des joueurs configurés (ou sans vue) ; true sinon.
function render_splitScreen.beginSoloView(player, options) end

--- Raccourci pour setCustomPlayers(nil).
---Source : lua/ge/extensions/render/splitScreen.lua:377
function render_splitScreen.clearCustomPlayers() end

--- Termine la vue solo et restaure la caméra du contexte et la disposition.
---Source : lua/ge/extensions/render/splitScreen.lua:458
---@return boolean  true si une vue solo était active.
function render_splitScreen.endSoloView() end

--- Renvoie la configuration d'affichage courante.
---Source : lua/ge/extensions/render/splitScreen.lua:562
---@return boolean  false si l'écran partagé est inactif.
---@return integer|nil  Nombre de joueurs.
---@return string|nil  Identifiant de disposition.
---@return string|nil  Mode : 'shared' ou 'split'.
function render_splitScreen.getCurrentConfiguration() end

--- Renvoie la liste ordonnée des indices de joueurs qui ont une vue : la liste personnalisée de setCustomPlayers si elle existe, sinon core_multiseat.getPlayers. Limitée à 64 ; contient {0} si vide.
---Source : lua/ge/extensions/render/splitScreen.lua:82
---@param result integer[]|nil Table à remplir et renvoyer (réutilisable pour éviter une allocation) ; créée si nil.
---@return integer[]  Indices de joueurs.
function render_splitScreen.getPlayers(result) end

--- Vrai si l'écran partagé est actif, rendu en vue partagée et sans vue solo.
---Source : lua/ge/extensions/render/splitScreen.lua:567
---@return boolean  État.
function render_splitScreen.isSharedView() end

--- Hook de changement de route de l'UI : renvoie l'état du HUD à chaque entrée dans la route 'multiseat', car la vue Vue est remontée avec sa route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:433
---@param context table Contexte de navigation (context.toRoute.name).
function render_splitScreen.onAfterRouteChange(context) end

--- Hook de fin de mission : termine la vue solo (endSoloView).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:458
function render_splitScreen.onClientEndMission() end

--- Hook appelé après un rechargement Lua GE : restaure la liste de joueurs sauvegardée et réactive l'écran partagé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:583
---@param data table Données de onSerialize (customPlayers).
function render_splitScreen.onDeserialized(data) end

--- Hook de chargement de l'extension : restaure customPlayers si des données sont fournies et active l'écran partagé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:593
---@param data table|nil Données sérialisées éventuelles.
function render_splitScreen.onExtensionLoaded(data) end

--- Hook de déchargement : alias de disable(preserveRoute). Détruit les vues, rend le monde sur la vue principale, remet l'exposition à zéro et rétablit la route de jeu 'play' sauf si preserveRoute.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:396
---@param preserveRoute boolean|nil Si vrai, ne change pas la route de jeu.
function render_splitScreen.onExtensionUnloaded(preserveRoute) end

--- Hook appelé avant un rechargement Lua GE : renvoie {customPlayers} et désactive l'écran partagé en conservant la route, pour détruire les vues C++.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:571
---@param reason string Raison de la sérialisation (utilisée dans le log).
---@return table  {customPlayers = ...}.
function render_splitScreen.onSerialize(reason) end

--- Hook appelé quand les réglages changent : reconstruit les surcharges de qualité des vues, qui sont un instantané des réglages globaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:448
function render_splitScreen.onSettingsChanged() end

--- Hook appelé à chaque image : recalcule la configuration (joueurs, taille de fenêtre, disposition) et met à jour les marqueurs de boussole des joueurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/splitScreen.lua:440
---@param dtReal number Durée réelle de l'image (s).
---@param dtSim number Durée simulée (s), non utilisée.
function render_splitScreen.onUpdate(dtReal, dtSim) end

--- Force le recalcul de la disposition au prochain passage (réinitialise la taille mémorisée) et le fait tout de suite si actif.
---Source : lua/ge/extensions/render/splitScreen.lua:556
function render_splitScreen.refreshLayout() end

--- Impose la liste des joueurs qui doivent avoir une vue (par exemple pour une mission), ou la supprime avec nil. Une liste vide équivaut à nil. Si l'écran partagé est actif, recalcule tout de suite.
---Source : lua/ge/extensions/render/splitScreen.lua:360
---@param players integer[]|nil Indices de joueurs ordonnés, ou nil pour effacer la surcharge.
function render_splitScreen.setCustomPlayers(players) end

--- Passe la vue propre à ce joueur au groupe de caméras suivant (core_camera.cycleCameraGroup).
---Source : lua/ge/extensions/render/splitScreen.lua:549
---@param player integer Indice du joueur.
---@return boolean  false si le joueur n'a pas de vue d'écran partagé (l'appelant peut alors utiliser le basculement de caméra principale).
function render_splitScreen.toggleFreeCam(player) end

