---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/richPresence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la « présence enrichie » du jeu : le statut affiché dans Steam (rich presence et timeline Steam), l'activité UDS (startActivityByID) et le statut Discord. Il déduit l'activité courante (replay, mode photo, carrière et ses sous-modes, garage, mission, scénario, drag, crawl, drift, niveau, menu principal) et le texte du statut (par exemple « Playing X on Niveau with Marque Modèle »), et il ajoute des évènements à la timeline Steam (crash, rollover, tentative, tour de course, résultat…). Les fonctions set et setActivity sont remplacées par nop quand la fonction est désactivée (versions de développement ou réglage richPresence à faux).
--- Accès : extension `util_richPresence` : `extensions.load("util_richPresence")`, puis la globale `util_richPresence`
---@class util_richPresence
---@field onDeserialized function nop (à ne pas supprimer, selon le commentaire du code)
---@field richPresenceEnabled boolean true si les fonctions set/setActivity sont actives
---@field state table {levelName, vehicleName, levelIdentifier, vehicleJbeam?} : état utilisé pour composer le message
util_richPresence = {}

--- Hook appelé à la fin d'un niveau : passe la timeline Steam en mode écran de chargement (4).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:526
---@param levelpath string Chemin du niveau
function util_richPresence.clientEndMission(levelpath) end

--- Hook appelé avant le démarrage d'un niveau : passe la timeline Steam en mode écran de chargement (4).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:526
---@param levelpath string Chemin du niveau
function util_richPresence.clientPreStartMission(levelpath) end

--- Hook appelé quand une mission change : met à jour le message et l'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:398
function util_richPresence.onAnyMissionChanged() end

--- Hook appelé à la réussite d'une tentative : évènement « Completed » dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:616
---@param attemptData table Données de la tentative (non utilisées)
function util_richPresence.onAttemptCompleted(attemptData) end

--- Hook appelé à l'échec d'une tentative : évènement « Failed » dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:606
---@param attemptData table Données de la tentative (non utilisées)
function util_richPresence.onAttemptFailed(attemptData) end

--- Hook : recalcule l'activité quand la carrière devient active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:230
function util_richPresence.onCareerActive() end

--- Hook appelé après le démarrage d'un niveau : mémorise l'identifiant et le nom lisible du niveau, met à jour le message et l'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:357
---@param levelPath string Chemin du niveau
function util_richPresence.onClientPostStartMission(levelPath) end

--- Hook : recalcule l'activité à la fin d'un parcours de crawl.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:242
function util_richPresence.onCrawlCleared() end

--- Hook : recalcule l'activité au début d'un parcours de crawl.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:241
function util_richPresence.onCrawlStarted() end

--- Hook : recalcule l'activité au début du mode livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:231
function util_richPresence.onDeliveryModeStarted() end

--- Hook : recalcule l'activité à la fin du mode livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:232
function util_richPresence.onDeliveryModeStopped() end

--- Hook : recalcule l'activité à l'effacement des données de drag.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:239
function util_richPresence.onDragClear() end

--- Hook : recalcule l'activité une fois l'effacement du drag terminé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:240
function util_richPresence.onDragClearComplete() end

--- Hook : recalcule l'activité quand les données de drag sont définies.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:238
function util_richPresence.onDragDataSet() end

--- Hook : recalcule l'activité à la réinitialisation du drag.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:237
function util_richPresence.onDragReset() end

--- Hook : recalcule l'activité quand le contexte de drift change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:243
function util_richPresence.onDriftContextChanged() end

--- Hook appelé à l'ouverture de l'éditeur : message « Using World Editor » et mode de jeu Steam 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:379
function util_richPresence.onEditorActivated() end

--- Hook appelé à la fermeture de l'éditeur : met à jour le message et remet le mode de jeu Steam à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:386
function util_richPresence.onEditorDeactivated() end

--- Appelé au chargement : initialise la présence enrichie Steam et Discord selon les réglages et enregistre les rappels de statistiques pour la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:440
function util_richPresence.onExtensionLoaded() end

--- Appelé au déchargement : efface le statut Steam et l'activité Discord et retire les rappels de statistiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:460
function util_richPresence.onExtensionUnloaded() end

