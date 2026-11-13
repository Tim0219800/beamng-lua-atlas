---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/scoring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule le score de drift de chaque véhicule suivi (un état de score par vehId). Pendant un drift, ajoute à un score en cache des points continus (distance parcourue x multiplicateurs d'angle, de vitesse et de proximité des murs, plus un bonus de palier), fait monter un combo (creep-up) via drift d'un seul côté, transitions de drift, zones de cascade et murs frôlés, et détermine le palier courant et le facteur de performance (1 à 4, lissé). À la fin d'un drift ou d'une chaîne, le score en cache multiplié par le combo est ajouté au score permanent (wrapUp) puis onDriftCompletedScored est émis.
--- Accès : extension `gameplay_drift_scoring` : `extensions.load("gameplay_drift_scoring")`, puis la globale `gameplay_drift_scoring`
---@class gameplay_drift_scoring
gameplay_drift_scoring = {}

--- Ajoute des points au score en cache (avant combo). Ignoré si le drift est gelé ou si le véhicule est gelé. Avec useStallingSystem, applique le facteur de gameplay_drift_stallingSystem et arrondit à l'entier inférieur.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:280
---@param valueToAdd number Points à ajouter.
---@param useStallingSystem boolean|nil true pour appliquer le facteur de stalling (défaut false).
---@param vehId integer|nil Id du véhicule (joueur 0 par défaut).
---@return number  Points réellement ajoutés (0 si ignoré).
function gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId) end

--- Renvoie la table du palier de drift courant du véhicule (le premier si aucun état).
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:740
---@param vehId integer|nil Id du véhicule.
---@return table  {minScore, continuousScore, id, order, name}
function gameplay_drift_scoring.getCurrentDriftTier(vehId) end

--- Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:724
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_scoring.getDriftDebugInfo() end

--- Renvoie le facteur de performance continu de la dernière frame (1 = drift de référence très bon).
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:709
---@param vehId integer|nil Id du véhicule.
---@return number  Facteur, 0 hors drift.
function gameplay_drift_scoring.getDriftPerformanceFactor(vehId) end

--- Renvoie la liste des paliers de drift (noms traduits au premier onUpdate).
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:728
---@return table[]  Liste de {minScore, continuousScore, id, order, name}.
function gameplay_drift_scoring.getDriftTiers() end

--- Renvoie la quantité de garbage mesurée par le profileur.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:732
---@return number|nil  nil tant que le debug général n'a jamais été actif.
function gameplay_drift_scoring.getGC() end

--- Renvoie le score potentiel (floor(cachedScore * combo)).
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:704
---@param vehId integer|nil Id du véhicule.
---@return number  Score potentiel, 0 si aucun état.
function gameplay_drift_scoring.getPotentialScore(vehId) end

--- Renvoie la table de score du véhicule demandé, ou celle du joueur 0 si vehId est nil. Si le véhicule n'a pas d'état, renvoie un score vide.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:693
---@param vehId integer|nil Id du véhicule.
---@return table  {score, combo, cachedScore, potentialScore, comboCreepup}. Attention : c'est la table vivante, pas une copie.
function gameplay_drift_scoring.getScore(vehId) end

--- Renvoie les points continus ajoutés à la dernière frame (bonus de palier inclus).
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:719
---@param vehId integer|nil Id du véhicule.
---@return number  Points de la frame.
function gameplay_drift_scoring.getScoreAddedThisFrame(vehId) end

--- Renvoie la table des réglages de score (points des zones, multiplicateurs, options de combo, récompenses carrière). Modifiable à chaud.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:736
---@return table  scoreOptions (table vivante).
function gameplay_drift_scoring.getScoreOptions() end

--- Renvoie le facteur de performance par paliers (1 à 4), lissé dans le temps.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:714
---@param vehId integer|nil Id du véhicule.
---@return number  Facteur lissé, 0 hors drift.
function gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId) end

--- Renvoie les points de base d'un type de zone de cascade.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:745
---@param stuntZoneType string "driftThrough", "donut", "hitPole" ou "nearPole".
---@return number  basePoints de ce type.
function gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType) end

--- Indique si le scoring de ce véhicule est gelé individuellement.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:753
---@param vehId integer Id du véhicule.
---@return boolean  true si gelé.
function gameplay_drift_scoring.isVehicleFrozen(vehId) end

--- Hook : zone de cascade réussie ; fait monter le combo (creep-up 140, ou 20 au-delà du soft cap).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:568
---@param vehId integer Véhicule.
function gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId) end

--- Hook : vide tous les états de score et les gels.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:239
function gameplay_drift_scoring.onClientEndMission() end

--- Hook : restaure les cases de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:778
---@param data table Table de onSerialize.
function gameplay_drift_scoring.onDeserialized(data) end

