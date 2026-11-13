---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mesure géométrique des virages des pacenotes à partir de la route (snaproad). À partir des points d'une partition, il ajuste un ou plusieurs cercles (méthode 2D à trois points) pour obtenir rayon, diamètre, longueur d'arc, angle et qualité d'ajustement, en trois variantes : 'single' (un cercle), 'split2' (deux parties), 'split3' (trois parties). Il en déduit l'intensité du virage (selon le compositeur de texte du notebook), le sens, les candidats d'épingle à cheveux et l'évolution du diamètre. Il dessine aussi la mesure en debug. Appelé par Snaproad:measurePartition dans l'éditeur de rallye.
--- Accès : extension `gameplay_rally_snaproad_geoPacenotes` : `extensions.load("gameplay_rally_snaproad_geoPacenotes")`, puis la globale `gameplay_rally_snaproad_geoPacenotes`
---@class gameplay_rally_snaproad_geoPacenotes
---@field defaultMeasurementType string Type de mesure par défaut : 'single'.
---@field measurementTypeOrder string[] Ordre des types : 'single', 'split2', 'split3'.
---@field measurementTypes table<string, table> Description de chaque type : {id, label ('Single fit', 'Two-part fit', 'Three-part fit'), segmentCount (1, 2, 3)}.
gameplay_rally_snaproad_geoPacenotes = {}

--- Calcule le cercle passant par trois points avec la méthode 2D (XY) : centre (Z moyen des trois points), rayon (distance 2D du centre à p1) et longueur d'arc de p1 à p3 par p2 (sens déterminé par le produit vectoriel).
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:220
---@param p1 vec3 Premier point
---@param p2 vec3 Point intermédiaire
---@param p3 vec3 Dernier point
---@return vec3|nil  Centre ; nil si les points sont alignés
---@return number  Rayon en mètres (0 si échec)
---@return number  Longueur d'arc en mètres (0 si échec)
function gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3) end

--- Point milieu d'un virage : halfpointPos ou halfpoint du pacenote s'il existe, sinon le point focus de la partition le plus proche du milieu géométrique entre début et fin.
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:515
---@param pn table Pacenote
---@param startPos vec3 Début du virage
---@param endPos vec3 Fin du virage
---@param partition table Partition avec focus_points
---@return vec3  Position du milieu
function gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition) end

--- Dessine une mesure avec debugDrawer : arc de cercle en prismes, rayons, et texte d'arc (longueur, diamètre, qualité d'ajustement, angle). Ne dessine rien si le centre est nil ou le rayon <= 0.
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:773
---@param center vec3|nil Centre du cercle
---@param radius number Rayon (m)
---@param arcDistance number Longueur d'arc (m)
---@param p1 vec3 Début de l'arc
---@param p2 vec3 Point intermédiaire
---@param p3 vec3 Fin de l'arc
---@param clr table|nil Couleur (violet par défaut)
---@param alpha number|nil Opacité (0,7 par défaut)
---@param prefix string|nil Préfixe du texte
---@param fitQuality number|nil Qualité d'ajustement (RMSE normalisé)
---@param arcDegrees number|nil Angle de l'arc en degrés
function gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees) end

--- Mesure le virage d'un pacenote à partir des points focus de la partition : construit le chemin, ajuste les cercles des trois variantes, annote intensité, sens et épingle à cheveux, et renseigne pn.measurements (voir notes).
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:800
---@param pn table Pacenote avec waypoints de début et de fin
---@param focusPoints table[] Points focus de la partition (au moins 3)
---@param skipAuto boolean|nil Non utilisé
function gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto) end

--- Liste ordonnée des définitions de types de mesure (pour une liste déroulante).
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:32
---@return table[]  Éléments {id, label, segmentCount}
function gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions() end

--- Renvoie le type s'il existe, sinon le type par défaut ('single').
---Source : lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua:27
---@param measurementType string|nil Type de mesure
---@return string  Type valide
function gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType) end

