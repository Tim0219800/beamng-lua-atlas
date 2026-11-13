# `core_audioForest`

*Fichier : `lua/ge/extensions/core/audioForest.lua` · VM : Game Engine (GE) · 613 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_audioForest` : `extensions.load("core_audioForest")`, puis la globale `core_audioForest`

Extension GE (core_audioForest) : coordinateur d'exécution des émetteurs audio de forêt. À partir des arbres/objets du Forest du niveau, elle construit un nuage de noeuds audio éclaircis (audioForestCommon), puis à chaque frame calcule la position moyenne pondérée des noeuds autour de l'auditeur (rayon 150 m) et déplace un émetteur SFX unique (le 'main emitter') à ce point en réglant ses paramètres FMOD (RTPC). Un émetteur 'roomtone' indépendant peut aussi jouer une ambiance. Les réglages par niveau sont lus dans levels/<niveau>/dynamicAudioEmitters/forestData.audioSFX.json (créé par l'éditeur). Les RTPC : volume = intensité, pitch = densité de noeuds, color = taille de la végétation, texture = inutilisé ; le paramètre global g_ForestHeight = hauteur de l'auditeur par rapport au barycentre de la forêt (ou au terrain).

## Exemple

```lua
-- Piloté par l'éditeur ou par le fichier de niveau. Contrôle manuel :
core_audioForest.setMainEvent('event:>Ambiance>Forest>Mon_event')
core_audioForest.setEnabled(true)
```

## Remarques

- Format du fichier de niveau : JSON lignes (une ligne 'meta' puis une ligne 'shape' par modèle de forêt avec include, classSel, classOvr).
- Au chargement du niveau (onClientCustomObjectSpawning) et après un rechargement Lua (onDeserialized), l'état est reconstruit depuis le fichier ; onSerialize ne renvoie rien d'utile ({}).
- Le calcul du nuage de noeuds est étalé sur plusieurs frames (runtimeLoadStepCount = 10000 objets par frame) via startRuntimePrepass/stepRuntimePrepass.
- Constantes internes : rayon d'écoute 150 m, gain de volume 30, seuil d'écriture de g_ForestHeight 0,05 m, émetteur surélevé de 0,05 m.
- Risque : onUpdate appelle em:setPosition / em:setVolumePitchCT sans tester que l'émetteur principal existe ; si enabled est vrai alors que mainEventName est vide (donc pas d'émetteur), cela déclenche une erreur sur nil (déduit du code).
- Les coordonnées de noeuds sont en mètres monde ; la profondeur d'un noeud (nodeDepth) est la hauteur de l'objet multipliée par nodeHeightBlend (0,5).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_audioForest.clear()` | Réinitialise tout l'état d'exécution (émetteurs, noeuds, état d'outil, réglages). | 582 |
| `core_audioForest.clearMainAudio()` | Supprime uniquement le chemin audio principal (émetteur et nom d'événement). | 550 |
| `core_audioForest.getEmitterNodeIds()` | Pour l'éditeur : renvoie la table {[1] = id du noeud représentatif le plus proche} et la taille 1. | 540 |
| `core_audioForest.getMainEmitterDebugState()` | Pour la visualisation éditeur : état actuel de l'émetteur principal. | 545 |
| `core_audioForest.getPersistedToolState()` | Renvoie l'état d'outil actuellement chargé. | 180 |
| `core_audioForest.onClientCustomObjectSpawning()` | Hook appelé quand les objets du niveau sont créés : charge la configuration du niveau et lance la pré-passe. *(interne)* *(hook)* | 517 |
| `core_audioForest.onClientEndMission()` | Hook appelé à la fin d'un niveau : réinitialise tout l'état. *(interne)* *(hook)* | 587 |
| `core_audioForest.onDeserialized(data)` | Hook après rechargement Lua : relit la configuration du niveau et reconstruit l'état. *(interne)* *(hook)* | 526 |
| `core_audioForest.onEditorBeforeSaveLevel()` | Hook appelé par l'éditeur avant la sauvegarde du niveau : écrit l'état d'outil mémorisé dans levels/<niveau>/dynamicAudioEmitters/forestData.audioSFX.json. *(interne)* *(hook)* | 531 |
| `core_audioForest.onSerialize()` | Hook de sérialisation avant rechargement Lua : renvoie une table vide. *(interne)* *(hook)* | 522 |
| `core_audioForest.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame par le système d'extensions : fait avancer la pré-passe de chargement, puis déplace l'émetteur principal et règle ses RTPC selon les noeuds proches de l'auditeur (SFXSystem.getPositionXYZ). *(interne)* *(hook)* | 299 |
| `core_audioForest.setEnabled(v)` | Active ou désactive le système. À l'activation, crée l'émetteur principal s'il y a un événement et des noeuds ; à la désactivation, le supprime. | 395 |
| `core_audioForest.setMainEvent(eventName)` | Définit l'événement FMOD de l'émetteur principal (sans toucher à la roomtone). Chaîne vide : supprime l'émetteur. Sinon met à jour l'émetteur existant ou le crée si le système est actif et a des noeuds. | 284 |
| `core_audioForest.setNodeCloud(cloud)` | Installe un nuage de noeuds produit par audioForestCommon.buildNodeCloudFromForest (utilisé par l'éditeur ou le runtime). Récupère le terrain (core_terrain.getTerrain) et les paramètres globaux audio ; renvoie false et vide l'état si le nuage est invalide ou s'il n'y a pas de terrain. | 253 |
| `core_audioForest.setPersistedToolState(st)` | Mémorise l'état de l'outil d'édition pour la sauvegarde du niveau. | 175 |
| `core_audioForest.setPitchDensityInv(v)` | Remplace la normalisation automatique du pitch (inverse du nombre de sources de référence). nil ou valeur <= 0 : revient à l'automatique. | 407 |
| `core_audioForest.setRoomtoneEnabled(v)` | Active ou coupe l'émetteur 'roomtone' indépendant (le crée s'il y a un événement roomtone). | 416 |
| `core_audioForest.setRoomtoneEvent(eventName)` | Définit l'événement de la roomtone. Sans effet visible tant que la roomtone n'est pas activée ; chaîne vide : supprime l'émetteur. | 426 |
| `core_audioForest.setRoomtoneZ(v)` | Fixe l'altitude de l'émetteur roomtone (positionné en x=0, y=0). | 446 |

### Détail des paramètres

#### `core_audioForest.getEmitterNodeIds()`

Pour l'éditeur : renvoie la table {[1] = id du noeud représentatif le plus proche} et la taille 1.

- **renvoie** : table<integer, integer> Tableau d'ids de noeuds (0 si aucun)
- **renvoie** : integer Nombre d'émetteurs (toujours 1)

#### `core_audioForest.getMainEmitterDebugState()`

Pour la visualisation éditeur : état actuel de l'émetteur principal.

- **renvoie** : boolean true si l'émetteur est actif (des noeuds sont dans le rayon)
- **renvoie** : number x (m)
- **renvoie** : number y (m)
- **renvoie** : number z (m)
- **renvoie** : integer id du noeud représentatif

#### `core_audioForest.getPersistedToolState()`

Renvoie l'état d'outil actuellement chargé.

- **renvoie** : table|nil État d'outil (voir setPersistedToolState)

#### `core_audioForest.onDeserialized(data)`

Hook après rechargement Lua : relit la configuration du niveau et reconstruit l'état.

- `data` (*table*) : Données de onSerialize (ignorées)

#### `core_audioForest.onSerialize()`

Hook de sérialisation avant rechargement Lua : renvoie une table vide.

- **renvoie** : table {}

#### `core_audioForest.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame par le système d'extensions : fait avancer la pré-passe de chargement, puis déplace l'émetteur principal et règle ses RTPC selon les noeuds proches de l'auditeur (SFXSystem.getPositionXYZ).

- `dtReal` (*number*) : Pas de temps réel (s)
- `dtSim` (*number*) : Pas de temps simulation (s)
- `dtRaw` (*number*) : Pas de temps brut (s)

#### `core_audioForest.setEnabled(v)`

Active ou désactive le système. À l'activation, crée l'émetteur principal s'il y a un événement et des noeuds ; à la désactivation, le supprime.

- `v` (*boolean*) : true pour activer

#### `core_audioForest.setMainEvent(eventName)`

Définit l'événement FMOD de l'émetteur principal (sans toucher à la roomtone). Chaîne vide : supprime l'émetteur. Sinon met à jour l'émetteur existant ou le crée si le système est actif et a des noeuds.

- `eventName` (*string|nil*) : Nom de l'événement FMOD

#### `core_audioForest.setNodeCloud(cloud)`

Installe un nuage de noeuds produit par audioForestCommon.buildNodeCloudFromForest (utilisé par l'éditeur ou le runtime). Récupère le terrain (core_terrain.getTerrain) et les paramètres globaux audio ; renvoie false et vide l'état si le nuage est invalide ou s'il n'y a pas de terrain.

- `cloud` (*table*) : Nuage : nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, kdNodes
- **renvoie** : boolean true si installé

#### `core_audioForest.setPersistedToolState(st)`

Mémorise l'état de l'outil d'édition pour la sauvegarde du niveau.

- `st` (*table|nil*) : Etat : version, mainEvent, roomtoneEnabled, roomtoneEvent, roomtoneZ, includeByShape, classSelByShape, classOverrideByShape, nodeVisDrawRadius, nodeVisSphereRadius, showNodes, selectedRow

#### `core_audioForest.setPitchDensityInv(v)`

Remplace la normalisation automatique du pitch (inverse du nombre de sources de référence). nil ou valeur <= 0 : revient à l'automatique.

- `v` (*number|nil*) : Facteur 1 / nombre de sources

#### `core_audioForest.setRoomtoneEnabled(v)`

Active ou coupe l'émetteur 'roomtone' indépendant (le crée s'il y a un événement roomtone).

- `v` (*boolean*) : true pour activer

#### `core_audioForest.setRoomtoneEvent(eventName)`

Définit l'événement de la roomtone. Sans effet visible tant que la roomtone n'est pas activée ; chaîne vide : supprime l'émetteur.

- `eventName` (*string|nil*) : Nom de l'événement FMOD

#### `core_audioForest.setRoomtoneZ(v)`

Fixe l'altitude de l'émetteur roomtone (positionné en x=0, y=0).

- `v` (*number|nil*) : Altitude en mètres, 0 par défaut

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `directoryExists`
- `Sim.` `upcast`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/audioForest.lua`.*
