---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/spawnPoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Découverte des points d'apparition (spawn points) d'un niveau en carrière. Chaque seconde, si le joueur conduit un véhicule de l'inventaire, il teste la distance aux points non découverts (seuil 75 m) ; à la découverte il ajoute une entrée au journal de bord (career_modules_logbook.spawnPointUnlocked), émet le hook onSpawnPointUnlocked(spawnPoint) et vide gameplay_rawPois. L'état est sauvegardé dans <save>/career/spawnPoints.json.
--- Accès : extension `career_modules_spawnPoints` : `extensions.load("career_modules_spawnPoints")`, puis la globale `career_modules_spawnPoints`
---@class career_modules_spawnPoints
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_spawnPoints = {}

--- Renvoie la table des points découverts, par niveau.
---Source : lua/ge/extensions/career/modules/spawnPoints.lua:77
---@return table<string, table<string, boolean>>  niveau -> nom du point -> true.
function career_modules_spawnPoints.getUnlockedSpawnpointsData() end

--- Indique si un point d'apparition est découvert (crée l'entrée de niveau si besoin).
---Source : lua/ge/extensions/career/modules/spawnPoints.lua:91
---@param level string Identifiant du niveau.
---@param spawnPointName string Nom de l'objet du point (objectname).
---@return boolean|nil  true si découvert, nil sinon.
function career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName) end

--- Hook : charge les points découverts quand la carrière devient active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/spawnPoints.lua:103
---@param active boolean Rien si false.
function career_modules_spawnPoints.onCareerActive(active) end

--- Hook : charge les points découverts si la carrière est déjà active (renvoie false sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/spawnPoints.lua:98
function career_modules_spawnPoints.onExtensionLoaded() end

--- Hook de sauvegarde : écrit spawnPoints.json dans <save>/career/.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/spawnPoints.lua:109
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath) end

--- Hook appelé chaque frame : toutes les secondes (dtReal cumulé), recherche un point non découvert à moins de 75 m du véhicule joueur et le débloque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/spawnPoints.lua:28
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation (s), non utilisé.
---@param dtRaw number Temps brut (s), non utilisé.
function career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw) end

