# `delayLine`

*Fichier : `lua/common/delayLine.lua` · VM : Commun (GE + véhicule) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("delayLine")`

Ligne à retard générique : chaque paquet de données poussé dans la ligne ressort après le même délai. Créée à l'origine pour simuler le temps que met le carburant imbrûlé à parcourir l'échappement avant de brûler. Il faut interroger la ligne régulièrement (pop/popSum) avec le pas de temps pour récupérer ce qui est arrivé au bout.

## Exemple

```lua
local dl = require('delayLine').new(0.2)  -- délai 0,2 s
dl:push(5)
-- à chaque frame :
local sum = dl:popSum(dt)
```

## Remarques

- Le temps interne (currentTime) n'avance que dans pop et popSum, pas dans peek.
- pop renvoie nil si la ligne est vide, sinon un tableau (éventuellement vide). popSum renvoie 0 si vide ; elle suppose des données numériques.
- Les paquets sortent dans l'ordre d'entrée (délai identique pour tous).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `delayLine.new(delay)` | Crée une ligne à retard. | 92 |

### Détail des paramètres

#### `delayLine.new(delay)`

Crée une ligne à retard.

- `delay` (*number*) : Délai en secondes appliqué à chaque paquet.
- **renvoie** : table Objet avec les méthodes push, peek, pop, popSum, reset.

## Classe `delayLine`

Objet renvoyé par new(delay). Champs : delay, length, currentTime, data, times.

| Méthode | Description | Ligne |
|---|---|---|
| `delayLine:peek(dt)` | Renvoie, sans les retirer ni avancer le temps, les paquets qui seraient arrivés dans dt secondes. | dyn |
| `delayLine:pop(dt)` | Fait avancer le temps de dt, retire et renvoie tous les paquets arrivés à échéance. | dyn |
| `delayLine:popSum(dt)` | Comme pop mais renvoie la somme (numérique) des paquets arrivés. | dyn |
| `delayLine:push(payload)` | Insère un paquet de données ; il sortira à currentTime + delay. | dyn |
| `delayLine:reset()` | Vide la ligne et remet le temps interne à 0. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/delayLine.lua`.*
