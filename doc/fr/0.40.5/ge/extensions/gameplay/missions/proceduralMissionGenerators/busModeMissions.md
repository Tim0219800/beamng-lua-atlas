# `gameplay_missions_proceduralMissionGenerators_busModeMissions`

*Fichier : `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_proceduralMissionGenerators_busModeMissions` : `extensions.load("gameplay_missions_proceduralMissionGenerators_busModeMissions")`, puis la globale `gameplay_missions_proceduralMissionGenerators_busModeMissions`

Générateur procédural de missions « busMode » (conduite de bus en freeroam). Pour chaque niveau possédant des fichiers /levels/<niveau>/buslines/*.buslines.json, il crée une mission par scénario « bus » de scenario_scenariosLoader, avec les données de route (liste de tâches, aides de navigation, couleur, véhicule, route inverse) et un déclencheur placé sur le point d'apparition du bus. Appelé par gameplay_missions_missions pour ajouter ces missions à la liste.

## Exemple

```lua
local missions = gameplay_missions_proceduralMissionGenerators_busModeMissions.generate('gridmap')
```

## Remarques

- Les missions générées ont l'id « <niveau>/<routeID>-<variance>-procedural », missionType « busMode », startCondition vide (le TODO dit qu'il faudrait exiger un bus), trafficAllowed=false, étoiles justFinish et noAccident, showInCareer=false et showInFreeroam=true.
- La route inverse est la route de même routeID avec la variance opposée (a <-> b) ; ses données sont stockées dans missionTypeData.rtasklist / rnavhelp / rdirection.
- Bug probable : quand le spawn est donné par rotAngAxisF, l'angle est converti avec (w * 3.1459) / 180, donc une approximation fautive de pi (3.14159).
- Le niveau est identifié par string.lower(level.levelName) ; si la route d'un scénario est introuvable dans les buslines, `route.tasklist` lèvera une erreur (aucune garde).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_proceduralMissionGenerators_busModeMissions.generate(levelIdentifier)` | Génère la liste des missions busMode pour un ou plusieurs niveaux (tous si nil). Ne garde que les niveaux ayant au moins une route de bus. Place le déclencheur (startTrigger) sur missionStartTriggerPos s'il existe, sinon sur le point d'apparition du bus, et remplit missionTypeData.spawnPos / spawnRot. | 32 |

### Détail des paramètres

#### `gameplay_missions_proceduralMissionGenerators_busModeMissions.generate(levelIdentifier)`

Génère la liste des missions busMode pour un ou plusieurs niveaux (tous si nil). Ne garde que les niveaux ayant au moins une route de bus. Place le déclencheur (startTrigger) sur missionStartTriggerPos s'il existe, sinon sur le point d'apparition du bus, et remplit missionTypeData.spawnPos / spawnRot.

- `levelIdentifier` (*string|table|nil*) : Nom de niveau ou liste de noms ; nil = tous les niveaux.
- **renvoie** : table Liste de définitions de missions (tables non enregistrées sur disque).

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua`.*
