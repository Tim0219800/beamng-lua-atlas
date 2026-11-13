---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tutoriel de la carrière, en 9 étapes (01enterVehicle à 09spmSignup). Ce module est une fine couche au-dessus de gameplay_tutorial_runtime : il lui fournit l'ordre des étapes, le préfixe des extensions d'étapes (career_modules_tutorial_step<id>), les préfabriqués initiaux et l'action de fin, et il sauvegarde la progression dans <profil>/career/tutorialState.json.
--- Accès : extension `career_modules_tutorial` : `extensions.load("career_modules_tutorial")`, puis la globale `career_modules_tutorial`
---@class career_modules_tutorial
---@field dependencies string[] gameplay_tutorial_runtime, _setup, _markers, _damageTracker, _bounds.
---@field sharedTutorialData table Données partagées entre étapes, issues de gameplay_tutorial_runtime.
career_modules_tutorial = {}

--- Active directement une étape.
---Source : lua/ge/extensions/career/modules/tutorial.lua:164
---@param stepId string Id de l'étape.
---@return boolean  Succès.
function career_modules_tutorial.activateStep(stepId) end

--- Passe à l'étape suivante.
---Source : lua/ge/extensions/career/modules/tutorial.lua:180
---@return boolean  Succès.
function career_modules_tutorial.advanceToNextStep() end

--- Marque une étape comme terminée.
---Source : lua/ge/extensions/career/modules/tutorial.lua:172
---@param stepId string Id de l'étape.
---@return boolean  Succès.
function career_modules_tutorial.completeStep(stepId) end

--- Termine le tutoriel (déclenche l'action de fin configurée).
---Source : lua/ge/extensions/career/modules/tutorial.lua:188
---@return boolean  Succès.
function career_modules_tutorial.endTutorial() end

--- Retourne les étapes terminées.
---Source : lua/ge/extensions/career/modules/tutorial.lua:204
---@return table  completedSteps du runtime (vide si aucune).
function career_modules_tutorial.getCompletedSteps() end

--- Retourne l'id de l'étape courante.
---Source : lua/ge/extensions/career/modules/tutorial.lua:144
---@return string|nil  Ex. "03basicManeuvers".
function career_modules_tutorial.getCurrentStep() end

--- Retourne l'id d'étape à un indice donné (à partir de 1).
---Source : lua/ge/extensions/career/modules/tutorial.lua:152
---@param index integer Indice dans l'ordre des étapes.
---@return string|nil  Id de l'étape.
function career_modules_tutorial.getStepIdByIndex(index) end

--- Retourne la liste ordonnée des ids d'étapes.
---Source : lua/ge/extensions/career/modules/tutorial.lua:148
---@return string[]  Les 9 étapes.
function career_modules_tutorial.getStepOrder() end

--- Indique si le tutoriel est en cours.
---Source : lua/ge/extensions/career/modules/tutorial.lua:140
---@return boolean  Résultat du runtime.
function career_modules_tutorial.isActive() end

--- Hook appelé quand la carrière devient active ; démarre le tutoriel si activé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial.lua:132
---@return boolean|nil  false si le tutoriel est désactivé.
function career_modules_tutorial.onCareerActive() end

--- Hook de chargement : configure le runtime, lit tutorialState.json du profil courant et envoie la progression au runtime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial.lua:94
function career_modules_tutorial.onExtensionLoaded() end

--- Hook de déchargement : arrête le runtime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial.lua:120
function career_modules_tutorial.onExtensionUnloaded() end

--- Pendant le tutoriel, ajoute à la liste de POI le point « garage » (tutorial_apm_parking) sur la place de parking garageExteriorPark, avec icône, nom et miniature de la grande carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial.lua:209
---@param elements table Liste de POI à compléter (table.insert).
function career_modules_tutorial.onGetRawPoiListForTutorial(elements) end

--- Hook de pré-rendu : relaie au runtime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial.lua:200
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook de sauvegarde du profil : écrit la progression dans tutorialState.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial.lua:126
---@param currentSavePath string Dossier de sauvegarde du profil.
function career_modules_tutorial.onSaveCurrentProfile(currentSavePath) end

--- Hook de mise à jour : relaie au runtime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial.lua:196
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw) end

--- Démarre le tutoriel via le runtime.
---Source : lua/ge/extensions/career/modules/tutorial.lua:156
---@return boolean  Succès.
function career_modules_tutorial.start() end

