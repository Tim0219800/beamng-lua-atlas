---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C
local flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C = {}

--- Vide pendingValue et pendingSettings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:115
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:_executionStarted() end

--- Applique le choix de copilote : enregistre rallyVoicepackPick (boucle) ou recharge les assets du voicepack via rm:reloadVoicepackAssets ; logue une erreur en cas d'échec.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:290
---@param value string Valeur du copilote choisi.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:applyPick(value) end

--- Renvoie les réglages booléens de la mission retenus dans settingKeys, avec la valeur en attente si elle existe.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:154
---@param mission table|nil Mission dont on lit getUserSettingsData().
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildBoolSettings(mission) end

--- Construit la liste des copilotes pour une mission de boucle rallye (label, value, shortLabel, detail) et la valeur sélectionnée ; renvoie nil si rien n'est disponible.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:125
---@param loopManager table Gestionnaire de boucle rallye.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildLoopOptions(loopManager) end

--- Idem pour une spéciale rallye standard à partir du rally manager.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:140
---@param rm table Rally manager (gameplay_rally.getRallyManager()).
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildStageOptions(rm) end

--- Renvoie la mission rallye de la boucle (loopManager:getRallyLoopMission()) ou, sans boucle, l'activité du gestionnaire.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:120
---@param loopManager table|nil Gestionnaire de boucle rallye ou nil.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:getMission(loopManager) end

--- Crée le panneau {type='coDriverSelector', ...} et vide les choix en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:102
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:init() end

--- Appelé par le panneau quand un copilote est choisi : mémorise le choix et joue un échantillon (composé, enregistré ou test d'interphone).
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:236
---@param value string Valeur choisie.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onCoDriverSelectedByPanel(value) end

--- Appelé quand un réglage booléen change : met à jour pendingSettings, mission.lastUserSettings et le panneau. Accepte soit (key, value), soit une table {key, value}.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:252
---@param key string|table Clé du réglage ou table payload.
---@param value boolean|nil Nouvelle valeur.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onRallyStartSettingChanged(key, value) end

--- Hook appelé au clic sur Start : coupe l'audio, écrit les réglages en attente via settings.setValue et applique le copilote choisi (applyPick).
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:276
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onUIStartButtonClicked() end

--- Appelé chaque frame comme extension ; fait avancer la file audio de l'échantillon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:232
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé quand la case notes visuelles change ; mémorise rallyVisualPacenotes en attente.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:243
---@param value boolean Nouvel état.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onVisualPacenotesChangedByPanel(value) end

--- Réinitialise la file audio d'échantillon puis y met les objets audio donnés (timing du voicepack de l'entrée).
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:224
---@param entry table|nil Entrée de voicepack.
---@param audioObjs table|nil Objets audio à jouer ; nil pour couper.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:playSample(entry, audioObjs) end

--- Retrouve l'entrée de voicepack correspondant à la valeur choisie (mode boucle ou spéciale).
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:214
---@param value string Valeur de réglage du copilote.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:resolveEntry(value) end

--- Construit le panneau (options de copilote, sélection, notes visuelles, réglages booléens, note de boucle) et l'ajoute à l'UI, puis joue le test d'interphone du copilote sélectionné. Sans rally manager ou sans option, logue un avertissement et saute le panneau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:173
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:work() end

