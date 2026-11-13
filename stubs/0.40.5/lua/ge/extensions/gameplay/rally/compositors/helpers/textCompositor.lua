---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compositeur de texte. Attributs : compositorName, missionDir, compositor (table du style chargé ou nil), cachedSystemPacenotes, voicepackEntry.
---@class gameplay_rally_compositors_helpers_textCompositor
local gameplay_rally_compositors_helpers_textCompositor = {}

--- Fait require du fichier de style (nil si pas de nom).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:65
---@return table|nil  Module du style (partagé : load en fait une copie).
function gameplay_rally_compositors_helpers_textCompositor:_requireCompositor() end

--- Appelle compositorUtil.compositePhraseEntries avec la config du style : renvoie des entrées {text, category, variant, audioFname}.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:81
---@param structured table Note structurée.
---@param distBefore number|nil Distance avant (m).
---@param distAfter number|nil Distance après (m).
---@param opts table|nil Options : escapeVars, variantResolver, distanceAfterBeforePostModifier.
---@return table[]|nil  Entrées de phrases.
function gameplay_rally_compositors_helpers_textCompositor:compositePhraseEntries(structured, distBefore, distAfter, opts) end

--- Compose le texte d'une note en appelant style.composite(config, structured, distBefore, distAfter).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:71
---@param structured table Note structurée.
---@param distBefore number|nil Distance depuis la note précédente (m).
---@param distAfter number|nil Distance jusqu'à la note suivante (m).
---@return table|nil  Résultat du style (liste de phrases) ou nil si le style n'est pas chargé.
function gameplay_rally_compositors_helpers_textCompositor:compositeText(structured, distBefore, distAfter) end

--- Comme compositeText, mais avec escapeVars=true : les distances sont remplacées par les variables de substitution (rallyUtil.var_db / var_da) au lieu de leur valeur.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:76
---@param structured table Note structurée.
---@param distBefore number|nil Distance avant (m).
---@param distAfter number|nil Distance après (m).
---@return table|nil  Liste de phrases ou nil.
function gameplay_rally_compositors_helpers_textCompositor:compositeTextEscaped(structured, distBefore, distAfter) end

--- Chemin de module du style : '/lua/ge/extensions/gameplay/rally/compositors/styles/<nom>'.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:61
---@return string  Chemin sans extension.
function gameplay_rally_compositors_helpers_textCompositor:compositorPath() end

--- Indique si les appels de distance sont activés dans le style (false si non chargé).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:91
---@return boolean  État.
function gameplay_rally_compositors_helpers_textCompositor:distanceCallsEnabled() end

--- Convertit une distance en texte parlé (partie entière puis arrondi) ; en unité 'large', le point décimal est remplacé par le mot 'point' du style et les chiffres sont séparés, puis l'unité est ajoutée.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:368
---@param dist number Distance en mètres.
---@return string  Texte de la distance.
function gameplay_rally_compositors_helpers_textCompositor:distanceToString(dist) end

--- Énumère toutes les phrases (distances, notes, système) avec hash, groupe et statistiques (totalChars, totalPhrases...). Lève une erreur si une phrase est dupliquée.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:261
---@return table  {stats, phrases, groups = {distances, pacenotes, system}}.
function gameplay_rally_compositors_helpers_textCompositor:enumerateAll() end

--- Énumère les appels de distance prononçables : de la distance max des liens à distance.max, par pas de rounding.small, dédoublonnés par texte. Vide si les appels de distance sont désactivés.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:162
---@return table[]  Liste triée de {phrase, distance}.
function gameplay_rally_compositors_helpers_textCompositor:enumerateDistanceEntries() end

--- Même chose qu'enumerateDistanceEntries mais ne garde que les phrases.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:196
---@return string[]  Phrases de distance triées.
function gameplay_rally_compositors_helpers_textCompositor:enumerateDistances() end

--- Énumère les phrases de notes via style.enumerate(self, config).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:204
---@return string[]  Phrases (vide si non chargé).
function gameplay_rally_compositors_helpers_textCompositor:enumeratePacenotes() end

--- Énumère les entrées du lecteur de script avec catégorie et variantes : notes système, distances, puis celles de compositorUtil.enumerateScriptEntries. Complète hash, audioFname et recordingSlug.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:209
---@return table[]  Entrées {phrase, hash, audioFname, recordingSlug, category, subcategory, sourceContext, variant, sortGroup, sortSubgroup}.
function gameplay_rally_compositors_helpers_textCompositor:enumerateScriptEntries() end

--- Unité de base des distances (distance.units.base).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:402
---@return string  Unité.
function gameplay_rally_compositors_helpers_textCompositor:getBaseUnit() end

--- Renvoie la table du style chargé.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:86
---@return table|nil  Config du style.
function gameplay_rally_compositors_helpers_textCompositor:getConfig() end

