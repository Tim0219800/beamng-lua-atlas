# `gameplay_rally_loop_penalties`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/penalties.lua` · VM : Game Engine (GE) · 114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_penalties` : `extensions.load("gameplay_rally_loop_penalties")`, puis la globale `gameplay_rally_loop_penalties`

Calcul des pénalités de contrôle horaire (time control) d'une boucle de rallye : arrivée en avance, en retard, faux départ. Le temps est comparé à la minute près (arrivée dans la même minute que l'heure prévue = à l'heure). Chaque minute d'écart coûte 10 s.

## Exemple

```lua
local r = gameplay_rally_loop_penalties.getTimingStatus(actualEpoch, scheduledEpoch)
if r.hasPenalty then print(r.status, r.totalPenalty) end
```

## Remarques

- Les temps passés à getTimingStatus sont des temps epoch en secondes ; la comparaison se fait sur math.floor(t/60).
- Si scheduledTime ou actualTime est nil, le résultat est 'on-time' sans pénalité.
- Les commentaires parlent de 'minute ou fraction de minute', mais le code compte les minutes calendaires d'écart (différence des minutes entières), pas la durée réelle.
- calculateFalseStartPenalty ignore son argument et renvoie toujours falseStartPenaltySeconds.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly)` | Pénalité d'une arrivée en avance : minutesEarly multiplié par timeControlPenaltySecondsPerMinute. | 14 |
| `gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount)` | Pénalité de faux départ ; constante, indépendante du nombre de faux départs. | 26 |
| `gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate)` | Pénalité d'une arrivée en retard : minutesLate multiplié par timeControlPenaltySecondsPerMinute. | 22 |
| `gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime)` | Détermine si l'arrivée à un point de contrôle est en avance, à l'heure ou en retard, et calcule la pénalité associée. | 38 |

### Détail des paramètres

#### `gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly)`

Pénalité d'une arrivée en avance : minutesEarly multiplié par timeControlPenaltySecondsPerMinute.

- `minutesEarly` (*number*) : Nombre de minutes d'avance.
- **renvoie** : number Pénalité en secondes.

#### `gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount)`

Pénalité de faux départ ; constante, indépendante du nombre de faux départs.

- `falseStartCount` (*integer*) : Nombre de faux départs (ignoré).
- **renvoie** : number falseStartPenaltySeconds.

#### `gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate)`

Pénalité d'une arrivée en retard : minutesLate multiplié par timeControlPenaltySecondsPerMinute.

- `minutesLate` (*number*) : Nombre de minutes de retard.
- **renvoie** : number Pénalité en secondes.

#### `gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime)`

Détermine si l'arrivée à un point de contrôle est en avance, à l'heure ou en retard, et calcule la pénalité associée.

- `actualTime` (*number|nil*) : Heure d'arrivée réelle, epoch en secondes.
- `scheduledTime` (*number|nil*) : Heure prévue, epoch en secondes (peut être nil).
- **renvoie** : table {status = 'early'|'on-time'|'late', totalPenalty, hasPenalty, penalties}. Chaque élément de penalties : {type = 'time_control_early'|'time_control_late', amount, data = {minutesEarly|minutesLate, actualMinute, scheduledMinute}} pour l'i18n.

## Champs

| Champ | Type | Description |
|---|---|---|
| `falseStartPenaltySeconds` | number | Pénalité de faux départ en secondes (10). |
| `timeControlPenaltySecondsPerMinute` | number | Pénalité en secondes par minute d'avance ou de retard (10). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/penalties.lua`.*
