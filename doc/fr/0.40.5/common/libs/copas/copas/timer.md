# `libs_copas_copas_timer`

*Fichier : `lua/common/libs/copas/copas/timer.lua` · VM : Commun (GE + véhicule) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/timer")`

Sous-module de la bibliothèque tierce Copas : minuteries (ponctuelles ou récurrentes) exécutées dans le répartiteur Copas. timer.new arme immédiatement un timer qui appellera callback(timer_obj, params) après le délai. Le module renvoie la table timer.

## Exemple

```lua
local timer = require("libs/copas/copas/timer")
local t = timer.new({delay = 2, recurring = true, callback = function(self, p) print("tic") end})
t:cancel()
```

## Remarques

- new lève une erreur (assert) si delay < 0 ou si callback n'est pas une fonction.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_timer.cancel(self)` | Annule un timer actif (retire sa coroutine du répartiteur). | 49 |
| `libs_copas_copas_timer.new(opts)` | Crée et arme un timer. | 72 |

### Détail des paramètres

#### `libs_copas_copas_timer.cancel(self)`

Annule un timer actif (retire sa coroutine du répartiteur).

- `self` (*table*) : Le timer (timer:cancel())
- **renvoie** : table|nil Le timer, ou nil + erreur si déjà annulé

#### `libs_copas_copas_timer.new(opts)`

Crée et arme un timer.

- `opts` (*table*) : {delay (s), callback, recurring?, params?, initial_delay? (défaut delay)}
- **renvoie** : table Objet timer

## Champs

| Champ | Type | Description |
|---|---|---|
| `__index` | table | Métatable des objets timer. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/timer.lua`.*
