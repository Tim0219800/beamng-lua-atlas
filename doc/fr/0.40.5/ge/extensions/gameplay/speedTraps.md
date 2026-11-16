# `gameplay_speedTraps`

*Fichier : `lua/ge/extensions/gameplay/speedTraps.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_speedTraps` : `extensions.load("gameplay_speedTraps")`, puis la globale `gameplay_speedTraps`

Extension qui gère les radars de vitesse et de feu rouge posés dans les niveaux sous forme de triggers BeamNGTrigger portant un champ speedTrapType (« speed » ou « redLight »). Quand un véhicule entre dans le trigger, dans le bon sens et trop vite, elle émet les hooks onSpeedTrapTriggered ou onRedLightCamTriggered et fait flasher la lumière associée. Inactive pendant une mission au premier plan.

## Exemple

```lua
function M.onSpeedTrapTriggered(data, speed, overSpeed)
  print(data.triggerName, speed, overSpeed)
end
```

## Remarques

- Données attendues dans data : event ('enter'), speedTrapType, speedLimit (m/s), speedLimitTolerance (défaut 10 % de la limite), speedTrapLightName, subjectID, triggerID, triggerName ; pour un feu rouge : triggerSpeed (défaut 5 m/s) et trafficSignalId.
- Radar de vitesse : déclenché si la vitesse dépasse limite + tolérance. Feu rouge : déclenché si la vitesse dépasse triggerSpeed ET que le signal est « redTrafficLight ».
- Ignoré si le véhicule est à plus de 100 m de la caméra ou si le véhicule roule dans le sens opposé à l'axe Y du trigger.
- Le flash dure 0,1 s (radar) ; pour un feu rouge : flash 0,1 s, pause de 10 / vitesse s, second flash 0,1 s.
- Pour un radar de feu rouge, trafficSignal est utilisé sans vérification de nil : si trafficSignalId est invalide, erreur Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType)` | Liste les triggers BeamNGTrigger du niveau courant dont le speedTrapType correspond. | 105 |
| `gameplay_speedTraps.onBeamNGTrigger(data)` | Hook appelé par le moteur à chaque événement d'un BeamNGTrigger. Ne traite que les triggers avec speedTrapType et l'événement 'enter'. Calcule la vitesse du véhicule, vérifie le sens de passage et émet onSpeedTrapTriggered(data, vehSpeed, overSpeed) ou onRedLightCamTriggered(data, vehSpeed), puis allume la lumière nommée. *(interne)* *(hook)* | 45 |

### Détail des paramètres

#### `gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType)`

Liste les triggers BeamNGTrigger du niveau courant dont le speedTrapType correspond.

- `speedTrapType` (*string*) : 'speed' ou 'redLight'.
- **renvoie** : table[] Objets trigger (table vide si aucun).

#### `gameplay_speedTraps.onBeamNGTrigger(data)`

Hook appelé par le moteur à chaque événement d'un BeamNGTrigger. Ne traite que les triggers avec speedTrapType et l'événement 'enter'. Calcule la vitesse du véhicule, vérifie le sens de passage et émet onSpeedTrapTriggered(data, vehSpeed, overSpeed) ou onRedLightCamTriggered(data, vehSpeed), puis allume la lumière nommée.

- `data` (*table*) : Données du trigger (voir notes).

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRedLightCamTriggered` — écouté par 2 module(s)
- `onSpeedTrapTriggered` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectPositionXYZ`, `getObjectVelocityXYZ`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/speedTraps.lua`.*
