---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roles/suspect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du rôle suspect, complétée par baseRole (self.veh = véhicule de trafic, self.flags, self.state, self.actions).
---@class gameplay_traffic_roles_suspect
local gameplay_traffic_roles_suspect = {}

--- Initialise le rôle : ajoute +0,2 d'offset à l'agressivité (personalityModifiers), définit les actions watchPolice / fleePolice / arrest / clear et fixe pursuitMode = 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/suspect.lua:7
function gameplay_traffic_roles_suspect:init() end

--- Appelé quand le véhicule n'est plus actif dans le trafic. Même traitement que onRoleEnded : si le drapeau flee est posé, le suspect est déclaré ayant échappé à la police.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/suspect.lua:55
function gameplay_traffic_roles_suspect:onActiveDone() end

--- Appelé quand le rôle prend fin. Si le suspect fuyait, appelle gameplay_police.evadeVehicle(vehId, gameplay_traffic.showMessages) et retire le drapeau flee.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/suspect.lua:48
function gameplay_traffic_roles_suspect:onRoleEnded() end

--- Appelé à chaque tick du gestionnaire de trafic. Si l'état est 'wanted', que la valeur de visibilité (pursuit.sightValue) atteint le seuil (0,25 pour une IA, 1 pour un joueur) et que la vitesse atteint le seuil (1 m/s si driveCheck, sinon 0), il cherche les policiers disponibles (ni en poursuite ni en reset), lance gameplay_police.setPursuitMode(pursuitMode, vehId, policeIds) et cible le policier le plus proche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/suspect.lua:62
---@param tickTime number Durée du tick de trafic en secondes (non utilisé dans le corps).
function gameplay_traffic_roles_suspect:onTrafficTick(tickTime) end

--- Appelé à chaque frame ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/suspect.lua:81
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s).
function gameplay_traffic_roles_suspect:onUpdate(dt, dtSim) end

