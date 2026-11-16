# `flowgraph_modules_actionModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/actionModule.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/actionModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 0) qui bloque ou autorise des actions d'entrée (input actions) pendant l'exécution d'un projet flowgraph. Il garde un ensemble d'actions bloquées et, dans afterTrigger, pousse la liste vers core_input_actionFilter sous le groupe 'fg_filter_<id du manager>'. Il mémorise aussi l'état d'autorisation du mode marche (gameplay_walk) au démarrage pour le restaurer à l'arrêt.

## Remarques

- Les blocages ne sont appliqués qu'à la fin du tick (afterTrigger), seulement si self.changed est vrai.
- Bug probable : dans executionStopped, la variable 'list' n'est pas définie (global nil), donc setGroup est appelé avec nil.
- Bug probable : blockActions/allowActions utilisent la clé 'k' (index de la liste) pour addActions/removeActions, et afterTrigger les parcourt avec ipairs : des blocages de listes différentes s'écrasent mutuellement par index.
- Les valeurs de addActions/removeActions ne sont jamais vidées après application.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_actionModule.afterTrigger()` | Appelé par le manager après le tick du graphe. Si des changements ont eu lieu, recalcule la liste des actions bloquées et l'envoie à core_input_actionFilter (setGroup puis addAction(0, groupe, true)). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_actionModule.allowActions(id)` | Marque les actions de la liste enregistrée comme à autoriser de nouveau (appliqué dans afterTrigger). (assignée dynamiquement) | dyn |
| `flowgraph_modules_actionModule.blockActions(id)` | Marque les actions de la liste enregistrée comme à bloquer (appliqué dans afterTrigger). (assignée dynamiquement) | dyn |
| `flowgraph_modules_actionModule.clear()` | Réinitialise les tables storedActions, actionsByName, addActions, removeActions et lists. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_actionModule.executionStarted()` | Appelé au démarrage du projet : mémorise gameplay_walk.isTogglingEnabled(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_actionModule.executionStopped()` | Appelé à l'arrêt du projet : désactive le groupe de filtre et restaure la permission de basculer en mode marche mémorisée au démarrage. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_actionModule.getFreeId()` | Incrémente et renvoie un identifiant unique pour enregistrer une liste d'actions. (assignée dynamiquement) | dyn |
| `flowgraph_modules_actionModule.init()` | Appelé à la création du module : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_actionModule.registerList(list)` | Enregistre une liste de noms d'actions et renvoie son identifiant, utilisable ensuite avec blockActions/allowActions. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_actionModule.allowActions(id)`

Marque les actions de la liste enregistrée comme à autoriser de nouveau (appliqué dans afterTrigger). (assignée dynamiquement)

- `id` (*integer*) : identifiant renvoyé par registerList

#### `flowgraph_modules_actionModule.blockActions(id)`

Marque les actions de la liste enregistrée comme à bloquer (appliqué dans afterTrigger). (assignée dynamiquement)

- `id` (*integer*) : identifiant renvoyé par registerList

#### `flowgraph_modules_actionModule.getFreeId()`

Incrémente et renvoie un identifiant unique pour enregistrer une liste d'actions. (assignée dynamiquement)

- **renvoie** : integer nouvel identifiant

#### `flowgraph_modules_actionModule.registerList(list)`

Enregistre une liste de noms d'actions et renvoie son identifiant, utilisable ensuite avec blockActions/allowActions. (assignée dynamiquement)

- `list` (*string[]*) : noms d'actions d'entrée
- **renvoie** : integer identifiant de la liste

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` |  | 44 |
| `C:allowActions(id)` |  | 37 |
| `C:blockActions(id)` |  | 30 |
| `C:clear()` |  | 16 |
| `C:executionStarted()` |  | 71 |
| `C:executionStopped()` |  | 62 |
| `C:getFreeId()` |  | 7 |
| `C:init()` |  | 12 |
| `C:registerList(list)` |  | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/actionModule.lua`.*
