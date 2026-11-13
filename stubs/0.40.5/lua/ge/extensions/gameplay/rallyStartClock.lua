---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rallyStartClock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les horloges de départ de spéciale (panneaux physiques présents dans les niveaux) pour le rallye. Il charge les types d'horloges depuis `lua/ge/extensions/gameplay/rally/startClocks/*.lua` (chacun doit exposer `textures`, `findClocks` et `draw`), crée un objet TSStatic d'affichage par horloge trouvée, dessine l'heure murale, le libellé « SS<n> » et le compte à rebours (avec code de feu R, A ou G) dans des textures dynamiques, puis, si le réglage `rallyStartCountdownDisplay` vaut '3d', affiche l'horloge la plus proche de la ligne de départ dans une vue de rendu incrustée en haut de l'écran avec un cadre coloré selon le feu. Il alimente son état à partir du hook `onRallyDataUpdated`.
--- Accès : extension `gameplay_rallyStartClock` : `extensions.load("gameplay_rallyStartClock")`, puis la globale `gameplay_rallyStartClock`
---@class gameplay_rallyStartClock
gameplay_rallyStartClock = {}

--- Types d'horloges chargés.
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:525
---@return table[]  Liste de {name, module} (name = nom du fichier sans extension).
function gameplay_rallyStartClock.getClockTypes() end

--- Indique si la vue de rendu 3D du compte à rebours est active ; rallyLoop s'en sert pour masquer le compte à rebours 2D.
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:524
---@return boolean  true si la vue 3D est disponible.
function gameplay_rallyStartClock.isRenderViewAvailable() end

--- Hook de chargement : charge (ou recharge) les types d'horloges depuis le dossier startClocks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:69
function gameplay_rallyStartClock.onExtensionLoaded() end

--- Hook de déchargement : détruit la vue de rendu, les affichages et réinitialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:426
function gameplay_rallyStartClock.onExtensionUnloaded() end

--- Appelé avant le rendu, après tous les onUpdate : avance l'horloge locale si aucune donnée fraîche n'est arrivée, redessine les textures si l'affichage a changé et trace le cadre coloré de la vue 3D.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:499
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_rallyStartClock.onPreRender(dtReal, dtSim) end

--- Hook appelé quand les données de rallye changent. Lit activeState (début et fin du compte à rebours, délai de 1,5 s de la vue 3D), rallyClock.wallClockSecs et startClockCountdownData (ou countdownData) pour calculer l'heure de départ (timeUntilLaunch en secondes, state 'launched').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:440
---@param data table Données de rallye (activeState, rallyClock, startClockCountdownData, countdownData).
function gameplay_rallyStartClock.onRallyDataUpdated(data) end

--- Hook émis à la fin d'une session de rallye : même nettoyage que le déchargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:426
function gameplay_rallyStartClock.onRallySessionEnd() end

--- Hook de mise à jour : (re)détecte les horloges du niveau toutes les secondes si besoin, relie les textures, fait tourner le délai de la vue et met à jour la vue de rendu 3D.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:476
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_rallyStartClock.onUpdate(dtReal, dtSim) end

