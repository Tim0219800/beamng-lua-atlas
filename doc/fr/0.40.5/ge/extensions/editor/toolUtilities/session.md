# `editor_toolUtilities_session`

*Fichier : `lua/ge/extensions/editor/toolUtilities/session.lua` · VM : Game Engine (GE) · 387 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_session` : `extensions.load("editor_toolUtilities_session")`, puis la globale `editor_toolUtilities_session`

Aide partagée de sauvegarde et chargement de session pour les outils personnalisés de splines et de zones de l'éditeur. Elle gère ce qui est identique pour tous les outils : l'enveloppe JSON portable (version, tool, mapName, items ou state, globals, records), la lecture/écriture de fichier, la boucle de chargement en remplacement ou en fusion, les boutons Save / Save As / Load en haut de fenêtre et la fenêtre modale Replace/Merge. Tout le spécifique à l'outil passe par une table spec. Référence de câblage : heroRoadEditor et roadSpline.

## Exemple

```lua
local session = extensions.editor_toolUtilities_session
local spec = {toolId = 'myTool', displayName = 'My Tool', itemNoun = 'zones', getItems = getItems,
  serializeItem = function(it) return session.itemToTable(it, nil, {'runtimeHandle'}) end,
  deserializeItem = deserializeItem, clearAll = clearAll, deepCopyAll = deepCopyAll,
  transUndo = undoFn, transRedo = redoFn}
