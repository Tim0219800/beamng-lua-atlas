# `gameplay_rally_loop_scheduleUtils`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_scheduleUtils` : `extensions.load("gameplay_rally_loop_scheduleUtils")`, puis la globale `gameplay_rally_loop_scheduleUtils`

Petites fonctions utilitaires de calcul d'horaires pour les boucles de rallye : arrondi à la minute supérieure, conversion de créneaux (slots) minutes vers secondes, calcul du prochain créneau, comparaison de temps avec tolérance. Tous les temps sont en secondes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute)` | Ajoute la durée du créneau au temps courant puis, par défaut, arrondit à la minute supérieure. | 27 |
| `gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance)` | Teste si newTime est strictement supérieur à currentTime + tolérance. | 45 |
| `gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs)` | Arrondit un temps à la minute supérieure : ceil(t / 60) * 60. | 11 |
| `gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes)` | Convertit une taille de créneau de minutes en secondes (1 minute par défaut si nil). | 18 |

### Détail des paramètres

#### `gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute)`

Ajoute la durée du créneau au temps courant puis, par défaut, arrondit à la minute supérieure.

- `currentTime` (*number*) : Temps courant en secondes.
- `slotSizeMinutes` (*number|nil*) : Taille du créneau en minutes (défaut 1).
- `roundToMinute` (*boolean|nil*) : true par défaut ; false pour ne pas arrondir.
- **renvoie** : number Prochain créneau en secondes.

#### `gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance)`

Teste si newTime est strictement supérieur à currentTime + tolérance.

- `newTime` (*number*) : Temps à tester.
- `currentTime` (*number*) : Temps de référence.
- `tolerance` (*number|nil*) : Tolérance en secondes (défaut 0).
- **renvoie** : boolean true si newTime > currentTime + tolerance.

#### `gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs)`

Arrondit un temps à la minute supérieure : ceil(t / 60) * 60.

- `timeSecs` (*number*) : Temps en secondes.
- **renvoie** : number Temps arrondi, en secondes.

#### `gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes)`

Convertit une taille de créneau de minutes en secondes (1 minute par défaut si nil).

- `slotSizeMinutes` (*number|nil*) : Taille du créneau en minutes.
- **renvoie** : number Secondes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua`.*
