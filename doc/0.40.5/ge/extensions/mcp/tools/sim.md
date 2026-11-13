# `mcp_tools_sim`

*Fichier : `lua/ge/extensions/mcp/tools/sim.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_sim` : `extensions.load("mcp_tools_sim")`, puis la globale `mcp_tools_sim`

Outils MCP de contrôle de la simulation : lire l'état, changer l'échelle de temps, mettre la physique en pause, la reprendre, ou l'avancer pas à pas. S'appuie sur l'objet moteur `be`.

## Remarques

- La pause ne gèle que la physique : le rendu et la caméra continuent.
- step_physics laisse toujours la physique en pause après les ticks demandés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_sim.get_simulation_state()` | État de la simulation en JSON : physicsRunning, timeScale, speedFactor, deterministic, enabled (be:getPhysicsRunning, getSimulationTimeScale, getPhysicsSpeedFactor, getPhysicsDeterministic, getEnabled). | 9 |
| `mcp_tools_sim.pause_physics()` | Met la physique en pause (be:setPhysicsRunning(false)). | 26 |
| `mcp_tools_sim.resume_physics()` | Reprend la physique (be:setPhysicsRunning(true)). | 31 |
| `mcp_tools_sim.set_simulation_speed(args)` | Règle l'échelle de temps de la simulation (be:setSimulationTimeScale). | 19 |
| `mcp_tools_sim.step_physics(args)` | Met la physique en pause puis avance de N ticks (be:physicsStep) ; elle reste en pause. | 37 |

### Détail des paramètres

#### `mcp_tools_sim.get_simulation_state()`

État de la simulation en JSON : physicsRunning, timeScale, speedFactor, deterministic, enabled (be:getPhysicsRunning, getSimulationTimeScale, getPhysicsSpeedFactor, getPhysicsDeterministic, getEnabled).

- **renvoie** : string JSON.
- **renvoie** : boolean false.

#### `mcp_tools_sim.pause_physics()`

Met la physique en pause (be:setPhysicsRunning(false)).

- **renvoie** : string Message.
- **renvoie** : boolean false.

#### `mcp_tools_sim.resume_physics()`

Reprend la physique (be:setPhysicsRunning(true)).

- **renvoie** : string Message.
- **renvoie** : boolean false.

#### `mcp_tools_sim.set_simulation_speed(args)`

Règle l'échelle de temps de la simulation (be:setSimulationTimeScale).

- `args` (*table*) : {scale: number} 1 = normal, <1 ralenti, >1 accéléré.
- **renvoie** : string Confirmation.
- **renvoie** : boolean true si scale manquant.

#### `mcp_tools_sim.step_physics(args)`

Met la physique en pause puis avance de N ticks (be:physicsStep) ; elle reste en pause.

- `args` (*table|nil*) : {steps?: integer} nombre de ticks physiques (défaut 1, minimum 1).
- **renvoie** : string Message.
- **renvoie** : boolean false.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils de simulation. |

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `getPhysicsDeterministic`, `getPhysicsRunning`, `getPhysicsSpeedFactor`, `getSimulationTimeScale`, `physicsStep`, `setPhysicsRunning`, `setSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/sim.lua`.*
