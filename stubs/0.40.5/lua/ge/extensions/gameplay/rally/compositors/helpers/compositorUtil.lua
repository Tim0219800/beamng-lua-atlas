---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils du compositeur de notes de rallye. Parcourt les éléments d'une note structurée dans l'ordre fixe des emplacements, appelle pour chaque type (corner, caution, modificateurs) les règles du registre componentTypes du style actif, et produit les phrases (avec catégorie et variante), en ajoutant les marqueurs de distance avant/après. Contient aussi les recherches dans les plages (intensité par diamètre, longueur par longueur d'arc), le hash de phrase servant de nom de fichier audio et les énumérations de phrases pour la génération audio et le lecteur de script. Les types inconnus ou valeurs non rendables sont ignorés silencieusement.
--- Accès : extension `gameplay_rally_compositors_helpers_compositorUtil` : `extensions.load("gameplay_rally_compositors_helpers_compositorUtil")`, puis la globale `gameplay_rally_compositors_helpers_compositorUtil`
---@class gameplay_rally_compositors_helpers_compositorUtil
gameplay_rally_compositors_helpers_compositorUtil = {}

--- Version simplifiée de compositePhraseEntries qui ne renvoie que les textes.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:556
---@param config table|nil Config du style.
---@param structured table Note structurée.
---@param rawDistanceBefore number|nil Distance avant (m).
---@param rawDistanceAfter number|nil Distance après (m).
---@param escapeVars boolean|nil true pour des variables de distance.
---@return string[]  Phrases dans l'ordre.
function gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars) end

--- Parcourt les éléments structurés dans l'ordre fixe des emplacements, appelle l'émetteur du type et ajoute les marqueurs de distance avant/après. Les éléments sont dits les uns après les autres sans connecteur automatique ; les liens inter-notes ('into', 'and') viennent de la liste de liens de distance si les appels de distance sont activés.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:455
---@param config table|nil Config du style.
---@param structured table Note structurée.
---@param rawDistanceBefore number|nil Distance avant (m).
---@param rawDistanceAfter number|nil Distance après (m).
---@param opts table|nil escapeVars (boolean : variables au lieu de valeurs), variantResolver (function(entry) -> entry|nil), distanceAfterBeforePostModifier (boolean : place la distance après avant le premier modificateur postérieur au virage).
---@return table[]  Entrées {text, category, variant?, audioFname?}.
function gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts) end

--- Liste ordonnée des intensités de virage du style.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:113
---@param cornerCfg table|nil Config corner.
---@return table[]|nil  Entrées {id, text, diameter, visual, afterDirection...}.
function gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg) end

--- Cherche une entrée de longueur par son id pour une intensité.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:125
---@param cornerCfg table|nil Config corner.
---@param intensityId string Intensité.
---@param lengthId string Id de la longueur.
---@return table|nil  Entrée.
---@return integer|nil  Indice dans la liste.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId) end

--- Libellé d'une entrée de longueur : label, sinon text, sinon id.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:152
---@param entry table|nil Entrée.
---@return string|nil  Libellé.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry) end

--- Texte parlé d'une entrée de longueur.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:147
---@param entry table|nil Entrée.
---@return string|nil  Texte.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry) end

--- Liste des longueurs de virage pour une intensité (lengthsByIntensity[intensityId]).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:118
---@param cornerCfg table|nil Config corner.
---@param intensityId string|nil Identifiant d'intensité.
---@return table[]|nil  Entrées {id, text, arcMeters...}.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId) end

--- Renvoie la sous-table de numérotation d'un composant corner (cornerCfg.numbering, ou cornerCfg lui-même s'il n'existe pas, ou {} si nil).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:107
---@param cornerCfg table|nil Config du composant corner.
---@return table  Numérotation.
function gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg) end

--- Vrai sauf si config.distance.callsEnabled vaut explicitement false.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:417
---@param config table|nil Config du style.
---@return boolean  État.
function gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config) end

--- Énumère toutes les phrases prononçables du style actif (dédoublonnées) : liens de distance, appels de virage, descripteurs, longueurs, formes, cautions, modificateurs. Sert au pipeline audio et au lecteur de script pour savoir quels fichiers chercher ou générer.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:784
---@param textCompositor table Non utilisé.
---@param config table Config du style.
---@return string[]  Phrases uniques.
function gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config) end

--- Énumère les entrées du lecteur de script avec catégorie, sous-catégorie, variante et clés de tri : liens de distance, appels de virage (par intensité et direction), descripteurs, longueurs, formes, niveaux de caution, modificateurs. Plus riche qu'enumerateConcise.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:660
---@param textCompositor table Non utilisé.
---@param config table Config du style.
---@return table[]  Entrées {phrase, hash, audioFname, recordingSlug, category, subcategory, sourceContext, variant, sortGroup, sortSubgroup, sortPhrase}.
function gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config) end

--- Texte d'un niveau de caution (cautionCfg.levels[item.level]).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:302
---@param cautionCfg table|nil Config caution.
---@param item table|nil Élément caution (level).
---@return string|nil  Texte.
function gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item) end

--- Renvoie l'entrée dont la plage est la plus proche de targetValue (distance 0 si contenue), avec filtre facultatif.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:71
---@param valuesList table[]|nil Liste d'entrées.
---@param targetValue number|string Valeur cible.
---@param key string|nil Clé de la plage.
---@param filterFn function|nil function(entry) -> boolean pour exclure des entrées.
---@return table|nil  Entrée la plus proche.
function gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn) end

