---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/runtime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur générique de didacticiel : il enchaîne des « étapes » qui sont chacune une extension Lua distincte (préfixe + identifiant d'étape). Il charge/décharge l'extension de l'étape courante, mémorise la progression (étapes terminées, étape courante) et relaie onUpdate/onPreRender vers l'étape active, vers le suivi de dégâts, les marqueurs et le système de limites de zone. Un moddeur s'en sert en appelant configure() puis start().
--- Accès : extension `gameplay_tutorial_runtime` : `extensions.load("gameplay_tutorial_runtime")`, puis la globale `gameplay_tutorial_runtime`
---@class gameplay_tutorial_runtime
---@field dependencies string[] Extensions chargées avant celle-ci : gameplay_tutorial_setup, _markers, _damageTracker et _bounds.
---@field sharedTutorialData table Table vide partagée que les étapes peuvent utiliser pour s'échanger des données.
gameplay_tutorial_runtime = {}

--- Nettoie et décharge l'étape précédente, charge l'extension de la nouvelle étape, met à jour la progression et appelle son setup({}).
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:150
---@param stepId string|integer Identifiant d'étape présent dans stepOrder.
---@return boolean  false si inactif, id invalide ou extension introuvable.
function gameplay_tutorial_runtime.activateStep(stepId) end

--- Termine l'étape courante puis active la suivante ; s'il n'y en a plus, appelle endTutorial().
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:200
---@return boolean  false si inactif ou si l'étape courante n'est pas dans stepOrder.
function gameplay_tutorial_runtime.advanceToNextStep() end

--- Marque une étape comme terminée dans completedSteps.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:192
---@param stepId string Identifiant de l'étape.
---@return boolean  false si le didacticiel n'est pas actif.
function gameplay_tutorial_runtime.completeStep(stepId) end

--- Fixe la configuration : ordre des étapes, préfixe des extensions d'étape, préfabs initiaux, chargement des sites et des actions bloquées au démarrage, callbacks onStarted/onEnded. Branche aussi les getters du module bounds et des marqueurs (véhicule du didacticiel).
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:57
---@param opts table Champs facultatifs : stepOrder (liste d'ids), stepExtensionPrefix, initialPrefabs, loadSitesOnStart, setupBlockedActionsOnStart, onStarted, onEnded.
function gameplay_tutorial_runtime.configure(opts) end

--- Fin normale : cleanup de l'étape, des marqueurs, du suivi de dégâts, des limites et du setup ; passe isCompleted à true, efface la liste de tâches de l'interface (ClearTasklist) et appelle onEnded.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:227
---@return boolean  false si le didacticiel n'était pas actif.
function gameplay_tutorial_runtime.endTutorial() end

--- Identifiant de l'étape courante.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:103
---@return string|nil  nil si aucune étape n'est active.
function gameplay_tutorial_runtime.getCurrentStep() end

--- Renvoie la table de progression interne (pas une copie).
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:95
---@return table  {currentStepId, completedSteps, isCompleted}
function gameplay_tutorial_runtime.getProgressData() end

--- Identifiant d'étape à une position donnée de l'ordre configuré.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:111
---@param index integer Position à partir de 1.
---@return string|nil  nil hors limites.
function gameplay_tutorial_runtime.getStepIdByIndex(index) end

--- Renvoie la liste ordonnée des identifiants d'étapes configurée.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:107
---@return string[]  Liste des ids.
function gameplay_tutorial_runtime.getStepOrder() end

--- Indique si le didacticiel est en cours.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:99
---@return boolean  true entre start() et endTutorial()/stop().
function gameplay_tutorial_runtime.isActive() end

--- Hook appelé avant le rendu : relaie à l'étape active (dtReal, dtSim seulement) et au module bounds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:293
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook appelé à chaque image par le moteur d'extensions : transmet l'id du véhicule du didacticiel au damageTracker, relaie à l'étape active, met à jour dégâts, marqueurs et limites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:277
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw) end

--- Remplace la progression (étape courante, étapes terminées, drapeau terminé), typiquement après chargement d'une sauvegarde.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:88
---@param data table Table avec currentStepId, completedSteps (table id -> true) et isCompleted.
function gameplay_tutorial_runtime.setProgressData(data) end

--- Démarre le didacticiel : active les préfabs initiaux, charge les sites, installe les actions bloquées, puis active l'étape mémorisée (ou la première si elle est invalide). Appelle onStarted en cas de succès.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:115
---@return boolean  false si déjà actif, si stepOrder est vide ou si l'étape n'a pas pu être activée.
function gameplay_tutorial_runtime.start() end

--- Décharge l'étape active sans marquer le didacticiel comme terminé et sans nettoyer les autres modules.
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:262
function gameplay_tutorial_runtime.stop() end

