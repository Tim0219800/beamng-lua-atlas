# `gameplay_rally_notebook_path`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/path.lua` · VM : Game Engine (GE) · 1692 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/notebook/path")` (fichier sous extensions/ mais pas une extension classique)

Le carnet de notes de rallye (notebook) : conteneur d'une liste triée de pacenotes (pacenote.lua) enregistré dans un fichier *.notebook.json sous <mission>/rally/notebooks/. Il gère le chargement/sauvegarde (version de format "4"), le nom/auteurs/description, le mode audio du carnet, la résolution du voicepack actif (via le gestionnaire de rallye ou l'éditeur), les compositeurs texte et visuel, le calcul automatique des appels de distance entre notes (autofillDistanceCalls) à partir de la snaproad, la génération de pacenotes depuis des virages détectés, les pacenotes système (compte à rebours, avertissements), les chemins des fichiers audio générés et le mode audio « custom » (clips enregistrés répartis sur les pacenotes par interpolation entre des ancres posées à la main). Le module renvoie un constructeur : require('/lua/ge/extensions/gameplay/rally/notebook/path')(name).

## Exemple

```lua
local nb = require('/lua/ge/extensions/gameplay/rally/notebook/path')()
nb:setFname('/gameplay/missions/<type>/rallyStage/<id>/rally/notebooks/primary.notebook.json')
nb:onDeserialized(jsonReadFile(nb.fname))
for _, pn in ipairs(nb.pacenotes.sorted) do print(pn.name, pn:noteOutputPreview()) end
```

## Remarques

- Chemin attendu du fichier : .../<mission>/rally/notebooks/<nom>.notebook.json ; getMissionDir remonte de deux dossiers depuis le fichier, getMissionId renvoie la partie après /missions/.
- onDeserialized ne reconstruit pas les textes (refreshAllStructuredNotes) ni les distances : c'est différé aux consommateurs (éditeur, RallyManager) et à setSnaproad(), qui appelle autofillDistanceCalls().
- Le concept de copilote est supprimé : selectedCodriver() renvoie un objet factice { id='_auto', name='<auto>', language, voice } ; la langue est la première trouvée dans les notes des pacenotes.
- Bug probable : dans _getRallyManagerPick, `rm.getVoicepackPickWritesSettings and rm:getVoicepackPickWritesSettings() or true` vaut toujours true quand la méthode renvoie false (idiome and/or).
- Bug probable : findNClosestPacenotes appelle getCornerStartWaypoint().pos sans test de nil ; une pacenote sans waypoint cornerStart provoque une erreur.
- validate() ne fait que vider validation_issues : is_valid() est donc toujours true pour le carnet.
- Dans getAudioMode, la variable locale `voicepack` masque le module voicepack du fichier (sans conséquence tant que self.audioMode est défini, ce qui est le cas après init).
- nextImportIdent incrémente la lettre ASCII sans borne : après 'Z' il renvoie des caractères non alphabétiques.
- Les fichiers audio custom sont dans le sous-dossier audio/ du voicepack de mission propriétaire du carnet ; les clips pacenote_system_* sont exclus du scan. Les surcharges mission des pacenotes système restent dans notebooks/custom/<carnet>/.

## Classe `C`

Instance de carnet. Champs : _uid, id, name (« Primary » par défaut), description, authors, metadata, version, created_at, updated_at, pacenotes (sortedList), fname, validation_issues, audioMode (structuredOffline par défaut), snaproad, caches (compositeurs, voicepack, métadonnées, mapping audio custom).

