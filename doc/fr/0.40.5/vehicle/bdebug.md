# `bdebug`

*Fichier : `lua/vehicle/bdebug.lua` · VM : Véhicule · 294 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `bdebug`

Façade légère de l'outil de debug visuel du véhicule (nœuds, poutres, triangles de collision, centre de gravité…). Tant que personne ne l'utilise, bdebugImpl.lua (gros module) n'est pas chargé : les fonctions marquées « initialisent » chargent bdebugImpl à leur premier appel et redirigent ensuite vers lui. Un moddeur s'en sert surtout pour afficher du texte sur des nœuds (setNodeDebugText) ou activer/désactiver l'outil. Le GE reçoit l'état via guihooks BdebugUpdate et extensions.hook onBDebugUpdate (envoyés par bdebugImpl).

## Exemple

```lua
-- VM véhicule
bdebug.setNodeDebugText('monTest', 12, 'noeud 12')
bdebug.setEnabled(true)
-- nettoyage
bdebug.clearTypeNodeDebugText('monTest')
```

## Remarques

- setPartsSelected, setNodeDebugText, clearNodeDebugText, clearTypeNodeDebugText et clearAllNodeDebugText peuvent être appelées avant l'initialisation de bdebugImpl : les données sont stockées dans un état local puis passées à bdebugImpl à son init. Après l'init, ces fonctions sont remplacées par celles de bdebugImpl.
- Avant l'initialisation, isEnabled() renvoie toujours false ; receiveViewportSize est une fonction vide ; nodeCollision, beamBroke, debugDraw, onPlayersChanged et reset valent nop. Elles sont remplacées par des redirections vers bdebugImpl à l'init.
- initState, state et stateNoReset sont des tables proxy : la première lecture ou écriture d'un champ charge bdebugImpl et redirige vers ses tables.
- toggleEnabled, nodetextModeChange, nodevisModeChange, nodedebugtextModeChange, skeletonModeChange, colTrisModeChange, cogChange et resetModes sont réservées aux événements d'entrée (input) ; le code dit de ne pas les utiliser depuis l'UI.
- bdebug.init ne fait rien (le chargement est paresseux). bdebug.setPartsSelected est assigné deux fois dans le fichier (sans conséquence).
- Persistance : onSerialize sauvegarde bdebugImpl.state si bdebugImpl a été initialisé ; onDeserialize le ré-initialise tout de suite après un rechargement du véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `bdebug.clearAllNodeDebugText()` | Supprime tous les groupes de textes debug de nœuds. | 229 |
| `bdebug.clearNodeDebugText(type, nodeCID)` | Supprime les textes d'un nœud dans un groupe. | 200 |
| `bdebug.clearTypeNodeDebugText(type)` | Supprime un groupe de textes entier (et décale les index des groupes suivants). | 209 |
| `bdebug.cogChange(change)` | Change le mode d'affichage du centre de gravité (cogModes, dont 'off' et 'on'). *(interne)* | 150 |
| `bdebug.colTrisModeChange(change)` | Change le mode des triangles de collision (off, simple, type, withoutBroken, withBroken, brokenOnly, collideableOnly). *(interne)* | 145 |
| `bdebug.init()` | Fonction vide appelée à l'initialisation du véhicule ; le chargement est paresseux. *(interne)* | 250 |
| `bdebug.isEnabled()` | Indique si l'outil est visible. Renvoie toujours false avant le chargement de bdebugImpl, puis bdebugImpl.isEnabled. | 107 |
| `bdebug.nodedebugtextModeChange(change)` | Change le groupe de texte debug de nœuds affiché (off puis les groupes créés par setNodeDebugText). *(interne)* | 135 |
| `bdebug.nodetextModeChange(change)` | Passe au mode suivant/précédent du texte de nœuds (off, names, numbers, names+numbers, weights, materials, groups, forces, relativePositions, worldPositions, clusters). Appelée par les actions d'entrée. *(interne)* | 125 |
| `bdebug.nodevisModeChange(change)` | Change le mode de visualisation des nœuds (off, simple, highlighted, weights, displacement, velocities, forces, density, clusters, mainCluster, nodeStability). *(interne)* | 130 |
| `bdebug.onDeserialize(data)` | Hook de restauration après rechargement : si un état bdebugImpl a été sauvegardé, initialise bdebugImpl avec lui. *(interne)* *(hook)* | 244 |
| `bdebug.onSerialize()` | Hook de sauvegarde avant rechargement du véhicule : renvoie {bdebugImplState = état} si bdebugImpl a déjà été initialisé. *(interne)* *(hook)* | 238 |
| `bdebug.receiveViewportSize()` | Fonction vide tant que bdebugImpl n'est pas chargé ; ensuite remplacée par bdebugImpl.receiveViewportSize(sizeX, sizeY). *(interne)* | 253 |
| `bdebug.requestDrawnBeamsGE(geFuncName)` | Comme requestDrawnNodesGE mais pour les poutres : appelle geFuncName(beamsDrawn, beamScale) dans le GE. | 102 |
| `bdebug.requestDrawnNodesGE(geFuncName)` | Demande qu'au prochain dessin, la liste des nœuds dessinés soit envoyée à une fonction Lua du GE, appelée sous la forme geFuncName(nodesDrawn, nodeScale). | 96 |
| `bdebug.requestState()` | Initialise bdebugImpl et demande l'envoi de l'état courant à l'UI/GE (BdebugUpdate). | 85 |
| `bdebug.resetModes()` | Remet tous les modes à leur valeur par défaut (copie de initState) et affiche le message vehicle.bdebug.clear. | 155 |
| `bdebug.setEnabled(enabled)` | Initialise bdebugImpl puis affiche/masque le debug visuel du véhicule. | 111 |
| `bdebug.setNodeDebugText(type, nodeCID, text)` | Ajoute un texte sur un nœud dans un groupe de texte debug (le groupe est créé s'il n'existe pas). Plusieurs appels sur le même nœud empilent les textes. Utilisable avant l'init de bdebugImpl. | 172 |
| `bdebug.setPartsSelected(parts)` | Définit les pièces sélectionnées dont les nœuds/poutres sont mis en valeur. Utilisable avant l'init de bdebugImpl. | 164 |
| `bdebug.setState(state, stateNoReset, notSendBack)` | Initialise bdebugImpl puis lui applique un état venu de l'UI. Ignoré si state.objectId n'est pas l'objet courant. | 90 |
| `bdebug.skeletonModeChange(change)` | Change le mode de visualisation des poutres (squelette) : off, simple, highlighted, type, type+broken, brokenOnly, supportOnly, stress, displacement, deformation, etc. *(interne)* | 140 |
| `bdebug.toggleEnabled()` | Bascule l'affichage debug. Réservée au système d'input, ne pas appeler depuis l'UI. *(interne)* | 120 |

