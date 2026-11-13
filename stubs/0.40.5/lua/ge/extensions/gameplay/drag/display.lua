---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affichage de la piste de drag : arbre de départ (feux pré-stage, stage, trois ambres, vert, rouge, bleu global, feu gagnant, feu conducteur clignotant), panneaux de chrono/vitesse (chiffres 5 par couloir, temps en 3 décimales, vitesse en mph avec 2 décimales), messages flash, repère de guidage de staging, et événements UI (guihooks) pour l'app d'arbre. Il pilote les objets de scène nommés par couloir (displayTime1..5, displaySpeed1..5, displayLight) et applique les états reçus du réseau en multijoueur. Chargée à la demande par gameplay_drag_core ; un moddeur s'en sert surtout via les hooks et pour allumer/éteindre des feux.
--- Accès : extension `gameplay_drag_display` : `extensions.load("gameplay_drag_display")`, puis la globale `gameplay_drag_display`
---@class gameplay_drag_display
---@field alwaysShowStageApp boolean true par défaut : garde l'app de staging visible quelle que soit la distance à la ligne de stage.
---@field dependencies string[] gameplay_drag_core, gameplay_drag_phaseHandlers.
gameplay_drag_display = {}

--- Affiche ou cache le voyant de staging de l'UI (guihook updateTreeLightStaging), et le répète pour chaque joueur multiseat.
---Source : lua/ge/extensions/gameplay/drag/display.lua:117
---@param visible boolean true pour afficher.
function gameplay_drag_display.broadcastTreeLightStaging(visible) end

--- Éteint tous les feux de l'arbre, cache les chiffres des panneaux et le repère de staging, annule un flash en cours et réinitialise la graine aléatoire.
---Source : lua/ge/extensions/gameplay/drag/display.lua:684
function gameplay_drag_display.clearAll() end

--- Ligne d'arrivée franchie : met à jour les panneaux (temps et vitesse) du couloir du racer.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1651
---@param vehId integer ID du véhicule du racer.
function gameplay_drag_display.dragRaceEndLineReached(vehId) end

--- Véhicule arrêté après la course : envoie updateTreeLightPhase=false à l'UI. N'efface pas les résultats affichés.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1655
function gameplay_drag_display.dragRaceVehicleStopped() end

--- Hook émis par core avant de décharger les extensions drag ; fait clearAll (même fonction).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:684
function gameplay_drag_display.onBeforeDragUnloadAllExtensions() end

--- Hook de clear complet : vide les caches joueur, fait clearAll puis lance un flash « reset système » (feux et chiffres clignotent 2 fois puis restent éteints) à partir d'un cache de la piste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:1724
---@param options table Options du clear (non utilisées).
function gameplay_drag_display.onDragClear(options) end

--- Hook émis par core.setDragRaceData : construit l'arbre de feux et les chiffres de la piste. En MP, ne déclenche pas le staging et garde les chiffres de la manche précédente (réinitialise seulement les feux) ; en solo fait clearAll.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:1733
---@param data table Données de piste armées.
function gameplay_drag_display.onDragDataSet(data) end

--- Hook MP : un timer d'un pilote distant est arrivé ; met à jour ses panneaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:1758
---@param raceId any Identifiant de course.
---@param mpPlayerId any Joueur MP.
---@param timerName string Nom du timer.
---@param timerValue number Valeur.
function gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue) end

--- Hook de reset : éteint les feux (mais garde les chiffres des résultats), annule un flash, remet à zéro les timers de couloir et les drapeaux treeStarted/raceStartBroadcasted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:1711
---@param options table Options (raceId...), non utilisées.
function gameplay_drag_display.onDragReset(options) end

--- Hook de chargement : init() puis clearAll().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:695
function gameplay_drag_display.onExtensionLoaded() end

--- Hook de pré-rendu : met à jour ou efface le repère de guidage de staging selon l'option dragAssistStageGuideVisualizer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:1350
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta brut (s).
function gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook par frame : applique les chiffres en attente, envoie les mises à jour d'arbre différées (MP), avance l'éventuel flash, vérifie la visibilité de l'app de staging, fait avancer le décompte de chaque racer et le clignotement du feu conducteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/display.lua:1303
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta brut (s).
function gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw) end

--- Allume le feu gagnant du couloir et fait clignoter son feu conducteur.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1365
---@param lane integer Couloir gagnant.
function gameplay_drag_display.onWinnerLightOn(lane) end

--- Éteint le feu de pré-stage du couloir du racer et met l'UI à jour.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1472
---@param vehId integer ID du véhicule.
function gameplay_drag_display.preStageLightOff(vehId) end

--- Allume le feu de pré-stage du couloir du racer, met l'UI à jour et affiche le message flash ui.drag.flash.preStage pour un racer jouable.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1437
---@param vehId integer ID du véhicule.
function gameplay_drag_display.preStageLightOn(vehId) end

--- Remet à zéro les timers de couloir de l'arbre (laneTimer, laneTimerFlag, dialOffset) et les drapeaux treeStarted/raceStartBroadcasted de chaque racer.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1681
function gameplay_drag_display.resetDragRaceValues() end

--- Éteint les ambres du racer disqualifié ; si la raison est le faux départ (redLightReason), éteint le vert et allume le rouge. Efface les panneaux, émet startRaceFromTree et affiche la raison en message flash (5 s) pour un racer jouable.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1597
---@param vehId integer ID du véhicule disqualifié.
function gameplay_drag_display.setDisqualifiedLights(vehId) end

--- Éteint le feu de stage, le feu bleu, décrémente le compteur de racers en stage et synchronise l'état (MP : drag.syncStageLightState).
---Source : lua/ge/extensions/gameplay/drag/display.lua:1537
---@param vehId integer ID du véhicule.
function gameplay_drag_display.stageLightOff(vehId) end

--- Allume le feu de stage du racer ; quand tous les couloirs sont en stage, allume le feu bleu. Met l'UI à jour, synchronise l'état (MP) et affiche ui.drag.flash.stage pour un racer jouable.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1500
---@param vehId integer ID du véhicule.
function gameplay_drag_display.stageLightOn(vehId) end

--- Démarre le décompte de l'arbre pour un racer en phase 2 'countdown' : émet onDragCountdownStarted, met treeStarted à true et règle dialOffset (dial moins le temps déjà écoulé depuis le départ MP).
---Source : lua/ge/extensions/gameplay/drag/display.lua:1568
---@param vehId integer ID du véhicule.
---@param dial number Délai avant le début de la séquence de feux (s).
function gameplay_drag_display.startDragCountdown(vehId, dial) end

--- Affiche le message flash missions.dragRace.gameplay.inLine (5 s) pour un racer jouable.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1644
---@param vehId integer ID du véhicule.
function gameplay_drag_display.stoppingVehicleDrag(vehId) end

--- Applique à un couloir l'état de feux reçu du réseau (countDownLights, stageLights) : met à jour isOn, les objets de scène, et l'UI du joueur du couloir (et multiseat). Construit l'arbre s'il n'existe pas encore.
---Source : lua/ge/extensions/gameplay/drag/display.lua:455
---@param lane integer Couloir.
---@param lightState table {countDownLights = {amberLight1..3, greenLight, redLight}, stageLights = {prestageLight, stageLight}}.
function gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState) end

