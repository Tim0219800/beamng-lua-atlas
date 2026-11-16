# `freeroam_crashCamMode`

*Fichier : `lua/ge/extensions/freeroam/crashCamMode.lua` · VM : Game Engine (GE) · 734 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_crashCamMode` : `extensions.load("freeroam_crashCamMode")`, puis la globale `freeroam_crashCamMode`

Caméra de crash (ralenti automatique) du mode freeroam. Chaque image, il prédit (0,2 s à l'avance) si le véhicule du joueur va percuter un véhicule de trafic/garé, un mur (rayons statiques) ou subit un brusque changement de vitesse ; si la différence de vitesse dépasse 13 m/s, il passe en ralenti (simTimeAuthority 0,15), cache l'interface et bascule sur la caméra 'crash' ou sur un chemin de caméra. Il restaure ensuite vitesse, interface et caméra précédentes et émet onCrashCamEnded. Chargé par freeroam_crashCamModeLoader selon le réglage enableCrashCam.

## Exemple

```lua
-- forcer l'activation hors freeroam (par ex. pour un scénario) et suivre aussi les véhicules non-trafic
freeroam_crashCamMode.setForcedEnabled(true)
freeroam_crashCamMode.setTrackingMode(2)
```

## Remarques

- Constantes : seuil de vitesse 13 m/s, délai minimal entre deux déclenchements 1 s, durée 4 s, anticipation 0,2 s, boîtes englobantes réduites à 85 %, vérification de vitesse toutes les 0,1 s (seuil +3 m/s).
- Trois modes de crash tirés au hasard : 1 (45 %) caméra proche au-dessus, fixe ; 2 (45 %) caméra au sol qui tourne ; 3 (10 %, seulement si plus de 5 s depuis le dernier crash cam) temps figé pendant que la caméra tourne autour du point d'impact via core_paths.playPath. Les crashs contre un mur ou par variation de vitesse n'utilisent que les modes 1 et 2.
- Modes de suivi (trackingMode) : 1 = joueur contre trafic, véhicules garés, murs et variation de vitesse ; 2 = joueur contre tous les véhicules actifs et murs.
- La détection est ignorée si : une relecture (replay) est en lecture, la caméra libre est active, le temps de simulation n'est pas à 1, le joueur vient d'être téléporté ou il n'y a pas de véhicule joueur.
- Hors état de jeu 'freeroam' (et sans forcedEnabled), onUpdate met crashCamEnabled à false de façon définitive jusqu'au prochain onClientStartMission en freeroam ou à la fin d'une mission (onAnyMissionChanged 'stopped').
- onExtensionLoaded renvoie false si enableCrashCam est désactivé (l'extension ne reste pas chargée dans ce cas, sauf si le moteur ignore la valeur).
- En VR (render_openxr en cours), le retour automatique à la caméra 'external' quand le véhicule sort du champ n'est pas fait.
- rolloverCheck (retournement) est défini mais son appel est commenté dans onUpdate : jamais utilisé.
- Le hook onCrashCamEnded n'est émis que si previousCamMode n'est pas nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_crashCamMode.getTrackingMode()` | Renvoie le mode de suivi actuel. | 707 |
| `freeroam_crashCamMode.onAnyMissionChanged(state)` | Hook appelé quand une mission change d'état : désactive la caméra de crash au démarrage ('started'), la réactive à l'arrêt ('stopped'). *(interne)* *(hook)* | 691 |
| `freeroam_crashCamMode.onBeforeBigMapActivated()` | Hook appelé juste avant l'ouverture de la grande carte : arrête la caméra de crash. *(interne)* *(hook)* | 668 |
| `freeroam_crashCamMode.onBeforeMenuOpened()` | Hook appelé avant l'ouverture d'un menu : arrête la caméra de crash si elle est active. *(interne)* *(hook)* | 678 |
| `freeroam_crashCamMode.onClientEndMission(levelPath)` | Hook appelé à la fin du niveau : désactive la caméra de crash. *(interne)* *(hook)* | 643 |
| `freeroam_crashCamMode.onClientStartMission()` | Hook appelé au démarrage du niveau : active la caméra de crash si l'état de jeu est 'freeroam'. *(interne)* *(hook)* | 647 |
| `freeroam_crashCamMode.onExtensionLoaded()` | Hook appelé au chargement : renvoie false si le réglage enableCrashCam est désactivé. *(interne)* *(hook)* | 653 |
| `freeroam_crashCamMode.onExtensionUnloaded()` | Hook appelé au déchargement : arrête proprement la caméra de crash (restaure vitesse, interface et caméra). *(interne)* *(hook)* | 657 |
| `freeroam_crashCamMode.onReplayStateChanged(state)` | Hook appelé quand l'état du replay change : arrête la caméra de crash. *(interne)* *(hook)* | 635 |
| `freeroam_crashCamMode.onSerialize()` | Hook appelé avant un rechargement des extensions : arrête la caméra de crash. *(interne)* *(hook)* | 639 |
| `freeroam_crashCamMode.onTogglePause()` | Hook appelé à la mise en pause ou reprise du jeu : arrête la caméra de crash si elle est active. *(interne)* *(hook)* | 672 |
| `freeroam_crashCamMode.onUpdate(dtReal, dtSim)` | Hook appelé à chaque image : détecte les crashs imminents (trafic, mur, variation de vitesse) quand la caméra de crash est inactive ; quand elle est active, suit sa durée, vérifie l'impact entre véhicules, lance le chemin de caméra en mode 3 et l'arrête après 4 s ou en cas de téléportation. *(interne)* *(hook)* | 535 |
| `freeroam_crashCamMode.onVehicleResetted(vehId)` | Hook appelé quand un véhicule est remis en place : arrête la caméra de crash si c'est le véhicule du joueur. *(interne)* *(hook)* | 629 |
| `freeroam_crashCamMode.onVehicleSwitched(oldVehId)` | Hook appelé au changement de véhicule joueur : si la caméra de crash est active, remet la caméra précédente sur l'ancien véhicule, puis arrête la caméra de crash. *(interne)* *(hook)* | 684 |
| `freeroam_crashCamMode.setForcedEnabled(enabled)` | Force l'exécution de la détection même hors freeroam ou si la caméra de crash est désactivée. | 711 |
| `freeroam_crashCamMode.setTrackingMode(mode)` | Choisit le mode de suivi (1 ou 2, voir notes). | 703 |
| `freeroam_crashCamMode.trackCamMode()` | À appeler quand l'utilisateur change de mode de caméra : arrête la caméra de crash si elle est active (aucun appelant dans ce fichier). | 662 |
| `freeroam_crashCamMode.trackVehReset()` | Arrête la caméra de crash (appelée en cas de reset du véhicule ; contrairement à onVehicleResetted, ne vérifie pas quel véhicule). | 699 |

