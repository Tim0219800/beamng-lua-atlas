# `ui_console`

*Fichier : `lua/ge/extensions/ui/console.lua` · VM : Game Engine (GE) · 1267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_console` : `extensions.load("ui_console")`, puis la globale `ui_console`

Console de développement « consoleNG » en ImGui (fenêtre « beamng.consoleNG »). Elle affiche le journal du jeu (lu à chaque image via Engine.getFrameLog) avec filtres par niveau (E, W, I, D, A), filtre par origine en motif Lua, pause (touche Arrêt défil), statistiques de journal et défilement automatique. Elle permet aussi d'exécuter des commandes dans quatre contextes : Lua du moteur de jeu (GE), TorqueScript, JavaScript de l'interface (CEF) ou Lua d'un véhicule précis. Un moddeur l'ouvre avec ui_console.toggle() pour déboguer.

## Exemple

```lua
extensions.load('ui_console')
ui_console.show()   -- ouvre la fenêtre
ui_console.toggle() -- ouvre ou ferme
```

## Remarques

- Les réglages de fenêtre (taille de police, filtres de niveau, plein écran, transparence, bouclage de l'historique, mode bac à sable, focus à l'ouverture, contrôle du véhicule) sont sauvegardés dans /settings/consoleNG.json ; l'historique des commandes (20 entrées au maximum) est dans /consoleHistory.json et rechargé si ce fichier change (onFileChanged).
- Contextes d'exécution (liste déroulante) : 0 = GE Lua, 1 = TorqueScript (un « ; » est ajouté s'il manque), 2 = JS de l'interface (be:queueJS), puis « Current Vehicle » et un élément par véhicule actif (v:queueLuaCommand).
- En GE Lua, si l'option « Sandbox GE Commands » est active, la commande passe par executeLuaSandboxed(cmd, 'GEConsole') ; sinon elle est envoyée par Lua:queueLuaCommand après un hex dump journalisé. La variable vaut true dans le code, mais settingsLoad la met à false si le fichier de réglages n'en contient pas.
- Quand la fenêtre est ouverte, les actions VehicleCommonActionMap et VehicleSpecificActionMap sont désactivées sauf si « enableVehicleControls » est vrai ; elles sont réactivées à la fermeture.
- Le filtre de journal utilise des motifs Lua (string.match), pas des expressions régulières ; un motif invalide est détecté par pcall et son message d'erreur est affiché.
- Le journal est un tampon circulaire borné par logsLimit = 1000 lignes.
- ConsoleInputCallback est une fonction globale appelée par ImGui pour naviguer dans l'historique avec les flèches haut et bas.
- Incohérences : M.inputCallback et M.onExtensionUnloaded sont assignés à des variables locales jamais définies et valent donc nil ; parseLogLine appelle M.onConsoleLog, qui n'existe plus (hook retiré, ligne en commentaire), ce qui provoquerait une erreur pour une ligne de journal non analysable ; settingsLoad utilise 0.64 comme taille de police par défaut alors que la valeur initiale est 0.95.

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_console.hide()` | Ferme la fenêtre de la console. | 172 |
| `ui_console.onDeserialized(data)` | Hook appelé après un rechargement de Lua : restaure l'état sauvegardé par onSerialize. *(interne)* *(hook)* | 1215 |
| `ui_console.onExtensionLoaded()` | Hook appelé au chargement de l'extension : charge les réglages et l'historique, initialise le thème ImGui de l'éditeur et construit la liste des contextes d'exécution. *(interne)* *(hook)* | 1230 |
| `ui_console.onFileChanged(filename, type)` | Hook appelé quand un fichier surveillé change. Recharge l'historique si le fichier est /consoleHistory.json. *(interne)* *(hook)* | 1239 |
| `ui_console.onSerialize()` | Hook appelé avant un rechargement de Lua : sauvegarde l'état de la fenêtre (ouverte, filtre d'origine, saisie en cours, filtre de niveaux, plein écran, position, défilement). *(interne)* *(hook)* | 1199 |
| `ui_console.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image. Si la fenêtre est ouverte, lit les nouvelles lignes du journal (sauf en pause), dessine la console ImGui et traite les commandes saisies ; à la fermeture, rend le contrôle du véhicule. *(interne)* *(hook)* | 556 |
| `ui_console.onVehicleActiveChanged()` | Hook appelé quand un véhicule devient actif ou inactif : reconstruit la liste des contextes d'exécution (refreshCombo). *(interne)* *(hook)* | 1178 |
| `ui_console.onVehicleDestroyed()` | Hook appelé quand un véhicule est détruit : reconstruit la liste des contextes d'exécution. *(interne)* *(hook)* | 1178 |
| `ui_console.onVehicleSpawned()` | Hook appelé quand un véhicule apparaît : reconstruit la liste des contextes d'exécution. *(interne)* *(hook)* | 1178 |
| `ui_console.onVehicleSwitched()` | Hook appelé quand le véhicule du joueur change : reconstruit la liste des contextes d'exécution. *(interne)* *(hook)* | 1178 |
| `ui_console.show()` | Ouvre la fenêtre de la console. | 168 |
| `ui_console.toggle()` | Ouvre la fenêtre si elle est fermée, la ferme si elle est ouverte. | 176 |

### Détail des paramètres

#### `ui_console.onDeserialized(data)`

Hook appelé après un rechargement de Lua : restaure l'état sauvegardé par onSerialize.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `ui_console.onFileChanged(filename, type)`

Hook appelé quand un fichier surveillé change. Recharge l'historique si le fichier est /consoleHistory.json.

- `filename` (*string*) : Chemin du fichier modifié.
- `type` (*string*) : Type de changement (non utilisé).

#### `ui_console.onSerialize()`

Hook appelé avant un rechargement de Lua : sauvegarde l'état de la fenêtre (ouverte, filtre d'origine, saisie en cours, filtre de niveaux, plein écran, position, défilement).

- **renvoie** : table Données à restituer à onDeserialized.

#### `ui_console.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image. Si la fenêtre est ouverte, lit les nouvelles lignes du journal (sauf en pause), dessine la console ImGui et traite les commandes saisies ; à la fermeture, rend le contrôle du véhicule.

- `dtReal` (*number*) : Durée réelle de l'image en secondes (non utilisée).
- `dtSim` (*number*) : Durée simulée de l'image en secondes (non utilisée).
- `dtRaw` (*number*) : Durée brute de l'image en secondes (non utilisée).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : ui_imgui. |
| `inputCallback` | nil | Toujours nil : assigné depuis une variable locale inexistante (bug). ⚠ référence `inputCallback` non définie dans le fichier (vaut probablement nil) |
| `onExtensionUnloaded` | nil | Toujours nil : assigné depuis une variable locale inexistante (bug), donc aucun hook de déchargement. ⚠ référence `onExtensionUnloaded` non définie dans le fichier (vaut probablement nil) |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `ConsoleInputCallback(data)` |  | 429 |

## Appels vers le moteur (C++)

- `Engine.` `getFrameLog`
- `Lua:` `getDevLogStats`, `queueLuaCommand`
- `be:` `getObject`, `getObjectCount`, `getPlayerVehicleID`, `queueJS`
- `scenetree.` `findObject`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/console.lua`.*
