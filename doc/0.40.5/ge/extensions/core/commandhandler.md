# `core_commandhandler`

*Fichier : `lua/ge/extensions/core/commandhandler.lua` · VM : Game Engine (GE) · 333 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_commandhandler` : `extensions.load("core_commandhandler")`, puis la globale `core_commandhandler`

Exécute les commandes asynchrones envoyées au jeu par le schéma de protocole « beamng:v1/<commande>/<données> » (lien navigateur, argument de ligne de commande -command, canal pipe). Les commandes reçues avant que l'interface soit prête sont mises en file puis rejouées à onUiReady. Au premier update, lit les arguments de démarrage (-command beamng:...).

## Exemple

```lua
-- équivalent d'un lien beamng:v1/core_input_actions/triggerDownUp/toggleCamera
core_commandhandler.onSchemeCommand('v1/core_input_actions/triggerDownUp/toggleCamera', false)
```

## Remarques

- Le texte est décodé (%XX) puis découpé sur '/' en au plus 3 morceaux : version, commande, données (les '/' des données sont conservés).
- Commandes v1 gérées : showMod, subscriptionMod, downloadMod (core_repository), updateZipMod (core_modmanager), openMap (core_loadMapCmd), loadSnapshot (core_snapshot), tech_utils/<fonction> (appelle extensions.tech_utils[fonction]()), core_input_actions/<fonction>/<args...> (appelle extensions.core_input_actions[fonction](args)), openWorkbench et runRepro (avec garde core_reproGuard.isCommandAllowed, exécution via executeShell, absente des builds shipping).
- Commandes sans test de version : startToolchainServer (charge networking_editorToolchain), startWorkbenchServer, startDebugServer, stopDebugServer, attachDebugger, detachDebugger.
- Quand isStartingArg est vrai (instance lancée uniquement pour traiter la commande), openWorkbench et runRepro quittent le jeu (shutdown(0)) après usage ou en cas d'échec.
- tech_utils et core_input_actions permettent d'appeler une fonction d'extension par son nom depuis un lien : à garder en tête côté sécurité.
- Point à noter : M.onExtensionLoaded vaut `nop` (champ marqué « non défini » par l'extraction, vraisemblablement une fonction globale vide du moteur ; déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_commandhandler.onDeserialized(d)` | Hook : restaure ignoreStartupCmd. *(interne)* *(hook)* | 319 |
| `core_commandhandler.onFirstUpdate()` | Hook : au premier update, cherche « -command beamng:... » dans Engine.getStartingArgs() et l'exécute (ignoré si l'extension a été rechargée). *(interne)* *(hook)* | 291 |
| `core_commandhandler.onSchemeCommand(scheme, isStartingArg)` | Traite une commande de schéma « version/commande/données » (sans le préfixe « beamng: »). Met en file si l'UI n'est pas prête. Les commandes inconnues ou mal formées sont journalisées en erreur. *(hook)* | 53 |
| `core_commandhandler.onSerialize()` | Hook : renvoie {ignoreStartupCmd = true} pour que le rechargement du GE ne rejoue pas la commande de démarrage. *(interne)* *(hook)* | 315 |
| `core_commandhandler.onUiReady()` | Hook : l'interface est prête ; exécute les commandes mises en file. *(interne)* *(hook)* | 283 |

### Détail des paramètres

#### `core_commandhandler.onDeserialized(d)`

Hook : restaure ignoreStartupCmd.

- `d` (*table*) : table renvoyée par onSerialize

#### `core_commandhandler.onSchemeCommand(scheme, isStartingArg)`

Traite une commande de schéma « version/commande/données » (sans le préfixe « beamng: »). Met en file si l'UI n'est pas prête. Les commandes inconnues ou mal formées sont journalisées en erreur.

- `scheme` (*string*) : ex. « v1/openMap/{...json...} », encodé en pourcentage
- `isStartingArg` (*boolean*) : vrai si la commande vient des arguments de démarrage du jeu

#### `core_commandhandler.onSerialize()`

Hook : renvoie {ignoreStartupCmd = true} pour que le rechargement du GE ne rejoue pas la commande de démarrage.

- **renvoie** : table données à sérialiser

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | function | Fonction vide (nop) : l'extension ne fait rien au chargement. |

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `fileExists`, `getFileRealPath`

**Charge les extensions :** `core_loadMapCmd`, `core_reproGuard`, `core_snapshot`, `networking_editorToolchain`, `workbench_webSocketHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/commandhandler.lua`.*