### Détail des paramètres

#### `bdebug.clearNodeDebugText(type, nodeCID)`

Supprime les textes d'un nœud dans un groupe.

- `type` (*string*) : Nom du groupe.
- `nodeCID` (*integer*) : ID du nœud à l'exécution.

#### `bdebug.clearTypeNodeDebugText(type)`

Supprime un groupe de textes entier (et décale les index des groupes suivants).

- `type` (*string*) : Nom du groupe.

#### `bdebug.cogChange(change)`

Change le mode d'affichage du centre de gravité (cogModes, dont 'off' et 'on').

- `change` (*integer*) : +1 / -1 (cyclique).

#### `bdebug.colTrisModeChange(change)`

Change le mode des triangles de collision (off, simple, type, withoutBroken, withBroken, brokenOnly, collideableOnly).

- `change` (*integer*) : +1 / -1 (cyclique).

#### `bdebug.isEnabled()`

Indique si l'outil est visible. Renvoie toujours false avant le chargement de bdebugImpl, puis bdebugImpl.isEnabled.

- **renvoie** : boolean true si vehicleDebugVisible.

#### `bdebug.nodedebugtextModeChange(change)`

Change le groupe de texte debug de nœuds affiché (off puis les groupes créés par setNodeDebugText).

- `change` (*integer*) : +1 / -1 (cyclique).

#### `bdebug.nodetextModeChange(change)`

Passe au mode suivant/précédent du texte de nœuds (off, names, numbers, names+numbers, weights, materials, groups, forces, relativePositions, worldPositions, clusters). Appelée par les actions d'entrée.

- `change` (*integer*) : +1 suivant, -1 précédent (cyclique).

