---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roles/police.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du rôle police, complétée par baseRole (self.veh, self.flags, self.state, self.targetId, setAction, setTarget, resetAction…).
---@class gameplay_traffic_roles_police
local gameplay_traffic_roles_police = {}

--- Compare les scores de poursuite des véhicules de trafic non policiers dont le mode de poursuite est >= 1 et renvoie l'id de celui qui a le meilleur score.
---Source : lua/ge/extensions/gameplay/traffic/roles/police.lua:107
---@return integer|nil  Id de la meilleure cible, ou nil s'il n'y en a pas.
function gameplay_traffic_roles_police:checkTarget() end

--- Configure le rôle : classe 'emergency', agressivité +0,1, drivability 0,5, et définit les actions pursuitStart (démarre une poursuite : mode 1 = suivi passif avec sirène par à-coups, mode > 1 = poursuite agressive avec rampe allumée), pursuitEnd (arrêt IA, rampe en mode 1, cooldown), chaseTarget, avoidTarget (mode 'flee' temporaire) et roadblock (arrêt, rampe allumée). Fusionne ensuite les baseActions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/police.lua:7
function gameplay_traffic_roles_police:init() end

--- Appelé lors du rafraîchissement du rôle. Sort de l'état 'disabled', remet les timers à zéro, réinitialise l'action si besoin, puis cherche une cible : s'il y en a une, lance pursuitStart ; sinon annule la poursuite en cours. Avertit dans le log si le joueur est ciblé sans que sa poursuite ait été correctement déclenchée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/police.lua:124
function gameplay_traffic_roles_police:onRefresh() end

--- Appelé à chaque tick du trafic. Met à jour les cibles potentielles (distance, visibilité), compte les policiers qui voient la cible, déclenche l'évitement d'une collision frontale, désactive le policier trop endommagé, et gère le gel des feux de circulation selon la rampe lumineuse (vitesse >= 6 m/s).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/police.lua:153
---@param dt number Durée du tick en secondes (non utilisée dans le corps).
function gameplay_traffic_roles_police:onTrafficTick(dt) end

--- Appelé chaque frame. Gère les impulsions de sirène, le décompte du cooldown (qui rappelle onRefresh à la fin), l'arrêt de la poursuite si la cible ne fuit plus, la sortie des barrages routiers, le rangement sur le côté ('pullOver') près d'une cible quasi arrêtée, et les délais des actions temporaires.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/police.lua:225
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s).
function gameplay_traffic_roles_police:onUpdate(dt, dtSim) end