--- Hook : donut réussi ; ajoute les points de la zone au cache, puis hook onDonutDriftScored.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:596
---@param data table {vehId, zoneData = {points}}.
function gameplay_drift_scoring.onDonutDriftAccomplished(data) end

--- Hook : début d'une chaîne de drifts ; émet onNewDriftTierReached avec le premier palier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:761
---@param vehId integer Véhicule.
function gameplay_drift_scoring.onDriftChainStarted(vehId) end

--- Hook : fin d'une chaîne de drifts ; valide le score (wrapUp) puis émet onDriftCompletedScored avec le score ajouté, le combo, le palier et le véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:631
---@param data table|nil Contient vehId.
function gameplay_drift_scoring.onDriftCompleted(data) end

--- Hook : crash ; perd le score en cache et le combo (reset du cache, hook onDriftCachedScoreReset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:685
---@param vehId integer Véhicule.
function gameplay_drift_scoring.onDriftCrash(vehId) end

--- Hook : début du cruising en roaming libre ; remet à zéro le score permanent de tous les véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:765
function gameplay_drift_scoring.onDriftFreeroamCruisingStarted() end

--- Hook : véhicule remis en place ; reset de l'état de score de ce véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:757
---@param vehId integer Véhicule.
function gameplay_drift_scoring.onDriftPlVehReset(vehId) end

--- Hook : spinout ; perd le score en cache et le combo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:689
---@param vehId integer Véhicule.
function gameplay_drift_scoring.onDriftSpinout(vehId) end

--- Hook : drift à travers une zone ; score = linearScale(angle, 0..90, 0..points de la zone) ajouté au cache avec stalling, puis hook onTightDriftScored.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:575
---@param data table {vehId, currDegAngle, zoneData = {points}}.
function gameplay_drift_scoring.onDriftThroughAccomplished(data) end

--- Hook : transition de drift (changement de côté) ; fait monter le combo selon la vitesse si elle dépasse 25 et que 2 s se sont écoulées depuis le dernier démarrage de drift.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:667
---@param vehId integer Véhicule.
function gameplay_drift_scoring.onDriftTransition(vehId) end

--- Hook : poteau touché ; score = linearScale(angle + vitesse, 0..250, 0..points) ajouté au cache, puis hook onHitPoleScored.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:582
---@param data table {vehId, currDegAngle, currAirSpeed, zoneData = {points}}.
function gameplay_drift_scoring.onHitPoleAccomplished(data) end

--- Hook : poteau frôlé ; score = angle * closeness / 90 * points ajouté au cache, puis hook onNearPoleScored.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:589
---@param data table {vehId, currDegAngle, closeness, zoneData = {points}}.
function gameplay_drift_scoring.onNearPoleAccomplished(data) end

--- Hook : sauvegarde les cases de debug avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:771
---@return table  {scoreExperiment, debugToggleSmothnessGraph}
function gameplay_drift_scoring.onSerialize() end

--- Appelé à chaque frame : crée les états de score des véhicules suivis, met à jour tier, facteur de performance, creep-up et score continu pour chacun. Au premier appel, traduit les paliers et calcule le score de référence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:533
---@param dtReal number Delta temps réel (debug).
---@param _dtSim number Delta temps simulé, utilisé pour les calculs.
function gameplay_drift_scoring.onUpdate(dtReal, _dtSim) end

--- Hook : supprime l'état de score et le gel du véhicule détruit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:234
---@param vehId integer Véhicule détruit.
function gameplay_drift_scoring.onVehicleDestroyed(vehId) end

--- Remet à zéro l'état de score d'un véhicule (ou de tous si vehId est nil) et vide l'historique de debug. Appelé par gameplay_drift_general.reset.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:222
---@param vehId integer|nil Véhicule à réinitialiser ; nil pour tous.
function gameplay_drift_scoring.reset(vehId) end

--- Gèle ou dégèle le scoring d'un véhicule individuel (ses ajouts de score sont alors ignorés).
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:749
---@param vehId integer Id du véhicule.
---@param isFrozen boolean true pour geler.
function gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen) end

--- Valide le score en cache : ajoute floor(cachedScore * combo) au score permanent puis remet le cache et le combo à zéro (hook onDriftCachedScoreReset). Ne fait rien si le résultat est < 1.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:602
---@param vehId integer|nil Id du véhicule.
---@return number|boolean  Points ajoutés, ou false si rien à valider.
function gameplay_drift_scoring.wrapUp(vehId) end

--- Comme wrapUp, mais émet aussi onDriftScoreWrappedUp(addedScore, vehId) pour que l'UI présente le score validé.
---Source : lua/ge/extensions/gameplay/drift/scoring.lua:614
---@param vehId integer|nil Id du véhicule.
---@return number|boolean  Points ajoutés, ou false.
function gameplay_drift_scoring.wrapUpWithText(vehId) end

