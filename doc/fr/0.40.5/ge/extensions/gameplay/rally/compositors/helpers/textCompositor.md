# `gameplay_rally_compositors_helpers_textCompositor`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua` · VM : Game Engine (GE) · 443 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/compositors/helpers/textCompositor")` (fichier sous extensions/ mais pas une extension classique)

Compositeur de texte des notes de rallye : charge un style (fichier compositors/styles/<nom>.lua), le copie, applique les calibrages de la mission, le valide, puis expose la composition de phrases pour une note structurée, la liste des notes système (avec leurs fichiers audio selon la mission ou le pack vocal), l'énumération de toutes les phrases à enregistrer et les règles de conversion des distances en texte parlé. Le module renvoie un constructeur : require(...)(compositorName, missionDir) ; il faut appeler load() avant tout usage.

## Exemple

```lua
local tc = require('/lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor')('english/casual', missionDir)
if tc:load() then
  local text = tc:compositeText(structured, 120, 40)
end
```

## Remarques

- Toutes les méthodes de composition renvoient nil (ou {} / false selon la méthode) tant que load() n'a pas réussi.
- Les distances sont en mètres ; distanceToString arrondit selon distance.rounding du style et passe à l'unité 'large' (km) avec 'point' pour la virgule, ex. '1 point 5 km' (chaque chiffre décimal est séparé).
- enumerateAll lève une erreur (error) si deux phrases identiques existent dans le style (distances, notes, système).
- getSystemPacenote lit sys[name][i] sans test : erreur si le nom n'existe pas ou si le style n'est pas chargé.
- Le résultat de getSystemPacenotes est mis en cache par dossier de notes de mission ; changer de pack vocal (setVoicepackEntry avec un id différent) vide le cache.

## Classe `C`

Compositeur de texte. Attributs : compositorName, missionDir, compositor (table du style chargé ou nil), cachedSystemPacenotes, voicepackEntry.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_compositors_helpers_textCompositor")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_requireCompositor()` | Fait require du fichier de style (nil si pas de nom). | 65 |
| `C:compositePhraseEntries(structured, distBefore, distAfter, opts)` | Appelle compositorUtil.compositePhraseEntries avec la config du style : renvoie des entrées {text, category, variant, audioFname}. | 81 |
| `C:compositeText(structured, distBefore, distAfter)` | Compose le texte d'une note en appelant style.composite(config, structured, distBefore, distAfter). | 71 |
| `C:compositeTextEscaped(structured, distBefore, distAfter)` | Comme compositeText, mais avec escapeVars=true : les distances sont remplacées par les variables de substitution (rallyUtil.var_db / var_da) au lieu de leur valeur. | 76 |
| `C:compositorPath()` | Chemin de module du style : '/lua/ge/extensions/gameplay/rally/compositors/styles/<nom>'. | 61 |
| `C:distanceCallsEnabled()` | Indique si les appels de distance sont activés dans le style (false si non chargé). | 91 |
| `C:distanceToString(dist)` | Convertit une distance en texte parlé (partie entière puis arrondi) ; en unité 'large', le point décimal est remplacé par le mot 'point' du style et les chiffres sont séparés, puis l'unité est ajoutée. | 368 |
| `C:enumerateAll()` | Énumère toutes les phrases (distances, notes, système) avec hash, groupe et statistiques (totalChars, totalPhrases...). Lève une erreur si une phrase est dupliquée. | 261 |
| `C:enumerateDistanceEntries()` | Énumère les appels de distance prononçables : de la distance max des liens à distance.max, par pas de rounding.small, dédoublonnés par texte. Vide si les appels de distance sont désactivés. | 162 |
| `C:enumerateDistances()` | Même chose qu'enumerateDistanceEntries mais ne garde que les phrases. | 196 |
| `C:enumeratePacenotes()` | Énumère les phrases de notes via style.enumerate(self, config). | 204 |
| `C:enumerateScriptEntries()` | Énumère les entrées du lecteur de script avec catégorie et variantes : notes système, distances, puis celles de compositorUtil.enumerateScriptEntries. Complète hash, audioFname et recordingSlug. | 209 |
| `C:getBaseUnit()` | Unité de base des distances (distance.units.base). | 402 |
| `C:getConfig()` | Renvoie la table du style chargé. | 86 |
| `C:getDistanceCallShorthand(dist)` | Renvoie le texte du premier lien de distance dont le seuil est supérieur à dist (ex. 'into', 'and'). | 381 |
| `C:getDistanceLinks()` | Liste des liens de distance du style (distance.links). | 392 |
| `C:getLargeUnit()` | Grande unité des distances (distance.units.large). | 405 |
| `C:getMaxDistance()` | Distance maximale énoncée (distance.max). | 428 |
| `C:getMaxLinkDistance()` | Seuil du dernier lien de distance (0 s'il n'y en a pas). | 396 |
| `C:getPointTranslation()` | Mot parlé pour le point décimal (distance.units.point). | 408 |
| `C:getRoundingLarge()` | Pas d'arrondi des grandes distances (distance.rounding.large). | 422 |
| `C:getRoundingLargeThreshold()` | Distance à partir de laquelle on passe à la grande unité (distance.rounding.largeThreshold). | 425 |
| `C:getRoundingMedium()` | Pas d'arrondi des distances moyennes (distance.rounding.medium). | 415 |
| `C:getRoundingMediumThreshold()` | Distance à partir de laquelle on utilise le pas moyen (distance.rounding.mediumThreshold). | 418 |
| `C:getRoundingSmall()` | Pas d'arrondi des petites distances (distance.rounding.small). | 412 |
| `C:getSystemPacenote(name, i)` | Renvoie la i-ème variante (1 par défaut) de la note système 'name'. | 155 |
| `C:getSystemPacenotes(missionPacenotesDirname, voicepackEntry)` | Renvoie une table {nom -> variantes[]} où chaque variante reçoit audioFname (fichier dans le dossier de notes de la mission, ou fichier du pack vocal actif ou résolu) et audioBasename. L'ordre de pairs() n'est pas défini : utiliser getSystemPacenotesOrdered quand l'ordre compte. Résultat mis en cache. | 105 |
| `C:getSystemPacenotesOrdered()` | Renvoie le tableau ordonné {name, variants} des notes système tel qu'écrit par l'auteur du style. | 97 |
| `C:init(compositorName, missionDir)` | Mémorise le nom du style et le dossier de mission (journalise une erreur si le nom est nil). Ne charge rien. | 15 |
| `C:load()` | Charge le style : require + deepcopy, applique calibrationOverrides.applyToConfig, valide avec styleValidator. En cas de fichier absent ou de validation échouée, journalise une erreur et laisse le style à nil. | 27 |
| `C:pacenoteHash(text)` | Hash textuel d'une phrase (voir compositorUtil.pacenoteHash). | 432 |
| `C:roundDistance(dist)` | Arrondit une distance selon les règles du style : au-delà de largeThreshold, valeur en unité 'large' (km) ; entre mediumThreshold et largeThreshold, pas medium (bascule en 'large' si le résultat atteint largeThreshold) ; sinon pas small. | 338 |
| `C:setVoicepackEntry(entry)` | Définit l'entrée de pack vocal active ; vide le cache des notes système si son identifiant (id, dir ou dirname) change. | 52 |
| `C:writeEnumerated(fname, enumerated)` | Écrit le résultat d'une énumération dans un fichier JSON indenté. | 334 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua`.*
