---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de configuration des concurrents IA (windowDescription = « AI Competitors Configuration »). Champs principaux : competitors (liste copiée pour l'édition), ui, selectedCompetitorIndex, generalFloatPtrs (un FloatPtr par paramètre général), referenceTimePtr et traitSkillPtr / traitConsistencyPtr / traitRiskPtr. Appelé par la fenêtre de l'éditeur de rallye (draw).
---@class editor_rallyEditor_aiCompetitorsTab
local editor_rallyEditor_aiCompetitorsTab = {}

--- Applique une table de paramètres généraux aux curseurs, chaque valeur étant bornée à sa plage.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:73
---@param general table<string, number> Paramètres généraux.
function editor_rallyEditor_aiCompetitorsTab:applyGeneralTable(general) end

--- Met les curseurs de traits aux valeurs du concurrent sélectionné (index borné à la liste ; valeur par défaut ui.default_slider_value ou 0.5 si le trait est absent).
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:97
function editor_rallyEditor_aiCompetitorsTab:applySelectedCompetitorToTraitSliders() end

--- Synchronise les traits puis calcule les données d'aperçu (aiCompetitorsEditorPreview.computeVisualization) avec les traits ramenés à [0,1] selon slider_min/slider_max.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:146
---@return table  {weights, density, weightedComponents, yMax, timeLo, timeHi}.
function editor_rallyEditor_aiCompetitorsTab:buildVisualization() end

--- Renvoie le nom affichable d'un concurrent, ou « ? » s'il est absent ou vide.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:111
---@param competitor table|nil Concurrent {name, skill, consistency, risk}.
---@return string  Nom ou « ? ».
function editor_rallyEditor_aiCompetitorsTab:competitorDisplayName(competitor) end

--- Appelé à chaque frame par la fenêtre de l'éditeur de rallye : barre d'outils (Reload / Save), parts de résultats, graphique, puis deux colonnes (paramètres généraux, référence et concurrents). Les arguments sont ignorés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:288
---@param _mouseInfo table|nil Non utilisé.
---@param _dtReal number|nil Non utilisé.
---@param _dtSim number|nil Non utilisé.
---@param _dtRaw number|nil Non utilisé.
function editor_rallyEditor_aiCompetitorsTab:draw(_mouseInfo, _dtReal, _dtSim, _dtRaw) end

--- Dessine les groupes de curseurs des paramètres généraux avec titres, descriptions, infobulles et valeur formatée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:161
function editor_rallyEditor_aiCompetitorsTab:drawGeneralParameterGroups() end

--- Dessine la colonne de droite : champ du temps de référence puis les curseurs de traits.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:254
function editor_rallyEditor_aiCompetitorsTab:drawReferenceAndDriversColumn() end

--- Dessine la navigation Prev / Next entre concurrents et les curseurs Pace, Consistency et Risk.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:197
function editor_rallyEditor_aiCompetitorsTab:drawTraitSliders() end

--- Relit les valeurs des curseurs dans une table des paramètres généraux.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:62
---@return table<string, number>  Paramètres généraux courants.
function editor_rallyEditor_aiCompetitorsTab:gatherGeneralTable() end

--- Crée les pointeurs ImGui (paramètres généraux par défaut, temps de référence, traits à 0.5) puis charge le fichier de configuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:46
function editor_rallyEditor_aiCompetitorsTab:init() end

--- Relit la configuration (loadRawConfig puis configWithDefaults), met à jour curseurs, concurrents, ui et temps de référence, et resélectionne le premier concurrent.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:122
function editor_rallyEditor_aiCompetitorsTab:loadFromDisk() end

--- Valide le temps de référence saisi : remplace une valeur invalide (NaN) par la valeur par défaut et impose un minimum de 1 s.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:133
---@return number  Temps de référence en secondes.
function editor_rallyEditor_aiCompetitorsTab:parseReferenceTimeSeconds() end

--- Copie les trois curseurs de traits dans le concurrent sélectionné (sans effet si aucun concurrent ou index invalide).
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:82
function editor_rallyEditor_aiCompetitorsTab:syncTraitsIntoSelectedCompetitor() end

--- Synchronise les traits, met à jour ui.default_player_time_sec et écrit le fichier via saveConfig ; journalise « Wrote ... » (I) ou « Failed to save ... » (E).
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:271
function editor_rallyEditor_aiCompetitorsTab:trySaveToDisk() end

