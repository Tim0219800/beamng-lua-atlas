---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les marqueurs d'édition du Track Builder (inclinaison, hauteur, largeur, checkpoint, murs gauche et droit, plafond) et l'interpolation des valeurs qu'ils portent le long de la piste. Les marqueurs sont des objets TSStatic créés et déplacés dans la scène (canSave = false). Chaque type de marqueur déclare dans une table interne 'types' son mode d'interpolation ('points', 'segments', 'both' ou 'single'), sa fonction d'interpolation de champ et sa fonction de placement des marqueurs. Le module calcule aussi les caps de début et fin entre segments voisins.
--- Accès : extension `util_trackBuilder_markers` : `extensions.load("util_trackBuilder_markers")`, puis la globale `util_trackBuilder_markers`
---@class util_trackBuilder_markers
---@field names string[] Liste des types de marqueurs gérés : bank, height, width, checkpoint, leftWall, rightWall, ceilingMesh.
util_trackBuilder_markers = {}

--- Note que le segment d'indice index a un marqueur modifié pour le champ name ; interpolate ne recalcule alors que les zones concernées.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:999
---@param name string Type de marqueur.
---@param index integer Indice du segment dans la piste.
function util_trackBuilder_markers.addMarkerChange(name, index) end

--- Calcule les caps de début et de fin entre segments consécutifs pour centerMesh, leftMesh, rightMesh (si les valeurs diffèrent), et pour leftWall, rightWall, ceilingMesh (si l'état actif diffère). Le segment 1 est ignoré ; si closed est vrai, le dernier segment est comparé au deuxième.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:921
---@param segments table[] Segments de la piste.
---@param closed boolean|nil Piste en boucle fermée.
function util_trackBuilder_markers.caps(segments, closed) end

--- Supprime de la scène les marqueurs du type donné.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:990
---@param name string Type de marqueur présent dans names.
function util_trackBuilder_markers.clearMarkers(name) end

--- Cache les marqueurs du type donné en mettant leur échelle à 0.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:982
---@param name string Type de marqueur présent dans names.
function util_trackBuilder_markers.hideMarkers(name) end

--- Interpole le champ nameOfField sur toute la piste selon le mode du type ('points', 'segments', 'both' ou 'single'), puis vide la liste des changements de ce champ.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:820
---@param nameOfField string Type de marqueur (bank, height, width, leftWall…).
---@param track table[] Liste ordonnée des segments.
function util_trackBuilder_markers.interpolate(nameOfField, track) end

--- Délègue à la fonction d'interpolation propre au type (par exemple interpolateBank, interpolateWidth) pour écrire la valeur interpolée dans point.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:972
---@param name string Type de marqueur.
---@param t number Fraction dans [0, 1].
---@param a table Valeur de départ.
---@param b table Valeur d'arrivée.
---@param point table Point ou markerInfo à écrire.
---@param length number Longueur de l'intervalle.
function util_trackBuilder_markers.interpolateField(name, t, a, b, point, length) end

--- Interpole entre deux valeurs successives de marqueurs sur les points des segments concernés (seulement s'ils sont dans markerChanges ou frais), selon la longueur parcourue.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:721
---@param nameOfField string Type de marqueur.
---@param track table[] Segments de la piste.
function util_trackBuilder_markers.interpolateOverPoints(nameOfField, track) end

--- Applique la valeur de marqueur précédente à chaque segment (mode 'segments'), à partir du premier segment qui porte le champ.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:781
---@param nameOfField string Type de marqueur.
---@param track table[] Segments de la piste.
function util_trackBuilder_markers.interpolateOverSegments(nameOfField, track) end

--- Interpole entre startValue et endValue sur les points d'un segment (fraction t = (p.length - startLength)/(endLength - startLength)) et sur son markerInfo ; sans points, ne calcule que markerInfo. Met refreshMesh à true.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:931
---@param segment table Segment à mettre à jour.
---@param startValue table Valeur de départ (avec .value, .interpolation…).
---@param endValue table|nil Valeur d'arrivée ; nil pour garder startValue.
---@param startLength number Longueur cumulée au départ.
---@param endLength number|nil Longueur cumulée à l'arrivée.
---@param nameOfField string Type de marqueur.
function util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField) end

--- Pour les types 'single' (checkpoint), appelle la fonction de segment seulement pour les indices enregistrés par addMarkerChange.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:808
---@param nameOfField string Type de marqueur.
---@param track table[] Segments de la piste.
function util_trackBuilder_markers.interpolateSingle(nameOfField, track) end

--- Interpolation linéaire : valeur t, dérivée 1 (0 hors de [0, 1] à gauche, 1 à droite).
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:439
---@param t number Position.
---@return number  Valeur.
---@return number  Dérivée.
function util_trackBuilder_markers.linear(t) end

--- Interpolation en t².
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:449
---@param t number Position.
---@return number  Valeur.
---@return number  Dérivée.
function util_trackBuilder_markers.pow2(t) end

--- Interpolation en t³.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:459
---@param t number Position.
---@return number  Valeur.
---@return number  Dérivée.
function util_trackBuilder_markers.pow3(t) end

--- Interpolation en t⁴.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:469
---@param t number Position.
---@return number  Valeur.
---@return number  Dérivée.
function util_trackBuilder_markers.pow4(t) end

--- Interpolation lissée (3t²-2t³) : va de 0 à 1 avec une pente horizontale en 0 et en 1.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:480
---@param t number Position.
---@return number  Valeur.
---@return number  Dérivée.
function util_trackBuilder_markers.smoothSlope(t) end

--- Interpolation encore plus lisse (polynôme de Perlin 6t⁵-15t⁴+10t³), pente et courbure nulles aux extrémités.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:491
---@param t number Position.
---@return number  Valeur.
---@return number  Dérivée.
function util_trackBuilder_markers.smootherSlope(t) end

--- Interpolation en escalier : renvoie toujours 0 et 0 (la valeur de départ est conservée).
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:435
---@param t number Position dans [0, 1].
---@return number  Valeur.
---@return number  Dérivée.
function util_trackBuilder_markers.step(t) end

--- Crée, supprime et repositionne les objets marqueurs du type donné pour les nœuds de la piste ; sans effet si le type n'a pas de fonction transformMarkers.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:976
---@param name string Type de marqueur.
---@param allNodes table[] Tous les nœuds/segments de la piste.
function util_trackBuilder_markers.transformMarkers(name, allNodes) end

--- Oublie toutes les listes de marqueurs (remises à {}) sans supprimer les objets de la scène ; à utiliser après un nettoyage de scène.
---Source : lua/ge/extensions/util/trackBuilder/markers.lua:1007
function util_trackBuilder_markers.unloadAll() end

