---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/lowPerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecteur de faible fréquence d'images en freeroam et en écran partagé (modes freeroam et multiseatGamemode uniquement ; missions, scénarios, carrière et tutoriels ne sont jamais contrôlés). Quand la moyenne lissée de FPS reste sous 25 pendant 5 s, il passe en état « low performance », affiche un toast d'avertissement et peut demander confirmation avant l'apparition d'un nouveau véhicule (confirmSpawn). Un moddeur qui spawne des véhicules peut passer par confirmSpawn pour respecter cet avertissement.
--- Accès : extension `gameplay_lowPerformance` : `extensions.load("gameplay_lowPerformance")`, puis la globale `gameplay_lowPerformance`
---@class gameplay_lowPerformance
gameplay_lowPerformance = {}

--- Abandonne la fonction de spawn en attente (bouton Annuler).
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:125
function gameplay_lowPerformance.cancelPendingSpawn() end

--- Exécute la fonction de spawn en attente, si elle existe (bouton Continuer).
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:119
function gameplay_lowPerformance.confirmPendingSpawn() end

--- Exécute spawnFn directement, sauf si l'état de faible performance est actif, l'avertissement pas encore montré pour cet épisode et les notifications activées : dans ce cas affiche un dialogue de confirmation (Annuler / Ne plus afficher / Continuer) et diffère spawnFn.
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:93
---@param spawnFn function Fonction qui effectue le spawn.
---@return any  Résultat de spawnFn si exécutée immédiatement (nil si elle ne renvoie rien), ou false tant que le joueur doit décider.
function gameplay_lowPerformance.confirmSpawn(spawnFn) end

--- Renvoie les textes traduits à afficher dans le menu pause quand la faible performance est active et les notifications autorisées.
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:141
---@return table|nil  {notice, hint, infoTitle, infoMessage} ou nil.
function gameplay_lowPerformance.getPauseNotice() end

--- Indique si le jeu est actuellement considéré en faible performance, et si la détection est encore applicable (gate actif).
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:88
---@return boolean  true si faible performance.
function gameplay_lowPerformance.isLowPerformance() end

--- Désactive les notifications (réglage notifyLowPerformance = false), affiche un toast d'information puis exécute le spawn en attente.
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:129
function gameplay_lowPerformance.muteAndConfirmPendingSpawn() end

--- Hook d'état du fondu d'écran : l'échantillonnage est suspendu tant que l'état n'est pas 3 (fondu terminé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:196
---@param state integer État du fondu ; 3 = terminé.
function gameplay_lowPerformance.onScreenFadeState(state) end

--- Hook de mise à jour chaque frame : vérifie périodiquement (1 s) le gate, gère la période de grâce, lisse les FPS et bascule l'état de faible performance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:151
---@param dtReal number Delta temps réel (non utilisé).
---@param dtSim number Delta temps de simulation (non utilisé).
---@param dtRaw number Delta temps brut en secondes, utilisé pour le chronométrage et les FPS.
function gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook d'apparition d'un véhicule : redémarre la période de grâce (le spawn fait chuter temporairement les FPS).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:192
function gameplay_lowPerformance.onVehicleSpawned() end

