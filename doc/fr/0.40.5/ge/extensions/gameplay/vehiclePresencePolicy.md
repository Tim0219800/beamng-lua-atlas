# `gameplay_vehiclePresencePolicy`

*Fichier : `lua/ge/extensions/gameplay/vehiclePresencePolicy.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_vehiclePresencePolicy` : `extensions.load("gameplay_vehiclePresencePolicy")`, puis la globale `gameplay_vehiclePresencePolicy`

Règles pures (sans état) décrivant la « présence » d'un joueur par rapport à un véhicule : driver (conducteur), passenger (passager) ou unrestricted (sans restriction). Dit si une carte d'actions d'entrée est autorisée pour un mode donné et quel mode non assis utiliser par défaut. Pas de hook ni d'état : on l'utilise comme bibliothèque.

## Exemple

```lua
local policy = require("gameplay/vehiclePresencePolicy")
if policy.allowsActionMap(mode, "driving") then ... end
```

## Remarques

- Modes valides : driver, passenger, unrestricted.
- allowsActionMap : unrestricted autorise tout ; driver n'autorise que la carte « driving » ; passenger n'autorise rien.
- Le fichier se charge par require("gameplay/vehiclePresencePolicy") ; le nom d'extension gameplay_vehiclePresencePolicy n'est pas nécessairement chargé par extensions.load.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_vehiclePresencePolicy.allowsActionMap(mode, mapKind)` | Indique si une carte d'actions est autorisée pour le mode. | 28 |
| `gameplay_vehiclePresencePolicy.defaultUnseatedMode(context)` | Mode par défaut d'un joueur non assis : « unrestricted » en freeroam (ou sans mode) quand le multi-siège n'est pas actif, « passenger » sinon. | 21 |
| `gameplay_vehiclePresencePolicy.isValidMode(mode)` | Teste si une valeur est un mode connu. | 13 |
| `gameplay_vehiclePresencePolicy.normalizeMode(mode, fallback)` | Renvoie le mode s'il est valide, sinon le mode de repli s'il est valide, sinon « passenger ». | 17 |

### Détail des paramètres

#### `gameplay_vehiclePresencePolicy.allowsActionMap(mode, mapKind)`

Indique si une carte d'actions est autorisée pour le mode.

- `mode` (*string*) : Mode de présence.
- `mapKind` (*string*) : Type de carte d'actions (par ex. « driving », « slot »).
- **renvoie** : boolean 

#### `gameplay_vehiclePresencePolicy.defaultUnseatedMode(context)`

Mode par défaut d'un joueur non assis : « unrestricted » en freeroam (ou sans mode) quand le multi-siège n'est pas actif, « passenger » sinon.

- `context` (*table|nil*) : {mode = "freeroam"|"multiplayer"|"career"|..., isMultiseatActive = boolean}
- **renvoie** : string "unrestricted" ou "passenger"

#### `gameplay_vehiclePresencePolicy.isValidMode(mode)`

Teste si une valeur est un mode connu.

- `mode` (*any*) : Valeur à tester.
- **renvoie** : boolean true pour driver, passenger ou unrestricted.

#### `gameplay_vehiclePresencePolicy.normalizeMode(mode, fallback)`

Renvoie le mode s'il est valide, sinon le mode de repli s'il est valide, sinon « passenger ».

- `mode` (*any*) : Mode demandé.
- `fallback` (*any*) : Mode de repli facultatif.
- **renvoie** : string Un mode valide.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/vehiclePresencePolicy.lua`.*
