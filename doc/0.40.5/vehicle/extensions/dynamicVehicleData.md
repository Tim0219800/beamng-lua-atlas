# `dynamicVehicleData`

*Fichier : `lua/vehicle/extensions/dynamicVehicleData.lua` · VM : Véhicule · 1121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `dynamicVehicleData` : `extensions.load (VM véhicule)("dynamicVehicleData")`, puis la globale `dynamicVehicleData`

Outil interne de génération automatique des fiches de performance des véhicules (fichiers vehicles/<modèle>/info_<config>.json), piloté depuis le GE par util_saveDynamicData. Une coroutine exécute des mesures statiques (poids, puissance, couple, régimes de pic, type de moteur, induction, carburant, transmission, layout, boîte englobante) puis dynamiques (accélérations, freinage, score tout-terrain) en repositionnant le véhicule, puis met à jour le fichier info par fusion récursive.

## Exemple

```lua
-- appelé par le GE : extensions.dynamicVehicleData.performTests('vivace', 'base')
```

## Remarques

- Clés écrites dans le fichier info : Weight (kg arrondi à 5), PowerPeakRPM, TorquePeakRPM (plage 'min - max' si l'écart dépasse 500 tr/min, valeurs arrondies à 50), Torque (N·m arrondi à 5), Power (arrondi), Weight/Power, Propulsion (Electric, ICE, Hybrid, Other), Induction Type (NA, Turbo, SC, N2O et combinaisons ; seulement pour ICE/Hybrid), Fuel Type (Gasoline, Diesel, Battery, Hybrid, …), Transmission, Drivetrain (layout), BoundingBox (deux points : min et max relatifs au nœud ref), Top Speed, 0-100 km/h, 0-200 km/h, 0-300 km/h, 100-200 km/h, 0-60 mph, 0-100 mph, 0-200 mph, 60-100 mph, 100-0 km/h, 60-0 mph, Braking G, Off-Road Score.
- Avant chaque écriture, les clés de la liste blanche sont effacées du fichier existant, puis les nouvelles valeurs sont fusionnées (tableMergeRecursive) ; compareData avertit dans le log si une valeur numérique change de plus de 10 %.
- Les tests dynamiques dépendent du GE : be:resetVehicle(0), setPositionRotation et autoplace sur le véhicule du joueur 0, avec des attentes de 2 s. updateGFX reprend la coroutine à chaque frame, envoie un heartbeat au GE et déclenche util_saveDynamicData.vehicleDone() à la fin.
- Le test de freinage n'est lancé que si le véhicule a pu atteindre 115 km/h pendant les accélérations.
- Pour les véhicules sans moteur (catégorie engine), seule la clé Weight est enregistrée par les données de performance statiques.
- performTests ne vérifie pas la présence de roues : les tests d'accélération s'arrêtent si wheels.wheelCount <= 0.
- getPowertrainLayout est exportée et renvoie une chaîne décrivant la disposition (valeur 'Other' par défaut, selon les roues motrices détectées).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `dynamicVehicleData.getPowertrainLayout()` | Détermine la disposition de la transmission du véhicule à partir des roues propulsées (valeur texte, 'Other' si indéterminée). | 499 |
| `dynamicVehicleData.onInit()` | Hook d'initialisation ; vide. *(interne)* *(hook)* | 86 |
| `dynamicVehicleData.onReset()` | Même fonction que onInit. *(interne)* *(hook)* | 86 |
| `dynamicVehicleData.performTests(_model_key, _config_key)` | Lance la séquence complète (données statiques puis tests dynamiques) dans une coroutine pour le modèle et la configuration indiqués. | 1071 |
| `dynamicVehicleData.updateGFX(dt)` | Appelé chaque frame : incrémente le chronomètre interne, reprend la coroutine de test et envoie le heartbeat/killswitch au GE. *(interne)* | 1053 |

### Détail des paramètres

#### `dynamicVehicleData.getPowertrainLayout()`

Détermine la disposition de la transmission du véhicule à partir des roues propulsées (valeur texte, 'Other' si indéterminée).

- **renvoie** : string Disposition : 'FWD', 'RWD', 'AWD', '4WD', 'NxM' (roues x roues motrices) ou 'Other'.

#### `dynamicVehicleData.performTests(_model_key, _config_key)`

Lance la séquence complète (données statiques puis tests dynamiques) dans une coroutine pour le modèle et la configuration indiqués.

- `_model_key` (*string*) : Nom du modèle (dossier vehicles/).
- `_config_key` (*string*) : Nom de la configuration.

#### `dynamicVehicleData.updateGFX(dt)`

Appelé chaque frame : incrémente le chronomètre interne, reprend la coroutine de test et envoie le heartbeat/killswitch au GE.

- `dt` (*number*) : Pas de temps en secondes.

## Appels vers le moteur (C++)

- `obj:` `calcBeamStats`, `getGravity`, `getPosition`, `queueGameEngineLua`

**Charge les extensions :** `cruiseControl`, `perfectLaunch`, `straightLine`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/dynamicVehicleData.lua`.*
