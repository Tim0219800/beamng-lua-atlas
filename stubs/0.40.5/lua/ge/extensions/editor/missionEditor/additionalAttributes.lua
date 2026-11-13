---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/additionalAttributes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-fenêtre des informations additionnelles.
---@class editor_missionEditor_additionalAttributes
local editor_missionEditor_additionalAttributes = {}

--- Dessine les champs Author, Date (avec bouton « Now »), As Scenario, DEV Mission, les listes déroulantes d'attributs additionnels, Group Id et Group Label.
---Source : lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:74
function editor_missionEditor_additionalAttributes:draw() end

--- Appelle setMission puis renvoie les problèmes de cette section (difficulté, auteur, date, traduction du label de groupe, mission DEV en release).
---Source : lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:43
---@param m table Données de mission.
---@return table[]  Éléments {label, severity}.
function editor_missionEditor_additionalAttributes:getMissionIssues(m) end

--- Constructeur : mémorise missionEditor, nomme la section « AdditionalInfo » et charge les attributs additionnels et leurs clés triées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:14
---@param missionEditor table Module editor_missionEditor.
function editor_missionEditor_additionalAttributes:init(missionEditor) end

--- Ouvre le popup « timeUpdaterForMissions ».
---Source : lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:198
function editor_missionEditor_additionalAttributes:openTimeUpdater() end

--- Sélectionne la mission : retrouve son instance (gameplay_missions_missions.getMissionById) et crée les tampons de Group Id, Group Label, auteur et date.
---Source : lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:29
---@param mission table Données de mission.
function editor_missionEditor_additionalAttributes:setMission(mission) end

--- Dessine le popup de mise à jour en masse : on choisit une date « After » et une date « Set To », la liste des missions concernées s'affiche (un clic en retire une), et « Update Affected Missions » écrit la nouvelle date dans chaque mission en la marquant _dirty. Les données du popup sont effacées à sa fermeture.
---Source : lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:213
function editor_missionEditor_additionalAttributes:timeUpdaterPopup() end

--- Calcule, une seule fois, la date lisible de la mission (format AAAA-MM-JJ hh:mm:ss) et la met en cache.
---Source : lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:39
function editor_missionEditor_additionalAttributes:updateDateHumanReadable() end

