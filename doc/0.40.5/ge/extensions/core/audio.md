# `core_audio`

*Fichier : `lua/ge/extensions/core/audio.lua` · VM : Game Engine (GE) · 293 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_audio` : `extensions.load("core_audio")`, puis la globale `core_audio`

Extension GE (core_audio) qui charge les banques FMOD du jeu. Au premier update, elle scanne /art/sound/fmod/<plateforme> (et le sous-dossier mods, plus le dossier _headphones si le mode casque est activé), regroupe les fichiers .bank en jeux de banques (assets/strings/streams/meta), les trie (strings d'abord, puis 'preload', puis par taille) et crée un SFXFMODProject par jeu. Elle gère aussi le rechargement à chaud des banques et le paramètre FMOD g_GamePause. Un moddeur l'utilise pour enregistrer une banque ou forcer un rechargement.

## Exemple

```lua
core_audio.registerBaseBank('/art/sound/fmod/monmod/macollection.bank')
core_audio.triggerBankHotloading()
```

## Remarques

- Bug : dans registerBaseBank, la variable est déclarée `inLevelOrLoadingOrLoading` mais testée sous le nom `inLevelOrLoading` (globale nil) : le garde 'pas pendant un niveau ou un chargement' n'a jamais d'effet.
- Dans registerBaseBank, les chemins sont mis en minuscules et préfixés par '/' ; avant le premier chargement ils sont mémorisés dans registeredBanks, mais la boucle qui les utilisait (loadBankSets) est commentée : ces banques ne sont alors jamais chargées par cette liste. Après init, la banque est chargée immédiatement via SFXFMODProject.loadBaseBank (une seule fois grâce à loadedBankCache).
- Rechargement à chaud : onFilesChanged marque comme non chargée toute banque .bank modifiée et ne déclenche triggerBankHotloading que quand toutes les banques connues sont marquées non chargées (attend la fin de la reconstruction).
- Les champs M.keepLoadedBanks et M.prevReplayState/M.prevReplayPaused sont créés dynamiquement (pas déclarés dans le module au chargement).
- Pause : onPhysicsPaused / onPhysicsUnpaused mettent le paramètre global FMOD g_GamePause à 1 / 0 ; onReplayStateChanged le met à jour d'après simTimeAuthority.getPause().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_audio.onClientEndMission()` | Hook appelé à la fin d'un niveau. Ne fait rien (corps vide, avec un commentaire). *(interne)* *(hook)* | 173 |
| `core_audio.onClientPreStartMission(levelPath)` | Hook appelé avant le démarrage d'un niveau. N'ajoute que des événements profileur (le chargement de banques de niveau est commenté). *(interne)* *(hook)* | 165 |
| `core_audio.onDeserialized(data)` | Hook de restauration après rechargement Lua. *(interne)* *(hook)* | 249 |
| `core_audio.onFilesChanged(files)` | Hook appelé quand des fichiers surveillés changent : gère le rechargement à chaud des .bank (voir notes). *(interne)* *(hook)* | 210 |
| `core_audio.onFirstUpdate()` | Hook appelé au premier update du GE : scanne et charge les banques (populateBankSets puis loadBankSets), sauf si keepLoadedBanks est vrai (rechargement Lua : on ne fait rien). *(interne)* *(hook)* | 150 |
| `core_audio.onPhysicsPaused()` | Hook appelé quand la physique est mise en pause : SFXSystem.setGlobalParameter('g_GamePause', 1). *(interne)* *(hook)* | 255 |
| `core_audio.onPhysicsUnpaused()` | Hook appelé à la reprise de la physique : g_GamePause = 0. *(interne)* *(hook)* | 259 |
| `core_audio.onReplayStateChanged(newState)` | Hook appelé quand l'état du replay change : met g_GamePause selon simTimeAuthority.getPause(), seulement si state ou paused a changé depuis la dernière fois. *(interne)* *(hook)* | 263 |
| `core_audio.onSerialize()` | Hook de sérialisation avant rechargement Lua : renvoie keepLoadedBanks=true, levelProjectsCache et loadedBankCache. *(interne)* *(hook)* | 241 |
| `core_audio.registerBaseBank(path)` | Enregistre une banque FMOD de base (voir notes pour le comportement avant/après l'initialisation). | 15 |
| `core_audio.triggerBankHotloading()` | Supprime les projets FMOD créés, vide les caches, prévient SFXFMODProject (hotloadingTriggered), re-scanne et recharge toutes les banques puis signale la fin (hotloadingCompleted). | 188 |

### Détail des paramètres

#### `core_audio.onClientPreStartMission(levelPath)`

Hook appelé avant le démarrage d'un niveau. N'ajoute que des événements profileur (le chargement de banques de niveau est commenté).

- `levelPath` (*string*) : Chemin du niveau

#### `core_audio.onDeserialized(data)`

Hook de restauration après rechargement Lua.

- `data` (*table*) : Table renvoyée par onSerialize

#### `core_audio.onFilesChanged(files)`

Hook appelé quand des fichiers surveillés changent : gère le rechargement à chaud des .bank (voir notes).

- `files` (*table<integer, table>*) : Liste d'entrées avec le champ filename (sans '/' initial)

#### `core_audio.onReplayStateChanged(newState)`

Hook appelé quand l'état du replay change : met g_GamePause selon simTimeAuthority.getPause(), seulement si state ou paused a changé depuis la dernière fois.

- `newState` (*table*) : Table avec les champs state et paused

#### `core_audio.onSerialize()`

Hook de sérialisation avant rechargement Lua : renvoie keepLoadedBanks=true, levelProjectsCache et loadedBankCache.

- **renvoie** : table {keepLoadedBanks, levelProjectsCache, loadedBankCache}

#### `core_audio.registerBaseBank(path)`

Enregistre une banque FMOD de base (voir notes pour le comportement avant/après l'initialisation).

- `path` (*string*) : Chemin du fichier .bank, avec ou sans '/' initial (mis en minuscules)

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `stat`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/audio.lua`.*
