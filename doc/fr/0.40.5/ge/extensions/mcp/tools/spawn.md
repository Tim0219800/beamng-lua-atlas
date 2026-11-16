# `mcp_tools_spawn`

*Fichier : `lua/ge/extensions/mcp/tools/spawn.lua` · VM : Game Engine (GE) · 109 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_spawn` : `extensions.load("mcp_tools_spawn")`, puis la globale `mcp_tools_spawn`

Outils MCP de spawn : lister les configurations d'un modèle, faire apparaître ou remplacer un véhicule, et tester automatiquement toutes les configurations d'un modèle (spawn de chacune puis relevé des erreurs de log et des instabilités physiques). Utile pour valider un mod de véhicule.

## Remarques

- test_configs est une machine à états pilotée par onUpdate : phase 'spawn' (remplace le véhicule par la config courante) puis 'wait' (après `delay` secondes, lit le log). Seules les lignes d'erreur « |E| » mentionnant le modèle, « jbeam », « skin », « slot » ou « flexbod » sont comptées ; 3 exemples max par config.
- Appel de test_configs : premier appel = démarrage ; appels suivants = progression {running, model, done, total, current} ; à la fin, un appel renvoie le rapport final (qui est ensuite consommé).
- Les configs sont triées par clé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_spawn.get_configs(args)` | Liste triée des clés de configuration (.pc) d'un modèle via core_vehicles.getModel. | 44 |
| `mcp_tools_spawn.onUpdate(dtReal)` | Appelé chaque frame : avance le test de configurations (spawn, attente, analyse du log et de shared.instabilityLog, passage à la config suivante, rapport final dans shared.asyncResults.testConfigs). *(interne)* *(hook)* | 12 |
| `mcp_tools_spawn.spawn(args)` | Fait apparaître un véhicule : remplace le véhicule courant (core_vehicles.replaceVehicle) ou, avec add=true, en ajoute un (core_vehicles.spawnNewVehicle). | 56 |
| `mcp_tools_spawn.test_configs(args)` | Teste chaque config d'un modèle (asynchrone, long). Voir les notes pour le protocole d'appels. | 67 |

### Détail des paramètres

#### `mcp_tools_spawn.get_configs(args)`

Liste triée des clés de configuration (.pc) d'un modèle via core_vehicles.getModel.

- `args` (*table|nil*) : {model?: string} (défaut : modèle du véhicule joueur).
- **renvoie** : string JSON {model, configs}.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_spawn.onUpdate(dtReal)`

Appelé chaque frame : avance le test de configurations (spawn, attente, analyse du log et de shared.instabilityLog, passage à la config suivante, rapport final dans shared.asyncResults.testConfigs).

- `dtReal` (*number*) : Durée réelle (s).

#### `mcp_tools_spawn.spawn(args)`

Fait apparaître un véhicule : remplace le véhicule courant (core_vehicles.replaceVehicle) ou, avec add=true, en ajoute un (core_vehicles.spawnNewVehicle).

- `args` (*table|nil*) : {model?: string, config?: string (clé ou chemin .pc), add?: boolean}
- **renvoie** : string Message de confirmation.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_spawn.test_configs(args)`

Teste chaque config d'un modèle (asynchrone, long). Voir les notes pour le protocole d'appels.

- `args` (*table|nil*) : {model?: string, delay?: number s d'attente par config (défaut 3)}
- **renvoie** : string JSON de progression ou rapport {model, total, results:[{config, ok, errorCount, errors, unstable}]}.
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas de get_configs, spawn et test_configs. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/spawn.lua`.*
