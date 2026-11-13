---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenote.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de pacenote. Champs : notebook, id, pk (identifiant aléatoire stable), name, todo, playback_rules (condition texte), isolate, triggerType, slowCornerReleaseType, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint, audioMode, notes (par langue), structured, pacenoteWaypoints (sortedList), metadata (metadata.system masque le mode structuré), measurements {corner1, corner2, splitPoint, variants, selectedType, selected}, sortOrder, validation_issues, halfpoint, prevNote/nextNote, customAudioAnchors.
---@class gameplay_rally_notebook_pacenote
local gameplay_rally_notebook_pacenote = {}

--- Avance un waypoint de 2 m le long de la route, relance autofillDistanceCalls du carnet et réaligne la normale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2081
---@param snaproad table Snaproad.
---@param wp table Waypoint.
---@param fwd boolean Sens d'avance.
function gameplay_rally_notebook_pacenote:_moveWaypointTowardsStepper(snaproad, wp, fwd) end

--- Recale chaque waypoint sur le terrain avec zSnap.zSnapWithCurrentMethod.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:135
function gameplay_rally_notebook_pacenote:allToTerrain() end

--- Les mesures étant des données de projection, ne fait que rafraîchir le texte structuré (refreshStructured) sans modifier les éléments canoniques.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2378
function gameplay_rally_notebook_pacenote:applyMeasurements() end

--- Compile la pacenote (mis en cache) : audioObjs et durées pour les quatre modes, texte d'aperçu, distances avant/après et événement visuel (visualPacenoteEvent) produit par le compositeur visuel. Renvoie nil si _compileFailed.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:851
---@return table|nil  { id, name, noteText, audioObjs*, audioLen*, visualPacenoteEvent, distanceBefore, distanceAfter }.
function gameplay_rally_notebook_pacenote:asCompiled() end

--- Chemin du fichier audio du texte libre dans le dossier freeform de la mission.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1896
---@return string  Chemin.
function gameplay_rally_notebook_pacenote:audioFnameFreeform() end

--- Noms de fichiers du mode structuré hors ligne.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1970
---@param opts table|nil includeMissingVariant.
---@return string[]  Chemins.
function gameplay_rally_notebook_pacenote:audioFnamesStructuredOffline(opts) end

--- Noms de fichiers (premier candidat si plusieurs) du mode structuré en ligne.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1925
---@param opts table|nil includeMissingVariant.
---@return string[]  Chemins.
function gameplay_rally_notebook_pacenote:audioFnamesStructuredOnline(opts) end

--- Éléments audio du mode structuré hors ligne, selon le voicepack actif ; liste vide sans voicepack ou compositeur.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1942
---@param opts table|nil includeMissingVariant.
---@return table[]  Éléments audio.
function gameplay_rally_notebook_pacenote:audioItemsStructuredOffline(opts) end

--- Éléments audio du mode structuré en ligne : { candidates, category } ou { fname, category } par phrase.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1909
---@param opts table|nil includeMissingVariant.
---@return table[]  Éléments audio.
function gameplay_rally_notebook_pacenote:audioItemsStructuredOnline(opts) end

--- Durée audio totale (s) des audioObjs du mode actif.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:794
---@return number  Secondes.
function gameplay_rally_notebook_pacenote:audioLenTotal() end

--- audioObjs du mode audio courant issus de asCompiled (résolus, en cache) ; nil si la compilation a échoué ou mode inconnu.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:811
---@return table[]|nil  Liste d'audioObjs (pacenoteFname, audioLen, category, structuredTimingAfter…).
function gameplay_rally_notebook_pacenote:audioObjs() end

--- Recalcule les audioObjs du mode courant sans passer par le cache de compilation.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:827
---@return table[]|nil  audioObjs résolus.
function gameplay_rally_notebook_pacenote:audioObjsFresh() end

--- true en mode structuredOnline ou freeform (fichiers générés).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2292
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:canDeleteAudioFiles() end

--- Élément de l'emplacement 1 s'il est de type caution.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2353
---@return table|nil  Élément.
function gameplay_rally_notebook_pacenote:caution() end

--- Niveau de prudence (1 à 3) ou nil.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2359
---@return integer|nil  Niveau.
function gameplay_rally_notebook_pacenote:cautionLevel() end

