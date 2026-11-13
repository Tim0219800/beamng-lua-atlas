---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/pursuit/proceduralMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Squelette vide prévu pour les scénarios de poursuite générés procéduralement et les évènements aléatoires. Le commentaire du code indique qu'il faudra y déplacer la logique de suspect aléatoire du trafic. Aucune logique n'est implémentée.
--- Accès : extension `gameplay_pursuit_proceduralMode` : `extensions.load("gameplay_pursuit_proceduralMode")`, puis la globale `gameplay_pursuit_proceduralMode`
---@class gameplay_pursuit_proceduralMode
gameplay_pursuit_proceduralMode = {}

--- Hook après rechargement Lua ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/proceduralMode.lua:20
function gameplay_pursuit_proceduralMode.onDeserialized() end

--- Hook de sérialisation avant rechargement Lua ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/proceduralMode.lua:17
function gameplay_pursuit_proceduralMode.onSerialize() end

--- Hook appelé à chaque image ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/proceduralMode.lua:14
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_pursuit_proceduralMode.onUpdate(dt, dtSim) end

