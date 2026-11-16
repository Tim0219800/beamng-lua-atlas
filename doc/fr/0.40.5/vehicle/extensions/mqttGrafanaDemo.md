# `mqttGrafanaDemo`

*Fichier : `lua/vehicle/extensions/mqttGrafanaDemo.lua` · VM : Véhicule · 170 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mqttGrafanaDemo` : `extensions.load (VM véhicule)("mqttGrafanaDemo")`, puis la globale `mqttGrafanaDemo`

Démonstration : publie la télémétrie du véhicule vers un broker MQTT (127.0.0.1) sur le sujet 'car_data', en JSON, à chaque frame, pour l'afficher par exemple dans Grafana. Données : géométrie et état de chaque roue, valeurs d'electrics du tableau de bord, capteurs d'accélération et de force du volant, position et attitude.

## Exemple

```lua
extensions.load('mqttGrafanaDemo')   -- (commentaire du fichier)
```

## Remarques

- Le broker est codé en dur (mqttBrokerURI = '127.0.0.1'). La connexion est lancée par client:start_connecting() ; en cas d'échec le client est mis à nil et rien n'est publié.
- Clés publiées : wheel_<nom> {caster, sai, camber, toe (degrés), pressure (psi), angularVelocity, brakeSurfaceTemperature, brakeCoreTemperature, isBrakeMolten, radius, wheelDir, propulsionTorque, lastSlip, downForce, brakingTorque, brakeTorque}, temp (°C), valeurs electrics (signal_L/R, lights, highbeam, lowpressure, lowfuel, parkingbrake, checkengine, hazard, oil, cruiseControlActive, gear, rpmTacho, fuel, watertemp, engineRunning, wheelspeed, esc, escActive, tcs, tcsActive, clutch, brake, throttle), engineInfo, gx/gy/gz/gx2/gy2/gz2, forceAtWheelNorm, forceAtDriverNorm, curForceLimitNorm, position, roll, pitch, yaw, gravity.
- Anomalie : data.pwr reçoit `powerDisplay`, variable non définie dans ce fichier (nil) ; la clé n'existe donc pas dans le JSON.
- Anomalie : M.reset = reset affecte une variable globale `reset` non définie (nil) : aucun hook reset effectif.
- La réception de messages (subscribe/on_message) est du code commenté (TODO).
- La publication à chaque frame, avec jsonEncode complet, est coûteuse ; c'est une démo.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mqttGrafanaDemo.onExtensionLoaded()` | Appelé au chargement : crée le client MQTT et démarre la connexion. *(interne)* *(hook)* | 142 |
| `mqttGrafanaDemo.onExtensionUnloaded()` | Appelé au déchargement : déconnecte le client MQTT. *(interne)* *(hook)* | 155 |
| `mqttGrafanaDemo.updateGFX(dt)` | Appelé chaque frame : collecte les données et les publie sur le sujet 'car_data' si le client est connecté. *(interne)* | 116 |

### Détail des paramètres

#### `mqttGrafanaDemo.updateGFX(dt)`

Appelé chaque frame : collecte les données et les publie sur le sujet 'car_data' si le client est connecté.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `reset` | any |  ⚠ référence `reset` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getEnvTemperature`, `getGravity`, `getGroupPressure`, `getPositionXYZ`, `getRollPitchYaw`, `nodeVecCos`, `nodeVecPlanarCos`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/mqttGrafanaDemo.lua`.*
