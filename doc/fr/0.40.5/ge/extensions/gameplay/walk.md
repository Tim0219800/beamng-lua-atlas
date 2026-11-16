# `gameplay_walk`

*Fichier : `lua/ge/extensions/gameplay/walk.lua` · VM : Game Engine (GE) · 697 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_walk` : `extensions.load("gameplay_walk")`, puis la globale `gameplay_walk`

Mode « marche » du joueur : sortir du véhicule fait apparaître un véhicule spécial « unicycle » (le personnage) que le joueur contrôle à pied ; remonter dans un véhicule proche le désactive. Gère par joueur (multi-siège/écran partagé compris) l'unicycle, son visage (face part) et sa couleur, détecte le véhicule le plus proche à moins de 2 m (distance aux arêtes de sa boîte orientée), affiche le message « walkingmode » et expose une liste noire de véhicules. Un moddeur s'en sert pour téléporter/placer le joueur, forcer le mode marche ou l'interdire.

## Exemple

```lua
gameplay_walk.setWalkingMode(true, vec3(x, y, z), quat(0, 0, 0, 1), true) -- force le mode marche à une position
if gameplay_walk.isWalking() then gameplay_walk.getInVehicle(veh) end
gameplay_walk.addVehicleToBlacklist(vehId) -- ce véhicule ne sera pas proposé à l'entrée
```

## Remarques

- `player` est l'indice de joueur (0 par défaut) ; la plupart des fonctions acceptent nil et prennent 0.
- Le joueur est « à pied » quand son véhicule courant a le fichier jbeam « unicycle » (getCurrentUnicycle).
- Basculer : possible seulement si force, ou (vitesse de stationnement atteinte et toggling activé, action toggleWalkingMode non bloquée, replay pas en lecture). Seuils de vitesse : < 5 km/h devient « à l'arrêt », > 6 km/h devient « en mouvement » (hystérésis).
- Hook émis : onBeforeWalkingModeToggled(enabled, vehId|nil, player) avant le changement ; le message UI « Message » (catégorie cameramode) est vidé à l'entrée en mode marche.
- En multijoueur, toggleWalkingMode délègue à multiplayer_vehicleSync.requestWalkingMode.
- Si gameplay_seatOccupants existe, l'entrée dans un véhicule passe par requestEnterBestSeat et la sortie par getSeatExitData.
- Un dump(config) de débogage reste dans le code : il écrit la config dans les logs à chaque création d'unicycle.
- L'état interne `active[player]` n'est mis à jour que par onVehicleSwitched et onDeserialize : setRot ne fait rien tant que le joueur n'a pas déclenché un changement de véhicule.
- Le hook de restauration s'appelle onDeserialize (et non onDeserialized) dans ce fichier, tandis que la sérialisation s'appelle onSerialize : incohérence de nom possible selon ce que le gestionnaire d'extensions appelle (non vérifié ici).
- onClientEndMission vide les mémoires d'unicycles, de visages et de peintures ; onClientStartMission vide la liste noire et réactive le toggling.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_walk.addVehicleToBlacklist(vehId)` | Exclut un véhicule des candidats à l'entrée en mode marche. | 561 |
| `gameplay_walk.canSetWalkingMode(enabled, force, player)` | Comme canToggleWalkingMode, mais exige aussi que l'état demandé diffère de l'état actif. | 306 |
| `gameplay_walk.canToggleWalkingMode(force, player)` | Indique si le joueur peut changer de mode : force, ou vitesse de stationnement + toggling activé + action non bloquée + pas de lecture de replay. | 298 |
| `gameplay_walk.clearBlacklist()` | Vide la liste noire. | 573 |
| `gameplay_walk.enableToggling(enabled)` | Autorise ou interdit le basculement manuel entre véhicule et marche. | 553 |
| `gameplay_walk.getBlacklist()` | Renvoie la table de la liste noire (id -> true), pas une copie. | 577 |
| `gameplay_walk.getCurrentUnicycle(player)` | Renvoie l'unicycle que le joueur contrôle en ce moment, qu'il soit ou non celui mémorisé dans unicycleIds. | 114 |
| `gameplay_walk.getDoorsidePosRot(veh)` | Calcule une position près de la portière conducteur d'un véhicule (côté gauche ou droit selon la conduite), orientée vers le centre du véhicule. | 215 |
| `gameplay_walk.getFacePart(player)` | Visage du personnage. Priorité : pièce de l'unicycle (sélecteur de pièces), réglage playerCharacterFace (par persona en écran partagé), dernier visage connu, visage aléatoire. | 135 |
| `gameplay_walk.getInVehicle(vehicle, player)` | Fait monter le joueur dans un véhicule (be:enterVehicle) en mémorisant son unicycle actuel. | 252 |
| `gameplay_walk.getPaint(player)` | Peinture du personnage. Priorité : peinture du persona (multi-siège), peinture de l'unicycle (menu de config), dernière peinture connue, couleur enregistrée playerCharacterColor. | 150 |
| `gameplay_walk.getPosRot(player)` | Position de l'unicycle et orientation de la caméra du joueur à pied. | 530 |
| `gameplay_walk.getPosXYZ(player)` | Position de l'unicycle en trois nombres (sans allocation). | 538 |
| `gameplay_walk.getRotXYZW(player)` | Orientation de la caméra du joueur à pied en quatre nombres. | 546 |
| `gameplay_walk.getStoredUnicycleId(player)` | Id de l'unicycle mémorisé pour ce joueur (même s'il est inactif, par exemple pendant qu'il conduit). | 357 |
| `gameplay_walk.getVehicleInFront(player)` | Véhicule le plus proche (moins de 2 m) que le joueur à pied peut rejoindre. | 510 |
| `gameplay_walk.isAtParkingSpeed(player)` | Indique si le véhicule le plus proche (ou celui du joueur) est assez lent pour permettre de basculer en mode marche. | 181 |
| `gameplay_walk.isTogglingEnabled()` | Indique si le basculement est autorisé. | 557 |
| `gameplay_walk.isVehicleBlacklisted(vehId)` | Teste si un véhicule est dans la liste noire. | 569 |
| `gameplay_walk.isWalking(player)` | Indique si le joueur contrôle actuellement un unicycle. | 177 |
| `gameplay_walk.onCameraChanged(player, camName, vid)` | Hook appelé au changement de caméra d'un joueur : masque l'unicycle dans la vue du joueur quand il utilise la caméra unicycle, ou quand la transition de la grande carte s'éloigne de lui. *(interne)* *(hook)* | 598 |
| `gameplay_walk.onClientEndMission(levelPath)` | Hook appelé à la fin d'un niveau : oublie unicycles, visages et peintures. *(interne)* *(hook)* | 586 |
| `gameplay_walk.onClientStartMission(levelPath)` | Hook appelé au début d'un niveau : vide la liste noire, réactive le toggling. *(interne)* *(hook)* | 581 |
| `gameplay_walk.onDeserialize(data)` | Restaure l'état sérialisé et recalcule quels joueurs sont à pied. *(interne)* *(hook)* | 518 |
| `gameplay_walk.onSerialize()` | Hook de sauvegarde avant rechargement des extensions : toggling, liste noire, unicycles, visages, peintures. *(interne)* *(hook)* | 514 |
| `gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode)` | Hook appelé quand l'écran partagé change : reconfigure les couleurs des unicycles. *(interne)* *(hook)* | 593 |
| `gameplay_walk.onUpdate(dtReal, dtSim)` | Hook appelé à chaque image : pour chaque joueur, cherche le véhicule proche, met à jour la vitesse de stationnement et affiche/retire le message « walkingmode ». *(interne)* *(hook)* | 502 |
| `gameplay_walk.onVehicleColorChanged(vehId, index, paint)` | Hook appelé quand la couleur d'un véhicule change : si c'est l'unicycle d'un joueur (hors multi-siège), enregistre la peinture dans le réglage playerCharacterColor. *(interne)* *(hook)* | 628 |
| `gameplay_walk.onVehicleDestroyed(vehId)` | Hook appelé à la destruction d'un véhicule : oublie l'unicycle correspondant. *(interne)* *(hook)* | 654 |
| `gameplay_walk.onVehicleReplaced(vehId)` | Hook appelé quand un véhicule est remplacé : oublie l'unicycle correspondant. *(interne)* *(hook)* | 650 |
| `gameplay_walk.onVehicleSwitched(oldId, newId, player)` | Hook appelé quand un joueur change de véhicule : désactive l'ancien unicycle mémorisé et met à jour l'état actif. *(interne)* *(hook)* | 617 |
| `gameplay_walk.removeVehicleFromBlacklist(vehId)` | Retire un véhicule de la liste noire. | 565 |
| `gameplay_walk.setFacePart(player, facePart)` | Change le visage. Si le joueur est à pied, son unicycle est reconfiguré ; sinon l'unicycle mémorisé est supprimé et sera recréé plus tard. | 163 |
| `gameplay_walk.setRot(front, up, player)` | Oriente la caméra/le personnage à pied via les données de la caméra unicycle. Sans effet si le joueur n'est pas actif en mode marche. | 287 |
| `gameplay_walk.setWalkingMode(enabled, pos, rot, force, player)` | Active ou désactive le mode marche. À l'activation, fait apparaître ou réactive l'unicycle à pos (sinon près de la portière ou au siège quitté) et y place le joueur. À la désactivation, monte dans le véhicule proche, ou désactive simplement l'unicycle. | 311 |
| `gameplay_walk.toggleWalkingMode(player)` | Bascule le mode marche (appelé par l'action d'entrée). Ne fait rien si le joueur marche sans véhicule à proximité ; en multijoueur, passe par multiplayer_vehicleSync. | 361 |

