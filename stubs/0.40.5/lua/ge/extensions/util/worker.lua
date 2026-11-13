---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/worker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exécuteur de tâches hors ligne : lit un fichier JSON `/work.json` contenant une liste d'éléments de travail ({type=..., ...}) et les exécute un par un (compilation de maillages .dae en .cdae, compilation d'imposteurs, rendu d'aperçus de véhicules, test de mods, mesures de performances, calibrage de l'ESC), puis quitte le jeu avec `shutdown(0)` quand plus aucun job n'est en cours. Prévu pour des lancements automatisés (ligne de commande), pas pour le jeu normal.
--- Accès : extension `util_worker` : `extensions.load("util_worker")`, puis la globale `util_worker`
---@class util_worker
util_worker = {}

--- Passe l'extension en déchargement manuel, charge les extensions test/renderVehiclePreview, util/saveDynamicData, util/calibrateESC et util/compileImposters, puis lit le fichier de tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/worker.lua:115
function util_worker.onExtensionLoaded() end

--- Hook appelé quand un job du système de jobs se termine : si les tâches ont déjà été mises en file et qu'il ne reste plus aucun job, quitte le jeu (shutdown(0)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/worker.lua:97
---@param job any job terminé (non utilisé)
---@param totalRunning integer nombre de jobs encore en cours
function util_worker.onJobDone(job, totalRunning) end

--- Après 120 images, exécute tous les éléments de travail via la table N, puis, quand core_jobsystem n'a plus de job en cours, arrête le jeu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/worker.lua:126
---@param dt number temps écoulé (non utilisé)
function util_worker.onPreRender(dt) end

--- Table des gestionnaires de tâches, indexée par le champ `type` d'un élément de work.json. Chaque méthode reçoit l'élément `w` (table JSON).
---@class util_worker_N
local util_worker_N = {}

--- Lance util_calibrateESC.work(w.pcFile, w.vehicle) pour calibrer l'ESC.
---Source : lua/ge/extensions/util/worker.lua:91
---@param w table élément de travail ; champs pcFile, vehicle
function util_worker_N.calibrateESC(w) end

--- Met en file la compilation des imposteurs des niveaux w.levels via util_compileImposters.
---Source : lua/ge/extensions/util/worker.lua:70
---@param w table élément de travail ; champ levels
function util_worker_N.compileImposters(w) end

--- Charge les matériaux du dossier de w.filename, puis compile ce fichier .dae en .cdae (avec un fichier *meshes.json). Erreur si w.filename est absent.
---Source : lua/ge/extensions/util/worker.lua:50
---@param w table élément de travail ; champ filename = chemin du .dae
function util_worker_N.compileMesh(w) end

--- Affiche w.vehicles dans le journal puis lance test_renderVehiclePreview.renderVehiclePreview.
---Source : lua/ge/extensions/util/worker.lua:80
---@param w table élément de travail ; champ vehicles
function util_worker_N.renderVehiclePreview(w) end

--- Vérifie que w.filename existe ; le test réel n'est pas implémenté (TODO dans le code).
---Source : lua/ge/extensions/util/worker.lua:60
---@param w table élément de travail ; champ filename
function util_worker_N.testImage(w) end

--- Appelle extensions.test_testMods.work avec w.tagid, w.resource_version_id et w.disableSpinScr.
---Source : lua/ge/extensions/util/worker.lua:76
---@param w table élément de travail ; champs tagid, resource_version_id, disableSpinScr
function util_worker_N.testMod(w) end

--- Lance util_saveDynamicData.work(w.pcFile, w.vehicle) pour mesurer les performances des véhicules.
---Source : lua/ge/extensions/util/worker.lua:85
---@param w table élément de travail ; champs pcFile, vehicle
function util_worker_N.testVehiclesPerformances(w) end

