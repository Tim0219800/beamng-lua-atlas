---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de carnet. Champs : _uid, id, name (« Primary » par défaut), description, authors, metadata, version, created_at, updated_at, pacenotes (sortedList), fname, validation_issues, audioMode (structuredOffline par défaut), snaproad, caches (compositeurs, voicepack, métadonnées, mapping audio custom).
---@class gameplay_rally_notebook_path
local gameplay_rally_notebook_path = {}

--- Première clé de langue trouvée dans les notes des pacenotes, ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:655
---@return string|nil  Langue.
function gameplay_rally_notebook_path:_detectFirstNotesLanguage() end

--- Choix de voicepack en cours : celui de l'éditeur si ce carnet est le courant, sinon celui du RallyManager actif. Renvoie aussi un booléen « écrit les réglages » (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:81
---@return table|nil  Choix.
---@return boolean  writesSettings.
function gameplay_rally_notebook_path:_getRallyManagerPick() end

--- Chemin du fichier de métadonnées d'un dossier de mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1580
---@param audioModeDir string Sous-dossier du mode.
---@return string  Chemin.
function gameplay_rally_notebook_path:_missionPacenoteMetadataFile(audioModeDir) end

--- Recale tous les waypoints sur le terrain.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:645
function gameplay_rally_notebook_path:allToTerrain() end

--- Table de tous les waypoints indexée par identifiant.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:613
---@return table<integer, table>  Waypoints.
function gameplay_rally_notebook_path:allWaypoints() end

--- Crée une pacenote par entrée et la désérialise.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:213
---@param pacenotes table[] Données sérialisées de pacenotes.
function gameplay_rally_notebook_path:appendPacenotes(pacenotes) end

--- Force csImmediate pour la première pacenote et dynamic pour les autres.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:702
function gameplay_rally_notebook_path:autoManageTriggerTypes() end

--- Recalcule les appels de distance : vide les champs avant/après (hors champs bloqués ou isolés), puis pour chaque paire de pacenotes consécutives non isolées met un mot de liaison (« avant » de la suivante) ou une distance (« après » de la courante) selon le compositeur. S'arrête si la snaproad ou le compositeur manque.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:806
function gameplay_rally_notebook_path:autofillDistanceCalls() end

--- Nom du fichier du carnet (avec extensions).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:279
---@return string|nil  Nom.
function gameplay_rally_notebook_path:basename() end

--- Nom sans les deux extensions (.notebook.json).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:285
---@return string|nil  Nom.
function gameplay_rally_notebook_path:basenameNoExt() end

