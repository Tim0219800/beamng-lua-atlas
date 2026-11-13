---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/jobsystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_jobsystem` : mini ordonnanceur de tâches coopératives basé sur des coroutines Lua. Un moddeur y met un traitement long (scan de fichiers, calcul lourd) pour l'étaler sur plusieurs images au lieu de bloquer le jeu. La fonction du job reçoit un objet `job` avec `job.yield()` (rend la main si le budget de temps est dépassé) et `job.sleep(secondes)` (pause sans bloquer le jeu). Toutes les coroutines sont reprises une fois par image dans onUpdate.
--- Accès : extension `core_jobsystem` : `extensions.load("core_jobsystem")`, puis la globale `core_jobsystem`
---@class core_jobsystem
core_jobsystem = {}

--- Retire un job de la liste pour qu'il ne soit plus repris. N'appelle pas son exit callback ni onJobDone ; la coroutine est abandonnée.
---Source : lua/ge/extensions/core/jobsystem.lua:146
---@param jobHandle table Objet renvoyé par create.
---@return boolean  true si le job a été trouvé et retiré.
function core_jobsystem.cancelJob(jobHandle) end

--- Crée et enregistre un job (coroutine) exécuté par morceaux à chaque image. La fonction est appelée avec (job, ...).
---Source : lua/ge/extensions/core/jobsystem.lua:43
---@param fct function Fonction de travail, fct(job, ...).
---@param maxdt number|nil Budget de temps en secondes entre deux yield effectifs ; défaut 0.01.
---@param ... any Arguments passés à fct après job.
---@return table  Objet job : {yield(), sleep(secs), setExitCallback(fn), running, fct, maxdt}. exitcbl est appelé avec le job à sa fin.
function core_jobsystem.create(fct, maxdt, ...) end

--- Cherche des fichiers sous un dossier : correspondances directes à la racine, puis recherche récursive native par sous-dossier de premier niveau, avec un appel à yieldFn après chacun. À appeler depuis un job en passant job.yield.
---Source : lua/ge/extensions/core/jobsystem.lua:161
---@param rootPath string Dossier racine.
---@param pattern string Motif de fichier (ex. '*.json').
---@param yieldFn function|nil Appelée avec un texte de debug après chaque sous-dossier ; défaut nop.
---@return string[]  Chemins trouvés.
function core_jobsystem.findFilesAsync(rootPath, pattern, yieldFn) end

--- Nombre de jobs actuellement en cours.
---Source : lua/ge/extensions/core/jobsystem.lua:140
---@return integer  Nombre de jobs.
function core_jobsystem.getRunningJobCount() end

--- Hook par image (appelé avec les dt du jeu) : reprend chaque coroutine, loggue les erreurs, supprime les jobs terminés, appelle leur exitCallback puis émet onJobDone.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/jobsystem.lua:102
---@param dtReal number Delta temps réel en secondes.
---@param dtSim number Delta temps de simulation en secondes.
---@param dtRaw number Delta temps brut en secondes.
function core_jobsystem.onUpdate(dtReal, dtSim, dtRaw) end

--- Renvoie une fonction qui lance fct comme job, sauf si une instance de fct tourne déjà (dans ce cas l'appel est ignoré).
---Source : lua/ge/extensions/core/jobsystem.lua:89
---@param fct function Fonction de travail du job.
---@param maxdt number|nil Budget en secondes, comme pour create.
---@return function  function(...) qui crée le job ; ne renvoie rien.
function core_jobsystem.wrap(fct, maxdt) end