#### `bdebug.nodevisModeChange(change)`

Change le mode de visualisation des nœuds (off, simple, highlighted, weights, displacement, velocities, forces, density, clusters, mainCluster, nodeStability).

- `change` (*integer*) : +1 / -1 (cyclique).

#### `bdebug.onDeserialize(data)`

Hook de restauration après rechargement : si un état bdebugImpl a été sauvegardé, initialise bdebugImpl avec lui.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `bdebug.onSerialize()`

Hook de sauvegarde avant rechargement du véhicule : renvoie {bdebugImplState = état} si bdebugImpl a déjà été initialisé.

- **renvoie** : table {bdebugImplState = table|nil}.

#### `bdebug.requestDrawnBeamsGE(geFuncName)`

Comme requestDrawnNodesGE mais pour les poutres : appelle geFuncName(beamsDrawn, beamScale) dans le GE.

- `geFuncName` (*string*) : Nom de la fonction GE.

#### `bdebug.requestDrawnNodesGE(geFuncName)`

Demande qu'au prochain dessin, la liste des nœuds dessinés soit envoyée à une fonction Lua du GE, appelée sous la forme geFuncName(nodesDrawn, nodeScale).

- `geFuncName` (*string*) : Nom de la fonction GE (chemin global, ex. 'monModule.recoit').

#### `bdebug.setEnabled(enabled)`

Initialise bdebugImpl puis affiche/masque le debug visuel du véhicule.

- `enabled` (*boolean*) : true pour afficher.

#### `bdebug.setNodeDebugText(type, nodeCID, text)`

Ajoute un texte sur un nœud dans un groupe de texte debug (le groupe est créé s'il n'existe pas). Plusieurs appels sur le même nœud empilent les textes. Utilisable avant l'init de bdebugImpl.

- `type` (*string*) : Nom du groupe de texte.
- `nodeCID` (*integer*) : ID du nœud à l'exécution (cid).
- `text` (*string*) : Texte à afficher.

#### `bdebug.setPartsSelected(parts)`

Définit les pièces sélectionnées dont les nœuds/poutres sont mis en valeur. Utilisable avant l'init de bdebugImpl.

- `parts` (*table*) : Sélection de pièces (format de partsSelected utilisé par bdebugImpl, déduit du code).

#### `bdebug.setState(state, stateNoReset, notSendBack)`

Initialise bdebugImpl puis lui applique un état venu de l'UI. Ignoré si state.objectId n'est pas l'objet courant.

- `state` (*table*) : État (objectId, vehicleDebugVisible, vehicle = {…modes…}).
- `stateNoReset` (*table*) : État conservé aux resets de modes.
- `notSendBack` (*boolean|nil*) : true pour ne pas renvoyer l'état à l'UI.

#### `bdebug.skeletonModeChange(change)`

Change le mode de visualisation des poutres (squelette) : off, simple, highlighted, type, type+broken, brokenOnly, supportOnly, stress, displacement, deformation, etc.

- `change` (*integer*) : +1 / -1 (cyclique).

## Champs

| Champ | Type | Description |
|---|---|---|
| `beamBroke` | function | Hook de rupture de poutre beamBroke(id, energy) ; nop avant l'init, puis redirection vers bdebugImpl. |
| `debugDraw` | function | Dessin debug debugDraw(focusPos) appelé par la boucle principale ; nop avant l'init, puis redirection vers bdebugImpl. |
| `initState` | table | Proxy vers bdebugImpl.initState (état par défaut des modes). Charge bdebugImpl à l'accès. |
| `nodeCollision` | function | Hook de collision de nœud ; nop tant que bdebugImpl n'est pas chargé, puis redirige nodeCollision(p) vers bdebugImpl. |
| `onPlayersChanged` | function | Hook de changement de joueur ; nop avant l'init, puis bdebugImpl.onPlayersChanged. |
| `reset` | function | Reset du véhicule ; nop avant l'init, puis bdebugImpl.reset. |
| `state` | table | Proxy vers bdebugImpl.state (état courant). Charge bdebugImpl à l'accès. |
| `stateNoReset` | table | Proxy vers bdebugImpl.stateNoReset (état non remis à zéro par resetModes). Charge bdebugImpl à l'accès. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/bdebug.lua`.*
