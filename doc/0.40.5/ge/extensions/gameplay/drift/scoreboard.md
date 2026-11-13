# `gameplay_drift_scoreboard`

*Fichier : `lua/ge/extensions/gameplay/drift/scoreboard.lua` · VM : Game Engine (GE) · 230 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_scoreboard` : `extensions.load("gameplay_drift_scoreboard")`, puis la globale `gameplay_drift_scoreboard`

Accumule les statistiques d'un défi de drift pour l'écran de fin : score et nombre de drifts par palier (tier), messages rapides obtenus (quick messages) et statistiques de performance (vitesse, angle, facteur de performance moyens, distance, durée, combo max). Les stats se remettent à zéro au premier onUpdate et via reset(). Fournit aussi une petite fenêtre imgui de debug.

## Remarques

- Les hooks de score ignorent les évènements quand le drift général est en pause ou gelé (gameplay_drift_general.getPaused/getFrozen).
- Le score des quick messages est soustrait du score du palier (multiplié par le combo) pour ne pas être compté deux fois.
- getPerformanceStats divise par des compteurs qui valent 0 avant le premier drift : les moyennes donnent alors NaN ; et table.sort sur la table compiledStats (clés texte) ne trie rien, l'ordre est porté par le champ order.
- La vitesse moyenne est convertie de km/h vers m/s (/3.6) avant translateVelocity ; la distance passe par translateDistance.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_scoreboard.getDriftDebugInfo()` | Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift. | 119 |
| `gameplay_drift_scoreboard.getDriftEventStats()` | Renvoie les stats par quick message. | 198 |
| `gameplay_drift_scoreboard.getPerformanceStats()` | Compile à la demande les statistiques de performance (moyennes calculées à l'appel, pas à chaque frame), formatées pour l'UI et traduites (missions.drift.stats.<nom>). | 148 |
| `gameplay_drift_scoreboard.getTiersStats()` | Renvoie les stats par palier. | 194 |
| `gameplay_drift_scoreboard.onDriftActiveDataFinished(data)` | Hook : à la fin d'un drift individuel, cumule vitesses, facteurs de performance, angles, durée et distance dans les stats brutes. *(interne)* *(hook)* | 87 |
| `gameplay_drift_scoreboard.onDriftCompletedScored(data)` | Hook : valide les quick messages en attente, met à jour le combo max et ajoute le score (hors quick messages) et le compte au palier du drift. *(interne)* *(hook)* | 68 |
| `gameplay_drift_scoreboard.onDriftCrash()` | Hook : un crash annule les quick messages en attente. *(interne)* *(hook)* | 206 |
| `gameplay_drift_scoreboard.onDriftQuickMessageReached(data)` | Hook : met en attente un quick message atteint (compteur et récompense) ; il n'est validé qu'à la fin du drift scoré. *(interne)* *(hook)* | 53 |
| `gameplay_drift_scoreboard.onDriftSpinout()` | Hook : un spinout annule les quick messages en attente. *(interne)* *(hook)* | 210 |
| `gameplay_drift_scoreboard.onUpdate()` | Appelé à chaque frame : au premier appel fait reset(), puis affiche la fenêtre de debug imgui si activée. *(interne)* *(hook)* | 44 |
| `gameplay_drift_scoreboard.reset()` | Remet à zéro les stats de performance, recrée les entrées de paliers (depuis gameplay_drift_scoring.getDriftTiers) et de quick messages (depuis gameplay_drift_quickMessages.getQuickMessages). | 104 |

### Détail des paramètres

#### `gameplay_drift_scoreboard.getDriftDebugInfo()`

Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = false, canBeChanged = true}

#### `gameplay_drift_scoreboard.getDriftEventStats()`

Renvoie les stats par quick message.

- **renvoie** : table<string, {count:integer, totalScoreEarned:number, msg:string}> Indexé par id de quick message.

#### `gameplay_drift_scoreboard.getPerformanceStats()`

Compile à la demande les statistiques de performance (moyennes calculées à l'appel, pas à chaque frame), formatées pour l'UI et traduites (missions.drift.stats.<nom>).

- **renvoie** : table<string, {order:integer, value:string|number, name:string}> Clés : avrgDriftPerformanceFactor, avrgDriftSpeed, avrgDriftAngle, maxDriftAngle, maxDriftCombo, totalDriftDist, totalIndividualDrifts, totalDriftDuration.

#### `gameplay_drift_scoreboard.getTiersStats()`

Renvoie les stats par palier.

- **renvoie** : table<string, {totalScore:number, count:integer, name:string, order:integer}> Indexé par id de palier.

#### `gameplay_drift_scoreboard.onDriftActiveDataFinished(data)`

Hook : à la fin d'un drift individuel, cumule vitesses, facteurs de performance, angles, durée et distance dans les stats brutes.

- `data` (*table*) : {totalSpeeds, totalSteps, totalPerformanceFactors, totalAngles, totalDriftTime, driftDistance}.

#### `gameplay_drift_scoreboard.onDriftCompletedScored(data)`

Hook : valide les quick messages en attente, met à jour le combo max et ajoute le score (hors quick messages) et le compte au palier du drift.

- `data` (*table*) : {combo, tier = {id}, addedScore}.

#### `gameplay_drift_scoreboard.onDriftQuickMessageReached(data)`

Hook : met en attente un quick message atteint (compteur et récompense) ; il n'est validé qu'à la fin du drift scoré.

- `data` (*table*) : {quickMessageId, reward}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/scoreboard.lua`.*
