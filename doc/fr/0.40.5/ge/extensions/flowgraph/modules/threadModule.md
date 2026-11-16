# `flowgraph_modules_threadModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/threadModule.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/threadModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 1000) qui permet à un projet flowgraph d'en lancer d'autres (projets enfants) et d'échanger des messages avec eux. Les messages reçus sont mis en file puis distribués au début de la mise à jour suivante (hook onFlowgraphManagerPreUpdate) aux nœuds via broadcastCall. À l'arrêt, tous les enfants lancés sont arrêtés et retirés.

## Remarques

- Un message avec un champ hook est diffusé comme appel mgr:broadcastCall(message.hook, message.data) ; sinon il l'est comme 'onThreadMessageProcess'.
- targetId == -1 désigne le parent (parentId) ; un projet racine a parentId = -1, donc l'envoi échoue (renvoie false).
- startProjectFromFilepath affiche un dump de la liste des enfants (dumpz).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_threadModule.afterTrigger()` | Appelé après le tick du graphe (ne fait rien). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_threadModule.clear()` | Vide les enfants et les messages, remet parentId = -1. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_threadModule.executionStarted()` | Appelé au démarrage du projet (ne fait rien). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_threadModule.executionStopped()` | Appelé à l'arrêt du projet : arrête immédiatement chaque enfant, les retire à la frame suivante, puis appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_threadModule.init()` | Appelé à la création du module : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_threadModule.onFlowgraphManagerPreUpdate()` | Hook appelé avant la mise à jour des managers : diffuse puis vide la file de messages reçus. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_threadModule.receiveMessage(message, sourceId)` | Ajoute un message à la file de réception et le journalise. (assignée dynamiquement) | dyn |
| `flowgraph_modules_threadModule.sendMessage(targetId, message, sourceNode)` | Envoie un message au manager cible (ou au parent si targetId vaut -1). Journalise l'envoi. (assignée dynamiquement) | dyn |
| `flowgraph_modules_threadModule.startProjectFromFilepath(file, sourceNode)` | Charge un projet flowgraph depuis un fichier (core_flowgraphManager.loadManager), le démarre, l'enregistre comme enfant et lui donne ce manager comme parent. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_threadModule.receiveMessage(message, sourceId)`

Ajoute un message à la file de réception et le journalise. (assignée dynamiquement)

- `message` (*table*) : message
- `sourceId` (*integer*) : id du manager émetteur

#### `flowgraph_modules_threadModule.sendMessage(targetId, message, sourceNode)`

Envoie un message au manager cible (ou au parent si targetId vaut -1). Journalise l'envoi. (assignée dynamiquement)

- `targetId` (*integer*) : id du manager flowgraph cible, -1 pour le parent
- `message` (*table*) : message (champs facultatifs name, hook, data)
- `sourceNode` (*table|nil*) : nœud émetteur, pour le log
- **renvoie** : boolean true si la cible existe

#### `flowgraph_modules_threadModule.startProjectFromFilepath(file, sourceNode)`

Charge un projet flowgraph depuis un fichier (core_flowgraphManager.loadManager), le démarre, l'enregistre comme enfant et lui donne ce manager comme parent. (assignée dynamiquement)

- `file` (*string*) : chemin du projet
- `sourceNode` (*table|nil*) : nœud à l'origine, pour le log
- **renvoie** : integer id du manager enfant

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` |  | 18 |
| `C:clear()` |  | 12 |
| `C:executionStarted()` |  | 74 |
| `C:executionStopped()` |  | 62 |
| `C:init()` |  | 8 |
| `C:onFlowgraphManagerPreUpdate()` |  | 32 |
| `C:receiveMessage(message, sourceId)` |  | 43 |
| `C:sendMessage(targetId, message, sourceNode)` |  | 21 |
| `C:startProjectFromFilepath(file, sourceNode)` |  | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/threadModule.lua`.*