### Détail des paramètres

#### `gameplay_walk.addVehicleToBlacklist(vehId)`

Exclut un véhicule des candidats à l'entrée en mode marche.

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_walk.canSetWalkingMode(enabled, force, player)`

Comme canToggleWalkingMode, mais exige aussi que l'état demandé diffère de l'état actif.

- `enabled` (*boolean*) : État demandé.
- `force` (*boolean|nil*) : Ignore les restrictions.
- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : boolean 

#### `gameplay_walk.canToggleWalkingMode(force, player)`

Indique si le joueur peut changer de mode : force, ou vitesse de stationnement + toggling activé + action non bloquée + pas de lecture de replay.

- `force` (*boolean|nil*) : Ignore toutes les restrictions.
- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : boolean 

#### `gameplay_walk.enableToggling(enabled)`

Autorise ou interdit le basculement manuel entre véhicule et marche.

- `enabled` (*boolean*) : true pour autoriser.

#### `gameplay_walk.getBlacklist()`

Renvoie la table de la liste noire (id -> true), pas une copie.

- **renvoie** : table<integer, boolean> 

#### `gameplay_walk.getCurrentUnicycle(player)`

Renvoie l'unicycle que le joueur contrôle en ce moment, qu'il soit ou non celui mémorisé dans unicycleIds.

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : userdata|nil Objet véhicule unicycle, nil sinon.

#### `gameplay_walk.getDoorsidePosRot(veh)`

Calcule une position près de la portière conducteur d'un véhicule (côté gauche ou droit selon la conduite), orientée vers le centre du véhicule.

- `veh` (*userdata*) : Objet véhicule.
- **renvoie** : vec3 Position.
- **renvoie** : vec3 Direction avant (z = 0).
- **renvoie** : vec3 Vecteur haut (0,0,1).

#### `gameplay_walk.getFacePart(player)`

Visage du personnage. Priorité : pièce de l'unicycle (sélecteur de pièces), réglage playerCharacterFace (par persona en écran partagé), dernier visage connu, visage aléatoire.

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : string Nom de la pièce skin_character_face.

#### `gameplay_walk.getInVehicle(vehicle, player)`

Fait monter le joueur dans un véhicule (be:enterVehicle) en mémorisant son unicycle actuel.

- `vehicle` (*userdata*) : Véhicule à rejoindre.
- `player` (*integer|nil*) : Indice de joueur.

#### `gameplay_walk.getPaint(player)`

Peinture du personnage. Priorité : peinture du persona (multi-siège), peinture de l'unicycle (menu de config), dernière peinture connue, couleur enregistrée playerCharacterColor.

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : table Peinture de véhicule.

#### `gameplay_walk.getPosRot(player)`

Position de l'unicycle et orientation de la caméra du joueur à pied.

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : vec3|nil Position.
- **renvoie** : quat|nil Rotation caméra.

#### `gameplay_walk.getPosXYZ(player)`

Position de l'unicycle en trois nombres (sans allocation).

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : number|nil x, y, z (nil si le joueur n'est pas à pied).

#### `gameplay_walk.getRotXYZW(player)`

Orientation de la caméra du joueur à pied en quatre nombres.

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : number|nil x, y, z, w (nil si le joueur n'est pas à pied).

#### `gameplay_walk.getStoredUnicycleId(player)`

Id de l'unicycle mémorisé pour ce joueur (même s'il est inactif, par exemple pendant qu'il conduit).

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : integer|nil 

#### `gameplay_walk.getVehicleInFront(player)`

Véhicule le plus proche (moins de 2 m) que le joueur à pied peut rejoindre.

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : userdata|nil 

#### `gameplay_walk.isAtParkingSpeed(player)`

Indique si le véhicule le plus proche (ou celui du joueur) est assez lent pour permettre de basculer en mode marche.

- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : boolean false seulement si la vitesse a dépassé 6 km/h sans repasser sous 5 km/h.

#### `gameplay_walk.isTogglingEnabled()`

Indique si le basculement est autorisé.

- **renvoie** : boolean 

#### `gameplay_walk.isVehicleBlacklisted(vehId)`

Teste si un véhicule est dans la liste noire.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : boolean|nil true ou nil.

#### `gameplay_walk.isWalking(player)`

Indique si le joueur contrôle actuellement un unicycle.

- `player` (*integer|nil*) : Indice de joueur (0 par défaut).
- **renvoie** : boolean 

#### `gameplay_walk.onCameraChanged(player, camName, vid)`

Hook appelé au changement de caméra d'un joueur : masque l'unicycle dans la vue du joueur quand il utilise la caméra unicycle, ou quand la transition de la grande carte s'éloigne de lui.

- `player` (*integer*) : Indice de joueur.
- `camName` (*string*) : Nom du mode de caméra.
- `vid` (*integer|nil*) : Id du véhicule suivi.

#### `gameplay_walk.onClientEndMission(levelPath)`

Hook appelé à la fin d'un niveau : oublie unicycles, visages et peintures.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_walk.onClientStartMission(levelPath)`

