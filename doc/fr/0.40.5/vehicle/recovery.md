# `recovery`

*Fichier : `lua/vehicle/recovery.lua` · VM : Véhicule · 589 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `recovery`

Système de récupération (touche « recover ») du véhicule. En roulant, enregistre toutes les 0,2 s un historique de positions/orientations (jusqu'à 700 points, un point au moins 2 m après le précédent). Quand on maintient la récupération, le véhicule « rembobine » ce chemin à vitesse croissante (3 -> 20 -> 50 m/s) avec une caméra de récupération et un fil de fer des poutres, puis est téléporté au point atteint à la relâche. Gère aussi le point « home » (saveHome/loadHome) et le mode multijoueur (validation par le serveur).

## Exemple

```lua
recovery.saveHome()        -- mémorise la position actuelle comme home
recovery.loadHome(false)    -- y retourne
recovery.recoverInPlace()   -- remet le véhicule d'aplomb sur place
```

## Remarques

- Trois modes de M.updateGFX : updateGFXRecord (enregistrement, mode normal), updateGFXRecovery (rembobinage en cours), et nop (avant init). init() installe updateGFXRecord.
- Réglages internes : intervalle d'enregistrement 0.2 s, séparation minimale 2 m, vitesses de rembobinage 3/20/50 m/s (rampes 2.5 s puis 10 s), délai avant téléportation visuelle 0.5 s, historique 700 points. Un segment de plus de 20 m (400 m²) coupe le rembobinage net.
- Sans smart spawn : l'orientation est redressée si tangage > 80° ou roulis > 45° (la direction de cap est conservée). Avec smart spawn (réglage settings 'enableSmartRecovery', inversé par useAltMode) la téléportation passe par spawn.safeTeleport côté GE.
- M.recoveryHooksOnly = true : start/stopRecovering n'émettent que les hooks GE onStartRecovering / onStopRecovering(0) sans toucher au véhicule (utilisé dans le tutoriel First Drive).
- Hooks GE émis : onStartRecovering (début) et onStopRecovering(timer) (fin, timer = durée réelle de récupération en s). Appelle aussi core_recoveryCamera.beginRecoveryCamera / endRecoveryCamera / setRecoveryCameraPosRot.
- En multijoueur, startRecovering passe par multiplayer_vehicleSync.requestRecoveringBegin ; la suite dépend de onRecoveringBeginAllowed / onRecoveringBeginDenied, et le point final est validé par requestRecoveringCommit puis appliqué par mpApplyRecoveryPoint.
- Anomalie : M.recoveryPoints est un dequeue (pas un tableau simple) ; onDeserialized le reconstruit via dequeue.new(v.recoveryPoints). M.homePoint n'est pas déclaré à l'initialisation (nil jusqu'au premier saveHome ou au premier point d'enregistrement).
- Anomalie mineure : dans finishStopRecovering le chemin non-MP appelle applyRecoveryPoint(lastRecoveryPoint, useSmartSpawn, nil, player) : l'argument player est passé à la place de moveTraffic (4e paramètre), le 3e paramètre player est nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `recovery.afterStopRecovering(timer)` | Finalise une récupération : remet à zéro les poutres de flexmesh cassées, libère les noeuds fixés par le grabber, affiche le message adapté, ferme la caméra et émet le hook GE onStopRecovering. *(interne)* | 283 |
| `recovery.beginRecoveringPreview(useAltMode)` | Entre réellement en mode rembobinage : crée un point de départ, passe updateGFX sur updateGFXRecovery, émet le hook GE onStartRecovering. Appelé par startRecovering ou après autorisation MP. | 491 |
| `recovery.cancelRecoveringPreview()` | Annule la récupération en cours sans téléporter : remet l'enregistrement, réinitialise les matériaux et ferme la caméra de récupération. | 260 |
| `recovery.clear()` | Vide l'historique des points, supprime homePoint et invalide le dernier point de récupération. | 50 |
| `recovery.init(path)` | Passe en mode enregistrement, mémorise le nombre de poutres et précalcule les positions relatives des noeuds par rapport au noeud de référence (pour dessiner le fil de fer). *(interne)* | 559 |
| `recovery.loadHome(moveTraffic)` | Demande le retour au point home (ne fait rien s'il n'y en a pas). Passe par multiplayer_vehicleSync.requestLoadHome si présent, sinon rappelle loadHomeLocal côté véhicule. | 507 |
| `recovery.loadHomeLocal(moveTraffic)` | Téléporte immédiatement le véhicule au point home et affiche 'vehicle.recovery.loadHome'. Appelé par loadHome (ou le serveur MP). | 521 |
| `recovery.mpApplyRecoveryPoint(requestId, action, px, py, pz, fx, fy, fz, ux, uy, uz, useSmartSpawnParam, player, moveTraffic)` | Applique un point de récupération validé par le serveur multijoueur : téléporte le véhicule (smart spawn ou vehicleSetPositionRotation) puis notifie multiplayer_vehicleSync.onVehicleRecoveryApplied. *(interne)* | 180 |
| `recovery.onDeserialized(v)` | Hook de désérialisation (rechargement du Lua véhicule) : fusionne l'état sauvegardé dans M et reconstruit la file recoveryPoints. *(interne)* *(hook)* | 56 |
| `recovery.onRecoveringBeginAllowed(requestId, useAltMode)` | Hook appelé en multijoueur quand le serveur autorise la récupération : mémorise requestId et lance beginRecoveringPreview. *(interne)* *(hook)* | 546 |
| `recovery.onRecoveringBeginDenied()` | Hook appelé en multijoueur quand le serveur refuse la récupération : annule l'état d'attente. *(interne)* *(hook)* | 551 |
| `recovery.recoverInPlace()` | Remet le véhicule d'aplomb à sa position actuelle (point de récupération = état courant, appliqué tout de suite). | 555 |
| `recovery.saveHome(point)` | Mémorise un point home. Sans argument, utilise la position/orientation actuelle et affiche le message 'vehicle.recovery.saveHome'. | 223 |
| `recovery.startRecovering(useAltMode)` | Démarre la récupération (appui sur la touche). En solo lance directement beginRecoveringPreview ; en multijoueur demande d'abord l'autorisation au serveur. Ignoré si déjà en cours. | 527 |
| `recovery.stopRecovering(player)` | Demande l'arrêt de la récupération (relâche de la touche) ; l'arrêt effectif et la téléportation ont lieu à la prochaine updateGFX. | 274 |

### Détail des paramètres

#### `recovery.afterStopRecovering(timer)`

Finalise une récupération : remet à zéro les poutres de flexmesh cassées, libère les noeuds fixés par le grabber, affiche le message adapté, ferme la caméra et émet le hook GE onStopRecovering.

- `timer` (*number|string|nil*) : Durée de la récupération en secondes (défaut : durée mesurée).

#### `recovery.beginRecoveringPreview(useAltMode)`

Entre réellement en mode rembobinage : crée un point de départ, passe updateGFX sur updateGFXRecovery, émet le hook GE onStartRecovering. Appelé par startRecovering ou après autorisation MP.

- `useAltMode` (*boolean|nil*) : Voir startRecovering.

#### `recovery.init(path)`

Passe en mode enregistrement, mémorise le nombre de poutres et précalcule les positions relatives des noeuds par rapport au noeud de référence (pour dessiner le fil de fer).

- `path` (*string*) : Non utilisé (déduit du code).

#### `recovery.loadHome(moveTraffic)`

Demande le retour au point home (ne fait rien s'il n'y en a pas). Passe par multiplayer_vehicleSync.requestLoadHome si présent, sinon rappelle loadHomeLocal côté véhicule.

- `moveTraffic` (*boolean|nil*) : Transmis à spawn.safeTeleport : déplacer aussi le trafic gênant.

#### `recovery.loadHomeLocal(moveTraffic)`

Téléporte immédiatement le véhicule au point home et affiche 'vehicle.recovery.loadHome'. Appelé par loadHome (ou le serveur MP).

- `moveTraffic` (*boolean|nil*) : Voir loadHome.

#### `recovery.mpApplyRecoveryPoint(requestId, action, px, py, pz, fx, fy, fz, ux, uy, uz, useSmartSpawnParam, player, moveTraffic)`

Applique un point de récupération validé par le serveur multijoueur : téléporte le véhicule (smart spawn ou vehicleSetPositionRotation) puis notifie multiplayer_vehicleSync.onVehicleRecoveryApplied.

- `requestId` (*integer*) : Identifiant de la requête MP.
- `action` (*string*) : Nom de l'action renvoyé au serveur.
- `px` (*number*) : Position X (m).
- `py` (*number*) : Position Y (m).
- `pz` (*number*) : Position Z (m).
- `fx` (*number*) : Direction avant X.
- `fy` (*number*) : Direction avant Y.
- `fz` (*number*) : Direction avant Z.
- `ux` (*number*) : Direction haut X.
- `uy` (*number*) : Direction haut Y.
- `uz` (*number*) : Direction haut Z.
- `useSmartSpawnParam` (*boolean|nil*) : Forcer/interdire le smart spawn (sinon valeur interne).
- `player` (*any*) : Joueur concerné, transmis à safeTeleport.
- `moveTraffic` (*boolean|nil*) : Déplacer le trafic gênant.

#### `recovery.onDeserialized(v)`

Hook de désérialisation (rechargement du Lua véhicule) : fusionne l'état sauvegardé dans M et reconstruit la file recoveryPoints.

- `v` (*table*) : Données sauvegardées.

#### `recovery.onRecoveringBeginAllowed(requestId, useAltMode)`

Hook appelé en multijoueur quand le serveur autorise la récupération : mémorise requestId et lance beginRecoveringPreview.

- `requestId` (*integer*) : Identifiant de requête.
- `useAltMode` (*boolean|string*) : Mode alternatif (true ou la chaîne 'true').

#### `recovery.saveHome(point)`

Mémorise un point home. Sans argument, utilise la position/orientation actuelle et affiche le message 'vehicle.recovery.saveHome'.

- `point` (*table|nil*) : Point {pos, dirFront, dirUp} ; position actuelle si nil.

#### `recovery.startRecovering(useAltMode)`

Démarre la récupération (appui sur la touche). En solo lance directement beginRecoveringPreview ; en multijoueur demande d'abord l'autorisation au serveur. Ignoré si déjà en cours.

- `useAltMode` (*boolean|nil*) : Mode alternatif : inverse le réglage 'enableSmartRecovery' (faux par défaut).

#### `recovery.stopRecovering(player)`

Demande l'arrêt de la récupération (relâche de la touche) ; l'arrêt effectif et la téléportation ont lieu à la prochaine updateGFX.

- `player` (*any*) : Joueur à l'origine de la demande, transmis à la téléportation (déduit du code).

## Champs

| Champ | Type | Description |
|---|---|---|
| `recoveryHooksOnly` | boolean | Si vrai, l'entrée de récupération n'émet que les hooks sans modifier le véhicule (tutoriel First Drive). Faux par défaut. |
| `recoveryPoints` | dequeue | Historique des points de récupération ({pos=vec3, dirFront=vec3, dirUp=vec3}), du plus ancien (gauche) au plus récent (droite). |
| `updateGFX` | function | nop au chargement, puis remplacée par updateGFXRecord (enregistrement) ou updateGFXRecovery (rembobinage). ⚠ référence nop non définie dans le fichier (global du jeu). |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getId`, `getPositionXYZ`, `getRealdt`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/recovery.lua`.*
