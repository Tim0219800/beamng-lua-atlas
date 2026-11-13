---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/forceField.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode « champ de force » du menu radial Fun Stuff : crée autour du véhicule du joueur 0 une « planète » de gravité (obj:setPlanets) envoyée à tous les autres véhicules, qui sont ainsi repoussés (multiplicateur > 0) ou attirés (< 0). Mise à jour toutes les 0.05 s de temps simulé. Se désactive au changement de véhicule, en fin de niveau, au passage en carrière et avant une sérialisation.
--- Accès : extension `gameplay_forceField` : `extensions.load("gameplay_forceField")`, puis la globale `gameplay_forceField`
---@class gameplay_forceField
gameplay_forceField = {}

--- Active le champ de force (sans effet s'il est déjà actif) et affiche un message UI indiquant répulsion ou attraction selon le signe de forceMultiplier.
---Source : lua/ge/extensions/gameplay/forceField.lua:17
function gameplay_forceField.activate() end

--- Désactive le champ : envoie obj:setPlanets({}) à tous les véhicules et affiche un message « désactivé » sauf si silent. Sans effet s'il est inactif.
---Source : lua/ge/extensions/gameplay/forceField.lua:24
---@param silent boolean|nil true pour ne pas afficher de message.
function gameplay_forceField.deactivate(silent) end

--- Renvoie le multiplicateur de force courant.
---Source : lua/ge/extensions/gameplay/forceField.lua:95
---@return number  Multiplicateur.
function gameplay_forceField.getForceMultiplier() end

--- Indique si le champ de force est actif.
---Source : lua/ge/extensions/gameplay/forceField.lua:74
---@return boolean|nil  true si actif, false ou nil sinon.
function gameplay_forceField.isActive() end

--- Hook : activation de la carrière ; désactive le champ si enabled est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/forceField.lua:85
---@param enabled boolean Carrière activée.
function gameplay_forceField.onCareerActive(enabled) end

--- Hook : fin de niveau ; désactive le champ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/forceField.lua:66
function gameplay_forceField.onClientEndMission() end

--- Hook : après un rechargement Lua ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/forceField.lua:82
function gameplay_forceField.onDeserialized() end

--- Hook : avant un rechargement Lua ; désactive le champ (ne renvoie rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/forceField.lua:78
function gameplay_forceField.onSerialize() end

--- Appelé à chaque frame : si actif, toutes les 0.05 s (dtSim) calcule la planète à partir de la boîte englobante du véhicule du joueur 0 et l'envoie aux autres véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/forceField.lua:45
---@param dtReal number Delta temps réel (inutilisé).
---@param dtSim number Delta temps simulé, cumulé pour la cadence.
---@param dtRaw number Delta temps brut (inutilisé).
function gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : changement de véhicule du joueur ; désactive le champ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/forceField.lua:70
function gameplay_forceField.onVehicleSwitched() end

--- Définit le multiplicateur de force : positif = répulsion, négatif = attraction. Pris en compte à la prochaine mise à jour.
---Source : lua/ge/extensions/gameplay/forceField.lua:91
---@param factor number Multiplicateur (1 par défaut).
function gameplay_forceField.setForceMultiplier(factor) end

--- Bascule entre actif et inactif.
---Source : lua/ge/extensions/gameplay/forceField.lua:36
function gameplay_forceField.toggleActive() end

