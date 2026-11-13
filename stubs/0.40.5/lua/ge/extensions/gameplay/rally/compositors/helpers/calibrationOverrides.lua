---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère le calibrage par mission des seuils d'un style de compositeur de notes de rallye (diamètres d'intensité des virages, longueurs d'arc par intensité). Les réglages sont stockés dans <missionDir>/rally/compositorCalibration.json sous la forme {version=1, styles={<style>={intensity={diameter={...}}, lengthsByIntensity={<intensité>={arcMeters={...}}}}}} et réappliqués à la configuration d'un style au chargement. Une liste de 'boundaries' est un tableau croissant de bornes basses commençant par 0 ; la dernière plage est ouverte (pas de max).
--- Accès : extension `gameplay_rally_compositors_helpers_calibrationOverrides` : `extensions.load("gameplay_rally_compositors_helpers_calibrationOverrides")`, puis la globale `gameplay_rally_compositors_helpers_calibrationOverrides`
---@class gameplay_rally_compositors_helpers_calibrationOverrides
gameplay_rally_compositors_helpers_calibrationOverrides = {}

--- Réécrit la clé 'key' de chaque entrée de la liste avec la plage {min, max} issue des bornes (la dernière : {min} seul). Ne modifie rien si les bornes sont invalides ou de mauvaise longueur.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:75
---@param list table[] Liste d'entrées modifiée sur place.
---@param key string Clé à écrire.
---@param boundaries number[] Bornes basses.
---@return boolean  true si appliqué.
function gameplay_rally_compositors_helpers_calibrationOverrides.applyBoundariesToList(list, key, boundaries) end

--- Applique les calibrages sauvegardés à la configuration d'un style (corner.numbering.intensity et lengthsByIntensity). Appelé par textCompositor:load.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:143
---@param config table Configuration du style (modifiée sur place).
---@param compositorName string Nom du style.
---@param missionDir string Dossier de la mission.
---@return boolean  true si au moins une liste a été modifiée.
function gameplay_rally_compositors_helpers_calibrationOverrides.applyToConfig(config, compositorName, missionDir) end

--- Extrait les bornes basses d'une liste d'entrées dont la clé 'key' est une plage {min, max}. Renvoie nil si la liste est vide, ne commence pas à 0, n'est pas contiguë (max précédent = min suivant) ou si un max manque hors dernière entrée.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:39
---@param list table[]|nil Liste ordonnée d'entrées.
---@param key string Clé contenant la plage (ex. 'diameter', 'arcMeters').
---@return number[]|nil  Bornes basses, ou nil si la liste n'est pas valide.
function gameplay_rally_compositors_helpers_calibrationOverrides.boundariesFromList(list, key) end

--- Chemin du fichier de calibrage d'une mission : <missionDir>/rally/compositorCalibration.json.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:17
---@param missionDir string|nil Dossier de la mission.
---@return string|nil  Chemin, ou nil si missionDir est nil.
function gameplay_rally_compositors_helpers_calibrationOverrides.calibrationFile(missionDir) end

--- Lit le fichier de calibrage de la mission. Renvoie une structure vierge {version=1, styles={}} si le fichier est absent ou illisible (erreur journalisée dans ce dernier cas).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:87
---@param missionDir string|nil Dossier de la mission.
---@return table  Données {version, styles}.
function gameplay_rally_compositors_helpers_calibrationOverrides.load(missionDir) end

--- Écrit les données de calibrage (indentées) dans le fichier de la mission, en créant le dossier au besoin.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:101
---@param missionDir string|nil Dossier de la mission.
---@param data table|nil Données ; vierges si nil.
---@return boolean  Résultat de jsonWriteFile (false si missionDir est nil).
function gameplay_rally_compositors_helpers_calibrationOverrides.save(missionDir, data) end

--- Enregistre une liste de bornes sous styles[compositorName][groupName][key] puis sauvegarde le fichier.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:126
---@param missionDir string Dossier de la mission.
---@param compositorName string Nom du style.
---@param groupName string Groupe (ex. 'intensity').
---@param key string Clé (ex. 'diameter').
---@param boundaries number[] Bornes (copiées ; nil si une valeur n'est pas numérique).
---@return boolean  Succès de l'écriture.
function gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, compositorName, groupName, key, boundaries) end

--- Enregistre les bornes de longueur d'arc d'une intensité sous styles[compositorName].lengthsByIntensity[intensityName].arcMeters puis sauvegarde.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:134
---@param missionDir string Dossier de la mission.
---@param compositorName string Nom du style.
---@param intensityName string Identifiant de l'intensité.
---@param boundaries number[] Bornes d'arc en mètres.
---@return boolean  Succès de l'écriture.
function gameplay_rally_compositors_helpers_calibrationOverrides.setLengthBoundaries(missionDir, compositorName, intensityName, boundaries) end

--- Vérifie qu'une liste de bornes est valable (numérique, commence à 0, strictement croissante, bonne longueur).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:59
---@param boundaries table Tableau de nombres.
---@param expectedCount integer|nil Longueur attendue.
---@return boolean  true si valide.
function gameplay_rally_compositors_helpers_calibrationOverrides.validateBoundaries(boundaries, expectedCount) end

