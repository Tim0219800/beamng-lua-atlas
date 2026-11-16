# `libs_timerwheel_timerwheel`

*Fichier : `lua/common/libs/timerwheel/timerwheel.lua` · VM : Commun (GE + véhicule) · 305 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/timerwheel/timerwheel")`

Bibliothèque tierce timerwheel (roue de minuteries, issue de l'écosystème Kong/lua-resty) : minuteries de type timeout avec insertion, annulation et exécution en O(1), au prix d'une précision limitée (taille d'un créneau). Le module ne fournit pas de boucle : l'appelant doit appeler `wheel:step()` régulièrement (au moins toutes les `precision` secondes), par exemple depuis onUpdate.

## Exemple

```lua
local timerwheel = require('libs/timerwheel/timerwheel')
local wheel = timerwheel.new({precision = 0.05, now = function() return os.clock() end})
local id = wheel:set(2, function(arg) print('fini', arg) end, 'x')
-- chaque frame :
wheel:step()
wheel:cancel(id)
```

## Remarques

- Appeler `timerwheel.new(opts)` avec un point (pas `timerwheel:new`), sinon une assertion échoue.
- Sans option `now`, la fonction d'horloge par défaut est `ngx.now` ou `socket.gettime` si le module `socket` est chargeable ; sinon aucune horloge n'existe et `new` échoue sur « expected 'now' to be a function ». Dans le jeu, passer `now` explicitement est le plus sûr.
- Les callbacks sont exécutés dans un xpcall ; en cas d'erreur le gestionnaire par défaut écrit la pile sur stderr.
- Les identifiants de minuteries sont des entiers négatifs uniques.
- Un `set` avec un délai déjà écoulé s'exécute au prochain `step` (la position ne peut pas être dans le passé). Un callback qui crée un nouveau timer ne le voit pas exécuté dans le même créneau.
- `wheel:peek` parcourt la roue : opération O(n).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_timerwheel_timerwheel.new(opts)` | Crée une roue de minuteries et renvoie l'objet `wheel` (méthodes step, count, set, cancel, peek). Valide les options par assertions. | 59 |

### Détail des paramètres

#### `libs_timerwheel_timerwheel.new(opts)`

Crée une roue de minuteries et renvoie l'objet `wheel` (méthodes step, count, set, cancel, peek). Valide les options par assertions.

- `opts` (*table|nil*) : Options : precision (secondes par créneau, défaut 0.050), ringsize (créneaux par anneau, entier > 0, défaut 72000 = 1 h), now (fonction renvoyant l'heure en secondes), err_handler (gestionnaire d'erreur du xpcall).
- **renvoie** : table Objet roue.

## Classe `wheel`

Objet renvoyé par new(opts). Les méthodes s'appellent avec les deux-points.

| Méthode | Description | Ligne |
|---|---|---|
| `wheel:cancel(id)` | Annule une minuterie. | dyn |
| `wheel:count()` | Nombre de minuteries en attente. | dyn |
| `wheel:peek(max_ahead)` | Cherche la prochaine minuterie à échoir (parcours O(n)). | dyn |
| `wheel:set(expire_in, cb, arg)` | Programme une minuterie qui appellera cb(arg) dans `expire_in` secondes. Lève une erreur si `cb` est nil. | dyn |
| `wheel:step()` | Vérifie et exécute les minuteries échues. À appeler régulièrement par votre boucle (au moins toutes les `precision` secondes). | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/timerwheel/timerwheel.lua`.*
