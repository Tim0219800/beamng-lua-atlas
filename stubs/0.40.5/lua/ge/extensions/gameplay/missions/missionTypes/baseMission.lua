---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de base d'une mission. L'objet porte les données de la mission (missionType, etc.) fournies via la table d'options.
---@class gameplay_missions_missionTypes_baseMission
local gameplay_missions_missionTypes_baseMission = {}

--- Renvoie la clé de traduction d'une clé de progression (« default », « custom ») ; si elle est inconnue, renvoie la clé telle quelle.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:13
---@param progressKey string Clé de progression.
---@return string  Clé de traduction ou progressKey.
function gameplay_missions_missionTypes_baseMission:getProgressKeyTranslation(progressKey) end

--- Appelé à la création d'une mission de ce type. Définit self.missionTypeLabel = "bigMap.missionLabels."..self.missionType et self.progressKeyTranslations = {default, custom} (clés de traduction missions.progressKeyLabels.*).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:8
function gameplay_missions_missionTypes_baseMission:init() end

--- Appelé au démarrage de la mission. Vide dans la base, à surcharger.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:23
function gameplay_missions_missionTypes_baseMission:onStart() end

--- Appelé à l'arrêt de la mission. `data` (la tentative) peut être nil. Vide dans la base.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:27
---@param data table|nil Données de fin de mission / tentative.
function gameplay_missions_missionTypes_baseMission:onStop(data) end

--- Appelé à chaque frame pendant la mission. Vide dans la base, à surcharger.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:25
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
---@param dtRaw number Temps brut écoulé (s).
function gameplay_missions_missionTypes_baseMission:onUpdate(dtReal, dtSim, dtRaw) end

