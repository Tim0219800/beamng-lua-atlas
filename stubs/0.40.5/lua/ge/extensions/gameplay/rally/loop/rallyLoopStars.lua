---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les étoiles (bronze, silver, gold) d'une boucle de rallye. Les seuils de la boucle sont la somme des seuils des spéciales liées (jusqu'à 4 : stage1_rallyStage…stage4_rallyStage). Le module note aussi une tentative (étoiles débloquées si le temps total est inférieur ou égal au seuil) et choisit le texte de fin de mission correspondant.
--- Accès : extension `gameplay_rally_loop_rallyLoopStars` : `extensions.load("gameplay_rally_loop_rallyLoopStars")`, puis la globale `gameplay_rally_loop_rallyLoopStars`
---@class gameplay_rally_loop_rallyLoopStars
gameplay_rally_loop_rallyLoopStars = {}

--- Calcule les seuils et les écrit dans loopMissionTypeData ; les met à nil si le calcul échoue.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:68
---@param loopMissionTypeData table missionTypeData de la boucle, modifié sur place.
---@return table|nil  Les totaux, ou nil.
function gameplay_rally_loop_rallyLoopStars.applyThresholds(loopMissionTypeData) end

--- Additionne les seuils bronze/silver/gold des spéciales liées à la boucle. Toutes les spéciales configurées doivent fournir les trois valeurs.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:29
---@param loopMissionTypeData table missionTypeData de la boucle (champs stage1_rallyStage…stage4_rallyStage).
---@return table|nil  {bronzeTime, silverTime, goldTime, stageCount} ou nil.
function gameplay_rally_loop_rallyLoopStars.deriveThresholds(loopMissionTypeData) end

--- Extrait l'id de mission d'une valeur de champ : renvoie ce qui est entre parenthèses finales ("Nom (id)" donne "id"), sinon la chaîne telle quelle ; nil si la valeur n'est pas une chaîne, est vide ou vaut '<none>'.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:10
---@param value any Valeur du champ stageN_rallyStage.
---@return string|nil  Id de mission.
function gameplay_rally_loop_rallyLoopStars.extractMissionId(value) end

--- Renvoie le texte de fin : celui de 'noStarUnlocked' puis celui de la meilleure étoile débloquée (bronze, puis silver, puis gold), pris dans careerSetup.starOutroTexts ou à défaut defaultStarOutroTexts. nil si la mission n'a pas de goldTime ou aucune étoile active.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:108
---@param mission table|nil Mission de la boucle.
---@param attempt table|nil Tentative notée (unlockedStars).
---@return string|nil  Texte de fin.
function gameplay_rally_loop_rallyLoopStars.getOutroText(mission, attempt) end

--- Remplit attempt.unlockedStars[clé] = (temps total <= seuil) pour chaque étoile active. Ne fait rien pour un DNF, une mission sans missionTypeData ou un temps non valide (<= 0).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopStars.lua:82
---@param mission table|nil Mission de la boucle (missionTypeData, careerSetup.starsActive).
---@param attempt table Tentative ; lit attempt.data.totalTime et attempt.dnf.
---@return table  La même tentative.
function gameplay_rally_loop_rallyLoopStars.gradeAttempt(mission, attempt) end

