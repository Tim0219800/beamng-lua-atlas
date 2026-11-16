# `mcp_tools`

*Fichier : `lua/ge/extensions/mcp/tools.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools` : `extensions.load("mcp_tools")`, puis la globale `mcp_tools`

Chargeur des modules d'outils MCP. Au chargement il parcourt `/lua/ge/extensions/mcp/tools/*.lua` (niveau 1), les `require` un par un et fusionne dans l'extension `mcp_tools` : les fonctions d'outils, les schémas (`schemas`), les callbacks (`cb`, exposés sous `_cb`) et les hooks `onUpdate`, `onPreRender`, `onInstabilityDetected`, redistribués à tous les modules. Le serveur (mcp_server) expose ensuite comme outil MCP chaque fonction de `mcp_tools` qui ne commence pas par `on`+majuscule.

## Exemple

```lua
-- ajouter un outil : créer lua/ge/extensions/mcp/tools/monoutil.lua
local M = {}
function M.dire_bonjour(args) return 'bonjour ' .. tostring(args and args.nom), false end
M.schemas = { dire_bonjour = { description = 'Dit bonjour', inputSchema = { type='object', properties = { nom = { type='string' } } } } }
return M
-- puis reload_lua (Ctrl+L) pour le charger
```

## Remarques

- Un module qui échoue au require est ignoré avec un log d'erreur `failed to load tool module "nom"` ; les autres continuent.
- Si deux modules définissent un outil du même nom, le dernier chargé écrase le précédent (ordre de FS:findFiles, non garanti).
- Les modifications des fichiers d'outils ne sont prises en compte qu'après un rechargement complet du VM Lua (outil reload_lua).
- Dépend de core_vehicles et core_vehicle_manager.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools.onInstabilityDetected(vid, returnData)` | Hook de fan-out : relaie l'instabilité physique détectée par le moteur aux modules (vehicle.lua la journalise). (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `mcp_tools.onPreRender(dtReal)` | Hook de fan-out : appelle le onPreRender de chaque module qui en définit un (debug : dessin des formes). Appelé avant le rendu. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `mcp_tools.onUpdate(dtReal)` | Hook de fan-out généré par le chargeur : appelle le onUpdate de chaque module d'outils qui en définit un (camera, input, spawn). Appelé chaque frame. (assignée dynamiquement) *(interne)* *(hook)* | dyn |

### Détail des paramètres

#### `mcp_tools.onInstabilityDetected(vid, returnData)`

Hook de fan-out : relaie l'instabilité physique détectée par le moteur aux modules (vehicle.lua la journalise). (assignée dynamiquement)

- `vid` (*integer*) : Id du véhicule instable (déduit du code).
- `returnData` (*any*) : Données fournies par le moteur (non utilisées).

#### `mcp_tools.onPreRender(dtReal)`

Hook de fan-out : appelle le onPreRender de chaque module qui en définit un (debug : dessin des formes). Appelé avant le rendu. (assignée dynamiquement)

- `dtReal` (*number*) : Durée réelle (s).

#### `mcp_tools.onUpdate(dtReal)`

Hook de fan-out généré par le chargeur : appelle le onUpdate de chaque module d'outils qui en définit un (camera, input, spawn). Appelé chaque frame. (assignée dynamiquement)

- `dtReal` (*number*) : Durée réelle de la frame (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `_cb` | table<string, function> | Callbacks appelés depuis la VM véhicule ou l'UI via `extensions.mcp_tools._cb.<nom>(...)` : ai, electrics, vehLua, vueDump, uiEval. Servent à rapporter des résultats asynchrones dans mcp/shared asyncResults. |
| `schemas` | table<string, table> | Métadonnées des outils : nom -> {description, inputSchema} (JSON Schema), fusionnées depuis chaque module. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools.lua`.*
