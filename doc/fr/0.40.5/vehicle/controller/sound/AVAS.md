# `controller_sound_AVAS`

*Fichier : `lua/vehicle/controller/sound/AVAS.lua` · VM : Véhicule · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `sound/AVAS` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de système d'alerte sonore pour piétons (AVAS) des véhicules électriques. Joue une boucle « avant » en modes D/S, une boucle « arrière » en R, et rien sinon ou au-dessus de la vitesse maximale (+1 m/s) ; le paramètre de pitch/volume dépend de la vitesse.

## Remarques

- Clés jbeam lues dans initSounds : forwardSoundEvent ("event:>Engine>Pedestrian Warning>Forward_01"), reverseSoundEvent ("..._Reverse_01"), forwardSoundNode_nodes et reverseSoundNode_nodes (premier élément = nœud, 0 sinon), warningMaxSpeed (50/3.6 m/s), warningVolume (0.5).
- Lit electrics.values.gear (nom du rapport) et wheelspeed. Le paramètre CT (ControlTrigger) de vitesse est linéaire de 0 à warningMaxSpeed.
- reset appelle obj:stopSFX sur des sources qui ne sont créées que dans initSounds (nil possible si reset est appelé avant).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_sound_AVAS.init(jbeamData)` | Ne fait rien (la configuration est lue dans initSounds). *(interne)* | 62 |
| `controller_sound_AVAS.initSounds(jbeamData)` | Crée les deux sources sonores en boucle et lit vitesse maximale et volume. Appelé par le moteur à l'initialisation des sons. *(interne)* | 65 |
| `controller_sound_AVAS.reset()` | Arrête les deux sons et remet l'état à « stopped ». *(interne)* | 56 |
| `controller_sound_AVAS.updateGFX(dt)` | Chaque frame : choisit l'état (avant/arrière/arrêté) selon le rapport et la vitesse, joue/arrête les sons et ajuste le paramètre de vitesse. *(interne)* | 22 |

### Détail des paramètres

#### `controller_sound_AVAS.init(jbeamData)`

Ne fait rien (la configuration est lue dans initSounds).

- `jbeamData` (*table*) : Données jbeam.

#### `controller_sound_AVAS.initSounds(jbeamData)`

Crée les deux sources sonores en boucle et lit vitesse maximale et volume. Appelé par le moteur à l'initialisation des sons.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_sound_AVAS.updateGFX(dt)`

Chaque frame : choisit l'état (avant/arrière/arrêté) selon le rapport et la vitesse, joue/arrête les sons et ajuste le paramètre de vitesse.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource2`, `playSFX`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/sound/AVAS.lua`.*
