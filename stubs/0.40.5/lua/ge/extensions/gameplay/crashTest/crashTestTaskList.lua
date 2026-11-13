---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Alimente la liste de tâches de l'UI (évènements SetTasklistHeader et SetTasklistTask) pour le scénario de crash test. Chaque étape devient une tâche de type 'goal' identifiée par l'id du véhicule joueur (plVehId) ; libellé et sous-texte sont construits depuis l'objectif, la vitesse d'impact et les conditions de dégâts. Les hooks marquent la tâche active, échouée ou terminée.
--- Accès : extension `gameplay_crashTest_crashTestTaskList` : `extensions.load("gameplay_crashTest_crashTestTaskList")`, puis la globale `gameplay_crashTest_crashTestTaskList`
---@class gameplay_crashTest_crashTestTaskList
gameplay_crashTest_crashTestTaskList = {}

--- Marque la tâche de l'étape comme terminée (done = true).
---Source : lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:134
---@param stepData table Données de l'étape.
function gameplay_crashTest_crashTestTaskList.finishedCurrentTask(stepData) end

--- Hook appelé quand une étape échoue : marque la tâche comme échouée (fail = true). Sans effet si stepData est nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:118
---@param stepData table|nil Données de l'étape.
function gameplay_crashTest_crashTestTaskList.onCrashTestStepFailed(stepData) end

--- Hook appelé au déchargement de l'extension : retire toutes les tâches de l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:148
function gameplay_crashTest_crashTestTaskList.onExtensionUnloaded() end

--- Hook appelé au début d'une étape : envoie la tâche correspondante comme active (ni terminée ni échouée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:104
---@param stepData table Données de l'étape.
function gameplay_crashTest_crashTestTaskList.onNewCrashTestStep(stepData) end

--- Retire toutes les tâches de l'UI (clear = true pour chaque étape).
---Source : lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:152
function gameplay_crashTest_crashTestTaskList.reset() end

--- Mémorise la liste des étapes, affiche l'en-tête « Crash analysis steps » et crée la première tâche (inactive).
---Source : lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:97
---@param crashTestData_ table<integer, table> Liste des données d'étapes du crash test.
function gameplay_crashTest_crashTestTaskList.setCrashTestDataAndInit(crashTestData_) end

