# `controller_sound_linearMovement`

*Fichier : `lua/vehicle/controller/sound/linearMovement.lua` · VM : Véhicule · 283 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `sound/linearMovement` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de sons pour un mouvement linéaire (vérin, siège, plateau, béquille…). Il mesure la longueur d'une poutre « capteur de position » (trouvée par tag), en déduit une vitesse lissée et joue : une boucle de mouvement (volume/pitch selon la vitesse, paramètre CT = direction), des sons de segment à chaque cran de segmentLength (montée/descente) et des sons de fin de course (position min/max).

## Remarques

- Clés jbeam lues dans init : hasSegments (false), hasEndstops (false), positionSensorBeamTag (obligatoire : poutre dont la longueur donne la position), segmentLength, minPosition (0), maxPosition (0), positionCalibration (0), velocitySmoothing (5), absVelocitySmoothing (5), absVelocitySmoothingIn / absVelocitySmoothingOut (= absVelocitySmoothing), debugMode (false).
- Clés lues dans initSounds : movementSoundVolume (1), movementSoundEvent (boucle, facultatif), segmentIncSoundEvent / segmentDecSoundEvent (défaut segmentSoundEvent), minPositionSoundEvent, maxPositionSoundEvent, movementSoundNode_nodes (premier élément, sinon 0), movementSoundPitchMinVelocity (0), movementSoundPitchMaxVelocity (2), movementSoundMinPitch (0), movementSoundMaxPitch (1), movementSoundVolumeCoefMinVelocity (0.05), movementSoundVolumeCoefMaxVelocity (0.1), movementSoundPlayingThresholdVelocity (0.05), movementSoundPlayingThresholdVolume (0.05).
- Les trois valeurs movementSoundVolumeCoefMinVelocity, movementSoundPlayingThresholdVelocity et movementSoundPlayingThresholdVolume doivent être > 0, sinon log E et updateGFX devient nop.
- Les vitesses et positions sont en m et m/s (longueur de poutre).
- Si la poutre capteur est introuvable, init s'arrête avec un log E et updateGFX reste nop.
- Incohérence : l'ordre d'appel suppose initSounds après init (positionSensorBeamCid est utilisé par initEndstops dans initSounds, et reset lit la longueur de la poutre sans test nil si init a échoué).
- Les valeurs de debug (debugMode) impriment une ligne par frame.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_sound_linearMovement.init(jbeamData)` | Retrouve la poutre capteur par tag, lit la configuration de segments/butées et crée les lisseurs de vitesse. *(interne)* | 236 |
| `controller_sound_linearMovement.initSounds(jbeamData)` | Crée la boucle de mouvement et lit les évènements et réglages sonores ; valide les seuils. Appelé par le moteur à l'initialisation des sons. *(interne)* | 178 |
| `controller_sound_linearMovement.reset(jbeamData)` | Remet la dernière longueur, le segment et les lisseurs à l'état initial. *(interne)* | 171 |
| `controller_sound_linearMovement.resetSounds(jbeamData)` | Arrête la boucle et réarme les sons de butée selon la position actuelle. *(interne)* | 163 |

### Détail des paramètres

#### `controller_sound_linearMovement.init(jbeamData)`

Retrouve la poutre capteur par tag, lit la configuration de segments/butées et crée les lisseurs de vitesse.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_sound_linearMovement.initSounds(jbeamData)`

Crée la boucle de mouvement et lit les évènements et réglages sonores ; valide les seuils. Appelé par le moteur à l'initialisation des sons.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_sound_linearMovement.reset(jbeamData)`

Remet la dernière longueur, le segment et les lisseurs à l'état initial.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_sound_linearMovement.resetSounds(jbeamData)`

Arrête la boucle et réarme les sons de butée selon la position actuelle.

- `jbeamData` (*table*) : Données jbeam.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function | nop au chargement, puis updateGFX interne après init réussi. |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource2`, `getBeamLength`, `playSFX`, `playSFXOnceCT`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/sound/linearMovement.lua`.*
