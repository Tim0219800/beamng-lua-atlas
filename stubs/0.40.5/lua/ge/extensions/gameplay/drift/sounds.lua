---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/sounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les sons d'interface du drift (événements FMOD UI>Career>Drift_*) : un son continu pendant un drift dont la hauteur suit le facteur de performance, un son à chaque nouveau palier, à chaque changement de combo, à l'annulation du drift (crash/spinout) et à la validation des points. Contient aussi une fenêtre imgui « Drift audio » pour simuler un drift en debug. Chargé par gameplay_drift_general tant que l'extension d'affichage drift est chargée.
--- Accès : extension `gameplay_drift_sounds` : `extensions.load("gameplay_drift_sounds")`, puis la globale `gameplay_drift_sounds`
---@class gameplay_drift_sounds
gameplay_drift_sounds = {}

--- Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:67
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_sounds.getDriftDebugInfo() end

--- Hook : joue le son de points reçus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:186
---@param data table Données du drift scoré (inutilisées).
function gameplay_drift_sounds.onDriftCompletedScored(data) end

--- Hook : joue le son d'annulation du drift.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:172
function gameplay_drift_sounds.onDriftCrash() end

--- Hook : à la désactivation du debug, arrête la simulation de drift (gameplay_drift_drift.simulateADrift()).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:180
---@param value boolean Nouvel état du debug.
function gameplay_drift_sounds.onDriftDebugChanged(value) end

--- Hook : joue le son de combo 1x ou 5x selon l'ampleur du changement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:159
---@param data table {comboChange = number}.
function gameplay_drift_sounds.onDriftNewCombo(data) end

--- Hook : joue le son d'annulation du drift.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:176
function gameplay_drift_sounds.onDriftSpinout() end

--- Hook : supprime la source audio du son continu au déchargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:195
function gameplay_drift_sounds.onExtensionUnloaded() end

--- Hook : joue le son de nouveau palier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:153
---@param tierData table Données du palier ; order sert au volume.
function gameplay_drift_sounds.onNewDriftTierReached(tierData) end

--- Appelé à chaque frame : au premier appel crée la source audio du son continu, affiche la fenêtre de debug, puis joue/arrête le son continu et met à jour son paramètre pitch et sa position (caméra).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/sounds.lua:135
---@param dtReal number Delta temps réel (inutilisé).
---@param _dtSim number Delta temps simulé, mémorisé pour les transitions de debug.
---@param dtRaw number Delta temps brut (inutilisé).
function gameplay_drift_sounds.onUpdate(dtReal, _dtSim, dtRaw) end

