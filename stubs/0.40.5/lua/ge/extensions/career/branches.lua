---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/branches.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Arbre des domaines, branches et compétences (skills) du mode carrière. Il lit tous les fichiers info.json sous /gameplay/domains/ (récursivement) et en déduit, d'après l'arborescence des dossiers (domains / branches / skills), l'identifiant pathId (noms de dossiers joints par « - », par ex. « apm-motorsport »), le parent et le type (isDomain, isBranch, isSkill). Il calcule niveaux et XP à partir de la valeur de l'attribut du joueur (career_modules_playerAttributes), les multiplicateurs de récompense par niveau, les conditions de déverrouillage (flags) et sauvegarde l'état « unlocked » dans career/branchUnlocks.json.
--- Accès : extension `career_branches` : `extensions.load("career_branches")`, puis la globale `career_branches`
---@class career_branches
---@field newAttributeNamesToOldNames table<string, string> Table inverse. Construite à partir de l'ancienne table ; si plusieurs anciens noms visent le même chemin, le dernier parcouru gagne.
---@field oldAttributeNamesToNewNames table<string, string> Anciens noms d'attributs vers les chemins actuels (par ex. drift vers bmra-drift).
---@field onPlayerAttributesChanged nil Toujours nil : référence à une variable non définie dans le fichier.
career_branches = {}

--- Calcule le niveau d'une branche pour une valeur d'XP : dernier niveau dont requiredValue <= val, plus la progression vers le suivant.
---Source : lua/ge/extensions/career/branches.lua:294
---@param val number Valeur de l'attribut (XP).
---@param id string Identifiant de la branche.
---@return integer  Niveau (-1 si aucun).
---@return number  Progression dans le niveau courant (-1 si pas de suivant).
---@return number  XP nécessaire pour passer au suivant (-1 si pas de suivant).
---@return number  Seuil du niveau courant (-1 si pas de suivant).
---@return number  Seuil du niveau suivant (-1 si pas de suivant).
function career_branches.calcBranchLevelFromValue(val, id) end

--- Recalcule unlocked, unlockInfo, lockedReason et unlockInfos de chaque branche selon unlockCondition et career_modules_unlockFlags.
---Source : lua/ge/extensions/career/branches.lua:462
function career_branches.checkUnlocks() end

--- Remplace dans la liste d'unlocks d'un niveau chaque entrée « automaticMission » par une carte « unlockCard » donnant le nombre de défis disponibles pour cette branche ; les autres entrées sont conservées.
---Source : lua/ge/extensions/career/branches.lua:396
---@param skill table Branche (id utilisé).
---@param level integer Niveau (non utilisé dans le calcul).
---@param unlocks table[] Liste d'unlocks du niveau.
---@return table[]  Nouvelle liste.
function career_branches.expandUnlocks(skill, level, unlocks) end

--- Déduit le pathId d'un chemin de fichier situé sous /gameplay/domains/.
---Source : lua/ge/extensions/career/branches.lua:624
---@param filePath string Chemin d'un fichier d'une branche.
---@return string  pathId.
function career_branches.extractBranchPathIdFromFilePath(filePath) end

--- Construit le pathId « domaine-branche-compétence » (les parties absentes sont omises) et retourne la branche.
---Source : lua/ge/extensions/career/branches.lua:265
---@param domainId string Domaine.
---@param branchId string|nil Branche.
---@param skillId string|nil Compétence (utilisée seulement si branchId est donné).
---@return table  La branche.
function career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId) end

--- Alias de getBranchByPath.
---Source : lua/ge/extensions/career/branches.lua:248
---@param id string Identifiant (pathId).
---@return table  La branche, ou la branche « missing ».
function career_branches.getBranchById(id) end

--- Cherche une branche par pathId ; accepte les anciens noms (avertissement journalisé).
---Source : lua/ge/extensions/career/branches.lua:252
---@param pathId string Chemin comme « apm-motorsport ».
---@return table  La branche ou la branche « missing ».
function career_branches.getBranchByPath(pathId) end

--- Retourne l'icône de la branche (nil si « missing »).
---Source : lua/ge/extensions/career/branches.lua:360
---@param id string Identifiant de la branche.
---@return string|nil  Icône.
function career_branches.getBranchIcon(id) end

