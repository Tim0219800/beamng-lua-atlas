# `util_calibrateESC`

*Fichier : `lua/ge/extensions/util/calibrateESC.lua` · VM : Game Engine (GE) · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_calibrateESC` : `extensions.load("util_calibrateESC")`, puis la globale `util_calibrateESC`

Outil interne de mesure automatisée du contrôle de stabilité (ESC) des véhicules. Il charge le niveau /levels/smallgrid/info.json, puis pour chaque config de véhicule (hors liste noire et hors configs déjà traitées) remplace le véhicule joueur, charge l'extension véhicule escMeasurement, lance escMeasurement.performTests(modèle, config) et attend la fin (vehicleDone), un watchdog de 20 s sans heartbeat ou une durée maximale. À la fin, le jeu s'arrête (shutdown(0)). Prévu pour une exécution automatisée par un script de worker, pas pour un usage normal.

## Remarques

- Au chargement, la vitesse de physique est réglée sur 2 (be:setPhysicsSpeedFactor(2)).
- Si core_camera est nil au chargement, les extensions automatiques sont déchargées puis les extensions prédéfinies chargées (unloadAutoExtensions, loadPresetExtensions).
- Liste noire de modèles lue dans blacklist.json, sinon blacklistDefault.json (tableau de clés de modèle).
- Une config est ignorée si le fichier vehicles/<modèle>/info_<config>.touched existe déjà.
- Watchdog : fin du test si plus de 20 000 unités de hptimer (ms) s'écoulent sans appel à heartbeat() ; durée maximale par véhicule : 10 000 000 de ces unités.
- work(pcFile, vehicle) filtre par config (pcFile) et modèle (vehicle) ; passer nil ou une chaîne vide pour pcFile traite toutes les configs. Le code note (TODO) que work ne bloque pas jusqu'à la fin des tests et qu'il est généralement appelé deux fois.
- Attention : le test s'achève toujours par shutdown(0), qui ferme le jeu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_calibrateESC.heartbeat()` | À appeler (depuis le véhicule) régulièrement pour signaler que le test progresse et réinitialiser le watchdog. | 203 |
| `util_calibrateESC.onClientStartMission(levelPath)` | Hook appelé au démarrage d'un niveau ; si c'est le niveau de test (/levels/smallgrid/info.json), autorise la suite du travail. *(interne)* *(hook)* | 141 |
| `util_calibrateESC.onExtensionLoaded()` | Hook de chargement : règle la vitesse de physique à 2, charge la liste noire de véhicules et affiche les véhicules ignorés. *(interne)* *(hook)* | 165 |
| `util_calibrateESC.onExtensionUnloaded()` | Hook de déchargement : ne fait que logguer. *(interne)* *(hook)* | 207 |
| `util_calibrateESC.onInit()` | Hook appelé au chargement du module (tous les systèmes ne sont pas forcément prêts) ; ne fait que logguer. *(interne)* *(hook)* | 24 |
| `util_calibrateESC.vehicleDone()` | À appeler (depuis le véhicule) quand les mesures d'un véhicule sont terminées : passe au suivant. | 199 |
| `util_calibrateESC.work(pcFile, vehicle)` | Démarre le travail de calibrage dans un job, charge le niveau de test s'il n'est pas déjà chargé. | 147 |

### Détail des paramètres

#### `util_calibrateESC.onClientStartMission(levelPath)`

Hook appelé au démarrage d'un niveau ; si c'est le niveau de test (/levels/smallgrid/info.json), autorise la suite du travail.

- `levelPath` (*string*) : Chemin du niveau démarré.

#### `util_calibrateESC.work(pcFile, vehicle)`

Démarre le travail de calibrage dans un job, charge le niveau de test s'il n'est pas déjà chargé.

- `pcFile` (*string|nil*) : Clé de la config à tester ; nil ou vide pour toutes.
- `vehicle` (*string|nil*) : Clé du modèle à tester ; nil pour tous.

## Appels vers le moteur (C++)

- `be:` `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/calibrateESC.lua`.*
