# `core_loadMapCmd`

*Fichier : `lua/ge/extensions/core/loadMapCmd.lua` · VM : Game Engine (GE) · 148 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_loadMapCmd` : `extensions.load("core_loadMapCmd")`, puis la globale `core_loadMapCmd`

Extension GE `core_loadMapCmd` : exécute la commande de lancement 'openMap' (lien du type beamng:v1/openMap/{level:"levels/gridmap/info.json",camPos:[x,y,z],camRot:[x,y,z,w]}). Elle attend que le gestionnaire de mods soit prêt, démarre le niveau demandé en freeroam, puis, une fois le monde prêt, place la caméra libre, règle le FOV, l'heure et charge éventuellement une piste (trackBuilder). Le moddeur s'en sert rarement directement, mais peut appeler set() pour ouvrir une carte avec une caméra donnée.

## Exemple

```lua
core_loadMapCmd.set({
  level = 'levels/gridmap_v2/info.json',
  camPos = {0, 0, 100},
  camRot = {0, 0, 0, 1},
  fov = 70,
  timeOfDay = 0.5,
})
```

## Remarques

- Champs de la table `data` de set : level (obligatoire, chaîne du genre 'levels/<nom>/info.json'), camPos {x,y,z}, camRot {x,y,z,w} (quaternion), fov (degrés, utilisé si > 0), timeOfDay (nombre passé à core_environment.setTimeOfDay), track (chemin d'une piste passé à util/trackBuilder/splineTrack.load).
- parseMapPath ne garde que les deux premiers segments utiles : 'levels/gridmap/info.json' ou '/levels/gridmap/info.json' donne 'levels/gridmap/'. Si data.level est nil, split plante : toujours fournir level.
- Le niveau n'est lancé que quand la cible existe, ou quand le gestionnaire de mods est prêt (core_modmanager.isReady) : un niveau venant d'un mod peut donc être monté avant d'être testé. Si la carte n'existe toujours pas, un toast d'erreur 'map not found, you may need to add a mod' est affiché.
- Si le jeu est déjà en freeroam sur la même carte, le niveau n'est pas relancé ; onWorldReadyState(2) est appelée directement pour appliquer la caméra, l'heure, etc.
- Le drapeau ignoreStartupCmd est mis à true lors d'un rechargement Lua (onSerialize), pour que la commande de démarrage ne soit pas rejouée : set(data, true) est alors ignoré.
- onUpdate appelle changeMapWhenModManagerReady à chaque frame tant que args.mapName est défini ; une fois lancé, args.mapName est mis à nil et l'appel ne fait plus rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_loadMapCmd.onClientPostStartMission()` | Hook appelé après le démarrage d'un niveau ; ne fait rien. *(interne)* *(hook)* | 89 |
| `core_loadMapCmd.onDeserialized(d)` | Après un rechargement Lua : restaure le drapeau ignoreStartupCmd. *(interne)* *(hook)* | 133 |
| `core_loadMapCmd.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 79 |
| `core_loadMapCmd.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 82 |
| `core_loadMapCmd.onModManagerReady()` | Hook émis par core_modmanager quand les mods sont montés : relance la tentative de changement de carte. *(interne)* *(hook)* | 85 |
| `core_loadMapCmd.onSerialize()` | Avant un rechargement Lua : renvoie { ignoreStartupCmd = true } pour ne pas rejouer la commande de lancement. *(interne)* *(hook)* | 129 |
| `core_loadMapCmd.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame : retente le changement de carte tant qu'il est en attente. *(interne)* *(hook)* | 93 |
| `core_loadMapCmd.onWorldReadyState(state)` | Hook appelé quand l'état du monde change. À l'état 2 (monde prêt), applique camPos/camRot (caméra libre), fov, timeOfDay et charge la piste demandée, puis oublie la commande. *(interne)* *(hook)* | 97 |
| `core_loadMapCmd.set(data, startCmd)` | Enregistre une commande d'ouverture de carte et tente de la lancer (la carte démarre dès que la cible existe et que les mods sont prêts). | 64 |

### Détail des paramètres

#### `core_loadMapCmd.onDeserialized(d)`

Après un rechargement Lua : restaure le drapeau ignoreStartupCmd.

- `d` (*table*) : Table renvoyée par onSerialize.

#### `core_loadMapCmd.onSerialize()`

Avant un rechargement Lua : renvoie { ignoreStartupCmd = true } pour ne pas rejouer la commande de lancement.

- **renvoie** : table { ignoreStartupCmd = true }

#### `core_loadMapCmd.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame : retente le changement de carte tant qu'il est en attente.

- `dtReal` (*number*) : Temps réel écoulé (s), non utilisé.
- `dtSim` (*number*) : Temps de simulation écoulé (s), non utilisé.
- `dtRaw` (*number*) : Temps brut (s), non utilisé.

#### `core_loadMapCmd.onWorldReadyState(state)`

Hook appelé quand l'état du monde change. À l'état 2 (monde prêt), applique camPos/camRot (caméra libre), fov, timeOfDay et charge la piste demandée, puis oublie la commande.

- `state` (*integer*) : Étape de chargement ; seule la valeur 2 déclenche l'action.

#### `core_loadMapCmd.set(data, startCmd)`

Enregistre une commande d'ouverture de carte et tente de la lancer (la carte démarre dès que la cible existe et que les mods sont prêts).

- `data` (*table|nil*) : Voir notes : { level, camPos, camRot, fov, timeOfDay, track }. nil : ne fait rien.
- `startCmd` (*boolean|nil*) : Vrai si la commande vient de la ligne de commande de démarrage : ignorée après un rechargement Lua.

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`
- `core_environment.` `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/loadMapCmd.lua`.*
