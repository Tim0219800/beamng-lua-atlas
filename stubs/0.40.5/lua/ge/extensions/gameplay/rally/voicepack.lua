---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/voicepack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module sans état qui gère les « voicepacks » du copilote de rallye : paquets de voix (audio .ogg + metadata.json + voicepack.json) situés soit en global (`/lua/ge/extensions/gameplay/rally/compositors/voicepacks/<dirname>/`), soit dans une mission (`<missionDir>/rally/voicepacks/<dirname>/`). Il fournit les chemins de fichiers, la lecture et le cache de l'inventaire (scan), le choix d'un voicepack à partir d'un « pick » ou des préférences (liste MRU des derniers utilisés stockée dans le réglage `rallyCodriverVoicepackMRU`), la résolution du notebook d'une mission, les candidats audio (variantes) d'une note, et la construction des réglages utilisateur de type liste déroulante (clé `rallyVoicepackPick`) pour étapes et boucles.
--- Accès : extension `gameplay_rally_voicepack` : `extensions.load("gameplay_rally_voicepack")`, puis la globale `gameplay_rally_voicepack`
---@class gameplay_rally_voicepack
---@field audioSubdir string 'audio' : sous-dossier des fichiers .ogg.
---@field defaultVoicepackId string 'global:ak_2026-04-16' : premier élément de la MRU si elle est vide.
---@field globalDir string '/lua/ge/extensions/gameplay/rally/compositors/voicepacks/' : dossier des voicepacks globaux (avec `/` final).
---@field infoBasename string 'voicepack.json'.
---@field missionSubdir string 'rally/voicepacks' : sous-dossier des voicepacks d'une mission.
---@field mruLimit integer 10 : taille maximale de la MRU.
gameplay_rally_voicepack = {}

--- Ajoute à la MRU le voicepack choisi pour une boucle : directement pour un pick 'voicepack', ou celui de la première étape où la famille est trouvée.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1059
---@param missionTypeData table Données de la mission boucle (stageN_rallyStage).
---@param value string|nil Valeur de réglage.
function gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value) end

--- Place un voicepack en tête de la MRU (sans doublon, limite 10) et enregistre le réglage. Résout l'entrée via resolveEntry si on ne donne pas une entrée complète.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1164
---@param entryOrPick table Entrée ou pick.
---@param missionDir string|nil Dossier de la mission.
---@param missionId string|nil Id de la mission.
function gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId) end

--- Construit le réglage utilisateur (liste déroulante) du voicepack pour une boucle : voicepacks globaux, plus les familles de voicepacks de mission communes à toutes les spéciales de la boucle. Sélection : valeur courante, sinon première correspondance MRU, sinon premier élément.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1094
---@param missionTypeData table Données de la boucle.
---@param currentValue string|nil Valeur actuelle.
---@return table|nil  {key = 'rallyVoicepackPick', label, type = 'select', values = {{l, v, shortLabel, detail}}, value, currentOption} ; nil si aucune entrée.
function gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue) end

--- Construit le réglage utilisateur (liste déroulante) du voicepack pour une spéciale : « Resolve from Settings » puis chaque voicepack disponible. Sélection : valeur courante, sinon voicepack résolu par préférences, sinon premier élément.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1213
---@param missionDir string Dossier de la mission.
---@param missionId string Id de la mission.
---@param currentValue string|nil Valeur actuelle.
---@return table|nil  Même structure que buildLoopMissionUserSetting ; nil si aucune entrée.
function gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue) end

--- Construit les entrées d'un sélecteur de voicepack pour une mission : éventuellement « Resolve from Settings » en tête (includePreferences), puis chaque voicepack disponible avec son label et son pick.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:871
---@param missionDir string|nil Dossier de la mission.
---@param opts table|nil {includePreferences, includeAuto, missionId, missionSuffix, globalOnly, requireMissionNotebook}.
---@return table[]  Liste de {label, entry, pick}.
function gameplay_rally_voicepack.buildPickerEntries(missionDir, opts) end

--- Choisit un candidat au hasard (math.random).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:197
---@param candidates table[] Liste de candidats.
---@return table|nil  Candidat, nil si la liste est vide.
function gameplay_rally_voicepack.chooseAudioCandidate(candidates) end