--- Recompile toutes les pacenotes (numéros d'ordre visuels, vide des caches) et journalise celles en échec.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:868
function gameplay_rally_notebook_path:cacheCompiledPacenotes() end

--- Vérifie qu'une ancre est possible : clip présent sur disque et ordre monotone avec les autres ancres.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1419
---@param pacenote table Pacenote.
---@param basename string Clip.
---@return boolean  Possible.
---@return string|nil  Raison du refus.
function gameplay_rally_notebook_path:canSetCustomAudioAnchor(pacenote, basename) end

--- Renomme chaque pacenote « <base> <index> » selon sa position et reconstruit l'index des noms.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:403
function gameplay_rally_notebook_path:cleanupPacenoteNames() end

--- Retire la marque à faire de toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1126
function gameplay_rally_notebook_path:clearAllTodo() end

--- Réinitialise les échecs de compilation de toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:888
function gameplay_rally_notebook_path:clearCompilationFailures() end

--- Retire l'ancre d'un clip.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1465
---@param basename string Clip.
---@return boolean  true si quelque chose a changé.
function gameplay_rally_notebook_path:clearCustomAudioAnchor(basename) end

--- Vide le cache des surcharges système et leurs métadonnées.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1544
function gameplay_rally_notebook_path:clearCustomSystemPacenoteCache() end

--- Remet toutes les pacenotes en mode audio auto (suivre celui du carnet).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1666
function gameplay_rally_notebook_path:clearPacenoteAudioModeOverrides() end

--- Vide les audioObjs résolus de toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:882
function gameplay_rally_notebook_path:clearResolvedAudioObjs() end

--- Infos d'ancre d'un clip.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1415
---@param basename string Nom du clip.
---@return table|nil  Infos.
function gameplay_rally_notebook_path:customAudioAnchorInfoFor(basename) end

--- Clips assignés à une pacenote.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1403
---@param pacenote table|nil Pacenote.
---@return string[]  Noms de clips.
function gameplay_rally_notebook_path:customAudioBasenamesFor(pacenote) end

--- Voicepack propriétaire de l'audio custom : celui de la mission, sinon le voicepack actif.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1234
---@return table|nil  Entrée.
function gameplay_rally_notebook_path:customAudioEntry() end

--- Sous-dossier audio/ du voicepack propriétaire.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1249
---@return string|nil  Chemin.
function gameplay_rally_notebook_path:customPacenotesAudioDir() end

--- Dossier des surcharges mission des pacenotes système : <mission>/<notebooksPath>/custom/<carnet>.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1512
---@return string  Chemin.
function gameplay_rally_notebook_path:customPacenotesBaseDir() end

--- Dossier racine du voicepack propriétaire (clips, metadata, transcriptions).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1241
---@return string|nil  Chemin.
function gameplay_rally_notebook_path:customPacenotesDir() end

--- Remplace la liste par une sortedList vide.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:220
function gameplay_rally_notebook_path:deleteAllPacenotes() end

--- Supprime une langue de toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1678
---@param lang string Langue.
function gameplay_rally_notebook_path:deletePacenoteLanguage(lang) end

--- Dossier du fichier du carnet.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:273
---@return string|nil  Chemin.
function gameplay_rally_notebook_path:dir() end

--- Dessin 3D du carnet dans l'éditeur : sélection (et voisines selon les préférences), ou toutes les pacenotes en arc-en-ciel si rien n'est sélectionné.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:484
---@param pacenoteToolsState table|nil État des outils.
---@param globalOpacity number Opacité.
function gameplay_rally_notebook_path:drawDebugNotebook(pacenoteToolsState, globalOpacity) end

--- Dessine les pacenotes qui chevauchent la fenêtre de distance donnée (création de pacenote).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:529
---@param pacenoteToolsState table État.
---@param globalOpacity number Opacité.
---@param window table|nil { startDistance, endDistance } le long de la route.
function gameplay_rally_notebook_path:drawDebugNotebookForPartitionAllSnaproad(pacenoteToolsState, globalOpacity, window) end

--- Les n pacenotes dont le waypoint cornerStart est le plus proche de pos (voir notes sur un nil possible).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:894
---@param pos vec3 Position.
---@param n integer Nombre.
---@return table[]  Pacenotes triées par distance.
function gameplay_rally_notebook_path:findNClosestPacenotes(pos, n) end

--- Pacenote suivante non isolée après l'indice i.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:849
---@param i integer Indice dans la liste triée.
---@return table|nil  Pacenote.
function gameplay_rally_notebook_path:findNextNonIsolated(i) end

--- Génère le texte libre à partir du structuré pour toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:741
function gameplay_rally_notebook_path:generateAllFreeform() end

--- Efface les pacenotes et en crée une par virage détecté (waypoints cs/ce posés sur la snaproad si disponible, normales alignées, sortOrder = 5*i), puis trie, renomme et remplit les distances.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:747
---@param corners table[] Virages de pacenoteGenerator.detectCorners (pos, posEnd).
function gameplay_rally_notebook_path:generatePacenotes(corners) end

--- Nom du style de compositeur déclaré par le voicepack actif (compositorStyle) ; nil si absent ou, en mode custom, si le module de style n'existe pas.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:134
---@return string|nil  Nom du style.
function gameplay_rally_notebook_path:getActiveCompositorName() end

--- Pacenotes précédente, sélectionnée et suivante d'un identifiant.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:463
---@param selected_pn_id integer|nil Identifiant de la sélection.
---@return table|nil  Précédente.
---@return table|nil  Sélectionnée.
---@return table|nil  Suivante.
function gameplay_rally_notebook_path:getAdjacentPacenoteSet(selected_pn_id) end

--- Mode audio du carnet (propriété sauvegardée, non surchargée par le voicepack).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1146
---@return integer|nil  RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_path:getAudioMode() end

--- Infos sur les ancres posées (clip -> pacenote) : points triés par clip et table par nom, avec indicateurs duplicate, nonMonotonic, invalid.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1295
---@return table  { points, byBasename }.
function gameplay_rally_notebook_path:getCustomAudioAnchorInfo() end

--- Répartit les clips sur les pacenotes : les clips ancrés vont à leur pacenote, les autres sont interpolés linéairement entre ancres voisines (bornes implicites 0 et fin).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1349
---@return table<integer, string[]>  Identifiant de pacenote -> clips.
function gameplay_rally_notebook_path:getCustomAudioAssignment() end

--- Version mode custom sans compositeur : cherche pacenote_system_<nom>_<n>.ogg dans le voicepack actif pour chaque nom de systemPacenotes.required (variantes sondées par indices croissants).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:993
---@return table  Pacenotes système.
---@return table  Métadonnées.
function gameplay_rally_notebook_path:getCustomSystemPacenotesForAudioMode() end

--- Liste d'une seule langue { language, codrivers = {} } (langue détectée ou par défaut).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:634
---@return table[]  Langues.
function gameplay_rally_notebook_path:getLanguages() end

--- Dossier de la mission (deux niveaux au-dessus du fichier du carnet) ; nil sans fname.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:244
---@return string|nil  Chemin.
function gameplay_rally_notebook_path:getMissionDir() end

--- Identifiant de mission (partie du dossier après /missions/), p. ex. gridmap_v2/rallyStage/rally-test-1 ; nil sans fichier.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:235
---@return string|nil  Identifiant.
function gameplay_rally_notebook_path:getMissionId() end

--- Champ missionType du info.json de la mission, ou nil.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:260
---@return string|nil  Type.
function gameplay_rally_notebook_path:getMissionType() end

--- Incrémente et renvoie le compteur d'identifiants du carnet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:18
---@return integer  Identifiant unique.
function gameplay_rally_notebook_path:getNextUniqueIdentifier() end

--- Idem pour le compositeur hors ligne (instance séparée).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:173
---@return table|nil  TextCompositor.
function gameplay_rally_notebook_path:getOfflineTextCompositor() end

--- Tire une variante pondérée d'une pacenote système.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1077
---@param desiredPrefix string Nom de la pacenote système.
---@return table|nil  Variante.
---@return table|nil  Métadonnées.
function gameplay_rally_notebook_path:getRandomSystemPacenote(desiredPrefix) end

--- Snaproad attachée.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:67
---@return table|nil  Snaproad.
function gameplay_rally_notebook_path:getSnaproad() end

--- Pacenotes système (compte à rebours, avertissements…) selon le mode audio, avec surcharges custom de mission ; renvoie la table nom -> variantes et les métadonnées audio.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:919
---@return table  Pacenotes système.
---@return table|nil  Métadonnées.
function gameplay_rally_notebook_path:getSystemPacenotesForAudioMode() end

--- Compositeur texte (créé et chargé à la demande, mis en cache) ; nil et log 'E' si aucun voicepack ne correspond (sauf en mode custom).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:148
---@return table|nil  TextCompositor.
function gameplay_rally_notebook_path:getTextCompositor() end

--- Compositeur visuel construit sur le compositeur texte ; nil s'il n'y a pas de compositeur texte.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:199
---@return table|nil  VisualCompositor.
function gameplay_rally_notebook_path:getVisualCompositor2() end

--- Waypoint d'identifiant donné, ou nil.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:623
---@param wpId integer Identifiant.
---@return table|nil  Waypoint.
function gameplay_rally_notebook_path:getWaypoint(wpId) end

--- true s'il y a au moins une pacenote.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:228
---@return boolean  Résultat.
function gameplay_rally_notebook_path:hasAnyPacenotes() end

--- Constructeur : champs par défaut, liste de pacenotes vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:23
---@param name string|nil Nom du carnet.
function gameplay_rally_notebook_path:init(name) end

--- Vide le cache du voicepack actif et des métadonnées hors ligne.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:115
function gameplay_rally_notebook_path:invalidateActiveVoicepackCache() end

--- Vide les caches custom (mapping, scan disque, métadonnées, transcriptions).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1408
function gameplay_rally_notebook_path:invalidateCustomAudioMapping() end

--- true si mode custom.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1173
---@return boolean  Résultat.
function gameplay_rally_notebook_path:isAudioModeCustom() end

--- true si mode freeform.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1169
---@return boolean  Résultat.
function gameplay_rally_notebook_path:isAudioModeFreeform() end

--- true si mode structuredOffline.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1165
---@return boolean  Résultat.
function gameplay_rally_notebook_path:isAudioModeOfflineStructured() end

--- true si mode structuredOnline.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1161
---@return boolean  Résultat.
function gameplay_rally_notebook_path:isAudioModeOnlineStructured() end

--- true si la version du carnet est 2 ou absente.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1182
---@return boolean  Résultat.
function gameplay_rally_notebook_path:isV2() end

--- true si la version est 3.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1186
---@return boolean  Résultat.
function gameplay_rally_notebook_path:isV3() end

--- true si validation_issues est vide.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:331
---@return boolean  Résultat.
function gameplay_rally_notebook_path:is_valid() end

--- Métadonnées (durées…) des clips custom, en cache ({} si absent).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1595
---@return table  Métadonnées.
function gameplay_rally_notebook_path:loadCustomPacenoteMetadata() end

--- Transcriptions des clips custom (clip -> { description }), en cache.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1609
---@return table  Transcriptions.
function gameplay_rally_notebook_path:loadCustomPacenoteTranscriptions() end

--- Métadonnées des surcharges système : fusion du fichier partagé et du fichier de mission.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1549
---@return table  Métadonnées.
function gameplay_rally_notebook_path:loadCustomSystemPacenoteMetadata() end

--- Métadonnées du dossier freeform de la mission ; nil si absent.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1648
---@return table|nil  Métadonnées.
function gameplay_rally_notebook_path:loadFreeformPacenoteMetadata() end

--- Métadonnées du voicepack actif (mode structuré hors ligne), en cache par voicepack.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1623
---@return table  Métadonnées.
function gameplay_rally_notebook_path:loadOfflineStructuredPacenoteMetadata() end

--- Métadonnées du dossier structuré en ligne de la mission ; nil si le fichier n'existe pas.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1639
---@return table|nil  Métadonnées.
function gameplay_rally_notebook_path:loadOnlineStructuredPacenoteMetadata() end

--- Métadonnées du dossier system de la mission ; nil si absent.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1657
---@return table|nil  Métadonnées.
function gameplay_rally_notebook_path:loadSystemPacenoteMetadata() end

--- Marque toutes les pacenotes à faire.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1120
function gameplay_rally_notebook_path:markAllTodo() end

--- Marque à faire la pacenote donnée et toutes les suivantes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1132
---@param pacenote table Pacenote de départ.
function gameplay_rally_notebook_path:markRestTodo(pacenote) end

--- Chemin du fichier audio d'un texte : <dossier du mode>/<nom dérivé du hash du texte>. nil sans compositeur.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1572
---@param audioModeDir string Sous-dossier du mode.
---@param pacenoteTextOut string Texte de la pacenote.
---@return string|nil  Chemin.
function gameplay_rally_notebook_path:missionPacenoteAudioFile(audioModeDir, pacenoteTextOut) end

--- Dossier des audios générés : <mission>/<notebooksPath>/<generatedPacenotesDir>/<carnet>/<audioModeDir>.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1190
---@param audioModeDir string Sous-dossier du mode (rallyUtil.structuredDir, freeformDir, systemDir).
---@return string|nil  Chemin.
function gameplay_rally_notebook_path:missionPacenotesDir(audioModeDir) end

--- Entrée du voicepack de mission dont la liste notebooks contient ce carnet.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1212
---@return table|nil  Entrée.
function gameplay_rally_notebook_path:missionVoicepackEntryForNotebook() end

--- Prochaine lettre d'import (« Import_X ») ; 'A' par défaut.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:378
---@return string  Lettre.
function gameplay_rally_notebook_path:nextImportIdent() end

--- Recharge le carnet depuis des données JSON (version, métadonnées, mode audio, pacenotes) ; migre v2 vers v3.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:557
---@param data table|nil Données.
function gameplay_rally_notebook_path:onDeserialized(data) end

--- Appelé quand les réglages changent : invalide voicepack et compositeurs, puis recompile les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:859
function gameplay_rally_notebook_path:onRallySettingsChanged() end

--- Données à sauvegarder : name, description, authors, metadata, dates, pacenotes, audioMode, version.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:543
---@return table  Table JSON.
function gameplay_rally_notebook_path:onSerialize() end

--- Nettoie le texte libre de chaque pacenote.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:694
function gameplay_rally_notebook_path:refreshAllFreeformNotes() end

--- Rafraîchit les textes structurés puis libres de toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:680
function gameplay_rally_notebook_path:refreshAllPacenotes() end

--- Oublie le compositeur texte en cache et recompose le texte structuré de chaque pacenote (sans effet en mode custom).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:685
function gameplay_rally_notebook_path:refreshAllStructuredNotes() end

--- Chaîne complète : noms (cleanupNames), types de déclenchement, remesure (remeasure), distances, textes. Journalise la durée.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:723
---@param opts table|nil cleanupNames=false et/ou remeasure=false pour sauter une étape.
function gameplay_rally_notebook_path:refreshPacenotes(opts) end

--- Relit le fichier du carnet et le désérialise.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:316
function gameplay_rally_notebook_path:reload() end

--- Pour chaque pacenote, partitionne la snaproad sur elle et mesure le virage (sans effet sans snaproad).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:711
function gameplay_rally_notebook_path:remeasureAllPacenotes() end

--- Résout (cache par mission + choix) le voicepack effectif via voicepack.resolveEffectiveEntry.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:122
---@return any  Voicepack.
---@return table|nil  Entrée de voicepack.
---@return any  Troisième résultat de resolveEffectiveEntry.
function gameplay_rally_notebook_path:resolveActiveVoicepack() end

--- Cherche les surcharges audio des pacenotes système (<nom>_<i>.ogg, ou <nom>.ogg si variante unique) dans le dossier partagé du jeu puis dans la mission (la mission l'emporte) ; résultat en cache.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1518
---@param systemPacenotes table nom -> variantes.
---@return table<string, string>  Clé nom_i -> chemin.
function gameplay_rally_notebook_path:resolveAllCustomSystemPacenotes(systemPacenotes) end

--- Chemin complet d'un clip via le voicepack propriétaire (avec repli reuseAudioFrom).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1280
---@param basename string|nil Nom du clip.
---@return string|nil  Chemin.
function gameplay_rally_notebook_path:resolveCustomAudioBasename(basename) end

--- Écrit le carnet en JSON (met à jour updated_at).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:297
---@param fname string|nil Chemin (défaut self.fname).
---@return boolean  Succès.
function gameplay_rally_notebook_path:save(fname) end

--- Liste triée (cache) des clips pacenote_*.ogg numérotés présents dans le dossier audio custom ; les clips système sont exclus.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1260
---@return string[]  Noms de fichiers.
function gameplay_rally_notebook_path:scanCustomAudioBasenames() end

--- Copilote factice (voir notes).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:666
---@return table  { id, name, language, voice }.
function gameplay_rally_notebook_path:selectedCodriver() end

--- Langue du copilote factice.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:675
---@return string  Langue.
function gameplay_rally_notebook_path:selectedCodriverLanguage() end

--- Définit les voisines (précédente/suivante) de la pacenote d'identifiant donné et efface celles des autres.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1094
---@param pacenote_id integer Identifiant.
function gameplay_rally_notebook_path:setAdjacentNotes(pacenote_id) end

--- Définit les voisines de toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1107
function gameplay_rally_notebook_path:setAllAdjacentNotes() end

--- Fixe le rayon des waypoints de toutes les pacenotes.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:639
---@param newRadius number Rayon en mètres.
---@param wpType string|nil Type de waypoint à filtrer.
function gameplay_rally_notebook_path:setAllRadii(newRadius, wpType) end

--- Définit le mode audio du carnet.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1157
---@param mode integer RallyEnums.pacenoteAudioMode.
function gameplay_rally_notebook_path:setAudioMode(mode) end

--- Pose l'ancre d'un clip sur une pacenote (retire l'ancienne ancre du clip), invalide les caches.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1444
---@param pacenote table Pacenote.
---@param basename string Clip.
---@return boolean  Succès.
function gameplay_rally_notebook_path:setCustomAudioAnchor(pacenote, basename) end

--- Définit le fichier du carnet et invalide le cache du voicepack.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:292
---@param newFname string Chemin.
function gameplay_rally_notebook_path:setFname(newFname) end

--- Attache la snaproad (fournie par l'éditeur ou le RallyManager) et, si non nil, relance autofillDistanceCalls().
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:60
---@param sn table|nil Snaproad.
function gameplay_rally_notebook_path:setSnaproad(sn) end

--- Trie les pacenotes par numéro final du nom (puis par nom), met à jour sortOrder et invalide le mapping audio custom.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:359
function gameplay_rally_notebook_path:sortPacenotesByName() end

--- Après un nouvel export audio : rescanne le disque et supprime les ancres dont le fichier a disparu.
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1490
function gameplay_rally_notebook_path:syncCustomAudioFromDisk() end

--- Migration v2 vers v3 : migre chaque pacenote, passe la version à "3" et relance l'autofill.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:602
function gameplay_rally_notebook_path:upgradeFromV2ToV3() end

--- Ne fait que réinitialiser les échecs de compilation (le copilote n'est plus sauvegardé).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1672
---@param codriver any Non utilisé.
function gameplay_rally_notebook_path:useCodriver(codriver) end

--- true si le mode est structuré (en ligne ou hors ligne).
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:1177
---@return boolean  Résultat.
function gameplay_rally_notebook_path:useStructured() end

--- Vide validation_issues (aucune règle réelle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/path.lua:327
function gameplay_rally_notebook_path:validate() end

