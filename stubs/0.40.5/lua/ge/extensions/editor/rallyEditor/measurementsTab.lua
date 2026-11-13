---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/measurementsTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs : measurements (table id -> mesure {id, name, points (vec3), totalDistance, followRoute, color, textColor}), selectedMeasurementId, selectedPointIndex, nextMeasurementId, snaproad, updatedAt. windowDescription = 'Measurements'.
---@class editor_rallyEditor_measurementsTab
local editor_rallyEditor_measurementsTab = {}

--- Ajoute un point en fin de mesure, le sélectionne, recalcule la distance et sauvegarde.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:576
---@param measurementId integer Identifiant.
---@param point vec3 Position monde.
function editor_rallyEditor_measurementsTab:addPointToMeasurement(measurementId, point) end

--- Calcule et stocke totalDistance en mètres. Avec followRoute et une snaproad, la distance suit la route entre points consécutifs ; sinon c'est la somme des distances directes. 0 s'il y a moins de 2 points.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:630
---@param measurementId integer Identifiant.
---@return number  Distance totale en mètres.
function editor_rallyEditor_measurementsTab:calculateMeasurementDistance(measurementId) end

--- Vide les mesures, la sélection et l'état d'interaction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:45
function editor_rallyEditor_measurementsTab:clearState() end

--- Crée une mesure vide (followRoute = true, couleur aléatoire), la sélectionne et sauvegarde.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:502
---@param name string|nil Nom ; par défaut « Measurement <id> ».
---@return table  La mesure créée.
function editor_rallyEditor_measurementsTab:createMeasurement(name) end

--- Supprime une mesure, désélectionne si besoin, recalcule nextMeasurementId et sauvegarde.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:546
---@param measurementId integer Identifiant.
function editor_rallyEditor_measurementsTab:deleteMeasurement(measurementId) end

--- Reconstruit les mesures depuis les données JSON, avec couleurs par défaut (jaune / noir), et recalcule nextMeasurementId (plus grand id + 1).
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:103
---@param data table|nil Données lues du fichier ; rien n'est fait si nil.
function editor_rallyEditor_measurementsTab:deserialize(data) end

--- Dessine l'interface imgui : création/suppression de mesures, liste, options (Follow Route, couleurs), distance totale, liste des points et boutons Move Up / Move Down / Delete Point.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:982
---@param mouseInfo table Informations souris.
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulation.
---@param dtRaw number Delta temps brut.
function editor_rallyEditor_measurementsTab:draw(mouseInfo, dtReal, dtSim, dtRaw) end

--- Rendu 3D appelé à chaque image : dessine la snaproad (noire) puis les points et lignes de mesure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:236
function editor_rallyEditor_measurementsTab:drawDebugEntrypoint() end

--- Dessine en 3D les points (sphères), les segments, le suivi de route et les libellés de distance de chaque mesure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:250
function editor_rallyEditor_measurementsTab:drawMeasurementPoints() end

--- Cherche, toutes mesures confondues, le point le plus proche d'une position.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:747
---@param mousePos vec3 Position de référence.
---@return integer|nil  Identifiant de la mesure.
---@return integer|nil  Indice du point.
---@return vec3|nil  Point.
---@return number  Distance (math.huge s'il n'y a aucun point).
function editor_rallyEditor_measurementsTab:findNearestPoint(mousePos) end

--- Renvoie une mesure par identifiant.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:532
---@param measurementId integer Identifiant.
---@return table|nil  Mesure, ou nil.
function editor_rallyEditor_measurementsTab:getMeasurement(measurementId) end

--- Chemin du fichier measurements.json dans le dossier de la mission.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:64
---@return string|nil  Chemin, ou nil (avec erreur au log) sans dossier de mission.
function editor_rallyEditor_measurementsTab:getMeasurementsFilePath() end

--- Gère la souris dans la vue 3D : survol, sélection, glisser-déplacer et ajout de points accrochés à la snaproad (distance < 5 m).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:772
function editor_rallyEditor_measurementsTab:handleMouseInput() end

--- Constructeur interne : initialise les mesures et l'état d'interaction (survol, glisser).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:26
---@param rallyEditor table Instance de l'éditeur de rallye.
function editor_rallyEditor_measurementsTab:init(rallyEditor) end

--- Lit measurements.json s'il existe (updatedAt pris dans la date du fichier s'il manque), désérialise puis recalcule les distances.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:155
---@return boolean  true si le fichier a été chargé.
function editor_rallyEditor_measurementsTab:loadMeasurements() end

--- Échange le point avec le suivant (indice + 1), recalcule et sauvegarde.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:617
---@param measurementId integer Identifiant.
---@param pointIndex integer Indice du point.
function editor_rallyEditor_measurementsTab:movePointDown(measurementId, pointIndex) end

--- Échange le point avec le précédent (indice - 1), recalcule et sauvegarde.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:604
---@param measurementId integer Identifiant.
---@param pointIndex integer Indice du point.
function editor_rallyEditor_measurementsTab:movePointUp(measurementId, pointIndex) end

--- Retire un point (ajuste l'indice sélectionné), recalcule la distance et sauvegarde.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:589
---@param measurementId integer Identifiant.
---@param pointIndex integer Indice du point (à partir de 1).
function editor_rallyEditor_measurementsTab:removePointFromMeasurement(measurementId, pointIndex) end

--- Met à jour updatedAt et écrit le fichier measurements.json (sauvegarde automatique).
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:140
---@return boolean  false si le chemin du fichier est inconnu.
function editor_rallyEditor_measurementsTab:saveMeasurements() end

--- Sélectionne une mesure et annule la sélection de point.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:569
---@param measurementId integer|nil Identifiant.
function editor_rallyEditor_measurementsTab:selectMeasurement(measurementId) end

--- Appelée par l'éditeur quand l'onglet est sélectionné : récupère la snaproad de la fenêtre pacenotes, charge measurements.json et émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:203
function editor_rallyEditor_measurementsTab:selected() end

--- Convertit les mesures en table compatible JSON (les points vec3 deviennent {x,y,z}).
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:74
---@return table  {measurements, nextMeasurementId, updatedAt}.
function editor_rallyEditor_measurementsTab:serialize() end

--- Définit le carnet courant (le commentaire du code note que « path » désigne en fait le carnet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:193
---@param path table Carnet.
function editor_rallyEditor_measurementsTab:setPath(path) end

--- Définit la snaproad utilisée pour l'accrochage et le calcul des distances.
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:198
---@param snaproad table|nil Objet snaproad.
function editor_rallyEditor_measurementsTab:setSnaproad(snaproad) end

--- Appelée quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:228
function editor_rallyEditor_measurementsTab:unselect() end

--- Renomme une mesure (sans sauvegarde immédiate).
---Source : lua/ge/extensions/editor/rallyEditor/measurementsTab.lua:537
---@param measurementId integer Identifiant.
---@param name string Nouveau nom.
function editor_rallyEditor_measurementsTab:updateMeasurement(measurementId, name) end

