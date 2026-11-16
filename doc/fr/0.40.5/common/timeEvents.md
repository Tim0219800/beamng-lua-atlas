# `timeEvents`

*Fichier : `lua/common/timeEvents.lua` · VM : Commun (GE + véhicule) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("timeEvents")`

Petit planificateur : permet de programmer l'exécution d'une fonction dans X secondes, à la manière de `schedule()`. On crée une liste d'événements avec require('timeEvents').create(), on y ajoute des événements, et on appelle process(dt) à chaque mise à jour.

## Exemple

```lua
local events = require('timeEvents').create()
events:addEvent(5, function() print('hello world!') end) -- dans 5 s
-- dans la boucle de mise à jour :
events:process(dtSim)
```

## Remarques

- La page extraite montre addEvent(fn) et process() sans argument, mais le code est addEvent(time, fn) et process(dt).
- process(dt) retranche dt au temps de chaque événement, parcourus du dernier ajouté au premier, et exécute puis supprime celui dont le temps devient STRICTEMENT inférieur à 0 (pas d'ordre garanti entre événements échus simultanément : ordre inverse d'ajout).
- Une erreur dans une fonction planifiée interrompt process (pas de pcall) et l'événement reste dans la liste.
- L'objet renvoyé par create() est lui-même le tableau des événements ({fn=, time=}) avec la metatable mt.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `timeEvents.create()` | Crée et renvoie une nouvelle liste d'événements temporels vide. | 46 |

### Détail des paramètres

#### `timeEvents.create()`

Crée et renvoie une nouvelle liste d'événements temporels vide.

- **renvoie** : table objet avec méthodes addEvent, clear, process

## Classe `mt`

Objet renvoyé par create(). Les événements sont stockés comme éléments du tableau.

| Méthode | Description | Ligne |
|---|---|---|
| `mt:addEvent(time, fn)` | Programme fn dans `time` secondes. | 27 |
| `mt:clear()` | Supprime tous les événements en attente. | 31 |
| `mt:process(dt)` | À appeler à chaque mise à jour : fait avancer les délais de dt et exécute les événements arrivés à échéance. | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/timeEvents.lua`.*
