---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Couche d'affichage (UI) du drift. Chaque frame, publie sur le stream UI "drift" l'état de chaque véhicule suivi (score permanent, score potentiel, score en cache, combo, temps de combo restant, creep, angle, vitesse, facteur de performance, phase de présentation du score confirmé). Réagit aux hooks de score, crash, spinout, zones de cascade, spots et paliers par des messages flash (TopCenterAppsFlashMessage) et des évènements guihooks, et affiche/masque les apps UI de drift (scoreboard, tasks, driftScores, flashMessage) selon le contexte de gameplay_drift_general. Chargé par general dans les contextes inChallenge, inFreeroamChallenge, inFreeroamCruising et inSplitscreen.
--- Accès : extension `gameplay_drift_display` : `extensions.load("gameplay_drift_display")`, puis la globale `gameplay_drift_display`
---@class gameplay_drift_display
---@field dependencies string[] gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, ui_apps_genericMissionData, ui_appContainers.
gameplay_drift_display = {}

--- Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/display.lua:494
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_display.getDriftDebugInfo() end

--- Indique si l'animation du score confirmé est en cours pour ce véhicule.
---Source : lua/ge/extensions/gameplay/drift/display.lua:70
---@param vehId integer Id du véhicule.
---@return boolean  true si la phase n'est pas idle.
function gameplay_drift_display.getIsScorePresentationActive(vehId) end

--- Renvoie la durée totale de la présentation du score confirmé (hold + dwindle + linger). Utilisée par driftSpots pour attendre la fin de l'animation.
---Source : lua/ge/extensions/gameplay/drift/display.lua:56
---@return number  Durée en secondes (2.0).
function gameplay_drift_display.getScorePresentationDuration() end

--- Hook : restaure driftDebugUILayout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:453
---@param data table Table de onSerialize.
function gameplay_drift_display.onDeserialized(data) end

--- Hook : message flash et évènement stuntZoneScored (type donut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:171
---@param score number Points gagnés.
function gameplay_drift_display.onDonutDriftScored(score) end

--- Hook : le score en cache a été réinitialisé ; efface le message temps réel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:407
---@param vehId integer Véhicule concerné.
function gameplay_drift_display.onDriftCachedScoreReset(vehId) end

--- Hook : lance la présentation du score confirmé, affiche « +points » et notifie l'UI (setDriftPersistentDriftScored).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:143
---@param data table {vehId, addedScore, combo}.
function gameplay_drift_display.onDriftCompletedScored(data) end

--- Hook : montre ou masque les apps UI de drift selon le nouveau contexte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:463
---@param context string Nouveau contexte de gameplay_drift_general.
function gameplay_drift_display.onDriftContextChanged(context) end

--- Hook : affiche l'échec « crashed » dans l'UI et remet le lisseur à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:163
---@param vehId integer Véhicule concerné.
function gameplay_drift_display.onDriftCrash(vehId) end

--- Hook : à la désactivation du debug, masque l'interface de drift.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:457
---@param value boolean Nouvel état du debug.
function gameplay_drift_display.onDriftDebugChanged(value) end

--- Hook : véhicule du joueur remis en place ; remet à zéro lisseur, présentation du score et message temps réel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:401
---@param vehId integer Véhicule concerné.
function gameplay_drift_display.onDriftPlVehReset(vehId) end

--- Hook : envoie un quick message à l'UI (displayDriftScoreModifier).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:396
---@param data table {msg, displayTime, vehId?}.
function gameplay_drift_display.onDriftQuickMessageDisplay(data) end

--- Hook : le score en cours est validé de force (fin de spot) ; lance la présentation et affiche les points bonus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:436
---@param score number Score validé.
---@param vehId integer Véhicule concerné.
function gameplay_drift_display.onDriftScoreWrappedUp(score, vehId) end

--- Hook : affiche l'échec « spinout » dans l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:167
---@param vehId integer Véhicule concerné.
function gameplay_drift_display.onDriftSpinout(vehId) end

--- Hook : message flash de fin de spot (nouveau record ou zone terminée) avec le score.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:392
---@param data table {newRecord, score, duration}.
function gameplay_drift_display.onDriftSpotCompleted(data) end

--- Hook : message flash de 2 s avec le texte de la raison d'échec.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:432
---@param data table {reason = {msg = clé de traduction}, ...}.
function gameplay_drift_display.onDriftSpotFailed(data) end

--- Hook : applique tout de suite l'UI correspondant au contexte drift déjà actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:480
function gameplay_drift_display.onExtensionLoaded() end

--- Hook : masque l'UI, vide les données et publie un stream vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:411
function gameplay_drift_display.onExtensionUnloaded() end

--- Hook : message flash « nouveau meilleur score ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:428
function gameplay_drift_display.onFreeroamDriftZoneNewHighscore() end

--- Hook : message flash et évènement stuntZoneScored (type hitPole).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:186
---@param score number Points gagnés.
function gameplay_drift_display.onHitPoleScored(score) end

--- Hook : message flash et évènement stuntZoneScored (type nearPole).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:176
---@param score number Points gagnés.
function gameplay_drift_display.onNearPoleScored(score) end

--- Hook : affiche le nom du nouveau palier en message flash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:442
---@param tierData table Données du palier (name utilisé).
function gameplay_drift_display.onNewDriftTierReached(tierData) end

--- Hook : sauvegarde driftDebugUILayout avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:447
---@return table  {driftDebugUILayout}
function gameplay_drift_display.onSerialize() end

--- Hook : message flash et évènement stuntZoneScored (type tightDrift).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:181
---@param score number Points gagnés.
function gameplay_drift_display.onTightDriftScored(score) end

--- Appelé à chaque frame (sauf après déchargement) : fenêtre de debug, publication du stream drift, messages de contresens, de sortie de limites et de distance restante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:381
---@param dtReal number Delta temps réel en secondes, utilisé pour les animations.
---@param dtSim number Delta temps simulé (inutilisé).
---@param dtRaw number Delta temps brut (inutilisé).
function gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : supprime lisseur et présentation du véhicule détruit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/display.lua:423
---@param vehId integer Véhicule détruit.
function gameplay_drift_display.onVehicleDestroyed(vehId) end

--- Vide les lisseurs de creep, les présentations de score, le pool de données joueur et les données de gameplay_ui genericMissionData.
---Source : lua/ge/extensions/gameplay/drift/display.lua:487
function gameplay_drift_display.reset() end

