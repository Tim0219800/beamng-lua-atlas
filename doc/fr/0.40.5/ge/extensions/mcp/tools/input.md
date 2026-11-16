# `mcp_tools_input`

*Fichier : `lua/ge/extensions/mcp/tools/input.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_input` : `extensions.load("mcp_tools_input")`, puis la globale `mcp_tools_input`

Outils MCP d'entrées véhicule : injecter un évènement de contrôle (direction, accélérateur, frein…), tester un contrôle « hydro » en aller-retour avec détection d'erreurs dans le log, et exécuter du Lua dans la VM d'un ou de tous les véhicules.

## Remarques

- run_lua_vehicle est asynchrone : il renvoie les résultats de l'appel PRÉCÉDENT (JSON vehId -> résultat) et lance le nouveau ; rappeler pour obtenir le dernier. Le code est compilé avec loadstring dans la VM véhicule, erreurs capturées par pcall.
- test_hydro enchaîne input.event(event, 1) -> (0,6 s) -> -1 -> (0,6 s) -> 0 -> (0,3 s) puis scanne beamng.log à la recherche de lignes « |E| » ; résultat dans shared.asyncResults.hydro, renvoyé à l'appel suivant.
- filter 2 = FILTER_DIRECT (valeur par défaut).
- Attention sécurité : run_lua_vehicle exécute du code arbitraire dans les VM véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_input.inject_input(args)` | Envoie input.event(event, value, filter) dans la VM du véhicule via be:queueObjectLua. | 43 |
| `mcp_tools_input.onUpdate(dtReal)` | Appelé chaque frame : fait avancer la séquence test_hydro (étapes 1 à 3 temporisées) et, à la fin, lit les erreurs du log. *(interne)* *(hook)* | 26 |
| `mcp_tools_input.run_lua_vehicle(args)` | Exécute du Lua dans la VM d'un véhicule (ou de tous avec all=true) ; résultats asynchrones. | 66 |
| `mcp_tools_input.test_hydro(args)` | Lance le test haut/bas/neutre d'un évènement d'entrée et détecte les erreurs loggées. Asynchrone : rappeler après ~2 s. | 54 |

### Détail des paramètres

#### `mcp_tools_input.inject_input(args)`

Envoie input.event(event, value, filter) dans la VM du véhicule via be:queueObjectLua.

- `args` (*table*) : {event: string (steering, throttle, brake, parkingbrake, clutch…), value?: number (défaut 0, typ. -1..1 ou 0..1), filter?: integer (défaut 2), id?: integer}
- **renvoie** : string Confirmation.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_input.onUpdate(dtReal)`

Appelé chaque frame : fait avancer la séquence test_hydro (étapes 1 à 3 temporisées) et, à la fin, lit les erreurs du log.

- `dtReal` (*number*) : Durée réelle (s).

#### `mcp_tools_input.run_lua_vehicle(args)`

Exécute du Lua dans la VM d'un véhicule (ou de tous avec all=true) ; résultats asynchrones.

- `args` (*table*) : {code: string, id?: integer, all?: boolean}
- **renvoie** : string JSON des résultats précédents ou message « queued ».
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_input.test_hydro(args)`

Lance le test haut/bas/neutre d'un évènement d'entrée et détecte les erreurs loggées. Asynchrone : rappeler après ~2 s.

- `args` (*table|nil*) : {event?: string (défaut 'steering'), id?: integer}
- **renvoie** : string JSON {event, vid, ok, errors} du test précédent, ou message de démarrage.
- **renvoie** : boolean true si le véhicule n'existe pas.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callback `vehLua(vid, result)` : stocke result dans shared.asyncResults.vehLua[tostring(vid)]. |
| `schemas` | table<string, table> | Schémas de inject_input, test_hydro, run_lua_vehicle. |

## Appels vers le moteur (C++)

- `be:` `queueAllObjectLua`, `queueObjectLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/input.lua`.*