--- true si tous les noms de fichiers sont non vides et existent (FS:fileExists).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:798
---@param audioMode string Mode (utilisé seulement pour un log commenté).
---@param fnames string[] Fichiers à tester.
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:checkFilesExist(audioMode, fnames) end

--- Oublie les pacenotes adjacentes.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1233
function gameplay_rally_notebook_pacenote:clearAdjacentNotes() end

--- Efface le cache de compilation et les audioObjs résolus ; à appeler après modification du contenu.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:638
function gameplay_rally_notebook_pacenote:clearCachedFgData() end

--- Remet à false le drapeau d'échec de compilation.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:643
function gameplay_rally_notebook_pacenote:clearCompilationFailures() end

--- Efface le cache des audioObjs résolus (tirage de variante).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:634
function gameplay_rally_notebook_pacenote:clearResolvedAudioObjs() end

--- Retire la marque à faire.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1220
function gameplay_rally_notebook_pacenote:clearTodo() end

--- Élément de l'emplacement 4 s'il est de type corner.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2368
---@return table|nil  Élément corner.
function gameplay_rally_notebook_pacenote:corner() end

--- Comme currentStructuredOutput mais sans les distances avant/après.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:495
---@return string[]  Textes.
function gameplay_rally_notebook_pacenote:currentStructuredContentOutput() end

--- Textes structurés actuels (en ligne), ou le champ structuré mémorisé en repli.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:487
---@return string[]  Textes.
function gameplay_rally_notebook_pacenote:currentStructuredOutput() end

--- Dossier audio custom du carnet.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2316
---@return string  Chemin.
function gameplay_rally_notebook_pacenote:customAudioFileDir() end

--- Supprime (FS:removeFile) les fichiers audio générés de la pacenote selon le mode ; sans effet si non supprimable.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2297
function gameplay_rally_notebook_pacenote:deleteAudioFiles() end

--- Supprime les textes d'une langue.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2312
---@param lang string Langue.
function gameplay_rally_notebook_pacenote:deleteLanguage(lang) end

--- true si la compilation a été marquée en échec.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:647
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:didCompileFail() end

--- Distance le long de la route entre le waypoint de lien « après » de cette pacenote et le cornerStart de la suivante, via snaproad:distanceBetweenPositions. Renvoie 0.0 si un waypoint manque et nil si aucune snaproad n'est disponible.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1708
---@param toPacenote table Pacenote suivante.
---@return number|nil  Distance en mètres.
function gameplay_rally_notebook_pacenote:distanceCornerEndToCornerStart(toPacenote) end

