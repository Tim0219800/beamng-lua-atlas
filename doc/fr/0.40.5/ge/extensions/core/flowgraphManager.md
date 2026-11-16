# `core_flowgraphManager`

*Fichier : `lua/ge/extensions/core/flowgraphManager.lua` · VM : Game Engine (GE) · 436 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_flowgraphManager` : `extensions.load("core_flowgraphManager")`, puis la globale `core_flowgraphManager`

Extension GE `core_flowgraphManager` : gestionnaire des projets Flowgraph (scripts visuels à base de nœuds) en cours d'exécution. Il crée, charge, démarre, supprime et sérialise les `manager` (un par projet .flow.json), fournit les catalogues de nœuds et de templates d'état disponibles pour l'éditeur, et expose des helpers `_flowgraph_createNode / _flowgraph_createStateNode / _flowgraph_createModule` que les fichiers de nœuds utilisent pour se déclarer. Un moddeur l'utilise pour lancer un projet flowgraph par script ou retrouver un nœud/module d'un projet actif.

## Exemple

```lua
local mgr, ok = core_flowgraphManager.loadManager('/flowgraphEditor/monProjet.flow.json')
if ok then mgr:setRunning(true) end
-- projet unique partagé (flowgraphEditor/<nom>.flow.json), démarré automatiquement
local s = core_flowgraphManager.getSingleton('monProjet')
```

## Remarques

- Un 'manager' est un objet créé par require('/lua/ge/extensions/flowgraph/manager')(M) : champs vus ici : id, graphs[graphId].nodes[nodeId], modules[nom], hidden, transient, savedDir, savedFilename, stopRunningOnClientEndMission ; méthodes vues : setRunning, destroy, historySnapshot, broadcastCall, resolveHooksAndReset, _onSerialize/_onDeserialized. Leur détail est dans le dossier flowgraph/.
- Les managers à démarrage différé (startNextFrame) sont lancés au prochain onUpdate ; ceux de startOnLoadingScreenFadeout le sont quand le hook onLoadingScreenFadeout est reçu et sont marqués stopRunningOnClientEndMission.
- onSerialize/onDeserialized sont utilisés lors du rechargement des extensions et aussi par reInitOnFileChange : modifier un fichier de nœud (flowgraph/nodes ou un *Node.lua du dossier customNodes d'un projet) recharge tous les managers.
- Les managers 'transient' ne sont pas sérialisés ; les 'singletons' (getSingleton) sont retrouvés par nom après rechargement et relancés.
- Incohérences : le commentaire de getNextUniqueIdentifier dit 'do not use ever' ; getAvailableStateTemplates utilise stateData.name qui n'est jamais défini (le dernier élément de splitPath n'est donc pas ajouté) et construit sourcePath avec l'extension .lua alors que ce sont des .flow.json ; mgrRunningChanged est un local vide non exporté ; les hooks onFlowgraphSceneObjectAdd/Remove/Changed ne font que dump() dans la console.
- Champs : M.dependencies n'est pas défini à la création, mais par refreshDependencies() (clés de runningProxies).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_flowgraphManager.addManager(data)` | Crée un manager, éventuellement à partir de données déjà décodées, et l'ajoute à la liste. Ne le démarre pas. | 115 |
| `core_flowgraphManager.clearAllManagers()` | Détruit tous les managers et vide la liste. | 59 |
| `core_flowgraphManager.controls(name)` | Diffuse à tous les managers l'évènement de contrôle 'onControlsReset' (name = 'reset') ou 'onControlsAction' (name = 'action'). | 387 |
| `core_flowgraphManager.getAllManagers()` | Liste de tous les managers actifs (référence directe à la table interne). | 66 |
| `core_flowgraphManager.getAvailableNodeTemplates()` | Scanne récursivement '/lua/ge/extensions/flowgraph/nodes/' (*.lua), les charge avec require (les erreurs sont loguées et le nœud ignoré) et construit un arbre de catégories et une table à plat. Résultat mis en cache jusqu'à la modification d'un fichier de nœud. | 262 |
| `core_flowgraphManager.getAvailablePinTypes(node)` | Types de pins entrants/sortants d'un nœud d'après son pinSchema ; ajoute 'flow' en entrée et sortie pour les nœuds fonctionnels non simples (via ui_flowgraph_editor). | 302 |
| `core_flowgraphManager.getAvailableStateTemplates()` | Scanne '/flowgraphEditor/states/' (*state.flow.json), lit chaque fichier et construit un arbre et une table à plat de templates d'état. Les fichiers directement à la racine du dossier sont ignorés. | 326 |
| `core_flowgraphManager.getManagerByID(id)` | Cherche un manager par son id. | 70 |
| `core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId)` | Récupère en sécurité un nœud d'un graphe d'un manager actif ; nil si un des ids est invalide (à préférer à l'accès direct getManagerByID(m).graphs[g].nodes[n]). | 79 |
| `core_flowgraphManager.getManagerModule(mgrId, moduleName)` | Récupère un module d'un manager actif par son nom ; nil si absent. | 89 |
| `core_flowgraphManager.getNextUniqueIdentifier()` | Compteur d'identifiants uniques incrémenté à chaque appel. Le code indique « do not use ever » : réservé à l'implémentation de flowgraph. *(interne)* | 9 |
| `core_flowgraphManager.getSingleton(name)` | Renvoie le manager unique de ce nom ; le charge depuis 'flowgraphEditor/<name>.flow.json', le démarre et le mémorise s'il n'existe pas encore. | 367 |
| `core_flowgraphManager.loadManager(filepath, hidden, keepSavedDirs)` | Crée un manager et y charge un projet .flow.json. Le manager est ajouté à la liste même si le fichier est introuvable (erreur loguée, manager vide). | 97 |
| `core_flowgraphManager.onDeserialized(data)` | Hook de restauration : détruit les managers, les recrée depuis les données, relance les singletons. *(interne)* *(hook)* | 244 |
| `core_flowgraphManager.onExtensionLoaded()` | Hook au chargement : définit les fonctions globales _flowgraph_createNode, _flowgraph_createStateNode et _flowgraph_createModule (rawset dans _G) utilisées par les fichiers de nœuds/modules. *(interne)* *(hook)* | 29 |
| `core_flowgraphManager.onFileChanged(filename, type)` | Hook de modification de fichier : si un nœud de base ou un '*Node.lua' du dossier customNodes d'un projet actif change, recharge (sérialise/désérialise) tous les managers. *(interne)* *(hook)* | 206 |
| `core_flowgraphManager.onFlowgraphSceneObjectAdd(id, name, fgPath)` | Hook appelé à l'ajout d'un objet de scène flowgraph : affiche seulement un dump de debug. *(interne)* *(hook)* | 399 |
| `core_flowgraphManager.onFlowgraphSceneObjectChanged(id, name, fgPath)` | Hook de modification d'un objet de scène flowgraph : dump de debug uniquement. *(interne)* *(hook)* | 407 |
| `core_flowgraphManager.onFlowgraphSceneObjectRemove(id, name, fgPath)` | Hook de suppression d'un objet de scène flowgraph : dump de debug uniquement. *(interne)* *(hook)* | 403 |
| `core_flowgraphManager.onLoadingScreenFadeout()` | Hook en fin d'écran de chargement : démarre les managers de la liste startOnLoadingScreenFadeout. *(interne)* *(hook)* | 153 |
| `core_flowgraphManager.onSerialize()` | Hook de sauvegarde avant rechargement des extensions : sérialise les managers non transitoires et l'index des singletons. *(interne)* *(hook)* | 224 |
| `core_flowgraphManager.onUpdate()` | Hook par image : résout les hooks en attente et réinitialise chaque manager, démarre/supprime ceux planifiés puis diffuse 'onFlowgraphManagerPreUpdate' à chacun. *(interne)* *(hook)* | 166 |
| `core_flowgraphManager.refreshDependencies()` | Recalcule M.dependencies à partir des clés de M.runningProxies. | 21 |
| `core_flowgraphManager.removeManager(mgr)` | Détruit un manager et le retire de la liste ainsi que des singletons. Sans effet si le manager n'est pas trouvé (comparaison par id). | 124 |
| `core_flowgraphManager.removeNextFrame(mgr)` | Planifie la suppression d'un manager au prochain onUpdate (évite de détruire un manager pendant son exécution). | 148 |
| `core_flowgraphManager.startNextFrame(mgr)` | Planifie setRunning(true) d'un manager au prochain onUpdate. | 145 |
| `core_flowgraphManager.startOnLoadingScreenFadeout(fg)` | Met un manager en file pour démarrer à la fin de l'écran de chargement (hook onLoadingScreenFadeout), utilisé par les projets lancés automatiquement avec un niveau. | 161 |

### Détail des paramètres

#### `core_flowgraphManager.addManager(data)`

Crée un manager, éventuellement à partir de données déjà décodées, et l'ajoute à la liste. Ne le démarre pas.

- `data` (*table|nil*) : Données de projet sérialisées.
- **renvoie** : table Manager.

#### `core_flowgraphManager.controls(name)`

Diffuse à tous les managers l'évènement de contrôle 'onControlsReset' (name = 'reset') ou 'onControlsAction' (name = 'action').

- `name` (*string*) : 'reset' ou 'action' ; autres valeurs ignorées.

#### `core_flowgraphManager.getAllManagers()`

Liste de tous les managers actifs (référence directe à la table interne).

- **renvoie** : table[] Managers.

#### `core_flowgraphManager.getAvailableNodeTemplates()`

Scanne récursivement '/lua/ge/extensions/flowgraph/nodes/' (*.lua), les charge avec require (les erreurs sont loguées et le nœud ignoré) et construit un arbre de catégories et une table à plat. Résultat mis en cache jusqu'à la modification d'un fichier de nœud.

- **renvoie** : table Arbre : sous-dossier -> {nodes = {nom -> template}, ...sous-dossiers}.
- **renvoie** : table<string, table> Table à plat chemin -> template (champs ajoutés : path, sourcePath, splitPath, availablePinTypes).

#### `core_flowgraphManager.getAvailablePinTypes(node)`

Types de pins entrants/sortants d'un nœud d'après son pinSchema ; ajoute 'flow' en entrée et sortie pour les nœuds fonctionnels non simples (via ui_flowgraph_editor).

- `node` (*table*) : Définition de nœud (champs pinSchema, category).
- **renvoie** : table {_in = {type = true}, _out = {type = true}}.

#### `core_flowgraphManager.getAvailableStateTemplates()`

Scanne '/flowgraphEditor/states/' (*state.flow.json), lit chaque fichier et construit un arbre et une table à plat de templates d'état. Les fichiers directement à la racine du dossier sont ignorés.

- **renvoie** : table Arbre par sous-dossier : {states = {…}}.
- **renvoie** : table<string, table> Table à plat chemin -> {data, path, sourcePath, splitPath}.

#### `core_flowgraphManager.getManagerByID(id)`

Cherche un manager par son id.

- `id` (*integer*) : Id du manager.
- **renvoie** : table|nil Manager ou nil.

#### `core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId)`

Récupère en sécurité un nœud d'un graphe d'un manager actif ; nil si un des ids est invalide (à préférer à l'accès direct getManagerByID(m).graphs[g].nodes[n]).

- `mgrId` (*integer*) : Id du manager.
- `graphId` (*integer*) : Id du graphe.
- `nodeId` (*integer*) : Id du nœud.
- **renvoie** : table|nil Nœud.

#### `core_flowgraphManager.getManagerModule(mgrId, moduleName)`

Récupère un module d'un manager actif par son nom ; nil si absent.

- `mgrId` (*integer*) : Id du manager.
- `moduleName` (*string*) : Nom du module.
- **renvoie** : table|nil Module.

#### `core_flowgraphManager.getNextUniqueIdentifier()`

Compteur d'identifiants uniques incrémenté à chaque appel. Le code indique « do not use ever » : réservé à l'implémentation de flowgraph.

- **renvoie** : integer Identifiant.

#### `core_flowgraphManager.getSingleton(name)`

Renvoie le manager unique de ce nom ; le charge depuis 'flowgraphEditor/<name>.flow.json', le démarre et le mémorise s'il n'existe pas encore.

- `name` (*string*) : Nom de projet sans extension.
- **renvoie** : table|nil Manager ; nil si le fichier est introuvable.

#### `core_flowgraphManager.loadManager(filepath, hidden, keepSavedDirs)`

Crée un manager et y charge un projet .flow.json. Le manager est ajouté à la liste même si le fichier est introuvable (erreur loguée, manager vide).

- `filepath` (*string*) : Chemin du fichier .flow.json.
- `hidden` (*boolean|nil*) : Marque le manager comme caché (mgr.hidden).
- `keepSavedDirs` (*boolean|nil*) : true = garde savedDir/savedFilename du fichier au lieu de ceux de filepath.
- **renvoie** : table Manager.
- **renvoie** : boolean true si le fichier a été lu.

#### `core_flowgraphManager.onDeserialized(data)`

Hook de restauration : détruit les managers, les recrée depuis les données, relance les singletons.

- `data` (*table*) : Données de onSerialize.

#### `core_flowgraphManager.onFileChanged(filename, type)`

Hook de modification de fichier : si un nœud de base ou un '*Node.lua' du dossier customNodes d'un projet actif change, recharge (sérialise/désérialise) tous les managers.

- `filename` (*string*) : Chemin du fichier.
- `type` (*any*) : Non utilisé.

#### `core_flowgraphManager.onFlowgraphSceneObjectAdd(id, name, fgPath)`

Hook appelé à l'ajout d'un objet de scène flowgraph : affiche seulement un dump de debug.

- `id` (*integer*) : Id de l'objet.
- `name` (*string*) : Nom.
- `fgPath` (*string*) : Chemin du flowgraph.

#### `core_flowgraphManager.onFlowgraphSceneObjectChanged(id, name, fgPath)`

Hook de modification d'un objet de scène flowgraph : dump de debug uniquement.

- `id` (*integer*) : Id de l'objet.
- `name` (*string*) : Nom.
- `fgPath` (*string*) : Chemin du flowgraph.

#### `core_flowgraphManager.onFlowgraphSceneObjectRemove(id, name, fgPath)`

Hook de suppression d'un objet de scène flowgraph : dump de debug uniquement.

- `id` (*integer*) : Id de l'objet.
- `name` (*string*) : Nom.
- `fgPath` (*string*) : Chemin du flowgraph.

#### `core_flowgraphManager.onSerialize()`

Hook de sauvegarde avant rechargement des extensions : sérialise les managers non transitoires et l'index des singletons.

- **renvoie** : table {mgrs, uniques}.

#### `core_flowgraphManager.removeManager(mgr)`

Détruit un manager et le retire de la liste ainsi que des singletons. Sans effet si le manager n'est pas trouvé (comparaison par id).

- `mgr` (*table*) : Manager.

#### `core_flowgraphManager.removeNextFrame(mgr)`

Planifie la suppression d'un manager au prochain onUpdate (évite de détruire un manager pendant son exécution).

- `mgr` (*table*) : Manager.

#### `core_flowgraphManager.startNextFrame(mgr)`

Planifie setRunning(true) d'un manager au prochain onUpdate.

- `mgr` (*table*) : Manager.

#### `core_flowgraphManager.startOnLoadingScreenFadeout(fg)`

Met un manager en file pour démarrer à la fin de l'écran de chargement (hook onLoadingScreenFadeout), utilisé par les projets lancés automatiquement avec un niveau.

- `fg` (*table*) : Manager.

## Champs

| Champ | Type | Description |
|---|---|---|
| `enableUsageTracking` | boolean | Drapeau de suivi d'usage (false par défaut) ; lu par d'autres modules flowgraph. |
| `nodePath` | string | '/lua/ge/extensions/flowgraph/nodes/' : dossier des nœuds de base. |
| `runningProxies` | table<string, any> | Extensions proxy en cours ; leurs clés servent à recalculer M.dependencies (refreshDependencies). |
| `skipCountdowns` | boolean | Drapeau pour ignorer les compte à rebours (false par défaut) ; lu par d'autres modules flowgraph. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/flowgraphManager.lua`.*