--- Phrase d'appel d'un virage : descripteur + direction, sinon intensité (ajustée au risque) + direction + afterDirection. Renvoie nil si pas de direction, direction non définie dans le style ou intensité introuvable.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:246
---@param cornerCfg table|nil Config corner.
---@param item table Élément corner (direction, descriptor, intensity...).
---@return string|nil  Phrase.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item) end

--- Texte de longueur d'un virage pour une intensité donnée d'après item.arcMeters ; lengthMode 'shorter'/'longer' décale d'une entrée, 'skip' supprime.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:266
---@param cornerCfg table Config corner.
---@param item table Élément corner (arcMeters, lengthMode).
---@param intensityEntry table|nil Entrée d'intensité.
---@return string|nil  Texte de longueur.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry) end

--- Texte de longueur d'un virage en cherchant d'abord l'intensité de l'élément (sans ajustement de risque).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:290
---@param cornerCfg table Config corner.
---@param item table Élément corner.
---@return string|nil  Texte de longueur.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item) end

--- Texte parlé de la forme d'un virage.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:296
---@param cornerCfg table Config corner.
---@param shape string|nil Clé de forme.
---@return string|nil  Texte.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape) end

--- Renvoie l'entrée dont la valeur numérique (clé 'value' par défaut) est la plus proche de targetValue.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:24
---@param valuesList table[] Liste d'entrées.
---@param targetValue number Valeur cible.
---@param key string|nil Clé numérique ('value' par défaut).
---@return table|nil  Entrée la plus proche.
function gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key) end

--- Tire un élément au hasard selon son champ 'weight' (1 par défaut).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:396
---@param items table[] Éléments avec weight facultatif.
---@return table  Élément choisi.
function gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items) end

--- Renvoie la première entrée dont la plage (clé 'value' par défaut) contient targetValue.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:58
---@param valuesList table[]|nil Liste d'entrées.
---@param targetValue number|string Valeur cherchée.
---@param key string|nil Clé de la plage.
---@return table|nil  Entrée trouvée.
function gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key) end

--- Identifiant d'une entrée d'intensité.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:158
---@param entry table|nil Entrée.
---@return string|nil  Id.
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry) end

--- Libellé d'une entrée d'intensité : label, sinon text, sinon id.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:168
---@param entry table|nil Entrée.
---@return string|nil  Libellé.
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry) end

--- Texte parlé d'une entrée d'intensité.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:163
---@param entry table|nil Entrée.
---@return string|nil  Texte.
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry) end

--- Renvoie la config du composant pour un type d'élément : corner et caution directement, sinon un modificateur (en résolvant modifierAliases).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:138
---@param componentTypes table|nil Registre componentTypes.
---@param itemType string Type de l'élément.
---@return table|nil  Config du composant.
function gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType) end

--- Entrée de descripteur d'un virage (cornerCfg.descriptors, en résolvant descriptorAliases).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:232
---@param cornerCfg table Config corner.
---@param descriptor string|nil Clé du descripteur.
---@return table|nil  Entrée.
function gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor) end

--- Entrée d'intensité du style correspondant à un diamètre physique mesuré (plage 'diameter').
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:213
---@param cornerCfg table Config corner.
---@param intensity number Diamètre mesuré (>= 0).
---@return table|nil  Entrée d'intensité.
function gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity) end

--- Comme lookupIntensityEntry sur item.intensity, puis décale l'entrée selon le signe de item.riskIntensity (positif = vers le début de la liste, plus risqué), borné aux extrémités.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:218
---@param cornerCfg table Config corner.
---@param item table Élément corner (intensity, riskIntensity).
---@return table|nil  Entrée d'intensité ajustée.
function gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item) end

--- Entrée de forme d'un virage (cornerCfg.shapes[shape]).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:238
---@param cornerCfg table Config corner.
---@param shape string|nil Clé de forme.
---@return table|nil  Entrée.
function gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape) end

--- Table des modificateurs atomiques du style (componentTypes.modifiers, ou {}).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:133
---@param componentTypes table|nil Registre componentTypes.
---@return table  Modificateurs par clé.
function gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes) end

--- Transforme une phrase en identifiant utilisable comme nom de fichier (voir notes).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:385
---@param text string|nil Phrase.
---@return string|nil  Hash, nil si text est nil.
function gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text) end

--- Nettoie une phrase (suppression des espaces de début et de fin via rallyUtil.trimString).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:379
---@param phrase string Phrase brute.
---@return string  Phrase nettoyée.
function gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase) end

--- Lit une plage {min, max} : renvoie min et max numériques (max nil si absent) ; nil, nil si value n'est pas une table.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:43
---@param value table|nil Plage.
---@return number|nil  min.
---@return number|nil  max.
function gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value) end

--- Vrai si targetValue est dans [min, max[ (ou >= min sans max).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:51
---@param value table Plage {min, max}.
---@param targetValue number Valeur testée.
---@return boolean  Résultat.
function gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue) end

--- Signe d'une valeur : 1, -1 ou 0 (0 si non numérique).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:174
---@param value number|nil Valeur.
---@return integer  -1, 0 ou 1.
function gameplay_rally_compositors_helpers_compositorUtil.signedStep(value) end

