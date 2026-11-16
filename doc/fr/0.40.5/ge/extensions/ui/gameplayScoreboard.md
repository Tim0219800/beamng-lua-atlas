# `ui_gameplayScoreboard`

*Fichier : `lua/ge/extensions/ui/gameplayScoreboard.lua` · VM : Game Engine (GE) · 172 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplayScoreboard` : `extensions.load("ui_gameplayScoreboard")`, puis la globale `ui_gameplayScoreboard`

Couche de données de tableau des scores, indépendante de la source (écran partagé local ou réseau multijoueur). Garde l'état des joueurs (nom, couleur, scores, statut, rang) et le pousse à l'UI par le stream « scoreboard » (guihooks.queueStream). Le tri se fait selon le style (orderBy.key, direction asc/desc), les joueurs « disqualified » passant après les autres ; les ex-aequo partagent le rang.

## Exemple

```lua
ui_gameplayScoreboard.startNewScoreboard({entries={{key='score', name='Score', order=1, type='points'}}, orderBy={key='score', direction='desc'}})
ui_gameplayScoreboard.ensurePlayer('p1', 'Alice', {1,0,0,1}, 1)
ui_gameplayScoreboard.updatePlayerScores('p1', {score = 10})
```

## Remarques

- Il faut appeler startNewScoreboard pour activer le tableau : updatePlayerScores, updatePlayerStatus et pulsePlayerColor ne font rien tant que active est faux (et après clear).
- Style par défaut : une colonne « score » (type points), tri décroissant sur score.
- Un score absent vaut 0 ; à égalité, l'ordre suit playerIndex.
- setPlayerName ne pousse pas à l'UI (pas de pushToUI) : le nom n'apparaît qu'au prochain push.
- clear() remet le style par défaut, désactive le tableau et pousse un état vide à l'UI.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplayScoreboard.clear()` | Vide les joueurs, remet le style par défaut, désactive le tableau et pousse l'état vide à l'UI. | 86 |
| `ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex)` | Crée le joueur s'il n'existe pas (nom par défaut = playerId, scores vides) ; sinon met à jour couleur, index et nom fournis (non nil). Ne pousse pas à l'UI. | 100 |
| `ui_gameplayScoreboard.getPlayers()` | Renvoie la table des joueurs (playerId -> {mpClientId, name, scores, status, color, playerIndex, rank}). | 147 |
| `ui_gameplayScoreboard.isActive()` | Indique si un tableau est actif (startNewScoreboard appelé et pas de clear depuis). | 96 |
| `ui_gameplayScoreboard.pulsePlayerColor(playerId, color)` | Déclenche une pulsation de couleur sur la ligne du joueur via guihooks.trigger('scoreboardPlayerPulseColor', {mpClientId, color}). Sans effet si inactif. | 137 |
| `ui_gameplayScoreboard.setLocalMPClientId(id)` | Indique à l'UI quel joueur est le client local (mpClientId) et pousse l'état. | 142 |
| `ui_gameplayScoreboard.setPlayerColor(playerId, color)` | Change la couleur d'un joueur (le crée au besoin) et pousse à l'UI. | 115 |
| `ui_gameplayScoreboard.setPlayerName(playerId, name)` | Change le nom d'un joueur (le crée au besoin). N'envoie pas de mise à jour à l'UI. | 110 |
| `ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle)` | Réinitialise (clear), active le tableau avec le style donné et pousse l'état à l'UI. | 152 |
| `ui_gameplayScoreboard.updatePlayerScores(playerId, scores)` | Fusionne les valeurs données dans les scores du joueur (clé par clé) et pousse à l'UI. Sans effet si le tableau n'est pas actif. | 121 |
| `ui_gameplayScoreboard.updatePlayerStatus(playerId, status)` | Définit le statut d'un joueur (ex. "disqualified" le classe en dernier) et pousse à l'UI. Sans effet si inactif. | 130 |

### Détail des paramètres

#### `ui_gameplayScoreboard.ensurePlayer(playerId, name, color, playerIndex)`

Crée le joueur s'il n'existe pas (nom par défaut = playerId, scores vides) ; sinon met à jour couleur, index et nom fournis (non nil). Ne pousse pas à l'UI.

- `playerId` (*string*) : Identifiant du joueur (stocké aussi dans mpClientId).
- `name` (*string|nil*) : Nom affiché.
- `color` (*any*) : Couleur du joueur (format transmis tel quel à l'UI).
- `playerIndex` (*integer|nil*) : Index du joueur, sert de départage au tri.

#### `ui_gameplayScoreboard.getPlayers()`

Renvoie la table des joueurs (playerId -> {mpClientId, name, scores, status, color, playerIndex, rank}).

- **renvoie** : table<string, table> Table interne des joueurs (non copiée).

#### `ui_gameplayScoreboard.isActive()`

Indique si un tableau est actif (startNewScoreboard appelé et pas de clear depuis).

- **renvoie** : boolean true si actif.

#### `ui_gameplayScoreboard.pulsePlayerColor(playerId, color)`

Déclenche une pulsation de couleur sur la ligne du joueur via guihooks.trigger('scoreboardPlayerPulseColor', {mpClientId, color}). Sans effet si inactif.

- `playerId` (*string*) : Identifiant du joueur.
- `color` (*any*) : Couleur de la pulsation.

#### `ui_gameplayScoreboard.setLocalMPClientId(id)`

Indique à l'UI quel joueur est le client local (mpClientId) et pousse l'état.

- `id` (*string|nil*) : Identifiant du joueur local.

#### `ui_gameplayScoreboard.setPlayerColor(playerId, color)`

Change la couleur d'un joueur (le crée au besoin) et pousse à l'UI.

- `playerId` (*string*) : Identifiant du joueur.
- `color` (*any*) : Nouvelle couleur.

#### `ui_gameplayScoreboard.setPlayerName(playerId, name)`

Change le nom d'un joueur (le crée au besoin). N'envoie pas de mise à jour à l'UI.

- `playerId` (*string*) : Identifiant du joueur.
- `name` (*string*) : Nouveau nom.

#### `ui_gameplayScoreboard.startNewScoreboard(_scoreboardStyle)`

Réinitialise (clear), active le tableau avec le style donné et pousse l'état à l'UI.

- `_scoreboardStyle` (*table|nil*) : Définition du style : entries (liste {key, name, order, type}) et orderBy ({key, direction}). Défaut : style à une colonne score.

#### `ui_gameplayScoreboard.updatePlayerScores(playerId, scores)`

Fusionne les valeurs données dans les scores du joueur (clé par clé) et pousse à l'UI. Sans effet si le tableau n'est pas actif.

- `playerId` (*string*) : Identifiant du joueur.
- `scores` (*table<string, number>*) : Valeurs par clé de colonne (ex. {score = 10}).

#### `ui_gameplayScoreboard.updatePlayerStatus(playerId, status)`

Définit le statut d'un joueur (ex. "disqualified" le classe en dernier) et pousse à l'UI. Sans effet si inactif.

- `playerId` (*string*) : Identifiant du joueur.
- `status` (*string|nil*) : Statut ; seule la valeur "disqualified" est interprétée par le tri.

**Évènements UI (guihooks.trigger) :** `scoreboardPlayerPulseColor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplayScoreboard.lua`.*
