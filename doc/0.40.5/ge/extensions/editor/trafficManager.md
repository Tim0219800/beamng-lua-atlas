# `editor_trafficManager`

*Fichier : `lua/ge/extensions/editor/trafficManager.lua` · VM : Game Engine (GE) · 2601 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficManager` : `extensions.load("editor_trafficManager")`, puis la globale `editor_trafficManager`

Éditeur « Traffic Manager » : permet de composer une session de trafic (véhicules et props placés sur la carte, feux de signalisation, panneaux), de lancer/arrêter la simulation (IA des véhicules non verrouillés, signaux), puis de sauvegarder la session en JSON avec un prefab associé. Fenêtres : principale (mode d'édition trafficEditMode), « Traffic Vehicles & Props », « Traffic Lights », « Traffic Signs » et « Options ». Les objets créés sont rangés dans le SimGroup « TrafficSession ». Un moddeur s'en sert via le menu de l'éditeur ; l'API Lua publique se limite au chargement/sauvegarde de session, à la lecture des données et à la simulation.

## Exemple

```lua
editor_trafficManager.loadSession('/levels/west_coast_usa/traffic/ma_session.json')
editor_trafficManager.enableSimulation()
local session = editor_trafficManager.getSessionData()
```

## Remarques

- Le fichier de session contient : name, author, description, level, version (1), includePlayerVehicle, signalsKeepOriginal, signalsSaveApart, debugMode, vehicles, signals {instances, controllers, sequences}.
- loadSession et saveSession remplacent .prefab.json par .json dans le chemin (pattern non échappé : le point est un joker) pour travailler sur le fichier de données ; un prefab du même nom est généré/chargé à côté.
- Si le niveau du fichier diffère du niveau courant et que M.assertLevel est vrai, une confirmation est demandée ; accepter désactive assertLevel jusqu'à sa réactivation.
- saveSession refuse d'écrire (notification « Missing session data! ») s'il n'y a ni véhicule, ni feu, ni panneau.
- À la sauvegarde, chaque véhicule est téléporté sur place (spawn.safeTeleport) et les champs aiActive, stats et _tempData ne sont pas écrits.
- onSerialize renvoie une table vide et onDeserialize ne fait rien : la session n'est pas conservée au rechargement Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficManager.disableSimulation()` | Arrête la simulation : désactive l'IA des véhicules non verrouillés et les signaux, met session.play à false. | 603 |
| `editor_trafficManager.enableSimulation()` | Démarre la simulation : active l'IA de tous les véhicules non verrouillés et les signaux, recharge la collision si l'éditeur est modifié, met session.play à true. | 586 |
| `editor_trafficManager.getSessionData()` | Renvoie la table de session courante (véhicules, feux, panneaux, nom, auteur, play…), non copiée. | 2305 |
| `editor_trafficManager.loadSession(filePath)` | Charge une session depuis un fichier JSON : réinitialise la session, restaure options et métadonnées, charge le prefab associé s'il existe puis recrée véhicules et signaux. Sans argument, reprend le fichier mémorisé après une demande de confirmation de niveau (et désactive assertLevel). Notification d'échec si le fichier est illisible. | 2088 |
| `editor_trafficManager.onDeserialized(data)` | Hook après rechargement Lua ; ne fait rien. *(interne)* *(hook)* | 2554 |
| `editor_trafficManager.onEditorGui()` | Hook de frame de l'éditeur : dessine les fenêtres du Traffic Manager (seulement quand le mode d'édition courant est Traffic Manager) et le debug. *(interne)* *(hook)* | 2341 |
| `editor_trafficManager.onEditorInitialized()` | Hook d'initialisation de l'éditeur : crée le mode d'édition trafficEditMode (raccourcis clic, Maj+clic déplacer, Alt) et enregistre les fenêtres. *(interne)* *(hook)* | 2566 |
| `editor_trafficManager.onSerialize()` | Hook avant rechargement Lua ; renvoie une table vide. *(interne)* *(hook)* | 2549 |
| `editor_trafficManager.onUpdate(dt, dtSim)` | Hook de mise à jour : si le SimGroup a disparu, réinitialise la session ; sinon range les véhicules apparus dans le SimGroup, met à jour les statistiques et un minuteur de 0.25 s. *(interne)* *(hook)* | 2423 |
| `editor_trafficManager.onVehicleResetted(vehId)` | Hook appelé quand un véhicule est réinitialisé : recrée ses données de session (statistiques remises à zéro). *(interne)* *(hook)* | 2526 |
| `editor_trafficManager.onVehicleSpawned(vehId)` | Hook appelé quand un véhicule apparaît : si la fenêtre véhicules ou panneaux est active, crée le SimGroup au besoin et met le véhicule en file pour l'ajouter à la session à la frame suivante. *(interne)* *(hook)* | 2513 |
| `editor_trafficManager.onWindowMenuItem()` | Hook du menu : crée la session et vérifie le SimGroup si besoin, vide la sélection et affiche la fenêtre principale. *(interne)* *(hook)* | 2557 |
| `editor_trafficManager.saveSession(filePath)` | Sauvegarde la session dans un fichier JSON et un prefab du même nom. Sans effet sans chemin. | 2212 |

