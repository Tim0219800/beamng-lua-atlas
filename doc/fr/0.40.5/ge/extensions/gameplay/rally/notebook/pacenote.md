# `gameplay_rally_notebook_pacenote`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/pacenote.lua` · VM : Game Engine (GE) · 2391 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/notebook/pacenote")` (fichier sous extensions/ mais pas une extension classique)

Une pacenote de rallye (une note du copilote) : classe instanciée par le carnet (notebook, path.lua). Elle porte deux waypoints (cornerStart et cornerEnd) dans une sortedList, un contenu structuré à six emplacements (structured.lua), des textes par langue (distance avant/après, texte libre), un mode audio (auto, freeform, structuredOnline, structuredOffline, custom), un type de déclenchement, des mesures géométriques du virage et des caches (compilation, longueur, position caméra). Elle compose le texte et les fichiers audio via les compositeurs et le voicepack du carnet, produit l'objet « compilé » joué par le copilote (audioObjs, événement visuel), se valide, se sérialise et se dessine dans l'éditeur (debugDrawer). Utile à un moddeur pour lire ou modifier un carnet chargé.

## Exemple

```lua
local Pacenote = require('/lua/ge/extensions/gameplay/rally/notebook/pacenote')
local pn = Pacenote(notebook, 'Pacenote 12')
print(pn:noteOutputPreview(), pn:getAudioModeString())
local corner = pn:corner() -- nil ou { type='corner', ... }
```

## Remarques

