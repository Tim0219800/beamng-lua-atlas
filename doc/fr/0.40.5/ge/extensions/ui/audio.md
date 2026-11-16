# `ui_audio`

*Fichier : `lua/ge/extensions/ui/audio.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_audio` : `extensions.load("ui_audio")`, puis la globale `ui_audio`

Joue les sons d'interface (canal audio « AudioGui ») à partir du fichier ui/soundClasses.json. Chaque classe de son contient des évènements ; un évènement simple joue un sfx une fois, un évènement « source » crée et réutilise une source audio gérée (play, setParameters, stopBeforePlay, recreateBeforePlay). Sert aussi aux sons de l'appui long (bng_hold_activate : start, complete, cancel).

## Exemple

```lua
ui_audio.playEventSound('bng_hold_activate', 'start', 'monBouton')
```

## Remarques

- Les classes de sons sont chargées dans M.ui_sound_classes au premier onFirstUpdate (jsonReadFile('ui/soundClasses.json')).
- Un évènement est « géré » (source persistante) s'il a type == 'source' ou un des champs sourceKey, action, parameters, stopBeforePlay, recreateBeforePlay. Sinon, avec seulement sfx, il est joué par Engine.Audio.playOnce('AudioGui', sfx).
- Les sources gérées sont mises en cache par clé sourceKey (ou sfx) suffixée de ':instanceId' ; une source dont l'objet n'existe plus dans scenetree est recréée.
- Les actions gérées reconnues sont 'play' (défaut) et 'setParameters' ; toute autre valeur ne fait rien (la source est tout de même créée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_audio.cancelHoldActivateSound(instanceId)` | Joue l'évènement « cancel » de la classe bng_hold_activate (appui long relâché trop tôt). | 140 |
| `ui_audio.completeHoldActivateSound(instanceId)` | Joue l'évènement « complete » de la classe bng_hold_activate (appui long abouti). | 136 |
| `ui_audio.onFirstUpdate()` | Hook appelé par le moteur au premier update : lit ui/soundClasses.json dans M.ui_sound_classes ({} si absent). *(interne)* *(hook)* | 10 |
| `ui_audio.playEventSound(className, eventName, instanceId)` | Joue l'évènement eventName de la classe className. Ne fait rien si la classe ou l'évènement n'existe pas. Évènement simple : joue le sfx une fois sur AudioGui ; évènement source : crée/réutilise la source, applique les paramètres puis la lance (play(-1)). | 119 |
| `ui_audio.startHoldActivateSound(instanceId)` | Joue l'évènement « start » de la classe bng_hold_activate (début d'un appui long). | 132 |

### Détail des paramètres

#### `ui_audio.cancelHoldActivateSound(instanceId)`

Joue l'évènement « cancel » de la classe bng_hold_activate (appui long relâché trop tôt).

- `instanceId` (*any*) : Identifiant d'instance de la source gérée.

#### `ui_audio.completeHoldActivateSound(instanceId)`

Joue l'évènement « complete » de la classe bng_hold_activate (appui long abouti).

- `instanceId` (*any*) : Identifiant d'instance de la source gérée.

#### `ui_audio.playEventSound(className, eventName, instanceId)`

Joue l'évènement eventName de la classe className. Ne fait rien si la classe ou l'évènement n'existe pas. Évènement simple : joue le sfx une fois sur AudioGui ; évènement source : crée/réutilise la source, applique les paramètres puis la lance (play(-1)).

- `className` (*string*) : Nom de la classe de sons dans soundClasses.json.
- `eventName` (*string*) : Nom de l'évènement dans la classe.
- `instanceId` (*any*) : Identifiant d'instance optionnel pour avoir une source distincte par composant UI (déduit du code : concaténé à la clé de cache).

#### `ui_audio.startHoldActivateSound(instanceId)`

Joue l'évènement « start » de la classe bng_hold_activate (début d'un appui long).

- `instanceId` (*any*) : Identifiant d'instance de la source gérée.

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/audio.lua`.*
