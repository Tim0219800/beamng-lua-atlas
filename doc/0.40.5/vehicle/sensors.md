# `sensors`

*Fichier : `lua/vehicle/sensors.lua` · VM : Véhicule · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `sensors`

Expose les accélérations mesurées au noeud de référence du véhicule (gx, gy, gz) ainsi que leur version lissée (gx2, gy2, gz2). Les valeurs brutes viennent d'une structure FFI fournie par le moteur (obj:getSensorsFFI()) et sont recopiées à chaque updateGFX. Utilisé par l'IA, l'ESC, le freinage post-crash, les jauges et les protocoles de simulateur.

## Exemple

```lua
local ay = sensors.gy2 -- accélération latérale lissée
if math.abs(sensors.gx2) > 5 then print('freinage/accélération forte') end
```

## Remarques

- Unités : le code ne les précise pas ; les usages (postCrashBrake compare sensors.gz2 - powertrain.currentGravity à un seuil, esc.lua compare gy2 à 3) indiquent des m/s² (déduit du code).
- Axes (déduits des usages) : gx = axe X du capteur (esc.lua/protocols.lua l'utilisent comme accélération latérale), gy = axe Y (esc.lua l'intègre comme accélération longitudinale ; ai.lua utilise -gy comme accélération avant), gz = axe vertical hors inertie (sensorZnonInertial ; postCrashBrake le compare à powertrain.currentGravity). Le sens exact des axes n'est pas documenté dans le code Lua (déduit des usages).
- gx, gy, gz sont les valeurs brutes de la structure FFI (sensorX, sensorY, sensorZnonInertial). gx2/gy2/gz2 sont lissées par newTemporalSmoothingNonLinear(7).
- Toutes les valeurs sont mises à jour dans updateGFX uniquement : avant le premier updateGFX, ffiSensors vaut 0 (nombre) puis une structure FFI après init().
- L'ordre de mise à jour par rapport aux autres modules (ai, esc…) dépend de la boucle principale ; ces modules lisent la valeur du dernier updateGFX.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `sensors.init()` | Récupère la structure FFI des capteurs auprès du moteur puis appelle reset(). Appelée au chargement du véhicule. *(interne)* | 36 |
| `sensors.reset()` | Remet à zéro les trois lisseurs temporels. Appelée à la réinitialisation du véhicule. *(interne)* | 19 |
| `sensors.updateGFX(dt)` | Copie les accélérations brutes depuis ffiSensors dans gx/gy/gz et met à jour les valeurs lissées gx2/gy2/gz2. Appelée à chaque frame graphique par la boucle principale. *(interne)* | 25 |

### Détail des paramètres

#### `sensors.updateGFX(dt)`

Copie les accélérations brutes depuis ffiSensors dans gx/gy/gz et met à jour les valeurs lissées gx2/gy2/gz2. Appelée à chaque frame graphique par la boucle principale.

- `dt` (*number*) : Pas de temps de la frame en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `ffiSensors` | table|number | Structure FFI renvoyée par obj:getSensorsFFI() (champs sensorX, sensorY, sensorZnonInertial…). Vaut 0 avant init(). |
| `gx` | number | Accélération brute sur l'axe X du capteur (ffiSensors.sensorX). |
| `gx2` | number | gx lissé temporellement (lissage non linéaire, paramètre 7). |
| `gy` | number | Accélération brute sur l'axe Y du capteur (ffiSensors.sensorY). |
| `gy2` | number | gy lissé temporellement. |
| `gz` | number | Accélération brute verticale hors inertie (ffiSensors.sensorZnonInertial). |
| `gz2` | number | gz lissé temporellement. |

## Appels vers le moteur (C++)

- `obj:` `getSensorsFFI`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/sensors.lua`.*
