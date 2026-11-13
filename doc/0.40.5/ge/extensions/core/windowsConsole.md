# `core_windowsConsole`

*Fichier : `lua/ge/extensions/core/windowsConsole.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_windowsConsole` : `extensions.load("core_windowsConsole")`, puis la globale `core_windowsConsole`

Pont entre la fenêtre console native de Windows (C++) et Lua. Il remplit la liste déroulante des contextes d'exécution (GE-Lua, véhicule courant, chaque véhicule actif, GE-TorqueScript, CEF/UI - JS) et exécute la commande saisie dans le contexte choisi. Tout est appelé par le moteur ; un moddeur peut seulement écouter le hook onConsoleExecuteCommand.

## Remarques

- Si les fonctions C++ consoleClearAvailableContexts etc. n'existent pas (autre plateforme), onExtensionLoaded renvoie false et l'extension reste inactive (refreshCombo ne fait rien).
- Le contexte 'GE-Lua' n'est pas géré dans executeCommand : il est exécuté côté C++ (tryRunCommand est le rappel utilisé).
- Les contextes véhicule sont nommés d'après mainPartName ; deux véhicules du même modèle partagent le même nom, donc nameVidMap n'en conserve qu'un.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_windowsConsole.configure()` | Reconstruit la liste des contextes disponibles dans la console (alias de refreshCombo). Appelé par le C++ quand la fenêtre console est activée. *(interne)* | 47 |
| `core_windowsConsole.executeCommand(context, cmd)` | Exécute une commande dans un contexte et émet le hook onConsoleExecuteCommand(context, cmd). 'GE-TorqueScript' passe par TorqueScript.eval, 'CEF/UI - JS' par be:queueJS, un nom de véhicule par queueLuaCommand sur ce véhicule. *(interne)* | 10 |
| `core_windowsConsole.onExtensionLoaded()` | Hook appelé au chargement : active l'extension si les fonctions console du C++ existent. *(interne)* *(hook)* | 77 |
| `core_windowsConsole.onVehicleActiveChanged()` | Hook appelé quand un véhicule devient actif ou inactif : rafraîchit la liste des contextes (même fonction que configure). *(interne)* *(hook)* | 47 |
| `core_windowsConsole.onVehicleDestroyed()` | Hook appelé à la destruction d'un véhicule : rafraîchit la liste des contextes. *(interne)* *(hook)* | 47 |
| `core_windowsConsole.onVehicleSpawned()` | Hook appelé à l'apparition d'un véhicule : rafraîchit la liste des contextes. *(interne)* *(hook)* | 47 |
| `core_windowsConsole.onVehicleSwitched()` | Hook appelé au changement de véhicule joueur : rafraîchit la liste des contextes. *(interne)* *(hook)* | 47 |
| `core_windowsConsole.tryRunCommand(cmd)` | Exécute du texte Lua dans la VM GE : essaie loadstring(cmd), sinon loadstring('return ' .. cmd) pour afficher la valeur d'une expression, puis dump le résultat s'il n'est pas nil. Journalise « syntax error » si rien ne compile. *(interne)* | 28 |

### Détail des paramètres

#### `core_windowsConsole.executeCommand(context, cmd)`

Exécute une commande dans un contexte et émet le hook onConsoleExecuteCommand(context, cmd). 'GE-TorqueScript' passe par TorqueScript.eval, 'CEF/UI - JS' par be:queueJS, un nom de véhicule par queueLuaCommand sur ce véhicule.

- `context` (*string*) : Nom du contexte choisi dans la console.
- `cmd` (*string*) : Texte de la commande.

#### `core_windowsConsole.onExtensionLoaded()`

Hook appelé au chargement : active l'extension si les fonctions console du C++ existent.

- **renvoie** : boolean|nil false si la console n'est pas disponible sur la plateforme.

#### `core_windowsConsole.tryRunCommand(cmd)`

Exécute du texte Lua dans la VM GE : essaie loadstring(cmd), sinon loadstring('return ' .. cmd) pour afficher la valeur d'une expression, puis dump le résultat s'il n'est pas nil. Journalise « syntax error » si rien ne compile.

- `cmd` (*string*) : Code ou expression Lua.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onConsoleExecuteCommand` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectCount`, `queueJS`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/windowsConsole.lua`.*
