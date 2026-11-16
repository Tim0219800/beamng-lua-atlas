# `util_saveDynamicData`

*Fichier : `lua/ge/extensions/util/saveDynamicData.lua` · VM : Game Engine (GE) · 214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_saveDynamicData` : `extensions.load("util_saveDynamicData")`, puis la globale `util_saveDynamicData`

Outil automatisé interne : charge le niveau de test « autotest », puis fait apparaître chaque configuration de véhicule (filtrable par modèle ou par fichier .pc) et lance dans le véhicule l'extension dynamicVehicleData pour mesurer ses données dynamiques (dynamicVehicleData.performTests). Les résultats sont déposés dans vehicles/<modèle>/info_<config>.touched ; les configs déjà traitées sont sautées. Un chien de garde (20 s sans heartbeat) et une durée maximale (600 s) font passer au véhicule suivant. À la fin, le jeu est quitté (shutdown(0)).

## Exemple

```lua
extensions.util_saveDynamicData.work('', 'pickup')
```

## Remarques

- Les modèles listés dans blacklist.json (ou à défaut blacklistDefault.json) sont ignorés.
- Le travail attend que le gestionnaire de mods soit prêt et que le niveau de test soit chargé (hook onClientStartMission).
- Le véhicule remplacé est placé en (0, 0, 0.5) et la vitesse de physique est fixée à physicsSpeedFactor (0 : valeur interne du fichier).
- Le code contient un TODO : work ne bloque pas jusqu'à la fin du travail. Le fichier utilise la globale non déclarée newVehicle.
- Le test de filtre sur pcFile est ignoré si la chaîne est vide ou nil ; un vehicleToTest nil teste tous les modèles.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_saveDynamicData.heartbeat()` | Appelée par le côté véhicule pendant les tests pour signaler qu'il est toujours actif (réarme le chien de garde de 20 s). *(interne)* | 197 |
| `util_saveDynamicData.onClientStartMission(levelPath)` | Hook appelé au démarrage d'un niveau ; marque le niveau comme prêt si c'est le niveau de test autotest. *(interne)* *(hook)* | 135 |
| `util_saveDynamicData.onExtensionLoaded()` | Appelé au chargement : décharge/recharge les extensions de base si core_camera est absent, puis charge la liste noire de véhicules (blacklist.json, sinon blacklistDefault.json). *(interne)* *(hook)* | 160 |
| `util_saveDynamicData.onExtensionUnloaded()` | Appelé au déchargement ; ne fait que logger. *(interne)* *(hook)* | 201 |
| `util_saveDynamicData.onInit()` | Appelé à l'initialisation du module ; ne fait que logger. *(interne)* *(hook)* | 26 |
| `util_saveDynamicData.vehicleDone()` | Appelée par le côté véhicule (dynamicVehicleData) quand les tests de la configuration courante sont terminés ; passe à la suivante. *(interne)* | 193 |
| `util_saveDynamicData.work(pcFile, vehicle)` | Point d'entrée : mémorise les filtres, démarre le job de test et lance le niveau autotest s'il n'est pas déjà chargé. | 142 |

### Détail des paramètres

#### `util_saveDynamicData.onClientStartMission(levelPath)`

Hook appelé au démarrage d'un niveau ; marque le niveau comme prêt si c'est le niveau de test autotest.

- `levelPath` (*string*) : Chemin du niveau démarré

#### `util_saveDynamicData.work(pcFile, vehicle)`

Point d'entrée : mémorise les filtres, démarre le job de test et lance le niveau autotest s'il n'est pas déjà chargé.

- `pcFile` (*string|nil*) : Clé de configuration à tester (vide ou nil = toutes)
- `vehicle` (*string|nil*) : Clé de modèle à tester (nil = tous)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/saveDynamicData.lua`.*
