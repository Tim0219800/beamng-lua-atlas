# `gameplay_rally_voicepack`

*Fichier : `lua/ge/extensions/gameplay/rally/voicepack.lua` · VM : Game Engine (GE) · 1266 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_voicepack` : `extensions.load("gameplay_rally_voicepack")`, puis la globale `gameplay_rally_voicepack`

Module sans état qui gère les « voicepacks » du copilote de rallye : paquets de voix (audio .ogg + metadata.json + voicepack.json) situés soit en global (`/lua/ge/extensions/gameplay/rally/compositors/voicepacks/<dirname>/`), soit dans une mission (`<missionDir>/rally/voicepacks/<dirname>/`). Il fournit les chemins de fichiers, la lecture et le cache de l'inventaire (scan), le choix d'un voicepack à partir d'un « pick » ou des préférences (liste MRU des derniers utilisés stockée dans le réglage `rallyCodriverVoicepackMRU`), la résolution du notebook d'une mission, les candidats audio (variantes) d'une note, et la construction des réglages utilisateur de type liste déroulante (clé `rallyVoicepackPick`) pour étapes et boucles.

## Exemple

```lua
local vp = require('/lua/ge/extensions/gameplay/rally/voicepack')
local dirname, entry, result = vp.resolveEffectiveEntry(missionDir, {type = 'preferences'}, {missionId = missionId})
if entry then print(entry.label, vp.getEntryAudioFile(entry, 'pacenote_123.ogg')) end
```

## Remarques

- Identifiants : 'global:<dirname>' ou 'mission:<missionId>:<dirname>' (makeId/parseId). Valeur par défaut : 'global:ak_2026-04-16'. La MRU est une liste CSV d'ids, limitée à 10.
- Un pick est une table {type = 'preferences'|'auto'|'voicepack'|'loopVoicepack', id, scope, missionId, dirname, familyKey}. Valeur de réglage : '' pour preferences, l'id pour un voicepack, 'loop:<familyKey>' pour une boucle.
- Le fichier d'infos s'appelle voicepack.json (et non info.json, car le système de missions traite tout info.json comme une mission). Il doit contenir persona, language, styleLabel et notebooks (liste non vide) sinon le voicepack est ignoré. Champs optionnels : dialect, compositorStyle, styleDetailLevel, enableAnimalCodrivers, enableSpeedScaling (défaut true en global), codriverTimingOffsetSeconds (défaut 0 en global, 0,2 en mission), reuseAudioFrom (liste de dirnames globaux dont réutiliser audio et metadata), cornerGapMs, phraseGapMs, linkWordGapMs, pacenoteGapMs.
- Les dossiers commençant par `_` sont masqués du scan. Les voicepacks avec enableAnimalCodrivers == false sont exclus de l'inventaire.
- Le scan global est mis en cache pour toute la durée du module (invalidateCache est réservé au dev/test) ; le scan de mission est mis en cache par couple missionDir|missionId.
- listInventory exclut par défaut les voicepacks dont aucun notebook candidat n'existe dans la mission (requireMissionNotebook ~= false).
- Ordre de résolution par préférences : MRU (correspondance exacte d'id, sinon scope + dirname, pour chaque entrée MRU dans l'ordre), puis repli sur le plus petit styleDetailLevel et l'ordre alphabétique du label.
- resolveDir parcourt la table avec pairs() : l'ordre n'est pas défini si plusieurs voicepacks correspondent.
- resolveLoopMissionSettingEntry renvoie nil pour un pick 'preferences'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value)` | Ajoute à la MRU le voicepack choisi pour une boucle : directement pour un pick 'voicepack', ou celui de la première étape où la famille est trouvée. | 1059 |
| `gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId)` | Place un voicepack en tête de la MRU (sans doublon, limite 10) et enregistre le réglage. Résout l'entrée via resolveEntry si on ne donne pas une entrée complète. | 1164 |
| `gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue)` | Construit le réglage utilisateur (liste déroulante) du voicepack pour une boucle : voicepacks globaux, plus les familles de voicepacks de mission communes à toutes les spéciales de la boucle. Sélection : valeur courante, sinon première correspondance MRU, sinon premier élément. | 1094 |
| `gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue)` | Construit le réglage utilisateur (liste déroulante) du voicepack pour une spéciale : « Resolve from Settings » puis chaque voicepack disponible. Sélection : valeur courante, sinon voicepack résolu par préférences, sinon premier élément. | 1213 |
| `gameplay_rally_voicepack.buildPickerEntries(missionDir, opts)` | Construit les entrées d'un sélecteur de voicepack pour une mission : éventuellement « Resolve from Settings » en tête (includePreferences), puis chaque voicepack disponible avec son label et son pick. | 871 |
| `gameplay_rally_voicepack.chooseAudioCandidate(candidates)` | Choisit un candidat au hasard (math.random). | 197 |
| `gameplay_rally_voicepack.ensureSettingsInitialized(opts)` | Si la MRU est vide, y met defaultVoicepackId. Ne fait rien avec opts.writeSettings == false. | 714 |
| `gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants)` | Liste les variantes audio d'une note d'après metadata. Sans allowedVariants, prend toutes les variantes indexées (`<stem>.ogg` = variante 1 et `<stem>_<n>.ogg`). Avec allowedVariants, ne prend que celles-ci. Résultat trié par variante puis par nom. | 142 |
| `gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants)` | getAudioCandidates avec les chemins résolus par getEntryAudioFile. | 185 |
| `gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants)` | getAudioCandidates avec les chemins d'un voicepack global (getAudioFile). | 191 |
| `gameplay_rally_voicepack.getAudioFile(voicepack, basename)` | Chemin d'un fichier audio d'un voicepack global (sous audio/). | 38 |
| `gameplay_rally_voicepack.getCascadeKeys()` | Compatibilité avec l'ancien système : langue, persona et styleLabel du voicepack global résolu par les préférences. | 849 |
| `gameplay_rally_voicepack.getEntryAssetDirs(entry)` | Dossier de l'entrée suivi de ceux de ses sources audio. | 480 |
| `gameplay_rally_voicepack.getEntryAudioFile(entry, basename)` | Chemin d'un fichier audio d'une entrée : d'abord son propre dossier, puis ceux des voicepacks de reuseAudioFrom. Si le fichier n'existe nulle part, renvoie le chemin local (si le dossier audio existe) ou le premier chemin source. | 46 |
| `gameplay_rally_voicepack.getEntryAudioSourceEntries(entry)` | Entrées globales dont l'audio est réutilisé (reuseAudioFrom), lues une fois puis mises en cache dans entry.audioSourceEntries. Ignore les doublons, soi-même et les dirnames invalides (avec avertissement). | 452 |
| `gameplay_rally_voicepack.getEntryMetadata(entry)` | Fusionne les metadata.json de l'entrée puis de ses sources (la première valeur d'un basename l'emporte), avec cache dans entry._mergedAudioMetadata. | 504 |
| `gameplay_rally_voicepack.getEntryMetadataFile(entry)` | Chemin du metadata.json de l'entrée, ou de la première source qui en a un. | 490 |
| `gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex)` | Chemin audio d'une note système pour une entrée (avec repli reuseAudioFrom). | 210 |
| `gameplay_rally_voicepack.getFile(voicepack, basename)` | Chemin d'un fichier d'un voicepack global. | 34 |
| `gameplay_rally_voicepack.getInfo(voicepack)` | Lit le voicepack.json d'un voicepack global (brut, sans validation). | 218 |
| `gameplay_rally_voicepack.getLanguage(voicepack)` | Langue déclarée d'un voicepack global. | 226 |
| `gameplay_rally_voicepack.getMetadataFile(voicepack)` | Chemin de metadata.json d'un voicepack global. | 214 |
| `gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash)` | Chemin audio d'une note par son hash dans un voicepack global. | 202 |
| `gameplay_rally_voicepack.getStyles(voicepack)` | Champ `styles` du voicepack.json d'un voicepack global. | 232 |
| `gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex)` | Chemin audio d'une note système dans un voicepack global. | 206 |
| `gameplay_rally_voicepack.getVoicepackMRU()` | Lit la liste MRU (réglage rallyCodriverVoicepackMRU, CSV ou ancien JSON). | 331 |
| `gameplay_rally_voicepack.invalidateCache()` | Hook dev/test : oublie l'inventaire global pour forcer un nouveau scan. Les changements de préférences ne doivent pas l'appeler. | 246 |
| `gameplay_rally_voicepack.invalidateMissionCache(missionDir)` | Oublie le cache d'inventaire d'une mission (ou de toutes si missionDir est nil). | 255 |
| `gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix)` | Libellé d'affichage « persona [(dialecte)] - style [suffixe] ». | 704 |
| `gameplay_rally_voicepack.listInventory(missionDir, opts)` | Liste triée par label des entrées disponibles : globales et, si missionDir est donné, celles de la mission. Filtrées par enableAnimalCodrivers et, par défaut, par la présence d'un notebook candidat dans la mission. | 629 |
| `gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo)` | Comme resolveMissionNotebook mais renvoie tous les noms de notebooks candidats (sans suffixe) qui existent dans la mission, dans l'ordre de préférence. | 687 |
| `gameplay_rally_voicepack.makeId(scope, dirname, missionId)` | Construit l'id d'un voicepack : 'global:<dirname>', 'mission:<missionId>:<dirname>' ou 'mission:<dirname>'. | 270 |
| `gameplay_rally_voicepack.missionFullDir(missionDir)` | Dossier des voicepacks d'une mission : <missionDir>/rally/voicepacks. | 549 |
| `gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick)` | Noms de notebooks chargeables dans la mission pour un pick de type 'voicepack'. | 1140 |
| `gameplay_rally_voicepack.parseId(id)` | Décompose un id en {scope, dirname, missionId}. | 277 |
| `gameplay_rally_voicepack.pickFromSettingValue(value)` | Convertit une valeur de réglage en pick : '', 'preferences', 'auto' donnent {type='preferences'} ; 'loop:<clé>' donne un loopVoicepack ; un id valide donne un voicepack ; le reste redevient preferences. | 1183 |
| `gameplay_rally_voicepack.picksMatch(a, b)` | Compare deux picks : même type ; 'preferences' (ou 'auto') égaux entre eux ; sinon même id, ou même dirname, scope et missionId compatibles. | 1150 |
| `gameplay_rally_voicepack.resolve(missionDir, pick, opts)` | Résout le voicepack à utiliser. Pick de type 'voicepack' : correspondance exacte dans l'inventaire, sinon repli sur les préférences (mode 'invalidExactFallback'). Autre pick ou nil : préférences (MRU puis niveau de détail). | 798 |
| `gameplay_rally_voicepack.resolveDir(language, persona, styleLabel)` | Premier voicepack global correspondant à une langue, un persona et un styleLabel (chaque critère facultatif). L'ordre est indéfini (pairs). | 617 |
| `gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts)` | Résout un pick ('auto' équivaut à 'preferences'; nil = préférences). | 859 |
| `gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId)` | Retrouve l'entrée d'un pick (ou d'un id) : l'index de mission pour scope 'mission', l'index global sinon. | 601 |
| `gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value)` | Entrée de voicepack correspondant à une valeur de réglage de boucle. | 1077 |
| `gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value)` | Transforme une valeur de réglage de boucle en pick concret pour une mission : un pick 'voicepack' est gardé ; un pick 'loopVoicepack' est cherché par famille dans les voicepacks de la mission. | 1049 |
| `gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo)` | Chemin du premier notebook déclaré par le voicepack (vpInfo.notebooks) qui existe dans la mission. | 673 |
| `gameplay_rally_voicepack.scan()` | Scanne les voicepacks globaux (hors dossiers `_`) et renvoie l'index dirname -> entrée, mis en cache. | 530 |
| `gameplay_rally_voicepack.scanMission(missionDir, missionId)` | Scanne les voicepacks d'une mission (avec cache). | 554 |
| `gameplay_rally_voicepack.settingValueForPick(pick)` | Opération inverse de pickFromSettingValue. | 1203 |

### Détail des paramètres

#### `gameplay_rally_voicepack.addLoopMissionSettingToMRU(missionTypeData, value)`

Ajoute à la MRU le voicepack choisi pour une boucle : directement pour un pick 'voicepack', ou celui de la première étape où la famille est trouvée.

- `missionTypeData` (*table*) : Données de la mission boucle (stageN_rallyStage).
- `value` (*string|nil*) : Valeur de réglage.

#### `gameplay_rally_voicepack.addToMRU(entryOrPick, missionDir, missionId)`

Place un voicepack en tête de la MRU (sans doublon, limite 10) et enregistre le réglage. Résout l'entrée via resolveEntry si on ne donne pas une entrée complète.

- `entryOrPick` (*table*) : Entrée ou pick.
- `missionDir` (*string|nil*) : Dossier de la mission.
- `missionId` (*string|nil*) : Id de la mission.

#### `gameplay_rally_voicepack.buildLoopMissionUserSetting(missionTypeData, currentValue)`

Construit le réglage utilisateur (liste déroulante) du voicepack pour une boucle : voicepacks globaux, plus les familles de voicepacks de mission communes à toutes les spéciales de la boucle. Sélection : valeur courante, sinon première correspondance MRU, sinon premier élément.

- `missionTypeData` (*table*) : Données de la boucle.
- `currentValue` (*string|nil*) : Valeur actuelle.
- **renvoie** : table|nil {key = 'rallyVoicepackPick', label, type = 'select', values = {{l, v, shortLabel, detail}}, value, currentOption} ; nil si aucune entrée.

#### `gameplay_rally_voicepack.buildMissionUserSetting(missionDir, missionId, currentValue)`

Construit le réglage utilisateur (liste déroulante) du voicepack pour une spéciale : « Resolve from Settings » puis chaque voicepack disponible. Sélection : valeur courante, sinon voicepack résolu par préférences, sinon premier élément.

- `missionDir` (*string*) : Dossier de la mission.
- `missionId` (*string*) : Id de la mission.
- `currentValue` (*string|nil*) : Valeur actuelle.
- **renvoie** : table|nil Même structure que buildLoopMissionUserSetting ; nil si aucune entrée.

#### `gameplay_rally_voicepack.buildPickerEntries(missionDir, opts)`

Construit les entrées d'un sélecteur de voicepack pour une mission : éventuellement « Resolve from Settings » en tête (includePreferences), puis chaque voicepack disponible avec son label et son pick.

- `missionDir` (*string|nil*) : Dossier de la mission.
- `opts` (*table|nil*) : {includePreferences, includeAuto, missionId, missionSuffix, globalOnly, requireMissionNotebook}.
- **renvoie** : table[] Liste de {label, entry, pick}.

#### `gameplay_rally_voicepack.chooseAudioCandidate(candidates)`

Choisit un candidat au hasard (math.random).

- `candidates` (*table[]*) : Liste de candidats.
- **renvoie** : table|nil Candidat, nil si la liste est vide.

#### `gameplay_rally_voicepack.ensureSettingsInitialized(opts)`

Si la MRU est vide, y met defaultVoicepackId. Ne fait rien avec opts.writeSettings == false.

- `opts` (*table|nil*) : {writeSettings}.

#### `gameplay_rally_voicepack.getAudioCandidates(metadata, basename, pathForBasename, allowedVariants)`

Liste les variantes audio d'une note d'après metadata. Sans allowedVariants, prend toutes les variantes indexées (`<stem>.ogg` = variante 1 et `<stem>_<n>.ogg`). Avec allowedVariants, ne prend que celles-ci. Résultat trié par variante puis par nom.

- `metadata` (*table*) : Table basename -> métadonnées (contenu de metadata.json), avec audioLen.
- `basename` (*string*) : Nom de base de la note (avec ou sans .ogg).
- `pathForBasename` (*function|nil*) : Fonction basename -> chemin ; sinon fname = basename.
- `allowedVariants` (*integer[]|nil*) : Numéros de variantes autorisés.
- **renvoie** : table[] Liste de {basename, fname, audioLen, metadata, variantIndex}.

#### `gameplay_rally_voicepack.getAudioCandidatesForEntry(entry, metadata, basename, allowedVariants)`

getAudioCandidates avec les chemins résolus par getEntryAudioFile.

- `entry` (*table*) : Entrée de voicepack.
- `metadata` (*table*) : Métadonnées audio.
- `basename` (*string*) : Nom de base.
- `allowedVariants` (*integer[]|nil*) : Variantes autorisées.
- **renvoie** : table[] Candidats.

#### `gameplay_rally_voicepack.getAudioCandidatesForVoicepack(voicepack, metadata, basename, allowedVariants)`

getAudioCandidates avec les chemins d'un voicepack global (getAudioFile).

- `voicepack` (*string*) : Dossier du voicepack.
- `metadata` (*table*) : Métadonnées audio.
- `basename` (*string*) : Nom de base.
- `allowedVariants` (*integer[]|nil*) : Variantes autorisées.
- **renvoie** : table[] Candidats.

#### `gameplay_rally_voicepack.getAudioFile(voicepack, basename)`

Chemin d'un fichier audio d'un voicepack global (sous audio/).

- `voicepack` (*string*) : Nom de dossier du voicepack.
- `basename` (*string*) : Nom du fichier audio.
- **renvoie** : string Chemin.

#### `gameplay_rally_voicepack.getCascadeKeys()`

Compatibilité avec l'ancien système : langue, persona et styleLabel du voicepack global résolu par les préférences.

- **renvoie** : string|nil Langue.
- **renvoie** : string|nil Persona.
- **renvoie** : string|nil styleLabel.

#### `gameplay_rally_voicepack.getEntryAssetDirs(entry)`

Dossier de l'entrée suivi de ceux de ses sources audio.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : string[] Dossiers.

#### `gameplay_rally_voicepack.getEntryAudioFile(entry, basename)`

Chemin d'un fichier audio d'une entrée : d'abord son propre dossier, puis ceux des voicepacks de reuseAudioFrom. Si le fichier n'existe nulle part, renvoie le chemin local (si le dossier audio existe) ou le premier chemin source.

- `entry` (*table*) : Entrée de voicepack (issue de scan/scanMission).
- `basename` (*string*) : Nom du fichier audio.
- **renvoie** : string|nil Chemin, nil si entry ou basename manque.

#### `gameplay_rally_voicepack.getEntryAudioSourceEntries(entry)`

Entrées globales dont l'audio est réutilisé (reuseAudioFrom), lues une fois puis mises en cache dans entry.audioSourceEntries. Ignore les doublons, soi-même et les dirnames invalides (avec avertissement).

- `entry` (*table|nil*) : Entrée.
- **renvoie** : table[] Entrées sources.

#### `gameplay_rally_voicepack.getEntryMetadata(entry)`

Fusionne les metadata.json de l'entrée puis de ses sources (la première valeur d'un basename l'emporte), avec cache dans entry._mergedAudioMetadata.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : table Table basename -> métadonnées.

#### `gameplay_rally_voicepack.getEntryMetadataFile(entry)`

Chemin du metadata.json de l'entrée, ou de la première source qui en a un.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : string|nil Chemin.

#### `gameplay_rally_voicepack.getEntrySystemPacenoteFile(entry, systemKey, variantIndex)`

Chemin audio d'une note système pour une entrée (avec repli reuseAudioFrom).

- `entry` (*table*) : Entrée de voicepack.
- `systemKey` (*string*) : Clé de la note système.
- `variantIndex` (*integer|nil*) : Variante.
- **renvoie** : string|nil Chemin.

#### `gameplay_rally_voicepack.getFile(voicepack, basename)`

Chemin d'un fichier d'un voicepack global.

- `voicepack` (*string*) : Nom de dossier du voicepack.
- `basename` (*string*) : Nom de fichier.
- **renvoie** : string Chemin complet.

#### `gameplay_rally_voicepack.getInfo(voicepack)`

Lit le voicepack.json d'un voicepack global (brut, sans validation).

- `voicepack` (*string*) : Dossier du voicepack.
- **renvoie** : table|nil Contenu JSON, nil si absent.

#### `gameplay_rally_voicepack.getLanguage(voicepack)`

Langue déclarée d'un voicepack global.

- `voicepack` (*string*) : Dossier du voicepack.
- **renvoie** : string|nil Langue.

#### `gameplay_rally_voicepack.getMetadataFile(voicepack)`

Chemin de metadata.json d'un voicepack global.

- `voicepack` (*string*) : Dossier du voicepack.
- **renvoie** : string Chemin.

#### `gameplay_rally_voicepack.getPacenoteFile(voicepack, pacenoteHash)`

Chemin audio d'une note par son hash dans un voicepack global.

- `voicepack` (*string*) : Dossier du voicepack.
- `pacenoteHash` (*string*) : Hash de la note.
- **renvoie** : string Chemin.

#### `gameplay_rally_voicepack.getStyles(voicepack)`

Champ `styles` du voicepack.json d'un voicepack global.

- `voicepack` (*string*) : Dossier du voicepack.
- **renvoie** : table Styles, table vide si absent.

#### `gameplay_rally_voicepack.getSystemPacenoteFile(voicepack, systemKey, variantIndex)`

Chemin audio d'une note système dans un voicepack global.

- `voicepack` (*string*) : Dossier du voicepack.
- `systemKey` (*string*) : Clé de la note système.
- `variantIndex` (*integer|nil*) : Variante ; défaut 1.
- **renvoie** : string Chemin.

#### `gameplay_rally_voicepack.getVoicepackMRU()`

Lit la liste MRU (réglage rallyCodriverVoicepackMRU, CSV ou ancien JSON).

- **renvoie** : string[] Ids, du plus récent au plus ancien.

#### `gameplay_rally_voicepack.invalidateMissionCache(missionDir)`

Oublie le cache d'inventaire d'une mission (ou de toutes si missionDir est nil).

- `missionDir` (*string|nil*) : Dossier de la mission.

#### `gameplay_rally_voicepack.labelForEntry(entry, dirname, suffix)`

Libellé d'affichage « persona [(dialecte)] - style [suffixe] ».

- `entry` (*table*) : Entrée.
- `dirname` (*string*) : Repli pour le persona.
- `suffix` (*string|nil*) : Suffixe ajouté (ex. '(mission)').
- **renvoie** : string Libellé.

#### `gameplay_rally_voicepack.listInventory(missionDir, opts)`

Liste triée par label des entrées disponibles : globales et, si missionDir est donné, celles de la mission. Filtrées par enableAnimalCodrivers et, par défaut, par la présence d'un notebook candidat dans la mission.

- `missionDir` (*string|nil*) : Dossier de la mission.
- `opts` (*table|nil*) : {missionId, globalOnly, requireMissionNotebook}.
- **renvoie** : table[] Entrées.

#### `gameplay_rally_voicepack.listMissionNotebookCandidates(missionDir, vpInfo)`

Comme resolveMissionNotebook mais renvoie tous les noms de notebooks candidats (sans suffixe) qui existent dans la mission, dans l'ordre de préférence.

- `missionDir` (*string|nil*) : Dossier de la mission.
- `vpInfo` (*table|nil*) : Entrée du voicepack.
- **renvoie** : string[] Noms de notebooks.

#### `gameplay_rally_voicepack.makeId(scope, dirname, missionId)`

Construit l'id d'un voicepack : 'global:<dirname>', 'mission:<missionId>:<dirname>' ou 'mission:<dirname>'.

- `scope` (*string*) : 'global' ou 'mission'.
- `dirname` (*string*) : Nom de dossier.
- `missionId` (*string|nil*) : Id de mission (scope mission).
- **renvoie** : string Id.

#### `gameplay_rally_voicepack.missionFullDir(missionDir)`

Dossier des voicepacks d'une mission : <missionDir>/rally/voicepacks.

- `missionDir` (*string|nil*) : Dossier de la mission.
- **renvoie** : string|nil Chemin.

#### `gameplay_rally_voicepack.notebookBasenamesForPick(missionDir, pick)`

Noms de notebooks chargeables dans la mission pour un pick de type 'voicepack'.

- `missionDir` (*string*) : Dossier de la mission.
- `pick` (*table|nil*) : Pick.
- **renvoie** : string[] Noms sans suffixe ; vide sinon.

#### `gameplay_rally_voicepack.parseId(id)`

Décompose un id en {scope, dirname, missionId}.

- `id` (*string*) : Id.
- **renvoie** : table|nil Parties, nil si le format est invalide.

#### `gameplay_rally_voicepack.pickFromSettingValue(value)`

Convertit une valeur de réglage en pick : '', 'preferences', 'auto' donnent {type='preferences'} ; 'loop:<clé>' donne un loopVoicepack ; un id valide donne un voicepack ; le reste redevient preferences.

- `value` (*string|nil*) : Valeur de réglage.
- **renvoie** : table Pick.

#### `gameplay_rally_voicepack.picksMatch(a, b)`

Compare deux picks : même type ; 'preferences' (ou 'auto') égaux entre eux ; sinon même id, ou même dirname, scope et missionId compatibles.

- `a` (*table|nil*) : Premier pick.
- `b` (*table|nil*) : Second pick.
- **renvoie** : boolean true si équivalents.

#### `gameplay_rally_voicepack.resolve(missionDir, pick, opts)`

Résout le voicepack à utiliser. Pick de type 'voicepack' : correspondance exacte dans l'inventaire, sinon repli sur les préférences (mode 'invalidExactFallback'). Autre pick ou nil : préférences (MRU puis niveau de détail).

- `missionDir` (*string|nil*) : Dossier de la mission.
- `pick` (*table|nil*) : Pick.
- `opts` (*table|nil*) : {missionId, globalOnly, requireMissionNotebook, writeSettings}.
- **renvoie** : table {entry, dirname, reason, mode, detail, candidates}.

#### `gameplay_rally_voicepack.resolveDir(language, persona, styleLabel)`

Premier voicepack global correspondant à une langue, un persona et un styleLabel (chaque critère facultatif). L'ordre est indéfini (pairs).

- `language` (*string|nil*) : Langue.
- `persona` (*string|nil*) : Persona.
- `styleLabel` (*string|nil*) : Style.
- **renvoie** : string|nil dirname.
- **renvoie** : table|nil Entrée.

#### `gameplay_rally_voicepack.resolveEffectiveEntry(missionDir, pick, opts)`

Résout un pick ('auto' équivaut à 'preferences'; nil = préférences).

- `missionDir` (*string|nil*) : Dossier de la mission.
- `pick` (*table|nil*) : Pick.
- `opts` (*table|nil*) : Voir resolve.
- **renvoie** : string|nil dirname.
- **renvoie** : table|nil Entrée.
- **renvoie** : table Résultat complet de resolve.

#### `gameplay_rally_voicepack.resolveEntry(missionDir, pick, missionId)`

Retrouve l'entrée d'un pick (ou d'un id) : l'index de mission pour scope 'mission', l'index global sinon.

- `missionDir` (*string|nil*) : Dossier de la mission.
- `pick` (*table|string*) : Pick ou id.
- `missionId` (*string|nil*) : Id de la mission.
- **renvoie** : table|nil Entrée.
- **renvoie** : string|nil dirname.

#### `gameplay_rally_voicepack.resolveLoopMissionSettingEntry(missionTypeData, value)`

Entrée de voicepack correspondant à une valeur de réglage de boucle.

- `missionTypeData` (*table*) : Données de la boucle.
- `value` (*string|nil*) : Valeur de réglage.
- **renvoie** : table|nil Entrée, nil pour preferences ou si introuvable.

#### `gameplay_rally_voicepack.resolveLoopVoicepackPick(missionDir, missionId, value)`

Transforme une valeur de réglage de boucle en pick concret pour une mission : un pick 'voicepack' est gardé ; un pick 'loopVoicepack' est cherché par famille dans les voicepacks de la mission.

- `missionDir` (*string*) : Dossier de la mission.
- `missionId` (*string*) : Id de la mission.
- `value` (*string*) : Valeur de réglage.
- **renvoie** : table|nil Pick concret, nil pour preferences ou si introuvable.

#### `gameplay_rally_voicepack.resolveMissionNotebook(missionDir, vpInfo)`

Chemin du premier notebook déclaré par le voicepack (vpInfo.notebooks) qui existe dans la mission.

- `missionDir` (*string|nil*) : Dossier de la mission.
- `vpInfo` (*table|nil*) : Entrée ou info du voicepack avec `notebooks`.
- **renvoie** : string|nil Chemin <missionDir>/rally/notebooks/<nom>.notebook.json.

#### `gameplay_rally_voicepack.scan()`

Scanne les voicepacks globaux (hors dossiers `_`) et renvoie l'index dirname -> entrée, mis en cache.

- **renvoie** : table<string, table> Index des entrées globales.

#### `gameplay_rally_voicepack.scanMission(missionDir, missionId)`

Scanne les voicepacks d'une mission (avec cache).

- `missionDir` (*string*) : Dossier de la mission.
- `missionId` (*string|nil*) : Id de la mission (entre dans la clé de cache et l'id des entrées).
- **renvoie** : table<string, table> Index dirname -> entrée.

#### `gameplay_rally_voicepack.settingValueForPick(pick)`

Opération inverse de pickFromSettingValue.

- `pick` (*table|nil*) : Pick.
- **renvoie** : string Valeur de réglage.

## Champs

| Champ | Type | Description |
|---|---|---|
| `audioSubdir` | string | 'audio' : sous-dossier des fichiers .ogg. |
| `defaultVoicepackId` | string | 'global:ak_2026-04-16' : premier élément de la MRU si elle est vide. |
| `globalDir` | string | '/lua/ge/extensions/gameplay/rally/compositors/voicepacks/' : dossier des voicepacks globaux (avec `/` final). |
| `infoBasename` | string | 'voicepack.json'. |
| `missionSubdir` | string | 'rally/voicepacks' : sous-dossier des voicepacks d'une mission. |
| `mruLimit` | integer | 10 : taille maximale de la MRU. |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `directoryList`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/voicepack.lua`.*
