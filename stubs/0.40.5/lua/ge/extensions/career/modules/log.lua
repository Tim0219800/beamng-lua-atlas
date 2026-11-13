---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/log.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit journal texte de la carrière. Les modules appellent addLog pour accumuler des lignes en mémoire ; à chaque sauvegarde du profil, les lignes sont ajoutées (mode append) au fichier career.log du slot de sauvegarde, puis la liste est vidée.
--- Accès : extension `career_modules_log` : `extensions.load("career_modules_log")`, puis la globale `career_modules_log`
---@class career_modules_log
---@field dependencies table<integer, string> Extensions chargées avant : career_saveSystem.
career_modules_log = {}

--- Ajoute une ligne au journal en mémoire (écrite dans career.log à la prochaine sauvegarde).
---Source : lua/ge/extensions/career/modules/log.lua:11
---@param message string Texte du message.
---@param origin string|nil Nom du module émetteur ("" par défaut).
---@param severity string|nil Sévérité, "I" par défaut (la valeur n'est pas validée).
function career_modules_log.addLog(message, origin, severity) end

--- Hook appelé quand la carrière devient active : vide la liste et ajoute « Loaded game <chemin> ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/log.lua:30
---@param active boolean true à l'activation ; rien n'est fait si false.
function career_modules_log.onCareerActive(active) end

--- Hook appelé lors de la sauvegarde du profil : ajoute une ligne « Save game to ... » puis écrit (append) toutes les lignes dans <saveRoot>/<slot>/career.log et vide la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/log.lua:15
---@param currentSavePath string Chemin de la sauvegarde en cours.
function career_modules_log.onSaveCurrentProfile(currentSavePath) end