### Détail des paramètres

#### `editor_trafficManager.disableSimulation()`

Arrête la simulation : désactive l'IA des véhicules non verrouillés et les signaux, met session.play à false.

- **renvoie** : boolean Faux si aucune session n'existe, vrai sinon.

#### `editor_trafficManager.enableSimulation()`

Démarre la simulation : active l'IA de tous les véhicules non verrouillés et les signaux, recharge la collision si l'éditeur est modifié, met session.play à true.

- **renvoie** : boolean Faux si aucune session n'existe, vrai sinon.

#### `editor_trafficManager.getSessionData()`

Renvoie la table de session courante (véhicules, feux, panneaux, nom, auteur, play…), non copiée.

- **renvoie** : table|nil Session, nil tant qu'elle n'est pas créée.

#### `editor_trafficManager.loadSession(filePath)`

Charge une session depuis un fichier JSON : réinitialise la session, restaure options et métadonnées, charge le prefab associé s'il existe puis recrée véhicules et signaux. Sans argument, reprend le fichier mémorisé après une demande de confirmation de niveau (et désactive assertLevel). Notification d'échec si le fichier est illisible.

- `filePath` (*string|nil*) : Chemin du fichier .json (ou .prefab.json, converti).

#### `editor_trafficManager.onDeserialized(data)`

Hook après rechargement Lua ; ne fait rien.

- `data` (*table*) : Valeur de onSerialize.

#### `editor_trafficManager.onSerialize()`

Hook avant rechargement Lua ; renvoie une table vide.

- **renvoie** : table Table vide.

#### `editor_trafficManager.onUpdate(dt, dtSim)`

Hook de mise à jour : si le SimGroup a disparu, réinitialise la session ; sinon range les véhicules apparus dans le SimGroup, met à jour les statistiques et un minuteur de 0.25 s.

- `dt` (*number*) : Delta de temps réel (s).
- `dtSim` (*number*) : Delta de temps de simulation (s).

#### `editor_trafficManager.onVehicleResetted(vehId)`

Hook appelé quand un véhicule est réinitialisé : recrée ses données de session (statistiques remises à zéro).

- `vehId` (*integer*) : Identifiant du véhicule.

#### `editor_trafficManager.onVehicleSpawned(vehId)`

Hook appelé quand un véhicule apparaît : si la fenêtre véhicules ou panneaux est active, crée le SimGroup au besoin et met le véhicule en file pour l'ajouter à la session à la frame suivante.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `editor_trafficManager.saveSession(filePath)`

Sauvegarde la session dans un fichier JSON et un prefab du même nom. Sans effet sans chemin.

- `filePath` (*string*) : Chemin du fichier .json (ou .prefab.json, converti).

## Champs

| Champ | Type | Description |
|---|---|---|
| `assertLevel` | boolean | Vrai par défaut : loadSession compare le niveau du fichier au niveau courant et demande confirmation en cas de différence. |
| `debugMode` | boolean | Faux par défaut : active le dessin de debug (cible IA, boîte sous le véhicule) même pour les véhicules actifs ; recopié depuis le fichier chargé. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `getEnabled`, `getPlayerVehicleID`, `getSurfaceHeightBelow`, `reloadCollision`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getClassName`, `getDirectionVector`, `getDirectionVectorUp`, `getID`, `getName`, `getPosition`, `setInternalName`, `setName`
- `scenetree.` `findObject`, `findObjectById`, `objectExists`, `objectExistsById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficManager.lua`.*
