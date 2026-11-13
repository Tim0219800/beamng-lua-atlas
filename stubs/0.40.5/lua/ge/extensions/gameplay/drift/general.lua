---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chef d'orchestre du gameplay de drift. Garde le contexte courant (inFreeroam, inChallenge, inFreeroamChallenge, inAnotherMissionType, inFreeroamCruising, inSplitscreen), le mode de défi (None, A to B, A to B with stunt zones, Gymkhana, Competition), les états pause/gel et le flag de debug. À chaque changement de contexte ou de mode, il charge ou décharge les autres extensions gameplay_drift_* selon la table variableExtensions. Un moddeur l'utilise pour lire le contexte drift ou en changer, et pour réinitialiser tout le système.
--- Accès : extension `gameplay_drift_general` : `extensions.load("gameplay_drift_general")`, puis la globale `gameplay_drift_general`
---@class gameplay_drift_general
---@field dependencies string[] gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_statistics, gameplay_drift_saveLoad, gameplay_util_groundContact.
gameplay_drift_general = {}

--- Appelle reset() de toutes les extensions drift chargées (sauf general), remet frozen à false puis vide les zones de cascade (gameplay_drift_stuntZones.clear).
---Source : lua/ge/extensions/gameplay/drift/general.lua:73
function gameplay_drift_general.clear() end

--- Renvoie le mode de défi courant.
---Source : lua/ge/extensions/gameplay/drift/general.lua:196
---@return string|nil  Mode de défi, nil tant qu'il n'a jamais été défini.
function gameplay_drift_general.getChallengeMode() end

--- Renvoie le contexte drift courant.
---Source : lua/ge/extensions/gameplay/drift/general.lua:179
---@return string|nil  Contexte courant.
function gameplay_drift_general.getContext() end

--- Renvoie {default=true, canBeChanged=false} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/general.lua:183
---@return table  {default = true, canBeChanged = false}
function gameplay_drift_general.getDriftDebugInfo() end

--- Indique si le debug est activé pour une extension drift donnée (debug général actif, extension connue, case cochée).
---Source : lua/ge/extensions/gameplay/drift/general.lua:187
---@param extName string Nom de l'extension, ex. "gameplay_drift_scoreboard".
---@return boolean  true si le debug de cette extension est actif.
function gameplay_drift_general.getExtensionDebug(extName) end

--- Indique si scoring et détection de drift sont gelés (hors limites, contresens, phase de conclusion).
---Source : lua/ge/extensions/gameplay/drift/general.lua:192
---@return boolean  État de gel.
function gameplay_drift_general.getFrozen() end

--- Indique si le debug général est actif.
---Source : lua/ge/extensions/gameplay/drift/general.lua:171
---@return boolean  Flag de debug.
function gameplay_drift_general.getGeneralDebug() end

--- Renvoie une valeur vraie seulement si une session multijoueur est en cours et que le drift multijoueur est autorisé.
---Source : lua/ge/extensions/gameplay/drift/general.lua:200
---@return any  Valeur vraie/fausse (peut être nil ou un booléen).
function gameplay_drift_general.getMultiplayerEnabled() end

--- Indique si le système de drift est en pause.
---Source : lua/ge/extensions/gameplay/drift/general.lua:175
---@return boolean  État de pause.
function gameplay_drift_general.getPaused() end

--- Hook : appelé au démarrage ou à l'arrêt d'une mission. Fait clear() ; au démarrage d'une mission non drift passe en "inAnotherMissionType" ; à l'arrêt remet pause/gel à false et le contexte à "inFreeroam".
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:204
---@param status string "started" ou "stopped".
---@param mission table Mission concernée (missionType est lu).
function gameplay_drift_general.onAnyMissionChanged(status, mission) end

--- Hook : fin de niveau, repasse le contexte à "inFreeroam".
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:427
function gameplay_drift_general.onClientEndMission() end

--- Hook : appelé quand le niveau est chargé ; si aucune mission n'est au premier plan, passe en "inFreeroam" et fait reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:393
function gameplay_drift_general.onClientPostStartMission() end

--- Hook : restaure debugFlag, context et challengeMode après un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:409
---@param data table Table renvoyée par onSerialize.
function gameplay_drift_general.onDeserialized(data) end

--- Hook : liste les fichiers lua de /lua/ge/extensions/gameplay/drift pour le suivi des extensions et du debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:415
function gameplay_drift_general.onExtensionLoaded() end

--- Hook : charge gameplay_drift_multiplayer à l'entrée en session multijoueur et le décharge à la sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:419
---@param old any Ancienne session (nil si aucune).
---@param new any Nouvelle session (nil si aucune).
function gameplay_drift_general.onMPSessionChanged(old, new) end

--- Hook : sauvegarde debugFlag, context et challengeMode avant un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:401
---@return table  {debugFlag, context, challengeMode}
function gameplay_drift_general.onSerialize() end

--- Appelé à chaque frame : fenêtre debug, chargement/déchargement des sons et du cruising, recalcul de l'état gelé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:385
function gameplay_drift_general.onUpdate() end

--- Hook : si le véhicule remis en place est suivi par gameplay_drift_drift, émet onDriftPlVehReset(vid).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/general.lua:217
---@param vid integer Id du véhicule.
function gameplay_drift_general.onVehicleResetted(vid) end

--- Appelle reset() de toutes les extensions drift chargées (sauf general), remet frozen à false puis réinitialise les zones de cascade (gameplay_drift_stuntZones.reset).
---Source : lua/ge/extensions/gameplay/drift/general.lua:78
function gameplay_drift_general.reset() end

--- Change le mode de défi et recharge/décharge les extensions concernées. Sans effet si le mode est identique.
---Source : lua/ge/extensions/gameplay/drift/general.lua:136
---@param newChallengeMode string "None", "A to B", "A to B with stunt zones", "Gymkhana" ou "Competition".
function gameplay_drift_general.setChallengeMode(newChallengeMode) end

--- Change le contexte drift, émet onDriftContextChanged(newContext, oldContext) et met à jour les extensions chargées.
---Source : lua/ge/extensions/gameplay/drift/general.lua:147
---@param newContext string "inFreeroam", "inChallenge", "inFreeroamChallenge", "inAnotherMissionType", "inFreeroamCruising" ou "inSplitscreen".
function gameplay_drift_general.setContext(newContext) end

--- Active/désactive le mode debug drift (fenêtre imgui « Drift general ») et émet onDriftDebugChanged(value).
---Source : lua/ge/extensions/gameplay/drift/general.lua:163
---@param value boolean true pour activer le debug.
function gameplay_drift_general.setDebug(value) end

--- Met le système de drift en pause (ou le relance).
---Source : lua/ge/extensions/gameplay/drift/general.lua:143
---@param newPaused boolean true pour mettre en pause.
function gameplay_drift_general.setPaused(newPaused) end