- Le module renvoie un constructeur : Pacenote(notebook, name, forceId). Le notebook doit fournir getNextUniqueIdentifier, getLanguages, selectedCodriverLanguage, getTextCompositor, getOfflineTextCompositor, getVisualCompositor2, resolveActiveVoicepack, load*PacenoteMetadata, etc.
- C.noteFields = { before, beforeMeters, note, after, afterMeters } : clés des champs d'un texte par langue (self.notes[lang]).
- self.notes n'est plus sauvegardé : onSerialize n'écrit pas les textes ; le texte structuré est reconstruit au chargement. Un notebook en mode freeform perd donc son texte libre à la sauvegarde (avertissement 'W' journalisé).
- Bug probable : playbackAllowed utilise la variable `context` alors que sa définition est commentée (local context = {currLap, maxLap}) ; setfenv(func, context) reçoit donc nil (global) et la branche « code Lua » échoue ou se comporte de façon indéfinie. Seuls nil/vide, true/t, false/f sont fiables.
- validate() remplit self.validation_issues et ne renvoie rien ; utiliser is_valid() ensuite (true si aucune anomalie).
- Les modes de dessin (drawDebugPacenote*) dépendent de pacenoteToolsState (selected_pn_id, selected_wp_id, shift, showMeasurements) fourni par l'éditeur ; ils sont sans objet hors éditeur.
- setNavgraph est un stub qui journalise 'setNavgraph() not implemented'.
- La distance « après » est mesurée depuis cornerEnd par défaut, ou depuis cornerStart si distanceMeasureWaypoint == 'cs' (valeur par défaut 'ce', non sérialisée tant qu'elle vaut 'ce').

## Classe `C`

Instance de pacenote. Champs : notebook, id, pk (identifiant aléatoire stable), name, todo, playback_rules (condition texte), isolate, triggerType, slowCornerReleaseType, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint, audioMode, notes (par langue), structured, pacenoteWaypoints (sortedList), metadata (metadata.system masque le mode structuré), measurements {corner1, corner2, splitPoint, variants, selectedType, selected}, sortOrder, validation_issues, halfpoint, prevNote/nextNote, customAudioAnchors.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_notebook_pacenote")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_moveWaypointTowardsStepper(snaproad, wp, fwd)` | Avance un waypoint de 2 m le long de la route, relance autofillDistanceCalls du carnet et réaligne la normale. | 2081 |
| `C:allToTerrain()` | Recale chaque waypoint sur le terrain avec zSnap.zSnapWithCurrentMethod. | 135 |
| `C:applyMeasurements()` | Les mesures étant des données de projection, ne fait que rafraîchir le texte structuré (refreshStructured) sans modifier les éléments canoniques. | 2378 |
| `C:asCompiled()` | Compile la pacenote (mis en cache) : audioObjs et durées pour les quatre modes, texte d'aperçu, distances avant/après et événement visuel (visualPacenoteEvent) produit par le compositeur visuel. Renvoie nil si _compileFailed. | 851 |
| `C:audioFnameFreeform()` | Chemin du fichier audio du texte libre dans le dossier freeform de la mission. | 1896 |
| `C:audioFnamesStructuredOffline(opts)` | Noms de fichiers du mode structuré hors ligne. | 1970 |
| `C:audioFnamesStructuredOnline(opts)` | Noms de fichiers (premier candidat si plusieurs) du mode structuré en ligne. | 1925 |
| `C:audioItemsStructuredOffline(opts)` | Éléments audio du mode structuré hors ligne, selon le voicepack actif ; liste vide sans voicepack ou compositeur. | 1942 |
| `C:audioItemsStructuredOnline(opts)` | Éléments audio du mode structuré en ligne : { candidates, category } ou { fname, category } par phrase. | 1909 |
| `C:audioLenTotal()` | Durée audio totale (s) des audioObjs du mode actif. | 794 |
| `C:audioObjs()` | audioObjs du mode audio courant issus de asCompiled (résolus, en cache) ; nil si la compilation a échoué ou mode inconnu. | 811 |
| `C:audioObjsFresh()` | Recalcule les audioObjs du mode courant sans passer par le cache de compilation. | 827 |
| `C:canDeleteAudioFiles()` | true en mode structuredOnline ou freeform (fichiers générés). | 2292 |
| `C:caution()` | Élément de l'emplacement 1 s'il est de type caution. | 2353 |
| `C:cautionLevel()` | Niveau de prudence (1 à 3) ou nil. | 2359 |
| `C:checkFilesExist(audioMode, fnames)` | true si tous les noms de fichiers sont non vides et existent (FS:fileExists). | 798 |
| `C:clearAdjacentNotes()` | Oublie les pacenotes adjacentes. | 1233 |
| `C:clearCachedFgData()` | Efface le cache de compilation et les audioObjs résolus ; à appeler après modification du contenu. | 638 |
| `C:clearCompilationFailures()` | Remet à false le drapeau d'échec de compilation. | 643 |
| `C:clearResolvedAudioObjs()` | Efface le cache des audioObjs résolus (tirage de variante). | 634 |
| `C:clearTodo()` | Retire la marque à faire. | 1220 |
| `C:corner()` | Élément de l'emplacement 4 s'il est de type corner. | 2368 |
| `C:currentStructuredContentOutput()` | Comme currentStructuredOutput mais sans les distances avant/après. | 495 |
| `C:currentStructuredOutput()` | Textes structurés actuels (en ligne), ou le champ structuré mémorisé en repli. | 487 |
| `C:customAudioFileDir()` | Dossier audio custom du carnet. | 2316 |
| `C:deleteAudioFiles()` | Supprime (FS:removeFile) les fichiers audio générés de la pacenote selon le mode ; sans effet si non supprimable. | 2297 |
| `C:deleteLanguage(lang)` | Supprime les textes d'une langue. | 2312 |
| `C:didCompileFail()` | true si la compilation a été marquée en échec. | 647 |
| `C:distanceCornerEndToCornerStart(toPacenote)` | Distance le long de la route entre le waypoint de lien « après » de cette pacenote et le cornerStart de la suivante, via snaproad:distanceBetweenPositions. Renvoie 0.0 si un waypoint manque et nil si aucune snaproad n'est disponible. | 1708 |
| `C:drawDebugMeasurement()` | Dessine les arcs mesurés (cercle ajusté, points p1 p2 p3, qualité d'ajustement) de la variante sélectionnée ; ignore les arcs de diamètre >= 750 m ; marque les points de coupure de plusieurs segments. | 1631 |
| `C:drawDebugPacenoteBackground(pacenoteToolsState, globalOpacity, showTextOverride)` | Dessin en arrière-plan (cs et ce, faible opacité). | 1831 |
| `C:drawDebugPacenoteHelper(drawConfig, pacenoteToolsState)` | Dessin commun : cs, caméra d'orbite, ce et géométrie de mesure selon drawConfig (cs, ce, campoint, measurement, textes, couleurs, rayons). | 1598 |
| `C:drawDebugPacenoteNext(pacenoteToolsState, pn_sel, globalOpacity)` | Dessin de la pacenote suivante de la sélection. | 1849 |
| `C:drawDebugPacenoteNoSelection(pacenoteToolsState, globalOpacity)` | Dessin utilisé quand aucune pacenote n'est sélectionnée (cs seulement). | 1802 |
| `C:drawDebugPacenoteNoSelectionRainbow(pacenoteToolsState, globalOpacity, csColor, showLabel, textColor)` | Variante colorée du dessin sans sélection (couleur de cs imposée, étiquette facultative). | 1815 |
| `C:drawDebugPacenotePartitionAllSnaproad(pacenoteToolsState)` | Dessin utilisé lors de la création d'une pacenote (cs et ce, rayon réduit). | 1787 |
| `C:drawDebugPacenotePrev(pacenoteToolsState, pn_sel, globalOpacity)` | Dessin de la pacenote précédente de la sélection. | 1865 |
| `C:drawDebugPacenoteSelected(pacenoteToolsState, globalOpacity)` | Dessin de la pacenote sélectionnée (cs, ce, point de caméra si la caméra pacenoteOrbit est active, mesures). | 1881 |
| `C:findItem(itemType)` | Premier élément structuré d'un type donné. | 2328 |
| `C:findItems(itemType)` | Tous les éléments structurés d'un type donné. | 2337 |
| `C:generateFreeformFromStructured()` | Génère un texte libre à partir du structuré (compositeTextEscaped), en préservant les positions personnalisées des variables de distance, et l'enregistre. | 2259 |
| `C:getAudioMode()` | Mode audio effectif : celui du carnet si le réglage est auto. | 973 |
| `C:getAudioModeSetting()` | Mode audio propre à la pacenote (peut être auto). | 969 |
| `C:getAudioModeString()` | Nom lisible du mode effectif. | 988 |
| `C:getCachedLength()` | Longueur mémorisée. | 2255 |
| `C:getCornerEndWaypoint()` | Premier waypoint de type cornerEnd, ou nil. | 1093 |
| `C:getCornerStartWaypoint()` | Premier waypoint de type cornerStart (liste triée), ou nil. | 1084 |
| `C:getCustomAudioFile()` | Premier fichier audio custom, ou '' s'il n'y en a pas. | 619 |
| `C:getCustomAudioFiles()` | Mode custom : demande au carnet les noms de clips attribués à cette pacenote (répartition automatique plus ancrages manuels) et les résout en chemins complets via le voicepack propriétaire. | 608 |
| `C:getCustomDescription()` | Description (transcription) du premier clip custom, '' si absente. | 624 |
| `C:getDistanceMeasureWaypoint()` | 'cs' ou 'ce' (défaut) : waypoint d'où se mesure la distance « après ». | 1692 |
| `C:getNextUniqueIdentifier()` | Délègue au carnet pour obtenir un identifiant unique (utilisé par les waypoints). | 106 |
| `C:getNextWaypointType()` | Type du prochain waypoint à créer : cornerStart s'il manque, sinon cornerEnd s'il manque, sinon nil. | 110 |
| `C:getNoteFieldAfter(lang)` | Texte de distance « après » d'une langue ('' si absent). | 547 |
| `C:getNoteFieldAfterMeters(lang)` | Distance « après » en mètres (-1 si inconnue). | 558 |
| `C:getNoteFieldBefore(lang)` | Texte de distance « avant » d'une langue ('' si absent). | 503 |
| `C:getNoteFieldBeforeMeters(lang)` | Distance « avant » en mètres (-1 si inconnue). | 514 |
| `C:getNoteFieldFreeform(lang)` | Texte libre brut d'une langue ('' si absent). | 525 |
| `C:getNoteFieldStructured(lang)` | Texte structuré mémorisé d'une langue ({} si absent). | 536 |
| `C:getPosForOrbitCamera()` | Position de la caméra d'orbite (en cache) : centroïde de halfpoint, cs et ce ; sinon milieu de cs et ce ; sinon cs ; sinon (0,0,0). | 2204 |
| `C:getSlowCornerReleaseType()` | Type de relâchement du slow corner. | 2173 |
| `C:getTriggerType()` | Type de déclenchement. | 2165 |
| `C:hasCorner()` | true si l'emplacement 4 contient un corner. | 2364 |
| `C:hasModifier(itemType)` | true si un élément du type donné existe. | 2374 |
| `C:init(notebook, name, forceId)` | Constructeur : initialise tous les champs par défaut (déclenchement dynamique, mode audio auto, textes vides par langue du carnet, structuré vide, liste de waypoints vide). | 50 |
| `C:invalidateCamPosCache()` | Oublie la position de caméra en cache. | 2251 |
| `C:isAudioModeCustom()` | true si le mode effectif est custom. | 1005 |
| `C:isAudioModeFreeform()` | true si le mode effectif est freeform. | 1001 |
| `C:isAudioModeStructuredOffline()` | true si le mode effectif est structuredOffline. | 997 |
| `C:isAudioModeStructuredOnline()` | true si le mode effectif est structuredOnline. | 993 |
| `C:isLastPacenote()` | true si c'est la dernière pacenote triée du carnet. | 2107 |
| `C:isSlowCornerReleaseCeMinus5()` | true si slowCorner et type ceMinus5. | 2193 |
| `C:isSlowCornerReleaseCeStatic()` | true si slowCorner et type ceStatic. | 2189 |
| `C:isSlowCornerReleaseCsHalf()` | true si slowCorner et type csHalf. | 2181 |
| `C:isSlowCornerReleaseCsStatic()` | true si slowCorner et type csStatic. | 2185 |
| `C:isSlowCornerReleaseCsStaticMinus40()` | true si slowCorner et type csStaticMinus40. | 2177 |
| `C:is_valid()` | true si validation_issues est vide (après validate). | 1029 |
| `C:items()` | Éléments structurés ordonnés (structured:orderedItems). | 2324 |
| `C:markTodo()` | Marque la pacenote comme à faire. | 1216 |
| `C:matchesSearchPattern(searchPattern)` | true si le texte libre d'une des langues correspond au motif de recherche (rallyUtil.matchSearchPattern). | 2069 |
| `C:measurementTypeForCorner(corner)` | Type de mesure normalisé d'un corner (via geoPacenotes.normalizeMeasurementType). | 442 |
| `C:measurementVariantForType(measurementType)` | Variante de mesure pour un type, avec repli sur la variante par défaut puis measurements.corner1. | 446 |
| `C:moveWaypointTowards(snaproads, wp, fwd, step)` | Répète step fois l'avance de 2 m d'un waypoint le long de la route. | 2100 |
| `C:nameComponents()` | Découpe le nom en base et numéro final (motif « (.-)%s*([%d%.]+)$ »). | 2064 |
| `C:noteOutputCustom()` | Mode custom : descriptions des clips assignés, jointes par ' \| ' ; nil s'il n'y en a pas. | 1728 |
| `C:noteOutputFreeform(lang)` | Texte libre final d'une langue, avec variables de distance avant/après interpolées. Chaîne vide si la compilation a échoué ou si la note est inutilisable. | 236 |
| `C:noteOutputPreview()` | Aperçu texte selon le mode (structuré, freeform, custom) ; '<empty>' si rien ; préfixé de '[S] ' pour un slow corner. | 1749 |
| `C:noteOutputStructuredOffline()` | Liste de textes du mode structuré hors ligne ({} si indisponible). | 479 |
| `C:noteOutputStructuredOnline(lang)` | Liste de textes du mode structuré en ligne ; si le compositeur est absent, retombe sur les textes mémorisés dans self.notes[lang].note.structured. | 380 |
| `C:noteTextForDrawDebug()` | Texte affiché au-dessus du waypoint dans la vue 3D (= noteOutputPreview). | 1782 |
| `C:onDeserialized(data, oldIdMap)` | Recharge depuis les données sauvegardées : convertit l'ancien codriverWait en triggerType, ignore les waypoints hérités fwdAudioTrigger, copie data.notes si présent et recharge structured. | 1143 |
| `C:onSerialize()` | Données à sauvegarder : oldId, name, pk, playback_rules, isolate, triggerType, slowCornerReleaseType, audioMode, todo, metadata, waypoints, structured, slowCorner, ignoreDistanceCalls, includeLinkWord, distanceBeforeModifier, distanceMeasureWaypoint (si différent de 'ce'), customAudioAnchors (si présents). Les textes notes ne sont pas écrits. | 1102 |
| `C:pacenoteTextForSelect()` | Libellé pour une liste de sélection : deuxième mot du nom + ' - ' + aperçu. | 1033 |
| `C:playbackAllowed(currLap, maxLap)` | Évalue playback_rules : vide/nil ou 'true'/'t' autorise, 'false'/'f' refuse, sinon la condition est compilée avec loadstring et exécutée (voir notes : bug sur `context`). Renvoie le résultat et un message d'erreur éventuel. | 1987 |
| `C:refreshFreeform()` | Nettoie (trim) le texte libre et le réécrit, sauf s'il est vide, bloqué (autofill_blocker) ou de transcription inconnue. | 2111 |
| `C:refreshStructured()` | Recompose le texte structuré en ligne et le stocke dans le champ structuré de la langue sélectionnée. | 2197 |
| `C:resolveAudioObjs(mode, audioObjs)` | Résout (une fois par mode, résultat mis en cache) les audioObjs : pour chaque objet ayant des candidats, tire une variante au hasard (math.random). | 774 |
| `C:selectedCodriver()` | Copilote sélectionné (via le carnet). | 1025 |
| `C:selectedCodriverLanguage()` | Langue du copilote sélectionné (via le carnet). | 1021 |
| `C:selectedMeasurementVariant()` | Variante de mesure correspondant au corner actuel. | 453 |
| `C:setAdjacentNotes(prevNote, nextNote)` | Mémorise les pacenotes précédente et suivante (pour le dessin). | 1228 |
| `C:setAllRadii(newRadius, wpType)` | Fixe le rayon de tous les waypoints (ou seulement de ceux d'un type). | 127 |
| `C:setAudioMode(mode)` | Définit le mode audio propre à la pacenote. | 1009 |
| `C:setCachedLength(len)` | Mémorise la longueur de la pacenote. | 2247 |
| `C:setDistanceMeasureWaypoint(value)` | Définit le waypoint de mesure (toute valeur autre que 'cs' revient à 'ce' et n'est pas stockée). | 1696 |
| `C:setNavgraph(navgraphName, fallback)` | Stub : journalise un avertissement 'not implemented'. | 1224 |
| `C:setNoteFieldAfter(val, meters)` | Définit texte et distance « après » pour la langue du copilote sélectionné. | 597 |
| `C:setNoteFieldBefore(val, meters)` | Définit texte et distance « avant » pour la langue du copilote sélectionné. | 569 |
| `C:setNoteFieldFreeform(val, lang)` | Définit le texte libre d'une langue. | 577 |
| `C:setNoteFieldStructured(val, lang)` | Définit le texte structuré mémorisé d'une langue. | 587 |
| `C:setSlowCornerReleaseType(val)` | Définit le type de relâchement du slow corner. | 2169 |
| `C:setTriggerType(val)` | Définit le type de déclenchement. | 2161 |
| `C:slowCornerAsText()` | '[S] slow corner' si slowCorner, sinon ''. | 1051 |
| `C:structuredForProjection()` | Copie du structuré { schemaVersion, items } enrichie, sur le corner, des mesures vivantes : direction (-1 gauche, 1 droite), intensity (diamètre), arcDegrees, arcMeters, chordMeters. Ne modifie pas le structuré source. | 457 |
| `C:structuredPhraseEntriesOffline(opts)` | Idem pour le mode hors ligne (voicepack actif et compositeur hors ligne). | 352 |
| `C:structuredPhraseEntriesOnline(lang, distBefore, distAfter, opts)` | Entrées de phrases du compositeur texte « en ligne » pour le contenu structuré projeté ; peut résoudre les variantes audio du voicepack de mission. | 326 |
| `C:toggleDistanceBeforeModifier()` | Bascule distanceBeforeModifier (place la distance avant les modificateurs post-virage). | 2136 |
| `C:toggleIgnoreDistanceCalls()` | Bascule ignoreDistanceCalls. | 2128 |
| `C:toggleIncludeLinkWord()` | Bascule includeLinkWord (vrai par défaut). | 2132 |
| `C:toggleIsolate()` | Bascule isolate ; à l'activation, met les distances avant/après au niveau interne autodist_internal_level1, à la désactivation les vide pour que l'autofill reprenne (sauf champs bloqués). | 2140 |
| `C:toggleSlowCorner()` | Bascule slowCorner. | 2124 |
| `C:triggerTypeAsSmallIndicator()` | Abréviation du type de déclenchement : I, csS, cs+50%, ce-5m, ceS ; nil pour les autres. | 1068 |
| `C:triggerTypeAsText()` | Texte « triggerType: [indicateur] nom » pour l'éditeur. | 1059 |
| `C:upgradeFromV2ToV3()` | Migration de format : transforme chaque langData.note en { freeform = ancien, structured = {} }. | 1206 |
| `C:useStructured()` | true si le contenu structuré est utilisé : mode structuré en ligne ou hors ligne, et pas une pacenote système (metadata.system). | 1013 |
| `C:validate()` | Remplit validation_issues : waypoint cs/ce manquant, nom vide, note vide, fichier custom manquant, note libre manquante ou transcription inconnue. | 930 |
| `C:vehiclePlacementPosAndRot(distAway)` | Position et rotation pour placer un véhicule avant la pacenote : à distAway mètres de cs le long de sa normale, du côté opposé à ce, orienté vers cs. | 2035 |
| `C:waypointForAfterLink()` | Waypoint de départ pour la distance « après » selon distanceMeasureWaypoint. | 1701 |
| `C:waypointForBeforeLink()` | Waypoint de référence pour la distance « avant » : cornerStart. | 1687 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `removeFile`
- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/pacenote.lua`.*
