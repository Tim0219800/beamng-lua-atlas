# `sounds`

*Fichier : `lua/vehicle/sounds.lua` · VM : Véhicule · 1462 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `sounds`

Sons du véhicule autres que le moteur : bruits de roulement et de dérapage des pneus (selon le matériau du sol : asphalte, terre, gravier, herbe, glace…), projections de gravillons (kickup), impacts et casses de carrosserie, frottements (scrapes), grincements de suspension par poutre (soundFile dans le jbeam), vent, sons de soundscape, banque de sons .sbeam pilotée par electrics, filtre d'habitacle. Fournit aussi les fonctions utilitaires pour créer et jouer des sources FMOD depuis un contrôleur ou un moteur (createSoundObj, playSoundOnceAtNode…) ainsi que les conversions Hz <-> échelle FMOD.

## Exemple

```lua
-- créer une boucle 3D sur le noeud 0 et la piloter
local snd = sounds.createSoundObj('event:>Vehicle>Aero>windbuffet', 'AudioDefaultLoop3D', 'MySound', 0)
snd:setVolumePitch(0.5, 0.3)
-- son ponctuel
sounds.playSoundOnceAtNode('event:>Destruction>Vehicle>vehicle_part_impact', 0, 0.8)
```

## Remarques

- Les valeurs volume/pitch/color/texture envoyées au moteur audio sont des paramètres normalisés (RTPC FMOD, en général 0..1), pas des Hz ni des dB. soundObj:setVolumePitch ignore les mises à jour trop petites (volume < 0.01 devient 0 ; écart de pitch < 0.0025 et de volume/color/texture < 0.01 -> pas d'appel).
- Chaîne de fonctionnement de la banque .sbeam : init() charge tous les *.sbeam du dossier 'sounds/' du véhicule (sinon 'vehicles/common/sounds/'), multiplie minVolume/maxVolume par 1.5 (sbeamVolumeFactor), remplace la valeur 'MAXRPM' par le plus grand maxSoundRPM du moteur, et active les sons dont group vaut 'default' ou v.data.engine.soundGroup. À chaque updateGFX la source (champ source : nom d'une valeur electrics, ou 'gear' pour drivetrain.gear) est transformée en volume/pitch via factor/offset, volumeBlendIn/Out*, pitchBlendIn*, minVolume/maxVolume, minPitch/maxPitch et les volumeModifiers/pitchModifiers.
- Clés jbeam lues dans la section 'sounds' : impactGeneric, impactMetal, impactPlastic, impactSoundVolumeCoef, breakGeneric, wind, windNode, scrapeMetal, scrapePlastic, cabinFilterCoef. Clés lues sur les poutres : soundFile, soundType, volumeFactor (1), pitchFactor (0), maxStress (35000), colorFactor (0.5), attackFactor (10), decayFactor (10), noiseFactor (0). Clés lues sur les noeuds : impactPlasticEvent, impactMetalEvent, impactGenericEvent, breakPlasticEvent, breakGenericEvent. Sur la roue : tireSoundVolumeCoef (0 coupe les bruits de pneus).
- Soundscape : v.data.soundscape[name] = {src, descriptor, node}. Le son 'horn' sert de noeud au vent s'il existe.
- Les sons de pneus sont créés pour chaque roue de wheels.wheels (events 'event:>Surfaces>roll_rigid_v2', 'skid_rigid_v2', 'roll_loose_v2', 'skid_loose_v2') ; paramètres statiques c_tirPrpVolRol, c_tirPrpPitch, c_tirPrpSizTrd, c_tirPrpVolSkd, c_tirPrpSoft ; c_objType vaut 0 joueur assis, 1 IA, 2 trafic (updateObjType).
- Bug/incohérence : soundObj:setParameter est déclarée avec (keyName, value) (le moteur appelle setSFXparameter(obj, keyName, value)). Le dummySoundObj renvoyé par createSoundObj quand la source ne peut pas être créée n'a que setVolumePitch : appeler setParameter dessus lève une erreur.
- Bug/incohérence : createSFXSource (module) remplace M.update, M.playSoundOnceAtNode et M.playSoundOnceFollowNode par nop en cas d'échec ; M.update n'existe pas ailleurs dans ce fichier (le hook réel est updateGFX).
- Bug mineur : breakPlasticEvent est utilisé (nœud ou valeur par défaut) mais aucune clé jbeam 'breakPlastic' de la section 'sounds' ne l'écrase, contrairement à breakGeneric.
- Valeurs numériques des surfaces (matériaux de sol) : 2 métal, 3 plastique, 4 caoutchouc, 6 bois, 10 asphalte, 11 asphalte mouillé, 14 terre poussiéreuse, 15 terre, 16 sable, 18 boue, 19 gravier, 20 herbe, 21 glace, 22 neige, 29 bande rugueuse, 30 pavés, 13 roche.
- Hz FMOD : la table interne fait correspondre 11 fréquences (20, 40, 80, 160, 330, 660, 1300, 2700, 5400, 11000, 22000 Hz) à des paliers de 100 (0..1000) ; hzToFMODHz interpole linéairement par segment. Ce code est dupliqué en C++ (trueforceDSP.cpp) : toute modification doit être reportée.
- M.objType est remis à -1 à la désérialisation (onDeserialized) pour forcer la renvoi des paramètres c_objType.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `sounds.FMODHzToHz(fmodHzValue)` | Conversion inverse de hzToFMODHz : valeur FMOD 0..1000 vers Hz. | 1329 |
| `sounds.bodyCollision(p)` | Gère le son de frottement (scrape) d'un noeud de carrosserie lors d'un contact : choisit l'événement selon le matériau (métal ou plastique), l'ignore sur les matériaux absorbants (caoutchouc, tissu, sable et boue pour les noeuds de roue) et règle volume, pitch, color et texture de la source. | 1045 |
| `sounds.createSFXSource(filename, description, SFXProfileName, nodeID)` | Crée une source audio brute (obj:createSFXSource) sans enveloppe soundObj. En cas d'échec, désactive playSoundOnceAtNode/FollowNode et logge un avertissement. | 195 |
| `sounds.createSoundObj(filename, description, SFXProfileName, nodeID)` | Crée une source audio FMOD (obj:createSFXSource) et la retourne enveloppée dans un soundObj, avec cache des dernières valeurs pour éviter les appels inutiles. Si la création échoue, renvoie un objet factice dont setVolumePitch ne fait rien. | 209 |
| `sounds.createSoundscapeSound(name)` | Crée la source d'un son de soundscape défini dans v.data.soundscape. Utilise le noeud du soundscape s'il est numérique, sinon refNode. | 104 |
| `sounds.disableOldEngineSounds()` | Vide la banque de sons .sbeam et empêche son rechargement : appelé par les moteurs qui utilisent le nouveau système de sons moteur. | 1308 |
| `sounds.getBeamSounds()` | Debug : renvoie la liste des sons de suspension par poutre (avec impulse, pitch, volume du dernier frame). | 1404 |
| `sounds.getEngineSoundData()` | Debug (éditeur de sons) : parcourt les moteurs ayant getSoundConfiguration et renvoie leurs configurations sonores. | 1408 |
| `sounds.hzToFMODHz(hzValue)` | Convertit une fréquence réelle en Hz (bornée à 20..22000) vers l'échelle FMOD 0..1000 (interpolation par segments de 100). Code dupliqué en C++ (trueforceDSP.cpp). | 1315 |
| `sounds.init()` | Réinitialise toutes les sources audio du véhicule (deleteSFXSources), charge les banques .sbeam, crée les sons de suspension par poutre, les sons de scrape, les sons de pneus et lit la section jbeam 'sounds'. Appelée au chargement du véhicule. *(interne)* | 1075 |
| `sounds.onDeserialized()` | Hook de désérialisation après rechargement du Lua véhicule : remet objType à -1 (tout M est sérialisé et restauré). *(interne)* *(hook)* | 1304 |
| `sounds.playSoundOnceAtNode(soundName, nodeID, volume, pitch, color, texture)` | Joue un son une seule fois à la position (statique) d'un noeud. Ignoré si le volume est < 0.01 ou le pitch < 0.0039. | 162 |
| `sounds.playSoundOnceFollowNode(soundName, nodeID, volume, pitch, color, texture)` | Comme playSoundOnceAtNode mais le son suit le noeud pendant sa lecture. | 169 |
| `sounds.playSoundSkipAI(sound, volume)` | Rejoue une source existante (volume puis cut + play), sauf si aucun joueur n'est assis et que l'IA conduit (le son est alors sauté). | 150 |
| `sounds.reset()` | Remet à zéro les sons de vent et de suspension, renvoie les paramètres statiques des pneus (le cache du GE est vidé à chaque reset) et met à jour c_objType. Appelée au reset du véhicule. *(interne)* | 1341 |
| `sounds.setUIDebug(enabled, data)` | Active ou désactive le rapport de debug audio vers l'UI (coûteux en performance, à réserver au debug). Le paramètre data n'est pas utilisé. | 1299 |
| `sounds.updateCabinFilter()` | Envoie au jeu (GE) la force du filtre d'habitacle de ce véhicule (cabinFilterCoef borné à 0..1) via core_sounds.setCabinFilterStrength. | 1069 |
| `sounds.updateGFX(dt)` | Boucle principale des sons (chaque frame graphique) : détection d'impacts/casses toutes les 0,04 s (obj:getImpactDeformEnergyNode), banque .sbeam, sons de suspension, vent (au-dessus de 3 m/s de vitesse relative au vent) et sons de roulement/dérapage/kickup de chaque roue. *(interne)* | 219 |
| `sounds.updateObjType()` | Détermine le type d'objet audio (0 joueur assis, 1 IA, 2 trafic) et, s'il a changé, renvoie le paramètre c_objType à tous les sons de pneus. *(interne)* | 1380 |

### Détail des paramètres

#### `sounds.FMODHzToHz(fmodHzValue)`

Conversion inverse de hzToFMODHz : valeur FMOD 0..1000 vers Hz.

- `fmodHzValue` (*number*) : Valeur sur l'échelle FMOD (bornée à 0..1000).
- **renvoie** : number Fréquence en Hz.

#### `sounds.bodyCollision(p)`

Gère le son de frottement (scrape) d'un noeud de carrosserie lors d'un contact : choisit l'événement selon le matériau (métal ou plastique), l'ignore sur les matériaux absorbants (caoutchouc, tissu, sable et boue pour les noeuds de roue) et règle volume, pitch, color et texture de la source.

- `p` (*table*) : Données de collision du moteur (id1, slipVel, normalForce, materialID1, materialID2).

#### `sounds.createSFXSource(filename, description, SFXProfileName, nodeID)`

Crée une source audio brute (obj:createSFXSource) sans enveloppe soundObj. En cas d'échec, désactive playSoundOnceAtNode/FollowNode et logge un avertissement.

- `filename` (*string*) : Fichier ou événement.
- `description` (*string*) : Descripteur audio.
- `SFXProfileName` (*string*) : Nom du profil SFX.
- `nodeID` (*integer*) : Noeud d'attache.
- **renvoie** : any|nil Identifiant de la source ou nil si échec.

#### `sounds.createSoundObj(filename, description, SFXProfileName, nodeID)`

Crée une source audio FMOD (obj:createSFXSource) et la retourne enveloppée dans un soundObj, avec cache des dernières valeurs pour éviter les appels inutiles. Si la création échoue, renvoie un objet factice dont setVolumePitch ne fait rien.

- `filename` (*string*) : Fichier ou événement FMOD (ex. 'event:>Surfaces>roll_rigid_v2').
- `description` (*string*) : Nom du descripteur audio (ex. 'AudioDefaultLoop3D').
- `SFXProfileName` (*string*) : Nom du profil SFX (peut être vide pour un événement FMOD).
- `nodeID` (*integer*) : Noeud sur lequel la source est attachée.
- **renvoie** : table soundObj (méthodes setVolumePitch, setParameter) ou objet factice.

#### `sounds.createSoundscapeSound(name)`

Crée la source d'un son de soundscape défini dans v.data.soundscape. Utilise le noeud du soundscape s'il est numérique, sinon refNode.

- `name` (*string*) : Nom du soundscape dans le jbeam.
- **renvoie** : any|nil Source audio, ou nil si le soundscape n'existe pas.

#### `sounds.getBeamSounds()`

Debug : renvoie la liste des sons de suspension par poutre (avec impulse, pitch, volume du dernier frame).

- **renvoie** : table Liste de tables {beam, clip, volumeFactor, pitchFactor, impulse, pitch, volume…}.

#### `sounds.getEngineSoundData()`

Debug (éditeur de sons) : parcourt les moteurs ayant getSoundConfiguration et renvoie leurs configurations sonores.

- **renvoie** : table Table indexée à partir de 0 : {reference, data, fundamentalFrequencyRPMCoef, engineIndex}.
- **renvoie** : table Liste de libellés 'nom (moteur) -> fichier blend'.

#### `sounds.hzToFMODHz(hzValue)`

Convertit une fréquence réelle en Hz (bornée à 20..22000) vers l'échelle FMOD 0..1000 (interpolation par segments de 100). Code dupliqué en C++ (trueforceDSP.cpp).

- `hzValue` (*number*) : Fréquence en Hz.
- **renvoie** : number Valeur sur l'échelle FMOD (0..1000).

#### `sounds.playSoundOnceAtNode(soundName, nodeID, volume, pitch, color, texture)`

Joue un son une seule fois à la position (statique) d'un noeud. Ignoré si le volume est < 0.01 ou le pitch < 0.0039.

- `soundName` (*string*) : Événement FMOD.
- `nodeID` (*integer*) : Noeud d'émission.
- `volume` (*number*) : Volume 0..1.
- `pitch` (*number|nil*) : Pitch normalisé (1 par défaut).
- `color` (*number|nil*) : Paramètre 'color' (0 par défaut).
- `texture` (*number|nil*) : Paramètre 'texture' (0 par défaut).

#### `sounds.playSoundOnceFollowNode(soundName, nodeID, volume, pitch, color, texture)`

Comme playSoundOnceAtNode mais le son suit le noeud pendant sa lecture.

- `soundName` (*string*) : Événement FMOD.
- `nodeID` (*integer*) : Noeud suivi.
- `volume` (*number*) : Volume 0..1.
- `pitch` (*number|nil*) : Pitch (1 par défaut).
- `color` (*number|nil*) : Paramètre 'color' (0 par défaut).
- `texture` (*number|nil*) : Paramètre 'texture' (0 par défaut).

#### `sounds.playSoundSkipAI(sound, volume)`

Rejoue une source existante (volume puis cut + play), sauf si aucun joueur n'est assis et que l'IA conduit (le son est alors sauté).

- `sound` (*any*) : Source audio obtenue par createSFXSource (déduit du code).
- `volume` (*number|nil*) : Volume (1 par défaut).

#### `sounds.setUIDebug(enabled, data)`

Active ou désactive le rapport de debug audio vers l'UI (coûteux en performance, à réserver au debug). Le paramètre data n'est pas utilisé.

- `enabled` (*boolean*) : Activer le rapport.
- `data` (*any*) : Non utilisé (todo dans le code).

#### `sounds.updateGFX(dt)`

Boucle principale des sons (chaque frame graphique) : détection d'impacts/casses toutes les 0,04 s (obj:getImpactDeformEnergyNode), banque .sbeam, sons de suspension, vent (au-dessus de 3 m/s de vitesse relative au vent) et sons de roulement/dérapage/kickup de chaque roue.

- `dt` (*number*) : Pas de temps de la frame (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `engineNode` | integer | Noeud d'émission des sons moteur : premier torqueReactionNodes du premier moteur, sinon le noeud ref. La déclaration initiale vaut nil, puis init() lui donne 0 ou un cid. |
| `objType` | integer | Type d'objet audio courant : 0 joueur assis, 1 IA seule, 2 trafic ; -1 force une mise à jour. |
| `refNode` | integer | Noeud de référence du véhicule (refNodes[0].ref ou leftCorner), 0 par défaut. Déclaré nil au départ, défini par init(). |
| `scrapeLoosenessMap` | table<integer, number> | Table matériau -> 'looseness' (0..0.9) du frottement : caoutchouc 0.05, roche 0.1, gravier 0.2, herbe 0.3, feuillage 0.4, feuillage fin 0.5, terre poussiéreuse 0.6, terre 0.7, boue 0.8, sable 0.9. Métal et bois valent 0 par défaut (absents). |
| `uiDebugging` | boolean | Vrai si le rapport de debug audio vers l'UI est activé (setUIDebug). |
| `usesOldCustomSounds` | boolean | Vrai si le véhicule a ses propres fichiers .sbeam (ancien système de sons personnalisés). |

## Classe `soundObj`

Enveloppe d'une source audio renvoyée par createSoundObj. Champs : obj (source brute), lastVol, lastPitch, lastColor, lastTexture.

| Méthode | Description | Ligne |
|---|---|---|
| `soundObj:setParameter(keyName, value)` | Règle un paramètre FMOD nommé (obj:setSFXparameter). Pour usage basse fréquence uniquement. La page automatique liste seulement 'value' mais la fonction prend (keyName, value). | 146 |
| `soundObj:setVolumePitch(vol, pitch, color, texture)` | Règle volume, pitch, color et texture (RTPC) de la source en évitant les appels redondants (volume < 0.01 devient 0). | 122 |

**Évènements UI (guihooks.trigger) :** `AudioDebug`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `createSFXSource`, `createSFXSource2`, `cutSFX`, `deleteSFXSources`, `getAirflowSpeed`, `getBeamStress`, `getBeamVelocity`, `getGroundSpeed`, `getID`, `getImpactDeformEnergyNode`, `inWater`, `playSFX`, `playSFXOnceCT`, `playSFXOnceStaticCT`, `queueGameEngineLua`, `setNodeVolumePitchCT`, `setSFXparameter`, `setVolume`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/sounds.lua`.*
