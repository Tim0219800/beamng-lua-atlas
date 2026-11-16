# `gameplay_rally_compositors_helpers_compositorUtil`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua` · VM : Game Engine (GE) · 863 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_helpers_compositorUtil` : `extensions.load("gameplay_rally_compositors_helpers_compositorUtil")`, puis la globale `gameplay_rally_compositors_helpers_compositorUtil`

Boîte à outils du compositeur de notes de rallye. Parcourt les éléments d'une note structurée dans l'ordre fixe des emplacements, appelle pour chaque type (corner, caution, modificateurs) les règles du registre componentTypes du style actif, et produit les phrases (avec catégorie et variante), en ajoutant les marqueurs de distance avant/après. Contient aussi les recherches dans les plages (intensité par diamètre, longueur par longueur d'arc), le hash de phrase servant de nom de fichier audio et les énumérations de phrases pour la génération audio et le lecteur de script. Les types inconnus ou valeurs non rendables sont ignorés silencieusement.

## Remarques

- Une plage est {min, max} avec max facultatif (dernière plage ouverte) ; rangeContains teste min <= v < max.
- Les listes d'intensité vont du risque le plus élevé au plus faible : un riskIntensity positif remonte vers le début de la liste (index - step, borné).
- Le descripteur (descriptor) d'un virage l'emporte sur l'intensité ; dans ce cas la longueur n'est pas énoncée.
- Direction d'un virage : -1 gauche, 1 droite, 0/nil = pas d'appel de virage. lengthMode peut être 'skip', 'shorter' ou 'longer'.
- Catégories de phrases : distance, linkword, corner, caution, modifier, other. Un texte de distance égal à un lien du style est classé 'linkword'.
- pacenoteHash : minuscules, apostrophes supprimées, tout caractère hors a-z0-9 remplacé par '_', '_' répétés fusionnés, '_' de début/fin retirés ; sert à nommer les fichiers audio.
- getRandomWeightedItem utilise math.random : résultat non déterministe ; le poids par défaut est 1.
- enumerateScriptEntries et enumerateConcise reçoivent un paramètre textCompositor qui n'est pas utilisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars)` | Version simplifiée de compositePhraseEntries qui ne renvoie que les textes. | 556 |
| `gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts)` | Parcourt les éléments structurés dans l'ordre fixe des emplacements, appelle l'émetteur du type et ajoute les marqueurs de distance avant/après. Les éléments sont dits les uns après les autres sans connecteur automatique ; les liens inter-notes ('into', 'and') viennent de la liste de liens de distance si les appels de distance sont activés. | 455 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg)` | Liste ordonnée des intensités de virage du style. | 113 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId)` | Cherche une entrée de longueur par son id pour une intensité. | 125 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry)` | Libellé d'une entrée de longueur : label, sinon text, sinon id. | 152 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry)` | Texte parlé d'une entrée de longueur. | 147 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId)` | Liste des longueurs de virage pour une intensité (lengthsByIntensity[intensityId]). | 118 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg)` | Renvoie la sous-table de numérotation d'un composant corner (cornerCfg.numbering, ou cornerCfg lui-même s'il n'existe pas, ou {} si nil). | 107 |
| `gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config)` | Vrai sauf si config.distance.callsEnabled vaut explicitement false. | 417 |
| `gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config)` | Énumère toutes les phrases prononçables du style actif (dédoublonnées) : liens de distance, appels de virage, descripteurs, longueurs, formes, cautions, modificateurs. Sert au pipeline audio et au lecteur de script pour savoir quels fichiers chercher ou générer. | 784 |
| `gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config)` | Énumère les entrées du lecteur de script avec catégorie, sous-catégorie, variante et clés de tri : liens de distance, appels de virage (par intensité et direction), descripteurs, longueurs, formes, niveaux de caution, modificateurs. Plus riche qu'enumerateConcise. | 660 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item)` | Texte d'un niveau de caution (cautionCfg.levels[item.level]). | 302 |
| `gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn)` | Renvoie l'entrée dont la plage est la plus proche de targetValue (distance 0 si contenue), avec filtre facultatif. | 71 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item)` | Phrase d'appel d'un virage : descripteur + direction, sinon intensité (ajustée au risque) + direction + afterDirection. Renvoie nil si pas de direction, direction non définie dans le style ou intensité introuvable. | 246 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry)` | Texte de longueur d'un virage pour une intensité donnée d'après item.arcMeters ; lengthMode 'shorter'/'longer' décale d'une entrée, 'skip' supprime. | 266 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item)` | Texte de longueur d'un virage en cherchant d'abord l'intensité de l'élément (sans ajustement de risque). | 290 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape)` | Texte parlé de la forme d'un virage. | 296 |
| `gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key)` | Renvoie l'entrée dont la valeur numérique (clé 'value' par défaut) est la plus proche de targetValue. | 24 |
| `gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items)` | Tire un élément au hasard selon son champ 'weight' (1 par défaut). | 396 |
| `gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key)` | Renvoie la première entrée dont la plage (clé 'value' par défaut) contient targetValue. | 58 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry)` | Identifiant d'une entrée d'intensité. | 158 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry)` | Libellé d'une entrée d'intensité : label, sinon text, sinon id. | 168 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry)` | Texte parlé d'une entrée d'intensité. | 163 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType)` | Renvoie la config du composant pour un type d'élément : corner et caution directement, sinon un modificateur (en résolvant modifierAliases). | 138 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor)` | Entrée de descripteur d'un virage (cornerCfg.descriptors, en résolvant descriptorAliases). | 232 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity)` | Entrée d'intensité du style correspondant à un diamètre physique mesuré (plage 'diameter'). | 213 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item)` | Comme lookupIntensityEntry sur item.intensity, puis décale l'entrée selon le signe de item.riskIntensity (positif = vers le début de la liste, plus risqué), borné aux extrémités. | 218 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape)` | Entrée de forme d'un virage (cornerCfg.shapes[shape]). | 238 |
| `gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes)` | Table des modificateurs atomiques du style (componentTypes.modifiers, ou {}). | 133 |
| `gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text)` | Transforme une phrase en identifiant utilisable comme nom de fichier (voir notes). | 385 |
| `gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase)` | Nettoie une phrase (suppression des espaces de début et de fin via rallyUtil.trimString). | 379 |
| `gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value)` | Lit une plage {min, max} : renvoie min et max numériques (max nil si absent) ; nil, nil si value n'est pas une table. | 43 |
| `gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue)` | Vrai si targetValue est dans [min, max[ (ou >= min sans max). | 51 |
| `gameplay_rally_compositors_helpers_compositorUtil.signedStep(value)` | Signe d'une valeur : 1, -1 ou 0 (0 si non numérique). | 174 |

### Détail des paramètres

#### `gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars)`

Version simplifiée de compositePhraseEntries qui ne renvoie que les textes.

- `config` (*table|nil*) : Config du style.
- `structured` (*table*) : Note structurée.
- `rawDistanceBefore` (*number|nil*) : Distance avant (m).
- `rawDistanceAfter` (*number|nil*) : Distance après (m).
- `escapeVars` (*boolean|nil*) : true pour des variables de distance.
- **renvoie** : string[] Phrases dans l'ordre.

#### `gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts)`

Parcourt les éléments structurés dans l'ordre fixe des emplacements, appelle l'émetteur du type et ajoute les marqueurs de distance avant/après. Les éléments sont dits les uns après les autres sans connecteur automatique ; les liens inter-notes ('into', 'and') viennent de la liste de liens de distance si les appels de distance sont activés.

- `config` (*table|nil*) : Config du style.
- `structured` (*table*) : Note structurée.
- `rawDistanceBefore` (*number|nil*) : Distance avant (m).
- `rawDistanceAfter` (*number|nil*) : Distance après (m).
- `opts` (*table|nil*) : escapeVars (boolean : variables au lieu de valeurs), variantResolver (function(entry) -> entry|nil), distanceAfterBeforePostModifier (boolean : place la distance après avant le premier modificateur postérieur au virage).
- **renvoie** : table[] Entrées {text, category, variant?, audioFname?}.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg)`

Liste ordonnée des intensités de virage du style.

- `cornerCfg` (*table|nil*) : Config corner.
- **renvoie** : table[]|nil Entrées {id, text, diameter, visual, afterDirection...}.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId)`

Cherche une entrée de longueur par son id pour une intensité.

- `cornerCfg` (*table|nil*) : Config corner.
- `intensityId` (*string*) : Intensité.
- `lengthId` (*string*) : Id de la longueur.
- **renvoie** : table|nil Entrée.
- **renvoie** : integer|nil Indice dans la liste.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry)`

Libellé d'une entrée de longueur : label, sinon text, sinon id.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : string|nil Libellé.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry)`

