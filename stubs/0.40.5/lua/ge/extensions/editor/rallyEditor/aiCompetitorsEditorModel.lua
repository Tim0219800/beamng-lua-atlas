---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle de données de l'onglet « AI Competitors » de l'éditeur de rallye. Il lit et écrit le fichier JSON gameplay/rally/aiCompetitorsConfig.json (sections general, competitors, ui), fournit les valeurs par défaut des 26 paramètres généraux du modèle de mélange de résultats (Safe, Push, Minor Mistake, Major Issue, DNF) et de 5 concurrents (A à E, traits skill/consistency/risk à 0.5), les bornes des curseurs, le formatage des valeurs et les groupes de paramètres affichés dans l'interface. Les calculs de mélange viennent de gameplay/rally/aiCompetitors, réexposés ici (computeMixtureWeights, mixtureDensityTimes).
--- Accès : extension `editor_rallyEditor_aiCompetitorsEditorModel` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorModel")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorModel`
---@class editor_rallyEditor_aiCompetitorsEditorModel
---@field computeMixtureWeights function Alias de gameplay/rally/aiCompetitors.computeMixtureWeights.
---@field configPath string Chemin du fichier de configuration : « gameplay/rally/aiCompetitorsConfig.json ».
---@field generalFieldNames table<integer, string> Noms des paramètres généraux, triés alphabétiquement.
---@field generalParamGroups table<integer, table> Groupes d'affichage {title, blurb, fields} : Stage limits, Safe & Push, Incidents & DNF, Pace vs reference, Base std dev, Consistency on std dev.
---@field generalSliderBounds table<string, {lo: number, hi: number}> Bornes min/max des curseurs pour chaque paramètre général.
---@field mixtureDensityTimes function Alias de gameplay/rally/aiCompetitors.mixtureDensityTimes.
---@field numOutcomes integer Nombre de résultats possibles (5).
---@field outcomeDnf integer Indice (5) du résultat DNF / Terminal.
---@field outcomeLabels table<integer, string> Libellés : Safe / Clean, Push / Aggressive, Minor Mistake, Major Issue, DNF / Terminal.
editor_rallyEditor_aiCompetitorsEditorModel = {}

--- Borne une valeur à la plage du curseur du paramètre (inchangée si le paramètre est inconnu).
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:284
---@param fieldName string Nom du paramètre général.
---@param value number|string Valeur (convertie par tonumber, 0 si invalide).
---@return number  Valeur bornée.
function editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value) end

--- Complète une configuration brute avec les valeurs par défaut : general fusionné, competitors normalisés (traits dans [0,1]), ui fusionné.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:135
---@param raw table|nil Configuration lue (general, competitors ou drivers, ui).
---@return table  general.
---@return table<integer, table>  Liste des concurrents normalisés.
---@return table  ui.
function editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw) end

--- Renvoie les réglages d'interface par défaut : default_player_time_sec 100, default_appearance_mode « dark », default_color_theme « blue », window_min_width 1100, window_min_height 720, slider_min 0, slider_max 1, default_slider_value 0.5.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:70
---@return table  Table ui par défaut.
function editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict() end

--- Transforme un nom snake_case en libellé (ex. « risk_tail_exponent » donne « Risk Tail Exponent »).
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:314
---@param snakeName string Nom du paramètre.
---@return string  Libellé.
function editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName) end

--- Formate un paramètre selon sa grandeur : 2 décimales si |v| ≥ 100, 3 si ≥ 10, 4 si ≥ 1, sinon 5 chiffres significatifs.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:299
---@param value number|string Valeur à formater.
---@return string  Texte formaté.
function editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value) end

--- Lit configPath avec jsonReadFile ; renvoie une table vide si le fichier est absent ou invalide.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:160
---@return table  Données brutes.
function editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig() end

--- Renvoie une copie des paramètres généraux par défaut, surchargés par les clés connues et non nil de overrides.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:58
---@param overrides table|nil Valeurs à surcharger.
---@return table<string, number>  Paramètres généraux complets.
function editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides) end

--- Écrit {general, competitors, ui} (nombres arrondis à 3 décimales) dans configPath avec jsonWriteFile (joli format).
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:211
---@param generalTable table Paramètres généraux.
---@param competitorsList table<integer, table> Liste des concurrents.
---@param uiTable table Réglages d'interface.
---@return boolean  Résultat de jsonWriteFile.
function editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable) end

--- Convertit une valeur de curseur en [0, 1] ; si l'étendue est ≤ 0, borne simplement la valeur.
---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:322
---@param value number Valeur du curseur.
---@param sliderMin number Minimum du curseur.
---@param sliderMax number Maximum du curseur.
---@return number  Valeur normalisée entre 0 et 1.
function editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax) end