--- Si la MRU est vide, y met defaultVoicepackId. Ne fait rien avec opts.writeSettings == false.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:714
---@param opts table|nil {writeSettings}.
function gameplay_rally_voicepack.ensureSettingsInitialized(opts) end

--- Liste les variantes audio d'une note d'après metadata. Sans allowedVariants, prend toutes les variantes indexées (`<stem>.ogg` = variante 1 et `<stem>_<n>.ogg`). Avec allowedVariants, ne prend que celles-ci. Résultat trié par variante puis par nom.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:142
---@param metadata table Table basename -> métadonnées (contenu de metadata.json), avec audioLen.
---@param basename string Nom de base de la note (avec ou sans .ogg).
---@param pathForBasename function|nil Fonction basename -> chemin ; sinon fname = basename.
---@param allowedVariants integer[]|nil Numéros de variantes autorisés.
---@return table[]  Liste de {basename, fname, audioLen, metadata, variantIndex}.
function gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants) end

--- getAudioCandidates avec les chemins résolus par getEntryAudioFile.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:185
---@param entry table Entrée de voicepack.
---@param metadata table Métadonnées audio.
---@param basename string Nom de base.
---@param allowedVariants integer[]|nil Variantes autorisées.
---@return table[]  Candidats.
function gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants) end

--- getAudioCandidates avec les chemins d'un voicepack global (getAudioFile).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:191
---@param voicepack string Dossier du voicepack.
---@param metadata table Métadonnées audio.
---@param basename string Nom de base.
---@param allowedVariants integer[]|nil Variantes autorisées.
---@return table[]  Candidats.
function gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants) end

--- Chemin d'un fichier audio d'un voicepack global (sous audio/).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:38
---@param voicepack string Nom de dossier du voicepack.
---@param basename string Nom du fichier audio.
---@return string  Chemin.
function gameplay_rally_voicepack.getAudioFile(voicepack, basename) end

--- Compatibilité avec l'ancien système : langue, persona et styleLabel du voicepack global résolu par les préférences.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:849
---@return string|nil  Langue.
---@return string|nil  Persona.
---@return string|nil  styleLabel.
function gameplay_rally_voicepack.getCascadeKeys() end

--- Dossier de l'entrée suivi de ceux de ses sources audio.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:480
---@param entry table|nil Entrée.
---@return string[]  Dossiers.
function gameplay_rally_voicepack.getEntryAssetDirs(entry) end

--- Chemin d'un fichier audio d'une entrée : d'abord son propre dossier, puis ceux des voicepacks de reuseAudioFrom. Si le fichier n'existe nulle part, renvoie le chemin local (si le dossier audio existe) ou le premier chemin source.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:46
---@param entry table Entrée de voicepack (issue de scan/scanMission).
---@param basename string Nom du fichier audio.
---@return string|nil  Chemin, nil si entry ou basename manque.
function gameplay_rally_voicepack.getEntryAudioFile(entry, basename) end

--- Entrées globales dont l'audio est réutilisé (reuseAudioFrom), lues une fois puis mises en cache dans entry.audioSourceEntries. Ignore les doublons, soi-même et les dirnames invalides (avec avertissement).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:452
---@param entry table|nil Entrée.
---@return table[]  Entrées sources.
function gameplay_rally_voicepack.getEntryAudioSourceEntries(entry) end

--- Fusionne les metadata.json de l'entrée puis de ses sources (la première valeur d'un basename l'emporte), avec cache dans entry._mergedAudioMetadata.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:504
---@param entry table|nil Entrée.
---@return table  Table basename -> métadonnées.
function gameplay_rally_voicepack.getEntryMetadata(entry) end

--- Chemin du metadata.json de l'entrée, ou de la première source qui en a un.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:490
---@param entry table|nil Entrée.
---@return string|nil  Chemin.
function gameplay_rally_voicepack.getEntryMetadataFile(entry) end

--- Chemin audio d'une note système pour une entrée (avec repli reuseAudioFrom).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:210
---@param entry table Entrée de voicepack.
---@param systemKey string Clé de la note système.
---@param variantIndex integer|nil Variante.
---@return string|nil  Chemin.
function gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex) end

--- Chemin d'un fichier d'un voicepack global.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:34
---@param voicepack string Nom de dossier du voicepack.
---@param basename string Nom de fichier.
---@return string  Chemin complet.
function gameplay_rally_voicepack.getFile(voicepack, basename) end

