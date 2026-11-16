# `core_multiseatPlayerLimits`

*Fichier : `lua/ge/extensions/core/multiseatPlayerLimits.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_multiseatPlayerLimits` : `extensions.load("core_multiseatPlayerLimits")`, puis la globale `core_multiseatPlayerLimits`

Extension GE `core_multiseatPlayerLimits` : calcule les limites du nombre de joueurs en multi-joueur local (multiseat). Deux sources : la limite 'douce' (recommandation matériel ou niveau, champ multiseat.maxPlayers du info.json du niveau, 4 par défaut via core_levels) et la limite 'dure' du mode de jeu multiseat en cours (gameplay_multiseat_gamemodeManager). Elle renvoie un état prêt pour l'interface : limite, atteinte, dépassée, avertissement.

## Exemple

```lua
local s = core_multiseatPlayerLimits.getCurrentLevelState(3)
if s.atLimit then log('I','','plus de place : limite ' .. tostring(s.limit)) end
```

## Remarques

- normalizeLimit : une limite doit être un nombre >= 1, arrondi à l'entier inférieur ; sinon elle est ignorée (nil).
- La limite du mode (modeLimit) est toujours appliquée. La limite douce ne l'est que dans le menu simple (Engine.UI.isSimpleMenu()) ou si softIsHard est vrai ; sinon, dépasser la limite douce produit seulement un avertissement { txt = 'ui.multiseat.playerLimitWarning', context = { count = softLimit } }.
- Le module est un simple module de fonctions (pas de hooks) ; il est défini avec des `function M.xxx`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_multiseatPlayerLimits.getCurrentLevelLimit()` | Renvoie le nombre maximal de joueurs recommandé par le niveau courant (level.multiseat.maxPlayers). | 17 |
| `core_multiseatPlayerLimits.getCurrentLevelState(playerCount, softIsHard)` | Raccourci : getState avec la limite du niveau courant et la limite du mode courant. | 51 |
| `core_multiseatPlayerLimits.getCurrentModeLimit()` | Renvoie le nombre maximal de joueurs du mode de jeu multiseat actif (gameplay_multiseat_gamemodeManager.getMaxPlayers) : limite dure sur toutes les plateformes. | 24 |
| `core_multiseatPlayerLimits.getState(softLimit, playerCount, modeLimit, softIsHard)` | Calcule l'état des limites de joueurs. La limite effective est celle du mode, abaissée par la limite douce si softIsHard (ou menu simple), sinon la limite douce seule si aucune limite de mode. | 31 |
| `core_multiseatPlayerLimits.isSimpleMenu()` | Indique si l'interface est en mode de menu simplifié (plateformes console/Steam Deck, selon Engine.UI.isSimpleMenu). | 13 |

### Détail des paramètres

#### `core_multiseatPlayerLimits.getCurrentLevelLimit()`

Renvoie le nombre maximal de joueurs recommandé par le niveau courant (level.multiseat.maxPlayers).

- **renvoie** : integer|nil Limite, ou nil si aucun niveau ou valeur invalide.

#### `core_multiseatPlayerLimits.getCurrentLevelState(playerCount, softIsHard)`

Raccourci : getState avec la limite du niveau courant et la limite du mode courant.

- `playerCount` (*number*) : Nombre de joueurs actuel.
- `softIsHard` (*boolean|nil*) : Voir getState.
- **renvoie** : table Même structure que getState.

#### `core_multiseatPlayerLimits.getCurrentModeLimit()`

Renvoie le nombre maximal de joueurs du mode de jeu multiseat actif (gameplay_multiseat_gamemodeManager.getMaxPlayers) : limite dure sur toutes les plateformes.

- **renvoie** : integer|nil Limite, ou nil.

#### `core_multiseatPlayerLimits.getState(softLimit, playerCount, modeLimit, softIsHard)`

Calcule l'état des limites de joueurs. La limite effective est celle du mode, abaissée par la limite douce si softIsHard (ou menu simple), sinon la limite douce seule si aucune limite de mode.

- `softLimit` (*number|nil*) : Limite recommandée (matériel ou niveau).
- `playerCount` (*number*) : Nombre de joueurs actuel (négatif ou invalide devient 0).
- `modeLimit` (*number|nil*) : Limite du mode de jeu.
- `softIsHard` (*boolean|nil*) : Si vrai, la limite douce est aussi imposée.
- **renvoie** : table { limit = integer|nil, hard = boolean, atLimit = boolean, exceeded = boolean, warning = table|nil }

#### `core_multiseatPlayerLimits.isSimpleMenu()`

Indique si l'interface est en mode de menu simplifié (plateformes console/Steam Deck, selon Engine.UI.isSimpleMenu).

- **renvoie** : boolean true si menu simple.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/multiseatPlayerLimits.lua`.*