Le module renvoie un constructeur : `local obj = require("gameplay_rally_notebook_path")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_detectFirstNotesLanguage()` | Première clé de langue trouvée dans les notes des pacenotes, ou nil. | 655 |
| `C:_getRallyManagerPick()` | Choix de voicepack en cours : celui de l'éditeur si ce carnet est le courant, sinon celui du RallyManager actif. Renvoie aussi un booléen « écrit les réglages » (voir notes). | 81 |
| `C:_missionPacenoteMetadataFile(audioModeDir)` | Chemin du fichier de métadonnées d'un dossier de mode. | 1580 |
| `C:allToTerrain()` | Recale tous les waypoints sur le terrain. | 645 |
| `C:allWaypoints()` | Table de tous les waypoints indexée par identifiant. | 613 |
| `C:appendPacenotes(pacenotes)` | Crée une pacenote par entrée et la désérialise. | 213 |
| `C:autoManageTriggerTypes()` | Force csImmediate pour la première pacenote et dynamic pour les autres. | 702 |
| `C:autofillDistanceCalls()` | Recalcule les appels de distance : vide les champs avant/après (hors champs bloqués ou isolés), puis pour chaque paire de pacenotes consécutives non isolées met un mot de liaison (« avant » de la suivante) ou une distance (« après » de la courante) selon le compositeur. S'arrête si la snaproad ou le compositeur manque. | 806 |
| `C:basename()` | Nom du fichier du carnet (avec extensions). | 279 |
| `C:basenameNoExt()` | Nom sans les deux extensions (.notebook.json). | 285 |
| `C:cacheCompiledPacenotes()` | Recompile toutes les pacenotes (numéros d'ordre visuels, vide des caches) et journalise celles en échec. | 868 |
| `C:canSetCustomAudioAnchor(pacenote, basename)` | Vérifie qu'une ancre est possible : clip présent sur disque et ordre monotone avec les autres ancres. | 1419 |
| `C:cleanupPacenoteNames()` | Renomme chaque pacenote « <base> <index> » selon sa position et reconstruit l'index des noms. | 403 |
| `C:clearAllTodo()` | Retire la marque à faire de toutes les pacenotes. | 1126 |
| `C:clearCompilationFailures()` | Réinitialise les échecs de compilation de toutes les pacenotes. | 888 |
| `C:clearCustomAudioAnchor(basename)` | Retire l'ancre d'un clip. | 1465 |
| `C:clearCustomSystemPacenoteCache()` | Vide le cache des surcharges système et leurs métadonnées. | 1544 |
| `C:clearPacenoteAudioModeOverrides()` | Remet toutes les pacenotes en mode audio auto (suivre celui du carnet). | 1666 |
| `C:clearResolvedAudioObjs()` | Vide les audioObjs résolus de toutes les pacenotes. | 882 |
| `C:customAudioAnchorInfoFor(basename)` | Infos d'ancre d'un clip. | 1415 |
| `C:customAudioBasenamesFor(pacenote)` | Clips assignés à une pacenote. | 1403 |
| `C:customAudioEntry()` | Voicepack propriétaire de l'audio custom : celui de la mission, sinon le voicepack actif. | 1234 |
| `C:customPacenotesAudioDir()` | Sous-dossier audio/ du voicepack propriétaire. | 1249 |
| `C:customPacenotesBaseDir()` | Dossier des surcharges mission des pacenotes système : <mission>/<notebooksPath>/custom/<carnet>. | 1512 |
| `C:customPacenotesDir()` | Dossier racine du voicepack propriétaire (clips, metadata, transcriptions). | 1241 |
| `C:deleteAllPacenotes()` | Remplace la liste par une sortedList vide. | 220 |
| `C:deletePacenoteLanguage(lang)` | Supprime une langue de toutes les pacenotes. | 1678 |
| `C:dir()` | Dossier du fichier du carnet. | 273 |
| `C:drawDebugNotebook(pacenoteToolsState, globalOpacity)` | Dessin 3D du carnet dans l'éditeur : sélection (et voisines selon les préférences), ou toutes les pacenotes en arc-en-ciel si rien n'est sélectionné. | 484 |
| `C:drawDebugNotebookForPartitionAllSnaproad(pacenoteToolsState, globalOpacity, window)` | Dessine les pacenotes qui chevauchent la fenêtre de distance donnée (création de pacenote). | 529 |
| `C:findNClosestPacenotes(pos, n)` | Les n pacenotes dont le waypoint cornerStart est le plus proche de pos (voir notes sur un nil possible). | 894 |
| `C:findNextNonIsolated(i)` | Pacenote suivante non isolée après l'indice i. | 849 |
| `C:generateAllFreeform()` | Génère le texte libre à partir du structuré pour toutes les pacenotes. | 741 |
| `C:generatePacenotes(corners)` | Efface les pacenotes et en crée une par virage détecté (waypoints cs/ce posés sur la snaproad si disponible, normales alignées, sortOrder = 5*i), puis trie, renomme et remplit les distances. | 747 |
| `C:getActiveCompositorName()` | Nom du style de compositeur déclaré par le voicepack actif (compositorStyle) ; nil si absent ou, en mode custom, si le module de style n'existe pas. | 134 |
| `C:getAdjacentPacenoteSet(selected_pn_id)` | Pacenotes précédente, sélectionnée et suivante d'un identifiant. | 463 |
| `C:getAudioMode()` | Mode audio du carnet (propriété sauvegardée, non surchargée par le voicepack). | 1146 |
| `C:getCustomAudioAnchorInfo()` | Infos sur les ancres posées (clip -> pacenote) : points triés par clip et table par nom, avec indicateurs duplicate, nonMonotonic, invalid. | 1295 |
| `C:getCustomAudioAssignment()` | Répartit les clips sur les pacenotes : les clips ancrés vont à leur pacenote, les autres sont interpolés linéairement entre ancres voisines (bornes implicites 0 et fin). | 1349 |
| `C:getCustomSystemPacenotesForAudioMode()` | Version mode custom sans compositeur : cherche pacenote_system_<nom>_<n>.ogg dans le voicepack actif pour chaque nom de systemPacenotes.required (variantes sondées par indices croissants). | 993 |
| `C:getLanguages()` | Liste d'une seule langue { language, codrivers = {} } (langue détectée ou par défaut). | 634 |
| `C:getMissionDir()` | Dossier de la mission (deux niveaux au-dessus du fichier du carnet) ; nil sans fname. | 244 |
| `C:getMissionId()` | Identifiant de mission (partie du dossier après /missions/), p. ex. gridmap_v2/rallyStage/rally-test-1 ; nil sans fichier. | 235 |
| `C:getMissionType()` | Champ missionType du info.json de la mission, ou nil. | 260 |
| `C:getNextUniqueIdentifier()` | Incrémente et renvoie le compteur d'identifiants du carnet. | 18 |
| `C:getOfflineTextCompositor()` | Idem pour le compositeur hors ligne (instance séparée). | 173 |
| `C:getRandomSystemPacenote(desiredPrefix)` | Tire une variante pondérée d'une pacenote système. | 1077 |
| `C:getSnaproad()` | Snaproad attachée. | 67 |
| `C:getSystemPacenotesForAudioMode()` | Pacenotes système (compte à rebours, avertissements…) selon le mode audio, avec surcharges custom de mission ; renvoie la table nom -> variantes et les métadonnées audio. | 919 |
| `C:getTextCompositor()` | Compositeur texte (créé et chargé à la demande, mis en cache) ; nil et log 'E' si aucun voicepack ne correspond (sauf en mode custom). | 148 |
| `C:getVisualCompositor2()` | Compositeur visuel construit sur le compositeur texte ; nil s'il n'y a pas de compositeur texte. | 199 |
| `C:getWaypoint(wpId)` | Waypoint d'identifiant donné, ou nil. | 623 |
| `C:hasAnyPacenotes()` | true s'il y a au moins une pacenote. | 228 |
| `C:init(name)` | Constructeur : champs par défaut, liste de pacenotes vide. | 23 |
| `C:invalidateActiveVoicepackCache()` | Vide le cache du voicepack actif et des métadonnées hors ligne. | 115 |
| `C:invalidateCustomAudioMapping()` | Vide les caches custom (mapping, scan disque, métadonnées, transcriptions). | 1408 |
| `C:isAudioModeCustom()` | true si mode custom. | 1173 |
| `C:isAudioModeFreeform()` | true si mode freeform. | 1169 |
| `C:isAudioModeOfflineStructured()` | true si mode structuredOffline. | 1165 |
| `C:isAudioModeOnlineStructured()` | true si mode structuredOnline. | 1161 |
| `C:isV2()` | true si la version du carnet est 2 ou absente. | 1182 |
| `C:isV3()` | true si la version est 3. | 1186 |
| `C:is_valid()` | true si validation_issues est vide. | 331 |
| `C:loadCustomPacenoteMetadata()` | Métadonnées (durées…) des clips custom, en cache ({} si absent). | 1595 |
| `C:loadCustomPacenoteTranscriptions()` | Transcriptions des clips custom (clip -> { description }), en cache. | 1609 |
| `C:loadCustomSystemPacenoteMetadata()` | Métadonnées des surcharges système : fusion du fichier partagé et du fichier de mission. | 1549 |
| `C:loadFreeformPacenoteMetadata()` | Métadonnées du dossier freeform de la mission ; nil si absent. | 1648 |
| `C:loadOfflineStructuredPacenoteMetadata()` | Métadonnées du voicepack actif (mode structuré hors ligne), en cache par voicepack. | 1623 |
| `C:loadOnlineStructuredPacenoteMetadata()` | Métadonnées du dossier structuré en ligne de la mission ; nil si le fichier n'existe pas. | 1639 |
| `C:loadSystemPacenoteMetadata()` | Métadonnées du dossier system de la mission ; nil si absent. | 1657 |
| `C:markAllTodo()` | Marque toutes les pacenotes à faire. | 1120 |
| `C:markRestTodo(pacenote)` | Marque à faire la pacenote donnée et toutes les suivantes. | 1132 |
| `C:missionPacenoteAudioFile(audioModeDir, pacenoteTextOut)` | Chemin du fichier audio d'un texte : <dossier du mode>/<nom dérivé du hash du texte>. nil sans compositeur. | 1572 |
| `C:missionPacenotesDir(audioModeDir)` | Dossier des audios générés : <mission>/<notebooksPath>/<generatedPacenotesDir>/<carnet>/<audioModeDir>. | 1190 |
| `C:missionVoicepackEntryForNotebook()` | Entrée du voicepack de mission dont la liste notebooks contient ce carnet. | 1212 |
| `C:nextImportIdent()` | Prochaine lettre d'import (« Import_X ») ; 'A' par défaut. | 378 |
| `C:onDeserialized(data)` | Recharge le carnet depuis des données JSON (version, métadonnées, mode audio, pacenotes) ; migre v2 vers v3. | 557 |
| `C:onRallySettingsChanged()` | Appelé quand les réglages changent : invalide voicepack et compositeurs, puis recompile les pacenotes. | 859 |
| `C:onSerialize()` | Données à sauvegarder : name, description, authors, metadata, dates, pacenotes, audioMode, version. | 543 |
| `C:refreshAllFreeformNotes()` | Nettoie le texte libre de chaque pacenote. | 694 |
| `C:refreshAllPacenotes()` | Rafraîchit les textes structurés puis libres de toutes les pacenotes. | 680 |
| `C:refreshAllStructuredNotes()` | Oublie le compositeur texte en cache et recompose le texte structuré de chaque pacenote (sans effet en mode custom). | 685 |
| `C:refreshPacenotes(opts)` | Chaîne complète : noms (cleanupNames), types de déclenchement, remesure (remeasure), distances, textes. Journalise la durée. | 723 |
| `C:reload()` | Relit le fichier du carnet et le désérialise. | 316 |
| `C:remeasureAllPacenotes()` | Pour chaque pacenote, partitionne la snaproad sur elle et mesure le virage (sans effet sans snaproad). | 711 |
| `C:resolveActiveVoicepack()` | Résout (cache par mission + choix) le voicepack effectif via voicepack.resolveEffectiveEntry. | 122 |
| `C:resolveAllCustomSystemPacenotes(systemPacenotes)` | Cherche les surcharges audio des pacenotes système (<nom>_<i>.ogg, ou <nom>.ogg si variante unique) dans le dossier partagé du jeu puis dans la mission (la mission l'emporte) ; résultat en cache. | 1518 |
| `C:resolveCustomAudioBasename(basename)` | Chemin complet d'un clip via le voicepack propriétaire (avec repli reuseAudioFrom). | 1280 |
| `C:save(fname)` | Écrit le carnet en JSON (met à jour updated_at). | 297 |
| `C:scanCustomAudioBasenames()` | Liste triée (cache) des clips pacenote_*.ogg numérotés présents dans le dossier audio custom ; les clips système sont exclus. | 1260 |
| `C:selectedCodriver()` | Copilote factice (voir notes). | 666 |
| `C:selectedCodriverLanguage()` | Langue du copilote factice. | 675 |
| `C:setAdjacentNotes(pacenote_id)` | Définit les voisines (précédente/suivante) de la pacenote d'identifiant donné et efface celles des autres. | 1094 |
| `C:setAllAdjacentNotes()` | Définit les voisines de toutes les pacenotes. | 1107 |
| `C:setAllRadii(newRadius, wpType)` | Fixe le rayon des waypoints de toutes les pacenotes. | 639 |
| `C:setAudioMode(mode)` | Définit le mode audio du carnet. | 1157 |
| `C:setCustomAudioAnchor(pacenote, basename)` | Pose l'ancre d'un clip sur une pacenote (retire l'ancienne ancre du clip), invalide les caches. | 1444 |
| `C:setFname(newFname)` | Définit le fichier du carnet et invalide le cache du voicepack. | 292 |
| `C:setSnaproad(sn)` | Attache la snaproad (fournie par l'éditeur ou le RallyManager) et, si non nil, relance autofillDistanceCalls(). | 60 |
| `C:sortPacenotesByName()` | Trie les pacenotes par numéro final du nom (puis par nom), met à jour sortOrder et invalide le mapping audio custom. | 359 |
| `C:syncCustomAudioFromDisk()` | Après un nouvel export audio : rescanne le disque et supprime les ancres dont le fichier a disparu. | 1490 |
| `C:upgradeFromV2ToV3()` | Migration v2 vers v3 : migre chaque pacenote, passe la version à "3" et relance l'autofill. | 602 |
| `C:useCodriver(codriver)` | Ne fait que réinitialiser les échecs de compilation (le copilote n'est plus sauvegardé). | 1672 |
| `C:useStructured()` | true si le mode est structuré (en ligne ou hors ligne). | 1177 |
| `C:validate()` | Vide validation_issues (aucune règle réelle). | 327 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/path.lua`.*
