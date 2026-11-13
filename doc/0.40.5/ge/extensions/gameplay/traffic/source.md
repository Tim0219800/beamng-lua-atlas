# `gameplay_traffic_source`

*Fichier : `lua/ge/extensions/gameplay/traffic/source.lua` · VM : Game Engine (GE) · 193 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_traffic_source` : `extensions.load("gameplay_traffic_source")`, puis la globale `gameplay_traffic_source`

Gère les « sources » (foyers) du gestionnaire de trafic, utile quand plusieurs joueurs (écran partagé) doivent chacun avoir du trafic autour d'eux. Une source est un véhicule ou une position fixe ; le module fait tourner le foyer du trafic (gameplay_traffic.setFocus) de source en source à intervalle régulier. Chargé à la demande.

## Exemple

```lua
gameplay_traffic_source.autoAddPlayers('default') -- une source par joueur, rotation toutes les 5 s
```

## Remarques

- Le mode de mise à jour vaut 'off' ou 'default' (seul 'default' fait tourner les sources).
- autoAddPlayers ne fait rien s'il y a moins de 2 joueurs (core_multiseat.getJoinedPlayers()[2] nil) ; il pose trafficClearRadius = 160 sur chaque véhicule joueur et désactive enableDynamicValues du trafic.
- En mode 'default', après chaque changement de source le timer est gelé à -1 jusqu'à ce qu'un véhicule IA de trafic soit réinitialisé (onVehicleResetted).
- addSource renvoie l'entrée créée ou false ; une source 'custom' exige data.pos et data.dir.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_traffic_source.addSource(mode, data)` | Ajoute une source au trafic. Mode 'vehicle' : data est un id de véhicule ou une table {vehId}. Mode 'custom' : data = {pos, dir, speed?}. Autre mode (ex. 'camera') : entrée sans donnée. | 34 |
| `gameplay_traffic_source.autoAddPlayers(defaultMode)` | Réinitialise les sources puis ajoute comme source le véhicule de chaque joueur (multiseat), si au moins 2 joueurs ont rejoint. Active ensuite le mode de mise à jour. | 118 |
| `gameplay_traffic_source.getSources()` | Renvoie la table des sources courantes (référence directe, pas une copie). | 72 |
| `gameplay_traffic_source.onUpdate(dt, dtSim)` | Hook appelé à chaque frame. Fait avancer le timer ; à l'intervalle, appelle updateSource puis gèle le timer (-1). *(interne)* *(hook)* | 167 |
| `gameplay_traffic_source.onVehicleResetted(vehId)` | Hook appelé quand un véhicule est réinitialisé. Si le timer de rotation est gelé (-1) et que le véhicule est une IA de trafic, relance le timer à 0. *(interne)* *(hook)* | 157 |
| `gameplay_traffic_source.onVehicleSwitched(oldId, newId, player)` | Hook appelé quand un joueur change de véhicule. En écran partagé, autoAddPlayers est souvent appelé avant que chacun soit assis : si le nouveau véhicule n'est pas déjà source et qu'il y a au moins 2 joueurs, relance autoAddPlayers. *(interne)* *(hook)* | 151 |
| `gameplay_traffic_source.removeSource(index)` | Retire la source à l'indice donné ; si c'était l'indice courant de rotation, la rotation repart à 1. | 65 |
| `gameplay_traffic_source.resetSources()` | Supprime toutes les sources (remet trafficClearRadius à 0 sur les véhicules concernés), rétablit le foyer par défaut du trafic et réactive enableDynamicValues. | 17 |
| `gameplay_traffic_source.setSourceMode(mode, options)` | Définit le mode de mise à jour des sources et réinitialise l'état de rotation. En mode 'default', crée un timer et un intervalle (minimum 1 s, 5 s par défaut). | 76 |
| `gameplay_traffic_source.updateSource(index)` | Passe à la source suivante (en privilégiant une source dont le véhicule roule à plus de 1 m/s) ou à l'indice donné, puis appelle gameplay_traffic.setFocus(mode, source). Appelée automatiquement par onUpdate ou manuellement. | 96 |

### Détail des paramètres

#### `gameplay_traffic_source.addSource(mode, data)`

Ajoute une source au trafic. Mode 'vehicle' : data est un id de véhicule ou une table {vehId}. Mode 'custom' : data = {pos, dir, speed?}. Autre mode (ex. 'camera') : entrée sans donnée.

- `mode` (*string*) : 'camera', 'vehicle' ou 'custom'.
- `data` (*integer|table|nil*) : Id de véhicule, ou table {vehId=…} ou {pos=vec3, dir=vec3, speed=number}.
- **renvoie** : table|boolean L'entrée de source ajoutée, ou false si les données sont invalides (véhicule inexistant, pos/dir manquants).

#### `gameplay_traffic_source.autoAddPlayers(defaultMode)`

Réinitialise les sources puis ajoute comme source le véhicule de chaque joueur (multiseat), si au moins 2 joueurs ont rejoint. Active ensuite le mode de mise à jour.

- `defaultMode` (*string|nil*) : Mode de mise à jour, 'default' si nil.

#### `gameplay_traffic_source.getSources()`

Renvoie la table des sources courantes (référence directe, pas une copie).

- **renvoie** : table Liste d'entrées {mode, auto, vehId?, pos?, dirVec?, speed?}.

#### `gameplay_traffic_source.onUpdate(dt, dtSim)`

Hook appelé à chaque frame. Fait avancer le timer ; à l'intervalle, appelle updateSource puis gèle le timer (-1).

- `dt` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps de simulation (s), utilisé par le timer.

#### `gameplay_traffic_source.onVehicleResetted(vehId)`

Hook appelé quand un véhicule est réinitialisé. Si le timer de rotation est gelé (-1) et que le véhicule est une IA de trafic, relance le timer à 0.

- `vehId` (*integer*) : Id du véhicule réinitialisé.

#### `gameplay_traffic_source.onVehicleSwitched(oldId, newId, player)`

Hook appelé quand un joueur change de véhicule. En écran partagé, autoAddPlayers est souvent appelé avant que chacun soit assis : si le nouveau véhicule n'est pas déjà source et qu'il y a au moins 2 joueurs, relance autoAddPlayers.

- `oldId` (*integer*) : Ancien id de véhicule.
- `newId` (*integer*) : Nouvel id de véhicule.
- `player` (*integer*) : Joueur concerné (non utilisé).

#### `gameplay_traffic_source.removeSource(index)`

Retire la source à l'indice donné ; si c'était l'indice courant de rotation, la rotation repart à 1.

- `index` (*integer*) : Indice (à partir de 1) dans la liste des sources.

#### `gameplay_traffic_source.setSourceMode(mode, options)`

Définit le mode de mise à jour des sources et réinitialise l'état de rotation. En mode 'default', crée un timer et un intervalle (minimum 1 s, 5 s par défaut).

- `mode` (*string*) : 'off' ou 'default'.
- `options` (*table|nil*) : Options ; options.interval = intervalle de rotation en secondes.

#### `gameplay_traffic_source.updateSource(index)`

Passe à la source suivante (en privilégiant une source dont le véhicule roule à plus de 1 m/s) ou à l'indice donné, puis appelle gameplay_traffic.setFocus(mode, source). Appelée automatiquement par onUpdate ou manuellement.

- `index` (*integer|nil*) : Indice forcé ; si nil, avance à la prochaine source.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/source.lua`.*
