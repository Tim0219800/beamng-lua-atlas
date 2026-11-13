---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playbookWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Enregistre l'historique des missions jouées (missionId et étoiles) dans playbook.json du dossier career de la sauvegarde. Chargé seulement quand la carrière est active.
--- Accès : extension `career_modules_playbookWriter` : `extensions.load("career_modules_playbookWriter")`, puis la globale `career_modules_playbookWriter`
---@class career_modules_playbookWriter
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_playbookWriter = {}

--- Ajoute {missionId, stars} à la fin du playbook en mémoire.
---Source : lua/ge/extensions/career/modules/playbookWriter.lua:14
---@param missionId string Identifiant de la mission.
---@param stars any Résultat en étoiles (déduit du code).
function career_modules_playbookWriter.addMissionPlayedEntry(missionId, stars) end

--- Hook : recharge le playbook quand la carrière devient active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playbookWriter.lua:37
---@param active boolean Rien si false.
function career_modules_playbookWriter.onCareerActive(active) end

--- Hook au chargement de l'extension : charge le playbook si la carrière est active (renvoie false sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playbookWriter.lua:32
function career_modules_playbookWriter.onExtensionLoaded() end

--- Hook de sauvegarde : écrit le playbook dans <save>/career/playbook.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playbookWriter.lua:43
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_playbookWriter.onSaveCurrentProfile(currentSavePath) end

