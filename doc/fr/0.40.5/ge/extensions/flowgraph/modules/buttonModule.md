# `flowgraph_modules_buttonModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/buttonModule.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/buttonModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 0) qui gère des boutons personnalisés affichés dans l'interface pendant un projet flowgraph. Chaque bouton a un label, un style, un état actif, un ordre, et des variables clicked/complete stockées dans un variableStorage. Dans afterTrigger, la liste des boutons actifs, triée par ordre puis id, est envoyée à l'UI via guihooks.trigger('CustomFGButtons', data). Le clic revient par une commande Lua qui appelle buttonClicked.

## Remarques

- La variable 'clicked' est remise à false à chaque afterTrigger : elle n'est vraie que pendant un tick.
- La liste n'est renvoyée à l'UI que si buttonsChanged est vrai (ajout ou set).
- Le module est appelé 'button' dans mgr.modules (cf. getCmd).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_buttonModule.addButton(data)` | Ajoute un bouton et renvoie son id. (assignée dynamiquement) | dyn |
| `flowgraph_modules_buttonModule.afterTrigger()` | Appelé après le tick du graphe : finalise les variables, envoie les boutons actifs triés à l'UI si modifiés, puis remet clicked à false. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_buttonModule.buttonClicked(id)` | Appelé quand l'UI signale un clic : met clicked et complete à true. (assignée dynamiquement) | dyn |
| `flowgraph_modules_buttonModule.clear()` | Vide variables et boutons, remet le compteur d'ids à 0 et envoie une liste vide à l'UI (CustomFGButtons). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_buttonModule.executionStopped()` | Appelé à l'arrêt du projet : appelle clear() (les boutons disparaissent de l'UI). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_buttonModule.getButton(id)` | Renvoie la table du bouton (champs de type variable : label, style, active, order, clicked, complete). (assignée dynamiquement) | dyn |
| `flowgraph_modules_buttonModule.getCmd(id)` | Construit la chaîne de commande Lua exécutée par l'UI au clic : récupère le module 'button' du manager et appelle buttonClicked(id). (assignée dynamiquement) | dyn |
| `flowgraph_modules_buttonModule.getFreeId()` | Incrémente et renvoie un id de bouton. (assignée dynamiquement) | dyn |
| `flowgraph_modules_buttonModule.init()` | Crée le variableStorage et appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_buttonModule.set(id, field, val)` | Change un champ du bouton via le variableStorage (appliqué à la fin du tick) et marque la liste comme modifiée. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_buttonModule.addButton(data)`

Ajoute un bouton et renvoie son id. (assignée dynamiquement)

- `data` (*table*) : champs facultatifs label (défaut 'Button <id>'), style (défaut 'default'), active (défaut true), order (défaut id)
- **renvoie** : integer id du bouton

#### `flowgraph_modules_buttonModule.buttonClicked(id)`

Appelé quand l'UI signale un clic : met clicked et complete à true. (assignée dynamiquement)

- `id` (*integer*) : id du bouton

#### `flowgraph_modules_buttonModule.getButton(id)`

Renvoie la table du bouton (champs de type variable : label, style, active, order, clicked, complete). (assignée dynamiquement)

- `id` (*integer*) : id du bouton
- **renvoie** : table|nil bouton

#### `flowgraph_modules_buttonModule.getCmd(id)`

Construit la chaîne de commande Lua exécutée par l'UI au clic : récupère le module 'button' du manager et appelle buttonClicked(id). (assignée dynamiquement)

- `id` (*integer*) : id du bouton
- **renvoie** : string code Lua

#### `flowgraph_modules_buttonModule.getFreeId()`

Incrémente et renvoie un id de bouton. (assignée dynamiquement)

- **renvoie** : integer id

#### `flowgraph_modules_buttonModule.set(id, field, val)`

Change un champ du bouton via le variableStorage (appliqué à la fin du tick) et marque la liste comme modifiée. (assignée dynamiquement)

- `id` (*integer*) : id du bouton
- `field` (*string*) : label, style, active, order, clicked ou complete
- `val` (*any*) : nouvelle valeur

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addButton(data)` | adds a new Button. | 27 |
| `C:afterTrigger()` |  | 67 |
| `C:buttonClicked(id)` |  | 57 |
| `C:clear()` |  | 18 |
| `C:executionStopped()` |  | 93 |
| `C:getButton(id)` |  | 51 |
| `C:getCmd(id)` |  | 62 |
| `C:getFreeId()` |  | 8 |
| `C:init()` |  | 13 |
| `C:set(id, field, val)` |  | 55 |

**Évènements UI (guihooks.trigger) :** `CustomFGButtons`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/buttonModule.lua`.*