Texte parlé d'une entrée de longueur.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : string|nil Texte.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId)`

Liste des longueurs de virage pour une intensité (lengthsByIntensity[intensityId]).

- `cornerCfg` (*table|nil*) : Config corner.
- `intensityId` (*string|nil*) : Identifiant d'intensité.
- **renvoie** : table[]|nil Entrées {id, text, arcMeters...}.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg)`

Renvoie la sous-table de numérotation d'un composant corner (cornerCfg.numbering, ou cornerCfg lui-même s'il n'existe pas, ou {} si nil).

- `cornerCfg` (*table|nil*) : Config du composant corner.
- **renvoie** : table Numérotation.

#### `gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config)`

Vrai sauf si config.distance.callsEnabled vaut explicitement false.

- `config` (*table|nil*) : Config du style.
- **renvoie** : boolean État.

#### `gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config)`

Énumère toutes les phrases prononçables du style actif (dédoublonnées) : liens de distance, appels de virage, descripteurs, longueurs, formes, cautions, modificateurs. Sert au pipeline audio et au lecteur de script pour savoir quels fichiers chercher ou générer.

- `textCompositor` (*table*) : Non utilisé.
- `config` (*table*) : Config du style.
- **renvoie** : string[] Phrases uniques.

#### `gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config)`

Énumère les entrées du lecteur de script avec catégorie, sous-catégorie, variante et clés de tri : liens de distance, appels de virage (par intensité et direction), descripteurs, longueurs, formes, niveaux de caution, modificateurs. Plus riche qu'enumerateConcise.

- `textCompositor` (*table*) : Non utilisé.
- `config` (*table*) : Config du style.
- **renvoie** : table[] Entrées {phrase, hash, audioFname, recordingSlug, category, subcategory, sourceContext, variant, sortGroup, sortSubgroup, sortPhrase}.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item)`

