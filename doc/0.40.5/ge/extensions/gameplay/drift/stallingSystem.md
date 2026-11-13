# `gameplay_drift_stallingSystem`

*Fichier : `lua/ge/extensions/gameplay/drift/stallingSystem.lua` · VM : Game Engine (GE) · 186 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_stallingSystem` : `extensions.load("gameplay_drift_stallingSystem")`, puis la globale `gameplay_drift_stallingSystem`

Système anti-répétition du mode défi « Gymkhana » : il garde l'historique des figures (drifts normaux et zones de cascade) et calcule un multiplicateur (stallingValue, entre 0.5 et 1) qui réduit le score quand le joueur répète la même figure. Chargé par gameplay_drift_general quand le mode de défi est "Gymkhana". Contient aussi une fenêtre imgui de debug.

## Remarques

- Réglages : minStallingValue 0.5, maxStallingValue 1, historique pris en compte = 10 dernières figures. Drift normal (stuntId 0) : +0.35 si changement de figure, -0.15 au-delà de 5 répétitions. Zone de cascade : +1, -0.6 au-delà de 1 répétition.
- Le multiplicateur reste à 1 tant que l'historique contient moins de 2 entrées ou moins de 2 figures différentes.
- Le multiplicateur vaut score/maxPossibleScore borné ; si maxPossibleScore reste à 0 la division donne NaN/inf avant le bornage (math.max/min).
- La variable stuntZonesCount est remise à -1 mais n'est jamais utilisée ailleurs (code mort).

**Dépendances (chargées avant) :** `gameplay_drift_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_stallingSystem.calculateScore(score)` | Applique le multiplicateur de stalling à un score. | 118 |
| `gameplay_drift_stallingSystem.getDriftDebugInfo()` | Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift. | 173 |
| `gameplay_drift_stallingSystem.onDriftStatusChanged(isDrifting)` | Hook : quand le joueur commence à drifter, ajoute un drift (stuntId 0) à l'historique et recalcule le multiplicateur. *(interne)* *(hook)* | 132 |
| `gameplay_drift_stallingSystem.onUpdate()` | Appelé à chaque frame : affiche la fenêtre de debug « Drift stalling system » si activée. *(interne)* *(hook)* | 169 |
| `gameplay_drift_stallingSystem.processStuntZone(stuntZoneId)` | Ajoute une zone de cascade à l'historique (type "stuntZone") et recalcule le multiplicateur. | 122 |
| `gameplay_drift_stallingSystem.reset()` | Vide l'historique et remet le multiplicateur à 1. | 40 |

### Détail des paramètres

#### `gameplay_drift_stallingSystem.calculateScore(score)`

Applique le multiplicateur de stalling à un score.

- `score` (*number*) : Score brut.
- **renvoie** : number score * stallingValue.

#### `gameplay_drift_stallingSystem.getDriftDebugInfo()`

Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = true, canBeChanged = true}

#### `gameplay_drift_stallingSystem.onDriftStatusChanged(isDrifting)`

Hook : quand le joueur commence à drifter, ajoute un drift (stuntId 0) à l'historique et recalcule le multiplicateur.

- `isDrifting` (*boolean*) : true au début d'un drift.

#### `gameplay_drift_stallingSystem.processStuntZone(stuntZoneId)`

Ajoute une zone de cascade à l'historique (type "stuntZone") et recalcule le multiplicateur.

- `stuntZoneId` (*integer*) : Identifiant de la zone ; une valeur différente de 0 la distingue des drifts normaux.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, chargé avant. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stallingSystem.lua`.*
