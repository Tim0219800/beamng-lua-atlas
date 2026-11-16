# `libs_copas_copas_limit`

*Fichier : `lua/common/libs/copas/copas/limit.lua` · VM : Commun (GE + véhicule) · 137 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/limit")`

Sous-module de la bibliothèque tierce Copas : limite le nombre de tâches exécutées simultanément. Chaque tâche ajoutée est planifiée tout de suite s'il y a de la place (sinon mise en file) ; wait permet d'attendre la fin de toutes. Le module renvoie { new = new }.

## Exemple

```lua
local limit = require("libs/copas/copas/limit")
local r = limit.new(5)
r:addthread(function(url) --[[ ... ]] end, "http://...")
r:wait()
```

## Remarques

- L'objet renvoyé par new a les méthodes addthread(task, ...), removethread(coro), next() et wait() ; addthread renvoie la coroutine, et relance l'erreur d'une tâche qui échoue.
- Valeur par défaut de maxt : 99999.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_limit.new(maxt)` | Crée un exécuteur de tâches avec au plus maxt tâches simultanées. | 121 |

### Détail des paramètres

#### `libs_copas_copas_limit.new(maxt)`

Crée un exécuteur de tâches avec au plus maxt tâches simultanées.

- `maxt` (*integer|nil*) : Maximum de tâches simultanées (défaut 99999)
- **renvoie** : table Exécuteur avec addthread, removethread, next, wait

## Classe `ll`

Liste chaînée interne servant de file d'attente des tâches.

| Méthode | Description | Ligne |
|---|---|---|
| `ll.new()` | Crée une liste vide. | 57 |
| `ll:pop()` | Retire et renvoie le premier élément (nil si vide). | 28 |
| `ll:push(item)` | Ajoute un élément en fin de liste. | 20 |
| `ll:remove(item)` | Retire un élément donné de la liste. | 41 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/limit.lua`.*