### Détail des paramètres

#### `freeroam_crashCamMode.getTrackingMode()`

Renvoie le mode de suivi actuel.

- **renvoie** : integer 1 (trafic et murs) ou 2 (tous les véhicules actifs et murs).

#### `freeroam_crashCamMode.onAnyMissionChanged(state)`

Hook appelé quand une mission change d'état : désactive la caméra de crash au démarrage ('started'), la réactive à l'arrêt ('stopped').

- `state` (*string*) : État de la mission : 'started' ou 'stopped' (les autres valeurs sont ignorées).

#### `freeroam_crashCamMode.onClientEndMission(levelPath)`

Hook appelé à la fin du niveau : désactive la caméra de crash.

- `levelPath` (*string*) : Chemin du niveau quitté (non utilisé).

#### `freeroam_crashCamMode.onExtensionLoaded()`

Hook appelé au chargement : renvoie false si le réglage enableCrashCam est désactivé.

- **renvoie** : boolean|nil false si désactivée, nil sinon.

#### `freeroam_crashCamMode.onReplayStateChanged(state)`

Hook appelé quand l'état du replay change : arrête la caméra de crash.

- `state` (*string*) : Nouvel état du replay (non utilisé).

#### `freeroam_crashCamMode.onUpdate(dtReal, dtSim)`

Hook appelé à chaque image : détecte les crashs imminents (trafic, mur, variation de vitesse) quand la caméra de crash est inactive ; quand elle est active, suit sa durée, vérifie l'impact entre véhicules, lance le chemin de caméra en mode 3 et l'arrête après 4 s ou en cas de téléportation.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation écoulé (s).

#### `freeroam_crashCamMode.onVehicleResetted(vehId)`

Hook appelé quand un véhicule est remis en place : arrête la caméra de crash si c'est le véhicule du joueur.

- `vehId` (*integer*) : Id du véhicule réinitialisé.

#### `freeroam_crashCamMode.onVehicleSwitched(oldVehId)`

Hook appelé au changement de véhicule joueur : si la caméra de crash est active, remet la caméra précédente sur l'ancien véhicule, puis arrête la caméra de crash.

- `oldVehId` (*integer*) : Id de l'ancien véhicule du joueur.

#### `freeroam_crashCamMode.setForcedEnabled(enabled)`

Force l'exécution de la détection même hors freeroam ou si la caméra de crash est désactivée.

- `enabled` (*boolean*) : true pour forcer.

#### `freeroam_crashCamMode.setTrackingMode(mode)`

Choisit le mode de suivi (1 ou 2, voir notes).

- `mode` (*integer*) : 1 ou 2.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCrashCamEnded` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`
- `be:` `getObjectActive`, `getObjectOOBBAxisNormalizedXYZ`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getObjectPositionXYZ`, `getObjectVelocityXYZ`, `getPlayerVehicleID`
- `obj:` `getSpawnWorldOOBB`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/crashCamMode.lua`.*
