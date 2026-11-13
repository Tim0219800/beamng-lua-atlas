# `telemetry_trackers_mcp`

*Fichier : `lua/ge/extensions/telemetry/trackers/mcp.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_mcp` : `extensions.load("telemetry_trackers_mcp")`, puis la globale `telemetry_trackers_mcp`

Suiveur de télémétrie des appels d'outils MCP (serveur Model Context Protocol du jeu) : pour chaque appel d'outil, enregistre le nom de l'outil et si l'appel a échoué (évènement « mcpToolCalled »). Les arguments et résultats ne sont pas rapportés.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_mcp.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel. *(interne)* *(hook)* | 18 |
| `telemetry_trackers_mcp.onMcpToolCalled(toolName, isError)` | Hook appelé quand un outil MCP est appelé : émet mcpToolCalled. *(interne)* *(hook)* | 10 |

### Détail des paramètres

#### `telemetry_trackers_mcp.onMcpToolCalled(toolName, isError)`

Hook appelé quand un outil MCP est appelé : émet mcpToolCalled.

- `toolName` (*string*) : Nom de l'outil MCP.
- `isError` (*boolean*) : true si l'appel a échoué.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/mcp.lua`.*
