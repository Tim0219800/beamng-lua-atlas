---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/uiModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du module UI (instance par gestionnaire flowgraph, accessible via mgr.modules.ui). Garde la mise en page en cours dans self.uiLayout.
---@class flowgraph_modules_uiModule_C
local flowgraph_modules_uiModule_C = {}

--- Enregistre une fonction de rappel et renvoie la table meta du bouton (avec mgrId et funId). Ne l'ajoute pas à l'écran.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:275
---@param fun function appelée au clic
---@param meta table|nil propriétés du bouton (label, focus, main, keepLayout…)
---@return table  meta complétée
function flowgraph_modules_uiModule_C:addButton(fun, meta) end

--- Ajoute un panneau « crashTestStepDetails » avec les points de l'étape d'un crash test.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:484
---@param stepDetails table contient stepScoreData
function flowgraph_modules_uiModule_C:addCrashAnalysisStepDetails(stepDetails) end

--- Ajoute trois panneaux texte (statistiques de performance, paliers, évènements de drift) sur la page drift, avec une ligne de total.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:506
---@param driftStats table perfStats, tiersStats, driftEvents
function flowgraph_modules_uiModule_C:addDriftStats(driftStats) end

--- Définit l'en-tête de l'écran.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:267
---@param header table données d'en-tête
function flowgraph_modules_uiModule_C:addHeader(header) end

--- Ajoute un panneau « Lap Times » (page lapTimes) avec chaque tour, son temps et l'écart au meilleur (« Best » pour le meilleur).
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:614
---@param state table contient historicTimes = liste de {lapTime}
---@param attempt any non utilisé dans le code
function flowgraph_modules_uiModule_C:addLaptimesForVehicle(state, attempt) end

--- Ajoute l'élément « objectives » (étoiles de la mission) calculé depuis les réglages utilisateur et, si change est fourni, les étoiles débloquées et récompenses. Sans effet s'il n'y a pas d'activité ou si aucune étoile n'est visible.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:301
---@param change table|nil résultat de progression (unlockedStarsAttempt, starRewards…)
---@param pages table|nil pages cibles, {main = true} par défaut
function flowgraph_modules_uiModule_C:addObjectives(change, pages) end

--- Ajoute les éléments de classement (« ratings » sur la page leaderboards), puis « rewards » (carrière, si récompenses) et « unlocks » (missions/ligues débloquées) quand change est fourni.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:397
---@param change table|nil changement de progression de la tentative
function flowgraph_modules_uiModule_C:addRatings(change) end

--- Ajoute le panneau « Replay Recording » (fichiers de replay de la mission) si l'activité supporte le replay et que le menu n'est pas simple.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:204
function flowgraph_modules_uiModule_C:addReplayPanelAndSupportsReplay() end

--- Comme addButton, mais ajoute le bouton à la liste des boutons de l'écran. Ceux ajoutés avant finishUIBuilding apparaissent au-dessus du bouton Start.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:291
---@param fun function appelée au clic
---@param meta table|nil propriétés du bouton
---@return table  meta du bouton
function flowgraph_modules_uiModule_C:addScreenButton(fun, meta) end

--- Ajoute un élément (table avec type, header, pages…) à la mise en page en cours.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:259
---@param element table élément d'interface ; element.pages = {nomPage = true}
function flowgraph_modules_uiModule_C:addUIElement(element) end

--- Transforme une liste d'éléments en table de fragments HTML <ul><li>…</li></ul> (à concaténer).
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:235
---@param items string[] textes des puces
---@return string[]  fragments HTML
function flowgraph_modules_uiModule_C:buildListText(items) end

--- Remet à zéro l'état : fade, construction en cours, mise en page et contexte d'app.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:18
function flowgraph_modules_uiModule_C:clear() end

--- Vide la table des fonctions de rappel des boutons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:40
function flowgraph_modules_uiModule_C:clearButtonFunctions() end

--- Appelée au démarrage du graphe : sauvegarde l'état du prompt de récupération et le game state, désactive le prompt, charge ui_apps_genericMissionData et ui_apps_pointsBar, vide la tasklist si une activité existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:669
function flowgraph_modules_uiModule_C:executionStarted() end