--- Dessine les arcs mesurés (cercle ajusté, points p1 p2 p3, qualité d'ajustement) de la variante sélectionnée ; ignore les arcs de diamètre >= 750 m ; marque les points de coupure de plusieurs segments.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1631
function gameplay_rally_notebook_pacenote:drawDebugMeasurement() end

--- Dessin en arrière-plan (cs et ce, faible opacité).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1831
---@param pacenoteToolsState table État.
---@param globalOpacity number Opacité.
---@param showTextOverride boolean|nil Force l'affichage du texte.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteBackground(pacenoteToolsState, globalOpacity, showTextOverride) end

--- Dessin commun : cs, caméra d'orbite, ce et géométrie de mesure selon drawConfig (cs, ce, campoint, measurement, textes, couleurs, rayons).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1598
---@param drawConfig table Configuration de dessin.
---@param pacenoteToolsState table État des outils de l'éditeur.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteHelper(drawConfig, pacenoteToolsState) end

--- Dessin de la pacenote suivante de la sélection.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1849
---@param pacenoteToolsState table État.
---@param pn_sel table Pacenote sélectionnée (non utilisé).
---@param globalOpacity number Opacité.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNext(pacenoteToolsState, pn_sel, globalOpacity) end

--- Dessin utilisé quand aucune pacenote n'est sélectionnée (cs seulement).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1802
---@param pacenoteToolsState table État.
---@param globalOpacity number Opacité globale.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNoSelection(pacenoteToolsState, globalOpacity) end

--- Variante colorée du dessin sans sélection (couleur de cs imposée, étiquette facultative).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1815
---@param pacenoteToolsState table État.
---@param globalOpacity number Opacité.
---@param csColor table Couleur {r,g,b}.
---@param showLabel boolean Afficher l'étiquette.
---@param textColor table Couleur du texte.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteNoSelectionRainbow(pacenoteToolsState, globalOpacity, csColor, showLabel, textColor) end

--- Dessin utilisé lors de la création d'une pacenote (cs et ce, rayon réduit).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1787
---@param pacenoteToolsState table État des outils.
function gameplay_rally_notebook_pacenote:drawDebugPacenotePartitionAllSnaproad(pacenoteToolsState) end

--- Dessin de la pacenote précédente de la sélection.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1865
---@param pacenoteToolsState table État.
---@param pn_sel table Pacenote sélectionnée (non utilisé).
---@param globalOpacity number Opacité.
function gameplay_rally_notebook_pacenote:drawDebugPacenotePrev(pacenoteToolsState, pn_sel, globalOpacity) end

--- Dessin de la pacenote sélectionnée (cs, ce, point de caméra si la caméra pacenoteOrbit est active, mesures).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1881
---@param pacenoteToolsState table État.
---@param globalOpacity number Opacité.
function gameplay_rally_notebook_pacenote:drawDebugPacenoteSelected(pacenoteToolsState, globalOpacity) end

--- Premier élément structuré d'un type donné.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2328
---@param itemType string Type (caution, corner, nom de modificateur).
---@return table|nil  Élément.
function gameplay_rally_notebook_pacenote:findItem(itemType) end

--- Tous les éléments structurés d'un type donné.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2337
---@param itemType string Type.
---@return table[]  Éléments.
function gameplay_rally_notebook_pacenote:findItems(itemType) end

--- Génère un texte libre à partir du structuré (compositeTextEscaped), en préservant les positions personnalisées des variables de distance, et l'enregistre.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2259
function gameplay_rally_notebook_pacenote:generateFreeformFromStructured() end

--- Mode audio effectif : celui du carnet si le réglage est auto.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:973
---@return integer  Valeur de RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_pacenote:getAudioMode() end

--- Mode audio propre à la pacenote (peut être auto).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:969
---@return integer  Valeur de RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_pacenote:getAudioModeSetting() end

--- Nom lisible du mode effectif.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:988
---@return string  Nom.
function gameplay_rally_notebook_pacenote:getAudioModeString() end

--- Longueur mémorisée.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2255
---@return number|nil  Longueur.
function gameplay_rally_notebook_pacenote:getCachedLength() end

--- Premier waypoint de type cornerEnd, ou nil.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1093
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:getCornerEndWaypoint() end

--- Premier waypoint de type cornerStart (liste triée), ou nil.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1084
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:getCornerStartWaypoint() end

--- Premier fichier audio custom, ou '' s'il n'y en a pas.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:619
---@return string  Chemin.
function gameplay_rally_notebook_pacenote:getCustomAudioFile() end

--- Mode custom : demande au carnet les noms de clips attribués à cette pacenote (répartition automatique plus ancrages manuels) et les résout en chemins complets via le voicepack propriétaire.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:608
---@return string[]  Chemins de fichiers audio.
function gameplay_rally_notebook_pacenote:getCustomAudioFiles() end

--- Description (transcription) du premier clip custom, '' si absente.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:624
---@return string  Description.
function gameplay_rally_notebook_pacenote:getCustomDescription() end

--- 'cs' ou 'ce' (défaut) : waypoint d'où se mesure la distance « après ».
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1692
---@return string  'cs' ou 'ce'.
function gameplay_rally_notebook_pacenote:getDistanceMeasureWaypoint() end

--- Délègue au carnet pour obtenir un identifiant unique (utilisé par les waypoints).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:106
---@return integer  Identifiant.
function gameplay_rally_notebook_pacenote:getNextUniqueIdentifier() end

--- Type du prochain waypoint à créer : cornerStart s'il manque, sinon cornerEnd s'il manque, sinon nil.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:110
---@return string|nil  Type de waypoint.
function gameplay_rally_notebook_pacenote:getNextWaypointType() end

--- Texte de distance « après » d'une langue ('' si absent).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:547
---@param lang string|nil Langue.
---@return string  Texte.
function gameplay_rally_notebook_pacenote:getNoteFieldAfter(lang) end

--- Distance « après » en mètres (-1 si inconnue).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:558
---@param lang string|nil Langue.
---@return number  Mètres.
function gameplay_rally_notebook_pacenote:getNoteFieldAfterMeters(lang) end

--- Texte de distance « avant » d'une langue ('' si absent).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:503
---@param lang string|nil Langue (défaut : copilote sélectionné).
---@return string  Texte.
function gameplay_rally_notebook_pacenote:getNoteFieldBefore(lang) end

--- Distance « avant » en mètres (-1 si inconnue).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:514
---@param lang string|nil Langue.
---@return number  Mètres.
function gameplay_rally_notebook_pacenote:getNoteFieldBeforeMeters(lang) end

--- Texte libre brut d'une langue ('' si absent).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:525
---@param lang string|nil Langue.
---@return string  Texte.
function gameplay_rally_notebook_pacenote:getNoteFieldFreeform(lang) end

--- Texte structuré mémorisé d'une langue ({} si absent).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:536
---@param lang string|nil Langue.
---@return table  Liste de textes.
function gameplay_rally_notebook_pacenote:getNoteFieldStructured(lang) end

--- Position de la caméra d'orbite (en cache) : centroïde de halfpoint, cs et ce ; sinon milieu de cs et ce ; sinon cs ; sinon (0,0,0).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2204
---@return vec3  Position.
function gameplay_rally_notebook_pacenote:getPosForOrbitCamera() end

--- Type de relâchement du slow corner.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2173
---@return integer  RallyEnums.slowCornerReleaseType.
function gameplay_rally_notebook_pacenote:getSlowCornerReleaseType() end

--- Type de déclenchement.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2165
---@return integer  RallyEnums.triggerType.
function gameplay_rally_notebook_pacenote:getTriggerType() end

--- true si l'emplacement 4 contient un corner.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2364
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:hasCorner() end

--- true si un élément du type donné existe.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2374
---@param itemType string Type de modificateur.
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:hasModifier(itemType) end

--- Constructeur : initialise tous les champs par défaut (déclenchement dynamique, mode audio auto, textes vides par langue du carnet, structuré vide, liste de waypoints vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:50
---@param notebook table Carnet propriétaire.
---@param name string|nil Nom (défaut « Pacenote <id> »).
---@param forceId integer|nil Identifiant imposé.
function gameplay_rally_notebook_pacenote:init(notebook, name, forceId) end

--- Oublie la position de caméra en cache.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2251
function gameplay_rally_notebook_pacenote:invalidateCamPosCache() end

--- true si le mode effectif est custom.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1005
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isAudioModeCustom() end

--- true si le mode effectif est freeform.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1001
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isAudioModeFreeform() end

--- true si le mode effectif est structuredOffline.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:997
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isAudioModeStructuredOffline() end

--- true si le mode effectif est structuredOnline.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:993
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isAudioModeStructuredOnline() end

--- true si c'est la dernière pacenote triée du carnet.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2107
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isLastPacenote() end

--- true si slowCorner et type ceMinus5.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2193
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCeMinus5() end

--- true si slowCorner et type ceStatic.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2189
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCeStatic() end

--- true si slowCorner et type csHalf.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2181
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsHalf() end

--- true si slowCorner et type csStatic.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2185
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsStatic() end

--- true si slowCorner et type csStaticMinus40.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2177
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:isSlowCornerReleaseCsStaticMinus40() end

--- true si validation_issues est vide (après validate).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1029
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:is_valid() end

--- Éléments structurés ordonnés (structured:orderedItems).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2324
---@return table[]  Éléments.
function gameplay_rally_notebook_pacenote:items() end

--- Marque la pacenote comme à faire.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1216
function gameplay_rally_notebook_pacenote:markTodo() end

--- true si le texte libre d'une des langues correspond au motif de recherche (rallyUtil.matchSearchPattern).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2069
---@param searchPattern string Motif.
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:matchesSearchPattern(searchPattern) end

--- Type de mesure normalisé d'un corner (via geoPacenotes.normalizeMeasurementType).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:442
---@param corner table|nil Élément corner.
---@return string  Type de mesure (single, split2, split3).
function gameplay_rally_notebook_pacenote:measurementTypeForCorner(corner) end

--- Variante de mesure pour un type, avec repli sur la variante par défaut puis measurements.corner1.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:446
---@param measurementType string|nil Type de mesure.
---@return table|nil  Mesure (diameter, direction, arcDegrees, arcMeters, chordMeters…).
function gameplay_rally_notebook_pacenote:measurementVariantForType(measurementType) end

--- Répète step fois l'avance de 2 m d'un waypoint le long de la route.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2100
---@param snaproads table Snaproad (nom pluriel trompeur).
---@param wp table Waypoint.
---@param fwd boolean Sens.
---@param step integer|nil Nombre de pas (1 par défaut).
function gameplay_rally_notebook_pacenote:moveWaypointTowards(snaproads, wp, fwd, step) end

--- Découpe le nom en base et numéro final (motif « (.-)%s*([%d%.]+)$ »).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2064
---@return string|nil  Base.
---@return string|nil  Numéro.
function gameplay_rally_notebook_pacenote:nameComponents() end

--- Mode custom : descriptions des clips assignés, jointes par ' | ' ; nil s'il n'y en a pas.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1728
---@return string|nil  Texte.
function gameplay_rally_notebook_pacenote:noteOutputCustom() end

--- Texte libre final d'une langue, avec variables de distance avant/après interpolées. Chaîne vide si la compilation a échoué ou si la note est inutilisable.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:236
---@param lang string|nil Langue (défaut : celle du copilote sélectionné).
---@return string  Texte.
function gameplay_rally_notebook_pacenote:noteOutputFreeform(lang) end

--- Aperçu texte selon le mode (structuré, freeform, custom) ; '<empty>' si rien ; préfixé de '[S] ' pour un slow corner.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1749
---@return string  Aperçu.
function gameplay_rally_notebook_pacenote:noteOutputPreview() end

--- Liste de textes du mode structuré hors ligne ({} si indisponible).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:479
---@return string[]  Textes.
function gameplay_rally_notebook_pacenote:noteOutputStructuredOffline() end

--- Liste de textes du mode structuré en ligne ; si le compositeur est absent, retombe sur les textes mémorisés dans self.notes[lang].note.structured.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:380
---@param lang string|nil Langue.
---@return string[]  Textes.
function gameplay_rally_notebook_pacenote:noteOutputStructuredOnline(lang) end

--- Texte affiché au-dessus du waypoint dans la vue 3D (= noteOutputPreview).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1782
---@return string  Texte.
function gameplay_rally_notebook_pacenote:noteTextForDrawDebug() end

--- Recharge depuis les données sauvegardées : convertit l'ancien codriverWait en triggerType, ignore les waypoints hérités fwdAudioTrigger, copie data.notes si présent et recharge structured.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1143
---@param data table Données issues de onSerialize.
---@param oldIdMap table Table de correspondance anciens/nouveaux identifiants.
function gameplay_rally_notebook_pacenote:onDeserialized(data, oldIdMap) end

--- Données à sauvegarder : oldId, name, pk, playback_rules, isolate, triggerType, slowCornerReleaseType, audioMode, todo, metadata, waypoints, structured, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint (si différent de 'ce'), customAudioAnchors (si présents). Les textes notes ne sont pas écrits.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1102
---@return table  Table sérialisable en JSON.
function gameplay_rally_notebook_pacenote:onSerialize() end

--- Libellé pour une liste de sélection : deuxième mot du nom + ' - ' + aperçu.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1033
---@return string  Libellé.
function gameplay_rally_notebook_pacenote:pacenoteTextForSelect() end

--- Évalue playback_rules : vide/nil ou 'true'/'t' autorise, 'false'/'f' refuse, sinon la condition est compilée avec loadstring et exécutée (voir notes : bug sur `context`). Renvoie le résultat et un message d'erreur éventuel.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1987
---@param currLap integer|nil Tour courant (-1 par défaut).
---@param maxLap integer|nil Nombre de tours (-1 par défaut).
---@return boolean|any  Autorisé ou non.
---@return string|nil  Erreur de syntaxe ou d'exécution.
function gameplay_rally_notebook_pacenote:playbackAllowed(currLap, maxLap) end

--- Nettoie (trim) le texte libre et le réécrit, sauf s'il est vide, bloqué (autofill_blocker) ou de transcription inconnue.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2111
function gameplay_rally_notebook_pacenote:refreshFreeform() end

--- Recompose le texte structuré en ligne et le stocke dans le champ structuré de la langue sélectionnée.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2197
function gameplay_rally_notebook_pacenote:refreshStructured() end

--- Résout (une fois par mode, résultat mis en cache) les audioObjs : pour chaque objet ayant des candidats, tire une variante au hasard (math.random).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:774
---@param mode string 'freeform', 'structuredOnline', 'structuredOffline' ou 'custom'.
---@param audioObjs table[]|nil audioObjs non résolus.
---@return table[]|nil  audioObjs concrets.
function gameplay_rally_notebook_pacenote:resolveAudioObjs(mode, audioObjs) end

--- Copilote sélectionné (via le carnet).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1025
---@return table  Copilote.
function gameplay_rally_notebook_pacenote:selectedCodriver() end

--- Langue du copilote sélectionné (via le carnet).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1021
---@return string  Langue.
function gameplay_rally_notebook_pacenote:selectedCodriverLanguage() end

--- Variante de mesure correspondant au corner actuel.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:453
---@return table|nil  Mesure.
function gameplay_rally_notebook_pacenote:selectedMeasurementVariant() end

--- Mémorise les pacenotes précédente et suivante (pour le dessin).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1228
---@param prevNote table|nil Précédente.
---@param nextNote table|nil Suivante.
function gameplay_rally_notebook_pacenote:setAdjacentNotes(prevNote, nextNote) end

--- Fixe le rayon de tous les waypoints (ou seulement de ceux d'un type).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:127
---@param newRadius number Rayon en mètres.
---@param wpType string|nil Type à filtrer, nil pour tous.
function gameplay_rally_notebook_pacenote:setAllRadii(newRadius, wpType) end

--- Définit le mode audio propre à la pacenote.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1009
---@param mode integer Valeur de RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_pacenote:setAudioMode(mode) end

--- Mémorise la longueur de la pacenote.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2247
---@param len number Longueur en mètres.
function gameplay_rally_notebook_pacenote:setCachedLength(len) end

--- Définit le waypoint de mesure (toute valeur autre que 'cs' revient à 'ce' et n'est pas stockée).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1696
---@param value string|nil 'cs' ou 'ce'.
function gameplay_rally_notebook_pacenote:setDistanceMeasureWaypoint(value) end

--- Stub : journalise un avertissement 'not implemented'.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1224
---@param navgraphName string Non utilisé.
---@param fallback any Non utilisé.
function gameplay_rally_notebook_pacenote:setNavgraph(navgraphName, fallback) end

--- Définit texte et distance « après » pour la langue du copilote sélectionné.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:597
---@param val string Texte.
---@param meters number Distance en mètres (-1 inconnue).
function gameplay_rally_notebook_pacenote:setNoteFieldAfter(val, meters) end

--- Définit texte et distance « avant » pour la langue du copilote sélectionné.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:569
---@param val string Texte.
---@param meters number Distance en mètres (-1 inconnue).
function gameplay_rally_notebook_pacenote:setNoteFieldBefore(val, meters) end

--- Définit le texte libre d'une langue.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:577
---@param val string Texte.
---@param lang string|nil Langue.
function gameplay_rally_notebook_pacenote:setNoteFieldFreeform(val, lang) end

--- Définit le texte structuré mémorisé d'une langue.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:587
---@param val table Liste de textes.
---@param lang string|nil Langue.
function gameplay_rally_notebook_pacenote:setNoteFieldStructured(val, lang) end

--- Définit le type de relâchement du slow corner.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2169
---@param val integer RallyEnums.slowCornerReleaseType.
function gameplay_rally_notebook_pacenote:setSlowCornerReleaseType(val) end

--- Définit le type de déclenchement.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2161
---@param val integer Valeur de RallyEnums.triggerType.
function gameplay_rally_notebook_pacenote:setTriggerType(val) end

--- '[S] slow corner' si slowCorner, sinon ''.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1051
---@return string  Texte.
function gameplay_rally_notebook_pacenote:slowCornerAsText() end

--- Copie du structuré { schemaVersion, items } enrichie, sur le corner, des mesures vivantes : direction (-1 gauche, 1 droite), intensity (diamètre), arcDegrees, arcMeters, chordMeters. Ne modifie pas le structuré source.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:457
---@return table  Structuré projeté.
function gameplay_rally_notebook_pacenote:structuredForProjection() end

--- Idem pour le mode hors ligne (voicepack actif et compositeur hors ligne).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:352
---@param opts table|nil resolveVariants, includeMissingVariant.
---@return table[]|nil  Entrées ; nil sans voicepack ou compositeur.
function gameplay_rally_notebook_pacenote:structuredPhraseEntriesOffline(opts) end

--- Entrées de phrases du compositeur texte « en ligne » pour le contenu structuré projeté ; peut résoudre les variantes audio du voicepack de mission.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:326
---@param lang string|nil Langue pour les champs avant/après.
---@param distBefore string|nil Surcharge du texte de distance avant.
---@param distAfter string|nil Surcharge du texte de distance après.
---@param opts table|nil resolveVariants, includeMissingVariant.
---@return table[]|nil  Entrées { text, category, ... } ; nil si pas de compositeur.
function gameplay_rally_notebook_pacenote:structuredPhraseEntriesOnline(lang, distBefore, distAfter, opts) end

--- Bascule distanceBeforeModifier (place la distance avant les modificateurs post-virage).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2136
function gameplay_rally_notebook_pacenote:toggleDistanceBeforeModifier() end

--- Bascule ignoreDistanceCalls.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2128
function gameplay_rally_notebook_pacenote:toggleIgnoreDistanceCalls() end

--- Bascule includeLinkWord (vrai par défaut).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2132
function gameplay_rally_notebook_pacenote:toggleIncludeLinkWord() end

--- Bascule isolate ; à l'activation, met les distances avant/après au niveau interne autodist_internal_level1, à la désactivation les vide pour que l'autofill reprenne (sauf champs bloqués).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2140
function gameplay_rally_notebook_pacenote:toggleIsolate() end

--- Bascule slowCorner.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2124
function gameplay_rally_notebook_pacenote:toggleSlowCorner() end

--- Abréviation du type de déclenchement : I, csS, cs+50%, ce-5m, ceS ; nil pour les autres.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1068
---@return string|nil  Indicateur.
function gameplay_rally_notebook_pacenote:triggerTypeAsSmallIndicator() end

--- Texte « triggerType: [indicateur] nom » pour l'éditeur.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1059
---@return string  Texte.
function gameplay_rally_notebook_pacenote:triggerTypeAsText() end

--- Migration de format : transforme chaque langData.note en { freeform = ancien, structured = {} }.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1206
function gameplay_rally_notebook_pacenote:upgradeFromV2ToV3() end

--- true si le contenu structuré est utilisé : mode structuré en ligne ou hors ligne, et pas une pacenote système (metadata.system).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1013
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenote:useStructured() end

--- Remplit validation_issues : waypoint cs/ce manquant, nom vide, note vide, fichier custom manquant, note libre manquante ou transcription inconnue.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:930
function gameplay_rally_notebook_pacenote:validate() end

--- Position et rotation pour placer un véhicule avant la pacenote : à distAway mètres de cs le long de sa normale, du côté opposé à ce, orienté vers cs.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:2035
---@param distAway number|nil Distance en mètres (15 par défaut).
---@return vec3|nil  Position.
---@return quat|nil  Rotation ; nil, nil si cs ou ce manque.
function gameplay_rally_notebook_pacenote:vehiclePlacementPosAndRot(distAway) end

--- Waypoint de départ pour la distance « après » selon distanceMeasureWaypoint.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1701
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:waypointForAfterLink() end

--- Waypoint de référence pour la distance « avant » : cornerStart.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenote.lua:1687
---@return table|nil  Waypoint.
function gameplay_rally_notebook_pacenote:waypointForBeforeLink() end