--- Renvoie le texte du premier lien de distance dont le seuil est supérieur à dist (ex. 'into', 'and').
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:381
---@param dist number Distance en mètres.
---@return string|nil  Texte du lien.
---@return boolean  true si un lien a été trouvé.
function gameplay_rally_compositors_helpers_textCompositor:getDistanceCallShorthand(dist) end

--- Liste des liens de distance du style (distance.links).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:392
---@return table[]  Liens {threshold, text}.
function gameplay_rally_compositors_helpers_textCompositor:getDistanceLinks() end

--- Grande unité des distances (distance.units.large).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:405
---@return string  Unité.
function gameplay_rally_compositors_helpers_textCompositor:getLargeUnit() end

--- Distance maximale énoncée (distance.max).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:428
---@return number  Distance en m.
function gameplay_rally_compositors_helpers_textCompositor:getMaxDistance() end

--- Seuil du dernier lien de distance (0 s'il n'y en a pas).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:396
---@return number  Distance en mètres.
function gameplay_rally_compositors_helpers_textCompositor:getMaxLinkDistance() end

--- Mot parlé pour le point décimal (distance.units.point).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:408
---@return string  Mot.
function gameplay_rally_compositors_helpers_textCompositor:getPointTranslation() end

--- Pas d'arrondi des grandes distances (distance.rounding.large).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:422
---@return number  Pas en m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingLarge() end

--- Distance à partir de laquelle on passe à la grande unité (distance.rounding.largeThreshold).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:425
---@return number  Seuil en m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingLargeThreshold() end

--- Pas d'arrondi des distances moyennes (distance.rounding.medium).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:415
---@return number  Pas en m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingMedium() end

--- Distance à partir de laquelle on utilise le pas moyen (distance.rounding.mediumThreshold).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:418
---@return number  Seuil en m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingMediumThreshold() end

--- Pas d'arrondi des petites distances (distance.rounding.small).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:412
---@return number  Pas en m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingSmall() end

--- Renvoie la i-ème variante (1 par défaut) de la note système 'name'.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:155
---@param name string Nom de la note système.
---@param i integer|nil Indice de variante.
---@return table|nil  Variante {text, audioFname, audioBasename...}.
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenote(name, i) end

--- Renvoie une table {nom -> variantes[]} où chaque variante reçoit audioFname (fichier dans le dossier de notes de la mission, ou fichier du pack vocal actif ou résolu) et audioBasename. L'ordre de pairs() n'est pas défini : utiliser getSystemPacenotesOrdered quand l'ordre compte. Résultat mis en cache.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:105
---@param missionPacenotesDirname string|nil Dossier des notes audio de la mission ; nil = utiliser le pack vocal.
---@param voicepackEntry table|nil Entrée de pack vocal à activer (via setVoicepackEntry).
---@return table<string, table[]>|nil  Notes système par nom ; nil si style non chargé.
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenotes(missionPacenotesDirname, voicepackEntry) end

--- Renvoie le tableau ordonné {name, variants} des notes système tel qu'écrit par l'auteur du style.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:97
---@return table[]  Liste ordonnée (vide si non chargé).
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenotesOrdered() end

--- Mémorise le nom du style et le dossier de mission (journalise une erreur si le nom est nil). Ne charge rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:15
---@param compositorName string Nom du style relatif à compositors/styles/ (ex. 'english/casual').
---@param missionDir string|nil Dossier de la mission, pour les calibrages.
function gameplay_rally_compositors_helpers_textCompositor:init(compositorName, missionDir) end

--- Charge le style : require + deepcopy, applique calibrationOverrides.applyToConfig, valide avec styleValidator. En cas de fichier absent ou de validation échouée, journalise une erreur et laisse le style à nil.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:27
---@return boolean  true si le style est chargé et valide.
function gameplay_rally_compositors_helpers_textCompositor:load() end

--- Hash textuel d'une phrase (voir compositorUtil.pacenoteHash).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:432
---@param text string Phrase.
---@return string|nil  Hash.
function gameplay_rally_compositors_helpers_textCompositor:pacenoteHash(text) end

--- Arrondit une distance selon les règles du style : au-delà de largeThreshold, valeur en unité 'large' (km) ; entre mediumThreshold et largeThreshold, pas medium (bascule en 'large' si le résultat atteint largeThreshold) ; sinon pas small.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:338
---@param dist number Distance en mètres.
---@return number  Valeur arrondie.
---@return string  Unité (base ou large).
function gameplay_rally_compositors_helpers_textCompositor:roundDistance(dist) end

--- Définit l'entrée de pack vocal active ; vide le cache des notes système si son identifiant (id, dir ou dirname) change.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:52
---@param entry table|nil Entrée de pack vocal.
function gameplay_rally_compositors_helpers_textCompositor:setVoicepackEntry(entry) end

--- Écrit le résultat d'une énumération dans un fichier JSON indenté.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:334
---@param fname string Fichier de sortie.
---@param enumerated table Données à écrire.
function gameplay_rally_compositors_helpers_textCompositor:writeEnumerated(fname, enumerated) end

