# `core_snapshot`

*Fichier : `lua/ge/extensions/core/snapshot.lua` · VM : Game Engine (GE) · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_snapshot` : `extensions.load("core_snapshot")`, puis la globale `core_snapshot`

Sauvegarde et chargement de « snapshots » (position et rotation de caméra) via le service en ligne BeamNG (s2/v4/saveSnapshot et getSnapshot). Un snapshot peut être chargé depuis une commande de schéma d'URL (loadSnapshot). Émet les hooks onSnapshotCreate et onSnapshotLoad.

## Remarques

- BUG : la fonction locale save(data) est une copie de load(data) (elle repositionne la caméra et émet onSnapshotLoad). createSnapshot appelle save() sans argument, donc data est nil et data.camPos provoque une erreur : la création de snapshot est cassée.
- createSnapshot ignore ses paramètres scheme et saveToServer.
- Le champ ignoreStartupCmd est conservé au rechargement des extensions (onSerialize renvoie true) pour ne pas rejouer la commande de démarrage.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_snapshot.createSnapshot(scheme, saveToServer)` | Prévu pour construire les données de snapshot, émettre onSnapshotCreate(data) puis les envoyer au serveur avec core_online.apiCall('s2/v4/saveSnapshot'). Journalise l'id reçu ou une erreur. | 27 |
| `core_snapshot.loadSnapshot(snapshotId)` | Télécharge le snapshot (s2/v4/getSnapshot) puis passe en caméra libre, place la caméra à data.camPos/camRot, émet onSnapshotLoad(data) et appelle changeMap() si core_modmanager.isReady(). | 43 |
| `core_snapshot.onDeserialized(d)` | Hook appelé après rechargement. Restaure ignoreStartupCmd. *(interne)* *(hook)* | 68 |
| `core_snapshot.onSerialize()` | Hook appelé avant un rechargement des extensions Lua. Renvoie {ignoreStartupCmd = true}. *(interne)* *(hook)* | 62 |
| `core_snapshot.onSnapshotSchemeCommand(command, data, isStartingArg)` | Hook appelé quand une commande de schéma d'URL arrive. Pour la commande "loadSnapshot", appelle loadSnapshot(data). Ignoré si isStartingArg et ignoreStartupCmd. *(interne)* *(hook)* | 54 |

### Détail des paramètres

#### `core_snapshot.createSnapshot(scheme, saveToServer)`

Prévu pour construire les données de snapshot, émettre onSnapshotCreate(data) puis les envoyer au serveur avec core_online.apiCall('s2/v4/saveSnapshot'). Journalise l'id reçu ou une erreur.

- `scheme` (*any*) : Non utilisé.
- `saveToServer` (*any*) : Non utilisé.

#### `core_snapshot.loadSnapshot(snapshotId)`

Télécharge le snapshot (s2/v4/getSnapshot) puis passe en caméra libre, place la caméra à data.camPos/camRot, émet onSnapshotLoad(data) et appelle changeMap() si core_modmanager.isReady().

- `snapshotId` (*string|number*) : Identifiant du snapshot sur le serveur.

#### `core_snapshot.onDeserialized(d)`

Hook appelé après rechargement. Restaure ignoreStartupCmd.

- `d` (*table*) : Table renvoyée par onSerialize.

#### `core_snapshot.onSerialize()`

Hook appelé avant un rechargement des extensions Lua. Renvoie {ignoreStartupCmd = true}.

- **renvoie** : table État à conserver.

#### `core_snapshot.onSnapshotSchemeCommand(command, data, isStartingArg)`

Hook appelé quand une commande de schéma d'URL arrive. Pour la commande "loadSnapshot", appelle loadSnapshot(data). Ignoré si isStartingArg et ignoreStartupCmd.

- `command` (*string*) : Nom de la commande.
- `data` (*any*) : Argument de la commande (id du snapshot).
- `isStartingArg` (*boolean*) : Vrai si la commande vient des arguments de lancement.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSnapshotCreate`
- `onSnapshotLoad`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/snapshot.lua`.*