Hook appelé au début d'un niveau : vide la liste noire, réactive le toggling.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_walk.onDeserialize(data)`

Restaure l'état sérialisé et recalcule quels joueurs sont à pied.

- `data` (*table*) : Table de onSerialize.

#### `gameplay_walk.onSerialize()`

Hook de sauvegarde avant rechargement des extensions : toggling, liste noire, unicycles, visages, peintures.

- **renvoie** : table {togglingEnabled, vehicleBlacklist, unicycleIds, faceParts, paints}

#### `gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode)`

Hook appelé quand l'écran partagé change : reconfigure les couleurs des unicycles.

- `enabled` (*boolean*) : Écran partagé actif.
- `playerCount` (*integer*) : Nombre de joueurs.
- `layout` (*any*) : Disposition.
- `mode` (*any*) : Mode.

#### `gameplay_walk.onUpdate(dtReal, dtSim)`

Hook appelé à chaque image : pour chaque joueur, cherche le véhicule proche, met à jour la vitesse de stationnement et affiche/retire le message « walkingmode ».

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_walk.onVehicleColorChanged(vehId, index, paint)`

Hook appelé quand la couleur d'un véhicule change : si c'est l'unicycle d'un joueur (hors multi-siège), enregistre la peinture dans le réglage playerCharacterColor.

- `vehId` (*integer*) : Id du véhicule.
- `index` (*integer*) : Indice de peinture (seul 1 est pris en compte).
- `paint` (*table*) : Peinture.

#### `gameplay_walk.onVehicleDestroyed(vehId)`

Hook appelé à la destruction d'un véhicule : oublie l'unicycle correspondant.

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_walk.onVehicleReplaced(vehId)`