--- Lit le voicepack.json d'un voicepack global (brut, sans validation).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:218
---@param voicepack string Dossier du voicepack.
---@return table|nil  Contenu JSON, nil si absent.
function gameplay_rally_voicepack.getInfo(voicepack) end

--- Langue déclarée d'un voicepack global.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:226
---@param voicepack string Dossier du voicepack.
---@return string|nil  Langue.
function gameplay_rally_voicepack.getLanguage(voicepack) end

--- Chemin de metadata.json d'un voicepack global.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:214
---@param voicepack string Dossier du voicepack.
---@return string  Chemin.
function gameplay_rally_voicepack.getMetadataFile(voicepack) end

--- Chemin audio d'une note par son hash dans un voicepack global.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:202
---@param voicepack string Dossier du voicepack.
---@param pacenoteHash string Hash de la note.
---@return string  Chemin.
function gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash) end

--- Champ `styles` du voicepack.json d'un voicepack global.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:232
---@param voicepack string Dossier du voicepack.
---@return table  Styles, table vide si absent.
function gameplay_rally_voicepack.getStyles(voicepack) end

--- Chemin audio d'une note système dans un voicepack global.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:206
---@param voicepack string Dossier du voicepack.
---@param systemKey string Clé de la note système.
---@param variantIndex integer|nil Variante ; défaut 1.
---@return string  Chemin.
function gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex) end

--- Lit la liste MRU (réglage rallyCodriverVoicepackMRU, CSV ou ancien JSON).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:331
---@return string[]  Ids, du plus récent au plus ancien.
function gameplay_rally_voicepack.getVoicepackMRU() end

--- Hook dev/test : oublie l'inventaire global pour forcer un nouveau scan. Les changements de préférences ne doivent pas l'appeler.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:246
function gameplay_rally_voicepack.invalidateCache() end

--- Oublie le cache d'inventaire d'une mission (ou de toutes si missionDir est nil).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:255
---@param missionDir string|nil Dossier de la mission.
function gameplay_rally_voicepack.invalidateMissionCache(missionDir) end

--- Libellé d'affichage « persona [(dialecte)] - style [suffixe] ».
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:704
---@param entry table Entrée.
---@param dirname string Repli pour le persona.
---@param suffix string|nil Suffixe ajouté (ex. '(mission)').
---@return string  Libellé.
function gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix) end

--- Liste triée par label des entrées disponibles : globales et, si missionDir est donné, celles de la mission. Filtrées par enableAnimalCodrivers et, par défaut, par la présence d'un notebook candidat dans la mission.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:629
---@param missionDir string|nil Dossier de la mission.
---@param opts table|nil {missionId, globalOnly, requireMissionNotebook}.
---@return table[]  Entrées.
function gameplay_rally_voicepack.listInventory(missionDir, opts) end

--- Comme resolveMissionNotebook mais renvoie tous les noms de notebooks candidats (sans suffixe) qui existent dans la mission, dans l'ordre de préférence.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:687
---@param missionDir string|nil Dossier de la mission.
---@param vpInfo table|nil Entrée du voicepack.
---@return string[]  Noms de notebooks.
function gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo) end

--- Construit l'id d'un voicepack : 'global:<dirname>', 'mission:<missionId>:<dirname>' ou 'mission:<dirname>'.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:270
---@param scope string 'global' ou 'mission'.
---@param dirname string Nom de dossier.
---@param missionId string|nil Id de mission (scope mission).
---@return string  Id.
function gameplay_rally_voicepack.makeId(scope, dirname, missionId) end

--- Dossier des voicepacks d'une mission : <missionDir>/rally/voicepacks.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:549
---@param missionDir string|nil Dossier de la mission.
---@return string|nil  Chemin.
function gameplay_rally_voicepack.missionFullDir(missionDir) end

--- Noms de notebooks chargeables dans la mission pour un pick de type 'voicepack'.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1140
---@param missionDir string Dossier de la mission.
---@param pick table|nil Pick.
---@return string[]  Noms sans suffixe ; vide sinon.
function gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick) end

--- Décompose un id en {scope, dirname, missionId}.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:277
---@param id string Id.
---@return table|nil  Parties, nil si le format est invalide.
function gameplay_rally_voicepack.parseId(id) end

