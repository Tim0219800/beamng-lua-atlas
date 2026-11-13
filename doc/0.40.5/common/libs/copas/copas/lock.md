# `libs_copas_copas_lock`

*Fichier : `lua/common/libs/copas/copas/lock.lua` · VM : Commun (GE + véhicule) · 194 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/lock")`

Sous-module de la bibliothèque tierce Copas : verrou (mutex) entre coroutines Copas. Une coroutine qui demande un verrou déjà pris cède la main jusqu'à ce qu'il soit libéré ou que le délai expire. Par défaut le verrou est ré-entrant et le délai de 10 s. Le module renvoie la table lock.

## Exemple

```lua
local lock = require("libs/copas/copas/lock").new(5)
local ok, err = lock:get()
-- section critique
lock:release()
```

## Remarques

- get renvoie le temps d'attente en cas de succès, ou nil, erreur, temps d'attente avec l'erreur parmi "timeout", "destroyed", "lock is not re-entrant".
- release renvoie nil + « cannot release a lock not owned » si la coroutine courante n'est pas propriétaire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_lock.get(self, timeout)` | Acquiert le verrou ; cède la main tant qu'une autre coroutine le possède. Avec timeout = 0, retourne immédiatement sans céder. | 99 |
| `libs_copas_copas_lock.new(seconds, not_reentrant)` | Crée un verrou. | 19 |
| `libs_copas_copas_lock.release(self)` | Libère le verrou détenu par la coroutine courante. | 153 |

### Détail des paramètres

#### `libs_copas_copas_lock.get(self, timeout)`

Acquiert le verrou ; cède la main tant qu'une autre coroutine le possède. Avec timeout = 0, retourne immédiatement sans céder.

- `self` (*table*) : Le verrou (appel lock:get)
- `timeout` (*number|nil*) : Délai en secondes, prioritaire sur celui de new
- **renvoie** : number|nil Temps d'attente en cas de succès, sinon nil
- **renvoie** : string|nil Erreur : timeout, destroyed ou lock is not re-entrant
- **renvoie** : number|nil Temps d'attente en cas d'échec

#### `libs_copas_copas_lock.new(seconds, not_reentrant)`

Crée un verrou.

- `seconds` (*number|nil*) : Délai par défaut d'acquisition en secondes (défaut 10)
- `not_reentrant` (*boolean|nil*) : Si vrai, une coroutine ne peut pas reprendre un verrou qu'elle possède déjà
- **renvoie** : table Le verrou

#### `libs_copas_copas_lock.release(self)`

Libère le verrou détenu par la coroutine courante.

- `self` (*table*) : Le verrou (appel lock:release)
- **renvoie** : boolean|nil true si libéré
- **renvoie** : string|nil Message d'erreur

## Champs

| Champ | Type | Description |
|---|---|---|
| `__index` | table | Métatable des objets verrou (lock lui-même). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/lock.lua`.*
