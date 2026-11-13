# `editor_vehicleEditor_liveEditor_veCrashTester`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veCrashTester` : `extensions.load("editor_vehicleEditor_liveEditor_veCrashTester")`, puis la globale `editor_vehicleEditor_liveEditor_veCrashTester`

Outil 'Other/Crash Tester' du Vehicle Editor live. On choisit un point de départ sur le terrain (molette = rotation par pas de 5°), un nombre de véhicules (1 à 15) et une vitesse cible (10 à 200 km/h). 'Run Test!' fait apparaître des voitures/camions tirés au hasard (core_vehicles.getVehicleList, Type Car ou Truck), espacés de 10 m, frein à main relâché et lancés à la vitesse cible via applyClusterVelocityScaleAdd. 'Stop Test!' supprime les véhicules.

## Remarques

- Vitesse de départ = targetSpeed / 3.6 (km/h vers m/s) dans la direction startDir * (0,1,0).
- Bug mineur : `hit = cameraMouseRayCast(...)` est affecté sans `local`, donc une globale `hit` est créée.
- vehsData.done n'est jamais mis à jour : seule la suppression via Stop Test! retire les véhicules.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veCrashTester.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 151 |
| `editor_vehicleEditor_liveEditor_veCrashTester.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 145 |
| `editor_vehicleEditor_liveEditor_veCrashTester.onUpdate()` | Appelé chaque frame : dessine la fenêtre (curseurs, boutons) et les repères de départ (triangles rouges via debugDrawer:drawTriSolid). *(interne)* *(hook)* | 111 |
| `editor_vehicleEditor_liveEditor_veCrashTester.open()` | Ouvre la fenêtre. | 141 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veCrashTester.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veCrashTester.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Other/Crash Tester' (sous-menu 'Other'). |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua`.*
