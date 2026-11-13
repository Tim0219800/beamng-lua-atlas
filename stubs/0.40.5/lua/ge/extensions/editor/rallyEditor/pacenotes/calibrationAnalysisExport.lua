---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exporte les données de calibration des virages d'un carnet de rallye vers un fichier JSON destiné à être analysé (par exemple par un LLM) pour ajuster les seuils d'intensité et de longueur des virages. Pour chaque pacenote non TODO, il remesure le virage sur la snaproad et sérialise les mesures, les étiquettes manuelles (métadonnées de calibration), les ajustements, l'aperçu composé et le contexte des waypoints, avec la calibration courante, les surcharges actives et des instructions d'analyse. Deux formats : v1 (complet, calibrationAnalysis.json) et v2 (compact avec comparaisons cible/projeté par intensité et longueur, calibrationAnalysis.v2.json). Utilisé par l'onglet Export de la fenêtre de calibration.
--- Accès : extension `editor_rallyEditor_pacenotes_calibrationAnalysisExport` : `extensions.load("editor_rallyEditor_pacenotes_calibrationAnalysisExport")`, puis la globale `editor_rallyEditor_pacenotes_calibrationAnalysisExport`
---@class editor_rallyEditor_pacenotes_calibrationAnalysisExport
editor_rallyEditor_pacenotes_calibrationAnalysisExport = {}

--- Construit la table d'export v1 en mémoire (version = 1) : identité du carnet, style de compositeur actif, calibration courante, surcharges, instructions, schéma, contexte, pacenotes et résumé.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:478
---@param path table|nil Carnet.
---@param pacenotesWindow table|nil Onglet Pacenotes (pour la snaproad).
---@return table|nil  Données d'export, ou nil en cas d'erreur.
---@return string|nil  Message d'erreur (pas de carnet, pas de calibration corner active, snaproad non chargée).
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.build(path, pacenotesWindow) end

--- Construit l'export compact v2 (version = 2) à partir de build() : plages de calibration, surcharges actives, analyse (distributions cible/projeté) et instructions.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:964
---@param path table|nil Carnet.
---@param pacenotesWindow table|nil Onglet Pacenotes.
---@return table|nil  Données v2, ou nil.
---@return string|nil  Message d'erreur.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.buildV2(path, pacenotesWindow) end

--- Construit l'export v1, l'écrit sur disque et vérifie la relecture.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:546
---@param path table|nil Carnet.
---@param pacenotesWindow table|nil Onglet Pacenotes.
---@return boolean  Succès.
---@return string|nil  Chemin du fichier en cas de succès, sinon message d'erreur.
---@return table|string|nil  Données exportées en cas de succès ; en cas d'échec d'écriture, chemin du fichier.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.export(path, pacenotesWindow) end

--- Chemin du fichier d'export v1 pour une mission.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:20
---@param missionDir string|nil Dossier de la mission.
---@return string|nil  <missionDir>/rally/calibrationAnalysis.json, ou nil sans dossier.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportFile(missionDir) end

--- Construit l'export v2, l'écrit sur disque et vérifie la relecture. Mêmes valeurs de retour que export().
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:991
---@param path table|nil Carnet.
---@param pacenotesWindow table|nil Onglet Pacenotes.
---@return boolean  Succès.
---@return string|nil  Chemin du fichier en cas de succès, sinon message d'erreur.
---@return table|string|nil  Données exportées, ou chemin en cas d'échec d'écriture.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2(path, pacenotesWindow) end

--- Chemin du fichier d'export v2 pour une mission.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:26
---@param missionDir string|nil Dossier de la mission.
---@return string|nil  <missionDir>/rally/calibrationAnalysis.v2.json, ou nil sans dossier.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2File(missionDir) end

