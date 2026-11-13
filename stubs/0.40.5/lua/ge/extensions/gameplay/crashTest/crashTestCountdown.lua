---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compte à rebours affiché pendant le scénario de crash test. Chaque seconde entière franchie, il envoie un message à l'UI (évènement ScenarioFlashMessage) avec le chiffre restant et un son de décompte, puis « Go! » avec un son de départ quand le temps est écoulé, et appelle alors le callback donné.
--- Accès : extension `gameplay_crashTest_crashTestCountdown` : `extensions.load("gameplay_crashTest_crashTestCountdown")`, puis la globale `gameplay_crashTest_crashTestCountdown`
---@class gameplay_crashTest_crashTestCountdown
gameplay_crashTest_crashTestCountdown = {}

--- Hook appelé à chaque image : fait avancer le compte à rebours s'il est en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua:40
---@param dtReal number Delta temps réel (s), non utilisé.
---@param dtSim number Delta temps simulation (s).
function gameplay_crashTest_crashTestCountdown.onUpdate(dtReal, dtSim) end

--- Démarre un compte à rebours de duration secondes. Le callback est appelé quand le décompte arrive à 0 (au moment du « Go! »).
---Source : lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua:11
---@param duration number Durée en secondes.
---@param callback_ function|nil Fonction appelée à la fin du compte à rebours.
function gameplay_crashTest_crashTestCountdown.startNewCountdown(duration, callback_) end

