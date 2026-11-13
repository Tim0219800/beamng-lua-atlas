---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les spots de drift du roaming libre (et de la carrière) : zones de départ/arrivée sous forme de lignes (lineOne/lineTwo), à traverser en drift. Il détecte le départ (le joueur drifte dans le rectangle d'une ligne, dans le sens de startDir), passe en contexte inFreeroamChallenge, configure les limites (gameplay_drift_bounds) et le trajet (gameplay_drift_destination), puis détecte la fin propre (ligne d'arrivée franchie à contresens de sa startDir) ou impropre (contresens, hors route, arrêt, remise en place du véhicule). Enregistre le score (10 meilleurs), valide les objectifs et expose les spots comme POI sur la carte.
--- Accès : extension `gameplay_drift_freeroam_driftSpots` : `extensions.load("gameplay_drift_freeroam_driftSpots")`, puis la globale `gameplay_drift_freeroam_driftSpots`
---@class gameplay_drift_freeroam_driftSpots
---@field dependencies string[] gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_saveLoad.
gameplay_drift_freeroam_driftSpots = {}

--- Teste si le joueur démarre un spot par la ligne indiquée : il doit être dans le rectangle de la ligne, rouler dans le sens de startDir (produit scalaire > 0) et être en train de drifter. Si oui, lance le spot (contexte inFreeroamChallenge, limites, trajet, hook onDriftSpotStarted, tasklist). Sans effet si déjà dans un défi, en multiseat ou en gamemode multijoueur. Logge une erreur si l'id de ligne est inconnu.
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:244
---@param lineId string Id de ligne de la forme spotId..lineName (clé de la table lines).
function gameplay_drift_freeroam_driftSpots.detectStart(lineId) end

--- Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:379
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_freeroam_driftSpots.getDriftDebugInfo() end

--- Renvoie la quantité de garbage mesurée par le profileur (0 hors debug).
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:387
---@return number  Garbage de la section « Drift driftSpots ».
function gameplay_drift_freeroam_driftSpots.getGC() end

--- Indique si un spot de drift est en cours.
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:391
---@return boolean  true pendant un défi de spot.
function gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge() end

--- Indique si le spot est dans sa phase de conclusion (réussite ou échec), pendant laquelle le drift est gelé.
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:383
---@return boolean  true pendant les ~2.5 s de conclusion.
function gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase() end

--- Hook : fin de niveau ; nettoie la tasklist et l'état du spot en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:482
function gameplay_drift_freeroam_driftSpots.onClientEndMission() end

--- Hook : démarrage de niveau ; vide le cache de gameplay_drift_saveLoad et reconstruit les lignes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:491
function gameplay_drift_freeroam_driftSpots.onClientStartMission() end

--- Hook : si un spot était en cours avant le rechargement, émet onDriftSpotForcedEnd puis le termine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:497
---@param data table Table renvoyée par onSerialize.
function gameplay_drift_freeroam_driftSpots.onDeserialized(data) end

--- Hook : à la fin d'une chaîne de drifts scorée, met à jour la tasklist des objectifs et affiche « New Highscore! » (une fois par spot) si le record est battu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:446
function gameplay_drift_freeroam_driftSpots.onDriftCompletedScored() end

--- Hook : recharge les lignes du niveau puis ajoute un POI par ligne (marqueur de ligne de drift) ; lineOne ajoute aussi un marqueur de grande carte avec nom, aperçu, meilleur score et position de téléportation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:409
---@param levelIdentifier string Identifiant du niveau (inutilisé).
---@param elements table Liste de POI bruts à compléter.
function gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook : un gamemode multijoueur démarre ; force la fin d'un spot en cours (onDriftSpotForcedEnd), désactive les spots et vide les POI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:468
function gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStarted() end

--- Hook : fin du gamemode multijoueur ; réactive les spots et vide les POI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:477
function gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStopped() end

--- Hook : sauvegarde isInFreeroamChallenge et activeLine avant un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:504
---@return table  {isInFreeroamChallenge, activeLine}
function gameplay_drift_freeroam_driftSpots.onSerialize() end

--- Appelé à chaque frame : met à jour position/vitesse du joueur puis, pendant un spot, vérifie la fin propre et les fins impropres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:358
---@param dtReal number Delta temps réel (inutilisé).
---@param dtSim number Delta temps simulé, utilisé pour le chrono d'arrêt.
---@param dtRaw number Delta temps brut (inutilisé).
function gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : si le véhicule remis en place est celui du drift pendant un spot, termine le spot en échec (reason vehReset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:395
---@param id integer Id du véhicule.
function gameplay_drift_freeroam_driftSpots.onVehicleResetted(id) end

