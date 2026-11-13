---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/branches/leagues.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les « ligues » de la carrière : groupes de missions (et de spots de drift) rattachés à une compétence, chargés depuis les fichiers /gameplay/**/*.leagues.json à l'activation de la carrière. Calcule si une ligue est débloquée (conditions leagueStars, branchLevel, skillStars, branchStars, inDevelopment), les étoiles obtenues/disponibles, l'ordre d'affichage, et vérifie la cohérence des missions (une seule ligue, skill, showInCareer).
--- Accès : extension `career_modules_branches_leagues` : `extensions.load("career_modules_branches_leagues")`, puis la globale `career_modules_branches_leagues`
---@class career_modules_branches_leagues
career_modules_branches_leagues = {}

--- Calcule league._order : groupe par compétence, tri par étoiles requises puis ordre de fichier, ligues 'highlightIfUnlocked' débloquées en tête, puis ordre des compétences (career_branches.getOrder).
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:223
function career_modules_branches_leagues.addLeagueSortOrder() end

--- Vérifie la configuration d'une mission par rapport aux ligues (startCondition cohérente avec la ligue, careerSetup.skill égal à la compétence de la ligue, showInCareer vrai) et logue des erreurs 'E'.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:455
---@param mission table Mission à vérifier.
function career_modules_branches_leagues.checkMission(mission) end

--- Efface le cache de déblocage de chaque ligue et le cache d'étoiles par compétence.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:15
function career_modules_branches_leagues.clearLeagueUnlockCache() end

--- Copie profonde d'une ligue enrichie pour l'UI : totalStarsAvailable, totalStarsObtained (missions et objectifs de drift), icon et accentColor de la compétence ('badgeRoundStar' si certification).
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:129
---@param l table Ligue brute.
---@return table  Ligue formatée.
function career_modules_branches_leagues.formatLeague(l) end

--- Renvoie la ligue d'id donné (table brute, non formatée).
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:9
---@param id string Id de la ligue.
---@return table|nil  Ligue ou nil.
function career_modules_branches_leagues.getLeagueById(id) end

--- Renvoie la ligue qui contient la mission donnée.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:10
---@param mId string Id de la mission.
---@return table|nil  Ligue ou nil.
function career_modules_branches_leagues.getLeagueOfMission(mId) end

--- Liste les ligues formatées (triées) qui contiennent la mission donnée.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:206
---@param missionId string Id de la mission.
---@return table[]  Ligues formatées.
function career_modules_branches_leagues.getLeaguesForMission(missionId) end

--- Liste les ligues formatées d'une branche (et de ses sous-compétences sauf si ignoreSubSkills), triées par _order. Sans branchId, toutes les ligues.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:167
---@param branchId string|nil Id de la branche ou compétence.
---@param ignoreSubSkills boolean|nil Si vrai, ne retient que les ligues de la compétence elle-même.
---@return table[]  Ligues formatées triées.
function career_modules_branches_leagues.getLeaguesForProgressBranchPage(branchId, ignoreSubSkills) end

--- Compare deux statuts de déblocage et renvoie les ligues nouvellement débloquées (formatées, triées) ; débloque le succès NEW_TERRITORY s'il y en a.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:183
---@param before table<string, boolean> Statut avant.
---@param after table<string, boolean> Statut après.
---@return table[]  Ligues nouvellement débloquées.
function career_modules_branches_leagues.getLeaguesForUnlockChange(before, after) end

--- Obsolète : logue l'erreur 'Deprecated' et ne fait rien.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:200
---@param skill any Non utilisé.
---@param missions any Non utilisé.
---@param driftSpots any Non utilisé.
function career_modules_branches_leagues.getNoLeague(skill, missions, driftSpots) end

--- Vide le cache puis renvoie une table id de ligue -> débloquée (booléen) pour toutes les ligues.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:19
---@return table<string, boolean>  Statut de déblocage par ligue.
function career_modules_branches_leagues.getSimpleUnlockedStatus() end

--- Raccourci de getStarsForSkills pour une seule compétence.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:389
---@param skillId string Id de la compétence.
---@return integer  Total d'étoiles par défaut.
---@return integer  Étoiles débloquées.
function career_modules_branches_leagues.getStarsForSkill(skillId) end

--- Somme des étoiles par défaut disponibles et débloquées pour toutes les missions dont careerSetup.skill est dans la table donnée.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:376
---@param skillIds table<string, boolean> Ensemble d'ids de compétences.
---@return integer  Total d'étoiles par défaut.
---@return integer  Étoiles par défaut débloquées.
function career_modules_branches_leagues.getStarsForSkills(skillIds) end

--- Remplit map[leagueId] = true pour chaque condition de type 'league' trouvée dans une startCondition (récursif sur cond.nested).
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:391
---@param cond table Condition de démarrage d'une mission.
---@param map table<string, boolean> Table de sortie.
function career_modules_branches_leagues.getStartConditionLeagueId(cond, map) end

--- Évalue (avec cache) les conditions de déblocage d'une ligue ; sans condition elle est débloquée.
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:28
---@param id string Id de la ligue.
---@return boolean  true si toutes les conditions sont remplies (false si la ligue n'existe pas).
---@return table[]|nil  Libellés des conditions (unlockLabels).
function career_modules_branches_leagues.isLeagueUnlocked(id) end

--- Hook : quand la carrière devient active, charge les ligues depuis les fichiers *.leagues.json de /gameplay/.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/branches/leagues.lua:367
---@param active boolean true à l'activation.
function career_modules_branches_leagues.onCareerActive(active) end

