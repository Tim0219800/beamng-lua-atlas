# `libs_copas_copas_semaphore`

*Fichier : `lua/common/libs/copas/copas/semaphore.lua` · VM : Commun (GE + véhicule) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/semaphore")`

Sous-module de la bibliothèque tierce Copas : sémaphore à compteur pour coroutines Copas. take demande des ressources (et attend si elles manquent), give en rend. Le module renvoie la table semaphore.

## Exemple

```lua
local sem = require("libs/copas/copas/semaphore").new(3, 3, 5)
sem:take()
-- travail limité à 3 coroutines en parallèle
sem:give()
```

## Remarques

- new lève une erreur si max < 1 ou si le timeout est négatif ; le timeout par défaut est de 10 s ; start vaut 0 par défaut.
- give plafonne à max et renvoie l'erreur « too many » en cas de dépassement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_semaphore.get_count(self)` | Nombre de ressources actuellement disponibles. | 154 |
| `libs_copas_copas_semaphore.get_wait(self)` | Manque total de ressources demandées par les coroutines en attente. | 159 |
| `libs_copas_copas_semaphore.give(self, given)` | Rend des ressources au sémaphore (et réveille les coroutines en attente). | 44 |
| `libs_copas_copas_semaphore.new(max, start, seconds)` | Crée un sémaphore. | 17 |
| `libs_copas_copas_semaphore.take(self, requested, timeout)` | Demande des ressources ; attend (en cédant la main) tant qu'il n'y en a pas assez. Avec timeout = 0, réussit ou échoue tout de suite avec « timeout ». | 111 |

### Détail des paramètres

#### `libs_copas_copas_semaphore.get_count(self)`

Nombre de ressources actuellement disponibles.

- `self` (*table*) : Le sémaphore
- **renvoie** : integer Compteur

#### `libs_copas_copas_semaphore.get_wait(self)`

Manque total de ressources demandées par les coroutines en attente.

- `self` (*table*) : Le sémaphore
- **renvoie** : integer Déficit total

#### `libs_copas_copas_semaphore.give(self, given)`

Rend des ressources au sémaphore (et réveille les coroutines en attente).

- `self` (*table*) : Le sémaphore
- `given` (*integer|nil*) : Nombre de ressources (défaut 1)
- **renvoie** : boolean|nil true en cas de succès
- **renvoie** : string|nil "too many" si le maximum est dépassé (le compteur est plafonné)

#### `libs_copas_copas_semaphore.new(max, start, seconds)`

Crée un sémaphore.

- `max` (*integer*) : Nombre maximal de ressources (doit être supérieur à 0)
- `start` (*integer|nil*) : Ressources disponibles au départ (défaut 0)
- `seconds` (*number|nil*) : Timeout par défaut en secondes (défaut 10)
- **renvoie** : table Le sémaphore

#### `libs_copas_copas_semaphore.take(self, requested, timeout)`

Demande des ressources ; attend (en cédant la main) tant qu'il n'y en a pas assez. Avec timeout = 0, réussit ou échoue tout de suite avec « timeout ».

- `self` (*table*) : Le sémaphore
- `requested` (*integer|nil*) : Nombre demandé (défaut 1)
- `timeout` (*number|nil*) : Délai en secondes (défaut : celui du sémaphore)
- **renvoie** : boolean|nil true en cas de succès
- **renvoie** : string|nil Erreur, ex. "timeout"

## Champs

| Champ | Type | Description |
|---|---|---|
| `__index` | table | Métatable des objets sémaphore. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/semaphore.lua`.*
