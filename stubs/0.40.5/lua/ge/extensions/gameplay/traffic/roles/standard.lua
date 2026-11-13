---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roles/standard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du rôle standard, complétée par baseRole (self.veh, self.driver, self.flags, self.state, setAction, resetAction, setTarget, checkTargetVisible…).
---@class gameplay_traffic_roles_standard
local gameplay_traffic_roles_standard = {}

--- Définit les actions fleePostCrash (fuite IA, agressivité aléatoire >= 0,5), followPostCrash (suivi ou poursuite 'road rage' du responsable), askInsurance (arrêt de l'IA) et disabled (arrêt, état 'disabled'), puis fusionne les baseActions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:15
function gameplay_traffic_roles_standard:init() end

--- Appelé quand ce véhicule est en collision avec un autre. Impute la faute si la vitesse dépasse 1,2 fois la limite, marque 'selfCollision', cible l'autre véhicule, émet onTrafficAction(vehId, 'collision', …), prévoit un coup de klaxon (selon bravoure et nombre de coups) et mémorise selfHitCount.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:109
---@param otherId integer Id du véhicule percuté.
---@param data table Données de collision ; data.count = nombre de collisions.
function gameplay_traffic_roles_standard:onCollision(otherId, data) end

--- Appelé quand le véhicule subit un dégât de crash. Si aucune collision n'est en cours, marque l'événement 'selfCrash' et, pour une IA, émet le hook onTrafficAction(vehId, 'crashDamage', {targetId}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:86
---@param data table Données de dégâts (non utilisées).
function gameplay_traffic_roles_standard:onCrashDamage(data) end

--- Appelé quand deux autres véhicules de trafic se percutent. Cible le plus lent des deux s'il est visible, proche et devant ; enregistre otherHitCount.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:130
---@param id1 integer Premier véhicule.
---@param id2 integer Second véhicule.
---@param data table Données de collision ; data.count = nombre de collisions.
function gameplay_traffic_roles_standard:onOtherCollision(id1, id2, data) end

--- Appelé quand un autre véhicule subit un crash. Si ce véhicule est proche (< 60 m d'après la distance interactive), devant et visible, marque l'événement 'otherCrash' et le cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:97
---@param otherId integer Id du véhicule accidenté.
---@param data table Données de dégâts (non utilisées).
function gameplay_traffic_roles_standard:onOtherCrashDamage(otherId, data) end

--- Appelé pour un événement signalé par un autre véhicule (ex. quasi-accident). Ignoré si un crash est déjà actif ; sinon, si le véhicule est visible, enregistre le type d'événement et le cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:149
---@param eventType string Type d'événement (ex. 'nearMiss').
---@param otherId integer Id du véhicule concerné.
---@param data table Données de l'événement (non utilisées).
function gameplay_traffic_roles_standard:onOtherEvent(eventType, otherId, data) end

--- Réinitialise cible, timers et état du conducteur (driver.eventType, damageAction, collisionThreshold, compteurs de collisions). Pour une IA, choisit damageAction selon la bravoure et tire le seuil de collisions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:60
function gameplay_traffic_roles_standard:onRefresh() end

--- Appelé à chaque tick du trafic. Désactive le véhicule IA trop endommagé, évalue visibilité et proximité de la cible, puis choisit une réaction (klaxon, rangement 'pullOver', suivi, fuite, passage en poursuite) selon l'événement et la personnalité. Gère aussi le klaxon différé et le gel des feux si une rampe lumineuse est allumée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:158
---@param tickTime number Durée du tick en secondes (non utilisée dans le corps).
function gameplay_traffic_roles_standard:onTrafficTick(tickTime) end

--- Appelé chaque frame. Fait décroître actionTimer et termine les actions : échange d'assurance quand les deux véhicules sont arrêtés à moins de 20 m, fin du suivi/de la fuite, fin du rangement ; réinitialise l'action si la cible a disparu du trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:274
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s), utilisé pour actionTimer.
function gameplay_traffic_roles_standard:onUpdate(dt, dtSim) end

