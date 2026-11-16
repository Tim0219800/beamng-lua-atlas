# `ui_ambientSound`

*Fichier : `lua/ge/extensions/ui/ambientSound.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_ambientSound` : `extensions.load("ui_ambientSound")`, puis la globale `ui_ambientSound`

Petit gestionnaire de « flux » de sons d'ambiance joués dans le canal audio 'AudioGui'. Chaque flux est décrit par un fichier JSON (clé data) contenant une liste de sons et un délai aléatoire entre deux lectures. update(dt) doit être appelé par l'appelant à chaque frame : il joue un son tiré au hasard, attend la fin du son plus le délai, puis en tire un autre.

## Remarques

- Bug : dans getRandomSound, les branches « delay à 1 valeur » et « pas de delay » écrivent dans la variable inexistante temptable (nil) au lieu de stream.currentSoundData : cela déclenche une erreur Lua. Seul le cas delay = {min, max} fonctionne.
- Bug : si un flux n'a qu'un seul son, le deuxième appel de getRandomSound boucle indéfiniment (repeat … until previousSound ~= temp ne peut jamais être vrai).
- Le volume est codé en dur à 0.29 dans update ; stream.volume n'est jamais utilisé pour la lecture. Le paramètre fadeInTime de setStreamState est ignoré (stream.fadeInTime n'est jamais renseigné par ce module).
- update ne vérifie pas qu'il existe des currentSoundData : un flux sans sons fera échouer getRandomSound dès init.
- Le module ne s'appelle pas tout seul : aucun hook onUpdate n'est exporté, c'est à l'appelant d'invoquer ui_ambientSound.update(dt).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_ambientSound.deleteSoundSFX(ID)` | Retire de la liste le flux dont le streamID correspond. | 90 |
| `ui_ambientSound.init(json)` | Charge un fichier JSON de flux sonore (clé data), l'ajoute à la liste des flux, tire un premier son au hasard et renvoie l'identifiant du flux. Si le fichier n'existe pas, journalise une erreur et ne renvoie rien. | 69 |
| `ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime)` | Fixe le volume et la hauteur (pitch) d'un flux. fadeInTime est accepté mais pas utilisé. | 33 |
| `ui_ambientSound.update(dt)` | Fait avancer tous les flux : joue le son courant s'il existe (FS:fileExists) via Engine.Audio.playOnce('AudioGui'), puis cumule le temps et passe à un nouveau son quand durée + délai sont écoulés. | 44 |

### Détail des paramètres

#### `ui_ambientSound.deleteSoundSFX(ID)`

Retire de la liste le flux dont le streamID correspond.

- `ID` (*integer*) : Identifiant de flux renvoyé par init.

#### `ui_ambientSound.init(json)`

Charge un fichier JSON de flux sonore (clé data), l'ajoute à la liste des flux, tire un premier son au hasard et renvoie l'identifiant du flux. Si le fichier n'existe pas, journalise une erreur et ne renvoie rien.

- `json` (*string*) : Chemin du fichier JSON décrivant le flux (champ data avec sounds, delay…).
- **renvoie** : integer|nil streamID du nouveau flux, ou nil si le fichier est introuvable.

#### `ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime)`

Fixe le volume et la hauteur (pitch) d'un flux. fadeInTime est accepté mais pas utilisé.

- `streamID` (*integer*) : Identifiant du flux.
- `volume` (*number*) : Volume mémorisé dans le flux (non utilisé à la lecture, voir notes).
- `pitch` (*number*) : Hauteur transmise à playOnce.
- `fadeInTime` (*number|nil*) : Ignoré.

#### `ui_ambientSound.update(dt)`

Fait avancer tous les flux : joue le son courant s'il existe (FS:fileExists) via Engine.Audio.playOnce('AudioGui'), puis cumule le temps et passe à un nouveau son quand durée + délai sont écoulés.

- `dt` (*number*) : Temps écoulé depuis la frame précédente, en secondes.

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/ambientSound.lua`.*