--- Convertit une valeur de réglage en pick : '', 'preferences', 'auto' donnent {type='preferences'} ; 'loop:<clé>' donne un loopVoicepack ; un id valide donne un voicepack ; le reste redevient preferences.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1183
---@param value string|nil Valeur de réglage.
---@return table  Pick.
function gameplay_rally_voicepack.pickFromSettingValue(value) end

--- Compare deux picks : même type ; 'preferences' (ou 'auto') égaux entre eux ; sinon même id, ou même dirname, scope et missionId compatibles.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1150
---@param a table|nil Premier pick.
---@param b table|nil Second pick.
---@return boolean  true si équivalents.
function gameplay_rally_voicepack.picksMatch(a, b) end

--- Résout le voicepack à utiliser. Pick de type 'voicepack' : correspondance exacte dans l'inventaire, sinon repli sur les préférences (mode 'invalidExactFallback'). Autre pick ou nil : préférences (MRU puis niveau de détail).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:798
---@param missionDir string|nil Dossier de la mission.
---@param pick table|nil Pick.
---@param opts table|nil {missionId, globalOnly, requireMissionNotebook, writeSettings}.
---@return table  {entry, dirname, reason, mode, detail, candidates}.
function gameplay_rally_voicepack.resolve(missionDir, pick, opts) end

--- Premier voicepack global correspondant à une langue, un persona et un styleLabel (chaque critère facultatif). L'ordre est indéfini (pairs).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:617
---@param language string|nil Langue.
---@param persona string|nil Persona.
---@param styleLabel string|nil Style.
---@return string|nil  dirname.
---@return table|nil  Entrée.
function gameplay_rally_voicepack.resolveDir(language, persona, styleLabel) end

--- Résout un pick ('auto' équivaut à 'preferences'; nil = préférences).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:859
---@param missionDir string|nil Dossier de la mission.
---@param pick table|nil Pick.
---@param opts table|nil Voir resolve.
---@return string|nil  dirname.
---@return table|nil  Entrée.
---@return table  Résultat complet de resolve.
function gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts) end

--- Retrouve l'entrée d'un pick (ou d'un id) : l'index de mission pour scope 'mission', l'index global sinon.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:601
---@param missionDir string|nil Dossier de la mission.
---@param pick table|string Pick ou id.
---@param missionId string|nil Id de la mission.
---@return table|nil  Entrée.
---@return string|nil  dirname.
function gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId) end

--- Entrée de voicepack correspondant à une valeur de réglage de boucle.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1077
---@param missionTypeData table Données de la boucle.
---@param value string|nil Valeur de réglage.
---@return table|nil  Entrée, nil pour preferences ou si introuvable.
function gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value) end

--- Transforme une valeur de réglage de boucle en pick concret pour une mission : un pick 'voicepack' est gardé ; un pick 'loopVoicepack' est cherché par famille dans les voicepacks de la mission.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1049
---@param missionDir string Dossier de la mission.
---@param missionId string Id de la mission.
---@param value string Valeur de réglage.
---@return table|nil  Pick concret, nil pour preferences ou si introuvable.
function gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value) end

--- Chemin du premier notebook déclaré par le voicepack (vpInfo.notebooks) qui existe dans la mission.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:673
---@param missionDir string|nil Dossier de la mission.
---@param vpInfo table|nil Entrée ou info du voicepack avec `notebooks`.
---@return string|nil  Chemin <missionDir>/rally/notebooks/<nom>.notebook.json.
function gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo) end

--- Scanne les voicepacks globaux (hors dossiers `_`) et renvoie l'index dirname -> entrée, mis en cache.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:530
---@return table<string, table>  Index des entrées globales.
function gameplay_rally_voicepack.scan() end

--- Scanne les voicepacks d'une mission (avec cache).
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:554
---@param missionDir string Dossier de la mission.
---@param missionId string|nil Id de la mission (entre dans la clé de cache et l'id des entrées).
---@return table<string, table>  Index dirname -> entrée.
function gameplay_rally_voicepack.scanMission(missionDir, missionId) end

--- Opération inverse de pickFromSettingValue.
---Source : lua/ge/extensions/gameplay/rally/voicepack.lua:1203
---@param pick table|nil Pick.
---@return string  Valeur de réglage.
function gameplay_rally_voicepack.settingValueForPick(pick) end

