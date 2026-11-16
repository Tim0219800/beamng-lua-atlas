# `editor_levelValidator`

*Fichier : `lua/ge/extensions/editor/levelValidator.lua` · VM : Game Engine (GE) · 993 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_levelValidator` : `extensions.load("editor_levelValidator")`, puis la globale `editor_levelValidator`

Outil « Level Validator » de l'éditeur (menu Window > Debug). Le bouton « Find issues » lance un job qui cherche dans le niveau les objets dupliqués, flottants (non plantés sur le terrain), les splines mal configurées (moins de 2 nœuds) et les échelles nulles ou quasi nulles, pour les objets de scène et les éléments de forêt. Les résultats sont triables, ignorables, et certains corrigeables (suppression des doublons, sans undo possible). Les résultats peuvent être lus par d'autres modules via getLevelLogs.

## Exemple

```lua
editor_levelValidator.startLevelValidation()
local agg = editor_levelValidator.getLevelLogsAggregated()
```

## Remarques

- Préférence levelValidator.general.extendedLogs : affiche des erreurs supplémentaires dans la liste.
- Dans startLevelValidation, getLevelLogs() est appelé mais cette fonction locale est définie plus bas dans le fichier (ligne ~894) : à cet endroit c'est la globale getLevelLogs qui est visée, donc nil. Avec extendedLogs activé, l'appel échoue (bug probable du jeu).
- Niveaux de log : I, W, E, D. Types internes : duplicate, floating, spline, scale.
- onEditorAfterSaveLevel est vide (l'appel automatique à startLevelValidation est commenté).

**Dépendances (chargées avant) :** `core_forest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_levelValidator.getLevelLogs()` | Renvoie la liste brute des problèmes trouvés (entrées avec logLevel, type, objectId, message…). | 894 |
| `editor_levelValidator.getLevelLogsAggregated()` | Renvoie les problèmes regroupés par type lisible (Duplicated Object, Floating Object, Spline Misconfigured, Duplicated Forest Item, Floating Forest Item, et « Zero or Near-Zero Scale »). Chaque entrée est enrichie du nom et de la position de l'objet, et d'une position/rotation de caméra (15 m derrière l'objet). | 897 |
| `editor_levelValidator.onClientStartMission()` | Appelé au démarrage d'un niveau : réinitialise les dimensions du terrain, les logs et l'état de vérification. *(interne)* *(hook)* | 876 |
| `editor_levelValidator.onEditorAfterSaveLevel(state)` | Appelé après la sauvegarde du niveau. Corps vide. *(interne)* *(hook)* | 884 |
| `editor_levelValidator.onEditorGui()` | Dessine la fenêtre de l'outil (bouton Find issues, liste filtrable et triable, actions). *(interne)* *(hook)* | 578 |
| `editor_levelValidator.onEditorInitialized()` | Enregistre la fenêtre « levelValidator » et l'entrée de menu « Level Validator » (groupe Debug). *(interne)* *(hook)* | 856 |
| `editor_levelValidator.onEditorPreferenceValueChanged(path, value)` | Si extendedLogs change, vide les résultats et réinitialise l'état de vérification. *(interne)* *(hook)* | 888 |
| `editor_levelValidator.onEditorRegisterPreferences(prefsRegistry)` | Enregistre la catégorie de préférences levelValidator.general (extendedLogs, columnSizes caché). *(interne)* *(hook)* | 865 |
| `editor_levelValidator.onExtensionLoaded()` | Hook de chargement : écrit un log Debug « initialized ». *(interne)* *(hook)* | 861 |
| `editor_levelValidator.startLevelValidation()` | Lance la validation du niveau dans un job (core_jobsystem, période 0.04) et passe l'état à « recherche en cours ». | 567 |

### Détail des paramètres

#### `editor_levelValidator.getLevelLogs()`

Renvoie la liste brute des problèmes trouvés (entrées avec logLevel, type, objectId, message…).

- **renvoie** : table levelLogs.

#### `editor_levelValidator.getLevelLogsAggregated()`

Renvoie les problèmes regroupés par type lisible (Duplicated Object, Floating Object, Spline Misconfigured, Duplicated Forest Item, Floating Forest Item, et « Zero or Near-Zero Scale »). Chaque entrée est enrichie du nom et de la position de l'objet, et d'une position/rotation de caméra (15 m derrière l'objet).

- **renvoie** : table {elementsByType = {[i] = {type, count, elements}}}.

#### `editor_levelValidator.onEditorAfterSaveLevel(state)`

Appelé après la sauvegarde du niveau. Corps vide.

- `state` (*any*) : Non utilisé.

#### `editor_levelValidator.onEditorPreferenceValueChanged(path, value)`

Si extendedLogs change, vide les résultats et réinitialise l'état de vérification.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_levelValidator.onEditorRegisterPreferences(prefsRegistry)`

Enregistre la catégorie de préférences levelValidator.general (extendedLogs, columnSizes caché).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"core_forest"}. |

## Classe `sortingFunctions`

Comparateurs de tri des colonnes de la liste de résultats (a et b sont deux entrées de log).

| Méthode | Description | Ligne |
|---|---|---|
| `sortingFunctions.Code(a, b)` | Tri par uniqueErrorCode (0 si absent). | 45 |
| `sortingFunctions.Description(a, b)` | Tri par message. | 51 |
| `sortingFunctions.File(a, b)` | Tri par champ filename. | 71 |
| `sortingFunctions.Line(a, b)` | Tri par champ lineNumber (0 si absent). | 77 |
| `sortingFunctions.LogLevel(a, b)` | Tri par logLevel (chaîne). | 39 |
| `sortingFunctions.ObjectName(a, b)` | Tri par nom de l'objet a.object (chaîne vide si absent). | 63 |
| `sortingFunctions.Origin(a, b)` | Tri par champ origin (chaîne vide si absent). | 57 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onLevelValidationFinished`

## Appels vers le moteur (C++)

- `Sim.` `deserializeObjectsFromText`, `findObjectById`
- `obj:` `deleteObject`, `getId`, `getWorldBox`, `isSubClassOf`, `serialize`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/levelValidator.lua`.*