Texte d'un niveau de caution (cautionCfg.levels[item.level]).

- `cautionCfg` (*table|nil*) : Config caution.
- `item` (*table|nil*) : Élément caution (level).
- **renvoie** : string|nil Texte.

#### `gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn)`

Renvoie l'entrée dont la plage est la plus proche de targetValue (distance 0 si contenue), avec filtre facultatif.

- `valuesList` (*table[]|nil*) : Liste d'entrées.
- `targetValue` (*number|string*) : Valeur cible.
- `key` (*string|nil*) : Clé de la plage.
- `filterFn` (*function|nil*) : function(entry) -> boolean pour exclure des entrées.
- **renvoie** : table|nil Entrée la plus proche.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item)`

Phrase d'appel d'un virage : descripteur + direction, sinon intensité (ajustée au risque) + direction + afterDirection. Renvoie nil si pas de direction, direction non définie dans le style ou intensité introuvable.

- `cornerCfg` (*table|nil*) : Config corner.
- `item` (*table*) : Élément corner (direction, descriptor, intensity...).
- **renvoie** : string|nil Phrase.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry)`

Texte de longueur d'un virage pour une intensité donnée d'après item.arcMeters ; lengthMode 'shorter'/'longer' décale d'une entrée, 'skip' supprime.

- `cornerCfg` (*table*) : Config corner.
- `item` (*table*) : Élément corner (arcMeters, lengthMode).
- `intensityEntry` (*table|nil*) : Entrée d'intensité.
- **renvoie** : string|nil Texte de longueur.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item)`

Texte de longueur d'un virage en cherchant d'abord l'intensité de l'élément (sans ajustement de risque).

- `cornerCfg` (*table*) : Config corner.
- `item` (*table*) : Élément corner.
- **renvoie** : string|nil Texte de longueur.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape)`

Texte parlé de la forme d'un virage.

- `cornerCfg` (*table*) : Config corner.
- `shape` (*string|nil*) : Clé de forme.
- **renvoie** : string|nil Texte.