--- Hook appelé quand l'état du jeu change : met à jour le message et l'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:393
---@param state table Nouvel état (non utilisé directement)
function util_richPresence.onGameStateUpdate(state) end

--- Hook appelé quand une tentative de mission est agrégée : évènement « Mission <type> » avec le nom de la mission dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:669
---@param attempt table Tentative (champ type utilisé)
---@param mission table Mission (champ name utilisé)
function util_richPresence.onMissionAttemptAggregated(attempt, mission) end

--- Hook appelé au début d'une tentative : évènement « New attempt » dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:596
---@param attemptData table Données de la tentative (non utilisées)
function util_richPresence.onNewAttempt(attemptData) end

--- Hook : recalcule l'activité à l'annulation d'un achat de pièces.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:236
function util_richPresence.onPartShoppingCancelled() end

--- Hook : recalcule l'activité au début d'une session d'achat de pièces.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:233
function util_richPresence.onPartShoppingStarted() end

--- Hook : recalcule l'activité après une transaction d'achat de pièces.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:234
function util_richPresence.onPartShoppingTransactionComplete() end

--- Hook appelé au choix d'une branche de course : évènement « Race branch » dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:647
---@param data table Données de la branche (non utilisées)
function util_richPresence.onRaceBranchChosen(data) end

--- Hook appelé à la fin d'un tour : évènement « Race lap N » avec le temps formaté mm:ss.mmm dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:636
---@param data table Contient lap (numéro de tour) et time (secondes)
function util_richPresence.onRaceLap(data) end

--- Hook appelé au résultat de course : évènement « Race Result » avec le temps final formaté dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:658
---@param data table Contient finalTime (secondes)
function util_richPresence.onRaceResult(data) end

--- Hook appelé au passage d'un point de course : évènement « Race waypoint » dans la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:626
---@param data table Données du point (non utilisées)
function util_richPresence.onRaceWaypointReached(data) end

--- Hook appelé à la réinitialisation du gameplay : ajoute un évènement « reset » à la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:586
function util_richPresence.onResetGameplay() end

--- Hook : recalcule l'activité au changement de scénario.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:235
function util_richPresence.onScenarioChange() end

--- Hook appelé quand les réglages changent : active ou désactive la présence enrichie (Steam, Discord, set/setActivity) selon richPresence et richPresenceDiscord.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:493
function util_richPresence.onSettingsChanged() end

--- Hook appelé au changement d'état de l'interface : met à jour le mode de jeu et la description d'état de la timeline Steam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:562
---@param toState string Nouvel état (menu.*, loading, scenario-*, autre)
---@param fromState string Ancien état
function util_richPresence.onUiChangedState(toState, fromState) end

--- Hook appelé quand l'interface est prête : déduit le mode de jeu Steam (menu, chargement, mise en place, jeu) de l'état courant et met à jour l'activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:533
function util_richPresence.onUiReady() end

--- Hook appelé au changement de véhicule joueur : relit le nom et la marque du véhicule (info.json) et met à jour le message.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:339
---@param oldId integer Ancien identifiant de véhicule
---@param newId integer Nouvel identifiant de véhicule
---@param player integer Index du joueur
function util_richPresence.onVehicleSwitched(oldId, newId, player) end

--- Hook : recalcule l'activité quand l'état du monde change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/richPresence.lua:244
---@param levelpath string Chemin du niveau (non utilisé)
function util_richPresence.onWorldReadyState(levelpath) end

--- Définit le texte de rich presence Steam (clé 'b') ; renvoie le succès. Remplacée par nop si la présence enrichie est désactivée. (assignée dynamiquement)
---Source : lua/ge/extensions/util/richPresence.lua:dyn
---@param v any Texte à afficher (converti avec tostring)
---@return boolean|nil  true en cas de succès (retour de OnlineServiceProvider.setRichPresence)
function util_richPresence.set(v) end

--- Démarre une activité UDS par identifiant si elle diffère de la dernière envoyée. Remplacée par nop si désactivée. (assignée dynamiquement)
---Source : lua/ge/extensions/util/richPresence.lua:dyn
---@param activityId string Identifiant de l'activité (voir la table activities du fichier)
function util_richPresence.setActivity(activityId) end