--- Appelée à l'arrêt du graphe : nettoie les apps de données, réinitialise le contexte topCenter, restaure le prompt de récupération et (sauf keepGameState) le game state initial, vide la tasklist.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:684
function flowgraph_modules_uiModule_C:executionStopped() end

--- Termine la construction. En startScreen ajoute le bouton Start (qui appelle startFromUi du nœud) ; en startScreen/endScreen ajoute le panneau de replay, prépare les pages, navigue vers 'mission.control' et déclenche le guihook onRequestMissionScreenDataReady.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:166
function flowgraph_modules_uiModule_C:finishUIBuilding() end

--- Incrémente et renvoie un identifiant unique, utilisé pour le buildId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:9
---@return integer  nouvel identifiant
function flowgraph_modules_uiModule_C:getFreeId() end

--- Appelée à la création du module ; appelle clear().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:14
function flowgraph_modules_uiModule_C:init() end

--- Indique s'il faut conserver le game state à l'arrêt du graphe (sinon il est restauré à l'état du début).
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:36
---@param keep boolean true pour garder le game state actuel
function flowgraph_modules_uiModule_C:keepGameState(keep) end

--- Insère une page vide dans le layout (prévu pour startPage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:664
function flowgraph_modules_uiModule_C:nextPage() end

--- Hook : ajoute le mode de l'écran actif à la liste fournie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:229
---@param screensActive string[] liste à compléter
function flowgraph_modules_uiModule_C:onGetIsMissionStartOrEndScreenActive(screensActive) end

--- Hook appelé au clic sur un bouton de l'écran. Ignore les boutons d'un autre gestionnaire (mgrId), exécute la fonction enregistrée, puis efface la mise en page sauf si button.keepLayout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:246
---@param button table meta du bouton (mgrId, funId, keepLayout)
function flowgraph_modules_uiModule_C:onMissionScreenButtonClicked(button) end

--- Hook appelé quand l'UI demande les données de l'écran de mission. Renvoie la mise en page (guihook onRequestMissionScreenDataReady), émet le hook onMissionScreenReady et appelle activity:onMissionScreenReady(mode). Ignoré si le mode contient « test ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:219
---@param mode string mode de l'écran demandé
function flowgraph_modules_uiModule_C:onRequestMissionScreenData(mode) end

--- Change le contexte du conteneur d'apps 'topCenter' si le contexte n'est pas vide et que ui_appContainers_topCenter existe, et le mémorise.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:29
---@param context string nom du contexte
function flowgraph_modules_uiModule_C:setAppContainerContext(context) end

--- Relais vers core_gamestate.setGameState avec les mêmes arguments.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:25
---@param ... any arguments de core_gamestate.setGameState
function flowgraph_modules_uiModule_C:setGameState(...) end

--- Remplace l'icône d'une page pendant la construction.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:56
---@param pageName string nom de la page
---@param icon string nom d'icône
function flowgraph_modules_uiModule_C:setPageIcon(pageName, icon) end

--- Définit le libellé du bouton Start (clé de traduction ou texte).
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:393
---@param text string libellé
function flowgraph_modules_uiModule_C:setStartButtonText(text) end

--- Marque l'écran de départ comme simple (pas de panneau de replay).
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:200
function flowgraph_modules_uiModule_C:setStartScreenAsSimple() end

--- Calcule la table des pages (ordre, icône, libellé, obligatoire) à partir des éléments du layout et la place dans uiLayout.pages. Ajoute un panneau texte « No layout elements found » si le layout est vide. Les pages 'mandatory' ne le sont qu'en endScreen ; 'rewards' est masquée hors carrière.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:61
function flowgraph_modules_uiModule_C:setupPages() end

--- Commence la construction d'un écran : crée self.uiLayout (mode, header, layout, buttons, nœud d'origine, buildId). Refuse si une construction est déjà en cours.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:44
---@param uiMode string 'startScreen' ou 'endScreen'
---@param node table nœud flowgraph appelant (utilise node.id et node.graph.id)
function flowgraph_modules_uiModule_C:startUIBuilding(uiMode, node) end