#### `gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key)`

Renvoie l'entrée dont la valeur numérique (clé 'value' par défaut) est la plus proche de targetValue.

- `valuesList` (*table[]*) : Liste d'entrées.
- `targetValue` (*number*) : Valeur cible.
- `key` (*string|nil*) : Clé numérique ('value' par défaut).
- **renvoie** : table|nil Entrée la plus proche.

#### `gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items)`

Tire un élément au hasard selon son champ 'weight' (1 par défaut).

- `items` (*table[]*) : Éléments avec weight facultatif.
- **renvoie** : table Élément choisi.

#### `gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key)`

Renvoie la première entrée dont la plage (clé 'value' par défaut) contient targetValue.

- `valuesList` (*table[]|nil*) : Liste d'entrées.
- `targetValue` (*number|string*) : Valeur cherchée.
- `key` (*string|nil*) : Clé de la plage.
- **renvoie** : table|nil Entrée trouvée.

#### `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry)`

Identifiant d'une entrée d'intensité.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : string|nil Id.

#### `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry)`

Libellé d'une entrée d'intensité : label, sinon text, sinon id.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : string|nil Libellé.

#### `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry)`

Texte parlé d'une entrée d'intensité.

- `entry` (*table|nil*) : Entrée.
- **renvoie** : string|nil Texte.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType)`

Renvoie la config du composant pour un type d'élément : corner et caution directement, sinon un modificateur (en résolvant modifierAliases).

- `componentTypes` (*table|nil*) : Registre componentTypes.
- `itemType` (*string*) : Type de l'élément.
- **renvoie** : table|nil Config du composant.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor)`

Entrée de descripteur d'un virage (cornerCfg.descriptors, en résolvant descriptorAliases).

- `cornerCfg` (*table*) : Config corner.
- `descriptor` (*string|nil*) : Clé du descripteur.
- **renvoie** : table|nil Entrée.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity)`

Entrée d'intensité du style correspondant à un diamètre physique mesuré (plage 'diameter').

- `cornerCfg` (*table*) : Config corner.
- `intensity` (*number*) : Diamètre mesuré (>= 0).
- **renvoie** : table|nil Entrée d'intensité.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item)`

Comme lookupIntensityEntry sur item.intensity, puis décale l'entrée selon le signe de item.riskIntensity (positif = vers le début de la liste, plus risqué), borné aux extrémités.

- `cornerCfg` (*table*) : Config corner.
- `item` (*table*) : Élément corner (intensity, riskIntensity).
- **renvoie** : table|nil Entrée d'intensité ajustée.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape)`

Entrée de forme d'un virage (cornerCfg.shapes[shape]).

- `cornerCfg` (*table*) : Config corner.
- `shape` (*string|nil*) : Clé de forme.
- **renvoie** : table|nil Entrée.

#### `gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes)`

Table des modificateurs atomiques du style (componentTypes.modifiers, ou {}).

- `componentTypes` (*table|nil*) : Registre componentTypes.
- **renvoie** : table Modificateurs par clé.

#### `gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text)`

Transforme une phrase en identifiant utilisable comme nom de fichier (voir notes).

- `text` (*string|nil*) : Phrase.
- **renvoie** : string|nil Hash, nil si text est nil.

#### `gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase)`

Nettoie une phrase (suppression des espaces de début et de fin via rallyUtil.trimString).

- `phrase` (*string*) : Phrase brute.
- **renvoie** : string Phrase nettoyée.

#### `gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value)`

Lit une plage {min, max} : renvoie min et max numériques (max nil si absent) ; nil, nil si value n'est pas une table.

- `value` (*table|nil*) : Plage.
- **renvoie** : number|nil min.
- **renvoie** : number|nil max.

#### `gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue)`

Vrai si targetValue est dans [min, max[ (ou >= min sans max).

- `value` (*table*) : Plage {min, max}.
- `targetValue` (*number*) : Valeur testée.
- **renvoie** : boolean Résultat.

#### `gameplay_rally_compositors_helpers_compositorUtil.signedStep(value)`

Signe d'une valeur : 1, -1 ou 0 (0 si non numérique).

- `value` (*number|nil*) : Valeur.
- **renvoie** : integer -1, 0 ou 1.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua`.*
