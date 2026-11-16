# `jbeam_io`

*Fichier : `lua/common/jbeam/io.lua` · VM : Commun (GE + véhicule) · 503 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/io")`

Lecture et mise en cache des fichiers .jbeam des véhicules. Pour chaque dossier demandé, parse chaque *.jbeam (JSON), normalise les sections slots/slots2 vers le format slots2 (name, allowTypes, denyTypes, default, description), stocke chaque pièce encodée dans un cache et construit des index (pièce -> fichier, slotType -> pièces, pièce -> description). Permet ensuite de récupérer une pièce (getPart), de lister les pièces disponibles et celles compatibles avec un emplacement. Un moddeur s'en sert pour interroger les pièces/slots d'un véhicule depuis une extension GE.

## Exemple

```lua
local io = require('jbeam/io')
local ioCtx = io.startLoading({'/vehicles/pickup/', '/vehicles/common/'})
local mainName = io.getMainPartName(ioCtx)
local part, filename = io.getPart(ioCtx, mainName)
```

## Remarques

- ioCtx est le contexte renvoyé par startLoading : {preloadedDirs = liste de dossiers}. Les dossiers sont de la forme '/vehicles/<nom>/' (avec slash final, sans slash initial dans le motif interne).
- Le cache est global au module : chaque fichier n'est parsé qu'une fois. onFileChanged l'invalide pour un .jbeam modifié et force un nouveau scan des dossiers au prochain startLoading ; les index restent périmés jusqu'à ce rechargement (voulu d'après le commentaire).
- Les pièces sont stockées encodées (stringBufferEncode) : getPart renvoie à chaque appel une copie décodée neuve, qu'on peut modifier sans effet sur le cache.
- Une pièce sans slotType (string ou table) est ignorée avec une erreur de journal. Une pièce de même nom présente deux fois dans un même slotType déclenche l'erreur 'Duplicate part found'.
- Le format slots (v1) est converti en slots2 (name = type, allowTypes = {type}, denyTypes = {}); le tableau d'en-tête manquant est ajouté avec avertissement. À la sortie, part.slots vaut nil et part.slots2 existe.
- getAvailableSlotNameMap est marqué DEPRECATED dans le code (incompatible slots2) ; utiliser getCompatiblePartNamesForSlot.
- La fonction locale updateAllVehiclesCompatibleParts n'est pas exportée.
- Le fichier est marqué « do not change this file without speaking to tdev » dans le code.
- Les modules core_modmanager (onExtensionLoaded) et FS ne sont disponibles que côté GE.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_io.finishLoading()` | Ne fait rien (le corps est commenté) ; existe pour symétrie avec startLoading. | 297 |
| `jbeam_io.getAvailablePartNamesForSlot(ioCtx, slotType)` | Liste les noms de pièces dont le slotType est slotType (ne gère pas slots2). | 351 |
| `jbeam_io.getAvailableParts(ioCtx)` | Liste toutes les pièces des dossiers du contexte avec leur description (description, authors, isAuxiliary, slotInfoUi, modName éventuel). Recharge si les index manquent ; journalise une erreur en cas de noms en double. | 301 |
| `jbeam_io.getAvailableSlotNameMap(ioCtx)` | Obsolète. Renvoie pour chaque slotType la liste des pièces qui s'y adaptent (selon le slotType de la pièce). | 324 |
| `jbeam_io.getCompatiblePartNamesForSlot(ioCtx, slotDef, slotMap)` | Pièces compatibles avec un emplacement. Pour un slot v1 (champ type) renvoie les pièces du type. Pour un slot v2, garde les pièces dont un slotType est dans allowTypes sans qu'aucun de leurs types ne soit dans denyTypes ; les autres sont renvoyées avec la raison 'Part type is in deny list'. | 361 |
| `jbeam_io.getLastStartLoadingStats()` | Statistiques du dernier startLoading : nombre total de fichiers et nombre servis par le cache. | 480 |
| `jbeam_io.getMainPartName(ioCtx)` | Nom de la première pièce déclarée avec le slotType 'main' dans les dossiers du contexte. | 288 |
| `jbeam_io.getPart(ioCtx, partName)` | Renvoie la définition complète d'une pièce (table jbeam décodée, avec partName) et le fichier d'origine. | 267 |
| `jbeam_io.onExtensionLoaded()` | Hook appelé au chargement de l'extension : récupère extensions.core_modmanager pour associer les pièces à leur mod. *(interne)* *(hook)* | 484 |
| `jbeam_io.onFileChanged(filename, type)` | Hook appelé quand un fichier change sur le disque : pour un .jbeam, supprime son cache et force un nouveau scan des dossiers. *(interne)* *(hook)* | 466 |
| `jbeam_io.startLoading(directories)` | Parse (ou récupère du cache) tous les *.jbeam des dossiers donnés, reconstruit les index globaux si un fichier a changé et mémorise des statistiques (total/cachedHits). | 230 |

### Détail des paramètres

#### `jbeam_io.getAvailablePartNamesForSlot(ioCtx, slotType)`

Liste les noms de pièces dont le slotType est slotType (ne gère pas slots2).

- `ioCtx` (*table*) : Contexte renvoyé par startLoading.
- `slotType` (*string*) : Type d'emplacement.
- **renvoie** : string[] Noms de pièces ({} si aucune).

#### `jbeam_io.getAvailableParts(ioCtx)`

Liste toutes les pièces des dossiers du contexte avec leur description (description, authors, isAuxiliary, slotInfoUi, modName éventuel). Recharge si les index manquent ; journalise une erreur en cas de noms en double.

- `ioCtx` (*table*) : Contexte renvoyé par startLoading.
- **renvoie** : table<string, table>|nil Table nomDePièce -> description ; nil si le contexte est invalide.

#### `jbeam_io.getAvailableSlotNameMap(ioCtx)`

Obsolète. Renvoie pour chaque slotType la liste des pièces qui s'y adaptent (selon le slotType de la pièce).

- `ioCtx` (*table*) : Contexte renvoyé par startLoading.
- **renvoie** : table<string, string[]>|nil slotType -> noms de pièces ; nil si contexte invalide.

#### `jbeam_io.getCompatiblePartNamesForSlot(ioCtx, slotDef, slotMap)`

Pièces compatibles avec un emplacement. Pour un slot v1 (champ type) renvoie les pièces du type. Pour un slot v2, garde les pièces dont un slotType est dans allowTypes sans qu'aucun de leurs types ne soit dans denyTypes ; les autres sont renvoyées avec la raison 'Part type is in deny list'.

- `ioCtx` (*table*) : Contexte renvoyé par startLoading.
- `slotDef` (*table*) : Définition de slot (élément de part.slots2 ou part.slots).
- `slotMap` (*table|nil*) : Résultat de getAvailableSlotNameMap, à fournir si on appelle plusieurs fois (optimisation).
- **renvoie** : string[] Noms de pièces compatibles.
- **renvoie** : table[] Pièces refusées : {partName, reason}.

#### `jbeam_io.getLastStartLoadingStats()`

Statistiques du dernier startLoading : nombre total de fichiers et nombre servis par le cache.

- **renvoie** : table {total = integer, cachedHits = integer}.

#### `jbeam_io.getMainPartName(ioCtx)`

Nom de la première pièce déclarée avec le slotType 'main' dans les dossiers du contexte.

- `ioCtx` (*table*) : Contexte renvoyé par startLoading.
- **renvoie** : string|nil Nom de la pièce principale.

#### `jbeam_io.getPart(ioCtx, partName)`

Renvoie la définition complète d'une pièce (table jbeam décodée, avec partName) et le fichier d'origine.

- `ioCtx` (*table*) : Contexte renvoyé par startLoading.
- `partName` (*string|nil*) : Nom de la pièce.
- **renvoie** : table|nil Pièce décodée ; nil si introuvable ou nom nil.
- **renvoie** : string|nil Nom du fichier .jbeam.

#### `jbeam_io.onFileChanged(filename, type)`

Hook appelé quand un fichier change sur le disque : pour un .jbeam, supprime son cache et force un nouveau scan des dossiers.

- `filename` (*string*) : Fichier modifié.
- `type` (*string*) : Type de changement (utilisé dans le journal).

#### `jbeam_io.startLoading(directories)`

Parse (ou récupère du cache) tous les *.jbeam des dossiers donnés, reconstruit les index globaux si un fichier a changé et mémorise des statistiques (total/cachedHits).

- `directories` (*string[]*) : Liste de dossiers jbeam (ex. '/vehicles/pickup/').
- **renvoie** : table Contexte ioCtx {preloadedDirs = directories}.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/io.lua`.*