--- Niveau actuel du joueur dans une branche (d'après son attribut). Retourne nil si la branche est inconnue ; renvoie aussi les valeurs de calcBranchLevelFromValue.
---Source : lua/ge/extensions/career/branches.lua:331
---@param id string Identifiant de la branche.
---@return integer|nil  Niveau.
function career_branches.getBranchLevel(id) end

--- Même chose que getBranchLevel, en passant un pathId.
---Source : lua/ge/extensions/career/branches.lua:338
---@param pathId string Chemin de la branche.
---@return integer|nil  Niveau.
function career_branches.getBranchLevelByPath(pathId) end

--- Retourne un résumé pour l'UI : label, level, icon, curLvlProgress, neededForNext, processPercent et max (nombre de niveaux).
---Source : lua/ge/extensions/career/branches.lua:315
---@param id string Identifiant de la branche.
---@return table  Résumé.
function career_branches.getBranchSimpleInfo(id) end

--- Valeur de l'attribut (XP) du joueur pour la branche, -1 si elle est inconnue du système d'attributs, nil si la branche est « missing ».
---Source : lua/ge/extensions/career/branches.lua:345
---@param id string Identifiant de la branche.
---@return number|nil  XP.
function career_branches.getBranchXP(id) end

--- Retourne toutes les branches indexées par id. Au premier appel, charge les info.json de /gameplay/domains/, les trie (domaines puis enfants) et propage la couleur du parent.
---Source : lua/ge/extensions/career/branches.lua:158
---@return table<string, table>  Branches par id.
function career_branches.getBranches() end

--- Libellé d'un niveau : « ui.career.lvlLabelMax » pour le dernier, levelName du niveau sinon, ou un texte avec contexte {lvl}.
---Source : lua/ge/extensions/career/branches.lua:366
---@param id string Identifiant de la branche.
---@param level integer|nil Niveau.
---@return string|table|nil  Clé de traduction ou table {txt, context}.
function career_branches.getLevelLabel(id, level) end

--- Multiplicateur de récompense du niveau actuel du joueur (levels[niveau].rewardMultiplier). Les multiplicateurs par défaut vont de 1 à 5 par pas de 0,25 quand la branche déclare defaultRewardMultipliers.
---Source : lua/ge/extensions/career/branches.lua:374
---@param id string Identifiant de la branche.
---@return number|nil  Multiplicateur.
function career_branches.getLevelRewardMultiplier(id) end

--- Retourne l'ordre d'une clé d'attribut (table order) ou -math.huge si inconnue.
---Source : lua/ge/extensions/career/branches.lua:21
---@param key string Clé d'attribut (money, beamXP, ...).
---@return number  Rang d'ordre.
function career_branches.getOrder(key) end

--- Retourne la liste des branches triée par ordre (mise en cache).
---Source : lua/ge/extensions/career/branches.lua:281
---@return table[]  Branches triées.
function career_branches.getSortedBranches() end

--- XP requis (requiredValue) pour atteindre un niveau, -1 si le niveau n'existe pas.
---Source : lua/ge/extensions/career/branches.lua:352
---@param id string Identifiant de la branche.
---@param level integer Niveau visé.
---@return number|nil  XP requis.
function career_branches.getXPNeededForLevel(id, level) end

--- Hook appelé à l'activation/désactivation de la carrière ; à l'activation lit branchUnlocks.json (voir notes : la restauration est vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/branches.lua:445
---@param active boolean Carrière active ou non.
function career_branches.onCareerActive(active) end

--- Hook où chaque branche déclare des flags de déverrouillage : « <id>-level-<n> » pour chaque niveau (et unlockFlags du niveau) et un flag par certification (réussi quand la mission requise est passée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/branches.lua:509
---@param flagDefinitions table<string, table> Table à remplir avec les définitions de flags.
function career_branches.onGetUnlockFlagDefinitions(flagDefinitions) end

--- Hook de sauvegarde du profil : écrit <save>/career/branchUnlocks.json avec le champ unlocked de chaque branche (career_saveSystem.jsonWriteFileSafe).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/branches.lua:432
---@param currentSavePath string Dossier de la sauvegarde courante.
function career_branches.onSaveCurrentProfile(currentSavePath) end

--- Trie une liste de clés d'attributs sur place selon l'ordre des branches et la retourne.
---Source : lua/ge/extensions/career/branches.lua:383
---@param list string[] Clés à trier.
---@return string[]  La même liste triée.
function career_branches.orderAttributeKeysByBranchOrder(list) end

--- Trie une liste d'identifiants de branche (par défaut toutes) selon l'ordre des branches.
---Source : lua/ge/extensions/career/branches.lua:389
---@param list string[]|nil Identifiants ; défaut : toutes les branches.
---@return string[]  Liste triée.
function career_branches.orderBranchNamesKeysByBranchOrder(list) end