-- dans le rendu de la fenêtre :
session.renderButtons(spec)
-- depuis la passe de reconstruction :
session.markEdited('myTool')
```

## Remarques

- Champs de spec obligatoires : toolId, getItems, serializeItem + deserializeItem (ou getState + loadWhole pour un outil à état global), clearAll, deepCopyAll, transUndo, transRedo.
- Champs de spec optionnels : displayName, itemNoun, refreshIdMap, onLoaded, logTag, version (défaut 1), noMerge (document unique : un Load remplace toujours), altItemsKey (ancienne clé de tableau acceptée), iconColor, iconSize (défaut 36x36), saveIcon/saveAsIcon/loadIcon, getGlobals/applyGlobals (réglages globaux de l'outil, appliqués seulement en Replace), getRecords/applyRecords (gros enregistrements, n'ouvrent jamais l'état modifié), loadJson, loadOptions, noLoadGuard.
- L'état (chemin lié, drapeau modifié, garde de chargement, baseline des globals) est tenu par toolId ; les tables sont locales au module et propres à l'exécution.
- Une fusion donne un nouvel identifiant (Engine.generateUUID) à un élément entrant dont l'id existe déjà.
- Après un Load en Replace (hors keepUnbound), l'outil est lié au fichier : les Save suivants l'écrasent sans demander. Les modifications de terrain ne sont pas sauvegardées.
- markEdited : la garde de chargement avale exactement un appel, celui de la reconstruction forcée provoquée par un Load.
- Les erreurs de chargement sont journalisées avec log('E', ...) ; le fichier est écrit par jsonWriteFile et lu par jsonReadFile.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_session.attachment(toolId)` | Renvoie le fichier auquel le document est attaché et s'il a des modifications non enregistrées. | 109 |
| `editor_toolUtilities_session.boundPath(toolId)` | Renvoie seulement le chemin lié, pour les appels par frame qui ne doivent pas allouer de table. | 114 |
| `editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys)` | Copie profonde d'un élément via le codec string.buffer (encode puis decode), avec en option des clés remplacées par {} ou supprimées. Sert à écrire serializeItem sans muter l'élément vivant. | 138 |
| `editor_toolUtilities_session.loadFromFile(path, spec, replace)` | Lit le fichier JSON puis applique spec.loadJson s'il existe, sinon loadJson du module. | 209 |
| `editor_toolUtilities_session.loadJson(j, spec, replace)` | Applique un JSON de session déjà décodé. replace vide d'abord les éléments courants (et applique globals/records) ; sinon les éléments chargés sont fusionnés, un id déjà utilisé recevant un nouvel UUID. Pour un outil à état global, passe state à spec.loadWhole. | 183 |
| `editor_toolUtilities_session.markEdited(toolId)` | Marque le document d'un outil comme modifié (non enregistré). À appeler depuis la passe de reconstruction de l'outil, une fois par passe. La garde de chargement avale un appel après un Load. | 92 |
| `editor_toolUtilities_session.reattach(toolId, at)` | Rétablit la liaison fichier et l'état modifié depuis une table renvoyée par attachment (par exemple après un rechargement d'extension). | 131 |
| `editor_toolUtilities_session.rehydrateVec3Array(arr)` | Reconvertit en place un tableau de positions chargées depuis le JSON ({x,y,z} simples) en vec3. Idempotent (les vec3 existants, qui ont une méthode distance, sont laissés tels quels) ; sans danger sur nil ou une non-table. | 147 |
| `editor_toolUtilities_session.renderButtons(spec)` | Variante en ligne : dessine Save (une fois un fichier connu), Save As (si l'outil est non vide) et Load côte à côte, puis la fenêtre modale Replace/Merge. | 345 |
| `editor_toolUtilities_session.renderButtonsColumns(spec)` | Variante en colonnes : dessine Save, Save As et Load comme trois cellules de grille. | 357 |
| `editor_toolUtilities_session.saveIfEdited(spec)` | Réécrit le document modifié sur le fichier auquel il est lié, pour un outil dont le travail ne doit jamais attendre un appui sur Save. Renvoie false s'il n'y a pas de fichier lié ou pas de modification. | 173 |
| `editor_toolUtilities_session.saveToFile(path, spec)` | Écrit tous les éléments dans path en JSON de session portable : version, tool, mapName (niveau courant), items ou state, globals, records. | 156 |
| `editor_toolUtilities_session.unbind(toolId)` | Détache un outil de son fichier : le prochain Save devra demander où écrire au lieu d'écraser silencieusement le dernier fichier chargé. | 104 |
| `editor_toolUtilities_session.windowTitle(toolId, label, id, newName)` | Titre de fenêtre nommant le fichier lié (ou newName avant qu'il y en ait un, « New Session » par défaut). L'identifiant id suit « ### » pour qu'ImGui garde l'ancrage et la taille. Mis en cache par outil. | 121 |

### Détail des paramètres

#### `editor_toolUtilities_session.attachment(toolId)`

Renvoie le fichier auquel le document est attaché et s'il a des modifications non enregistrées.

- `toolId` (*string*) : Identifiant de l'outil.
- **renvoie** : table { path = string|nil, dirty = true|nil }

#### `editor_toolUtilities_session.boundPath(toolId)`

Renvoie seulement le chemin lié, pour les appels par frame qui ne doivent pas allouer de table.

- `toolId` (*string*) : Identifiant de l'outil.
- **renvoie** : string|nil Chemin du fichier lié.

#### `editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys)`

Copie profonde d'un élément via le codec string.buffer (encode puis decode), avec en option des clés remplacées par {} ou supprimées. Sert à écrire serializeItem sans muter l'élément vivant.

- `item` (*table*) : Élément à copier.
- `emptyKeys` (*string[]|nil*) : Clés à remplacer par une table vide.
- `nilKeys` (*string[]|nil*) : Clés à supprimer.
- **renvoie** : table Copie propre.

#### `editor_toolUtilities_session.loadFromFile(path, spec, replace)`

Lit le fichier JSON puis applique spec.loadJson s'il existe, sinon loadJson du module.

- `path` (*string*) : Chemin du fichier.
- `spec` (*table*) : Spécification de l'outil.
- `replace` (*boolean*) : true pour remplacer, false pour fusionner.
- **renvoie** : boolean ok.
- **renvoie** : integer|string Nombre d'éléments ou erreur.
- **renvoie** : boolean|nil keepUnbound (fichier partiel) quand spec.loadJson le renvoie.

#### `editor_toolUtilities_session.loadJson(j, spec, replace)`

Applique un JSON de session déjà décodé. replace vide d'abord les éléments courants (et applique globals/records) ; sinon les éléments chargés sont fusionnés, un id déjà utilisé recevant un nouvel UUID. Pour un outil à état global, passe state à spec.loadWhole.

- `j` (*table*) : JSON décodé.
- `spec` (*table*) : Spécification de l'outil.
- `replace` (*boolean*) : true pour remplacer, false pour fusionner.
- **renvoie** : boolean ok.
- **renvoie** : integer|string Nombre d'éléments chargés, ou message d'erreur (« not a valid <toolId> session file »).

#### `editor_toolUtilities_session.markEdited(toolId)`

Marque le document d'un outil comme modifié (non enregistré). À appeler depuis la passe de reconstruction de l'outil, une fois par passe. La garde de chargement avale un appel après un Load.

- `toolId` (*string*) : Identifiant de l'outil.

#### `editor_toolUtilities_session.reattach(toolId, at)`

Rétablit la liaison fichier et l'état modifié depuis une table renvoyée par attachment (par exemple après un rechargement d'extension).

- `toolId` (*string*) : Identifiant de l'outil.
- `at` (*table*) : { path, dirty } ; ignoré si ce n'est pas une table.

#### `editor_toolUtilities_session.rehydrateVec3Array(arr)`

Reconvertit en place un tableau de positions chargées depuis le JSON ({x,y,z} simples) en vec3. Idempotent (les vec3 existants, qui ont une méthode distance, sont laissés tels quels) ; sans danger sur nil ou une non-table.

- `arr` (*table|nil*) : Tableau de positions.

#### `editor_toolUtilities_session.renderButtons(spec)`

Variante en ligne : dessine Save (une fois un fichier connu), Save As (si l'outil est non vide) et Load côte à côte, puis la fenêtre modale Replace/Merge.

- `spec` (*table*) : Spécification de l'outil.

#### `editor_toolUtilities_session.renderButtonsColumns(spec)`

Variante en colonnes : dessine Save, Save As et Load comme trois cellules de grille.

- `spec` (*table*) : Spécification de l'outil.

#### `editor_toolUtilities_session.saveIfEdited(spec)`

Réécrit le document modifié sur le fichier auquel il est lié, pour un outil dont le travail ne doit jamais attendre un appui sur Save. Renvoie false s'il n'y a pas de fichier lié ou pas de modification.

- `spec` (*table*) : Spécification de l'outil.
- **renvoie** : boolean true si enregistré.

#### `editor_toolUtilities_session.saveToFile(path, spec)`

Écrit tous les éléments dans path en JSON de session portable : version, tool, mapName (niveau courant), items ou state, globals, records.

- `path` (*string*) : Chemin du fichier.
- `spec` (*table*) : Spécification de l'outil.
- **renvoie** : boolean ok (toujours true).
- **renvoie** : integer Nombre d'éléments de getItems().

#### `editor_toolUtilities_session.unbind(toolId)`

Détache un outil de son fichier : le prochain Save devra demander où écrire au lieu d'écraser silencieusement le dernier fichier chargé.

- `toolId` (*string*) : Identifiant de l'outil.

#### `editor_toolUtilities_session.windowTitle(toolId, label, id, newName)`

Titre de fenêtre nommant le fichier lié (ou newName avant qu'il y en ait un, « New Session » par défaut). L'identifiant id suit « ### » pour qu'ImGui garde l'ancrage et la taille. Mis en cache par outil.

- `toolId` (*string*) : Identifiant de l'outil.
- `label` (*string*) : Libellé affiché.
- `id` (*string*) : Identifiant ImGui stable.
- `newName` (*string|nil*) : Nom affiché tant qu'aucun fichier n'est lié.
- **renvoie** : string Titre « label - [nom]###id ».

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/session.lua`.*
