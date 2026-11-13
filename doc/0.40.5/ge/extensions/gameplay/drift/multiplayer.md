# `gameplay_drift_multiplayer`

*Fichier : `lua/ge/extensions/gameplay/drift/multiplayer.lua` · VM : Game Engine (GE) · 88 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_multiplayer` : `extensions.load("gameplay_drift_multiplayer")`, puis la globale `gameplay_drift_multiplayer`

Pont entre le gameplay de drift et le tableau de scores multijoueur (multiplayer_multiplayerScoreboard). Quand un spot de drift démarre, crée un scoreboard avec les colonnes potentialScore, driftLevel et score ; ensuite pousse le score du joueur, son niveau de drift, son statut (finishLine / disqualified) et pulse en rouge lors d'un crash. Ne fait rien si multiplayer_multiplayerScoreboard n'existe pas.

## Remarques

- Les mises à jour de score ne sont envoyées que si le contexte drift est "inFreeroamChallenge".
- Le niveau de drift (driftLevel) est renvoyé à chaque frame seulement quand la valeur de gameplay_drift_scoring.getDriftPerformanceFactor() change.
- functionDriftSpotEnded (nom local mal formé) remet driftLevel à 0 et hasDriftSpotStarted à false ; scoreboardHandle n'est jamais remis à nil.

**Dépendances (chargées avant) :** `gameplay_drift_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_multiplayer.getDriftDebugInfo()` | Renvoie la table {default=false, canBeChanged=false} décrivant le réglage de debug de ce module (utilisée par la fenêtre de debug drift). | 59 |
| `gameplay_drift_multiplayer.onDriftCrash()` | Hook : crash pendant un défi, fait pulser la couleur du joueur en rouge dans le scoreboard. *(interne)* *(hook)* | 53 |
| `gameplay_drift_multiplayer.onDriftScoreChanged(data)` | Hook : pousse au scoreboard le score potentiel, le score et le niveau de drift courants, en contexte inFreeroamChallenge. *(interne)* *(hook)* | 18 |
| `gameplay_drift_multiplayer.onDriftSpotFailed()` | Hook : spot échoué, pousse le statut "disqualified" au scoreboard. *(interne)* *(hook)* | 46 |
| `gameplay_drift_multiplayer.onDriftSpotFinishLineCrossed()` | Hook : ligne d'arrivée franchie, pousse le statut "finishLine" au scoreboard. *(interne)* *(hook)* | 39 |
| `gameplay_drift_multiplayer.onDriftSpotStarted(data)` | Hook : à l'entrée dans un spot de drift, crée un nouveau scoreboard multijoueur trié par score décroissant. *(interne)* *(hook)* | 25 |
| `gameplay_drift_multiplayer.onUpdate()` | Appelé à chaque frame : envoie le niveau de drift au scoreboard s'il a changé depuis la dernière frame. *(interne)* *(hook)* | 72 |

### Détail des paramètres

#### `gameplay_drift_multiplayer.getDriftDebugInfo()`

Renvoie la table {default=false, canBeChanged=false} décrivant le réglage de debug de ce module (utilisée par la fenêtre de debug drift).

- **renvoie** : table {default = false, canBeChanged = false}

#### `gameplay_drift_multiplayer.onDriftScoreChanged(data)`

Hook : pousse au scoreboard le score potentiel, le score et le niveau de drift courants, en contexte inFreeroamChallenge.

- `data` (*table*) : Données du changement de score (inutilisées ici : le score est relu via gameplay_drift_scoring.getScore()).

#### `gameplay_drift_multiplayer.onDriftSpotStarted(data)`

Hook : à l'entrée dans un spot de drift, crée un nouveau scoreboard multijoueur trié par score décroissant.

- `data` (*table*) : Contient lineId, passé à startNewScoreboard.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, chargé avant. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/multiplayer.lua`.*