Hook appelé quand un véhicule est remplacé : oublie l'unicycle correspondant.

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_walk.onVehicleSwitched(oldId, newId, player)`

Hook appelé quand un joueur change de véhicule : désactive l'ancien unicycle mémorisé et met à jour l'état actif.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer|nil*) : Indice de joueur.

#### `gameplay_walk.removeVehicleFromBlacklist(vehId)`

Retire un véhicule de la liste noire.

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_walk.setFacePart(player, facePart)`

Change le visage. Si le joueur est à pied, son unicycle est reconfiguré ; sinon l'unicycle mémorisé est supprimé et sera recréé plus tard.

- `player` (*integer|nil*) : Indice de joueur.
- `facePart` (*string*) : Nom de la pièce de visage.

#### `gameplay_walk.setRot(front, up, player)`

Oriente la caméra/le personnage à pied via les données de la caméra unicycle. Sans effet si le joueur n'est pas actif en mode marche.

- `front` (*vec3*) : Direction avant.
- `up` (*vec3*) : Direction haut.
- `player` (*integer|nil*) : Indice de joueur.

#### `gameplay_walk.setWalkingMode(enabled, pos, rot, force, player)`

Active ou désactive le mode marche. À l'activation, fait apparaître ou réactive l'unicycle à pos (sinon près de la portière ou au siège quitté) et y place le joueur. À la désactivation, monte dans le véhicule proche, ou désactive simplement l'unicycle.

- `enabled` (*boolean*) : true pour marcher.
- `pos` (*vec3|nil*) : Position d'apparition (facultative).
- `rot` (*quat|nil*) : Orientation de départ (facultative).
- `force` (*boolean|nil*) : Ignore les restrictions de bascule.
- `player` (*integer|nil*) : Indice de joueur.
- **renvoie** : boolean true si l'état demandé est atteint (false si bloqué).
- **renvoie** : integer|nil Id de l'unicycle courant.

#### `gameplay_walk.toggleWalkingMode(player)`

Bascule le mode marche (appelé par l'action d'entrée). Ne fait rien si le joueur marche sans véhicule à proximité ; en multijoueur, passe par multiplayer_vehicleSync.

- `player` (*integer|nil*) : Indice de joueur (ignoré si négatif).

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeWalkingModeToggled` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `exitVehicle`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/walk.lua`.*
