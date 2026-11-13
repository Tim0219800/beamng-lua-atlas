# `mcp_tools_perf`

*Fichier : `lua/ge/extensions/mcp/tools/perf.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_perf` : `extensions.load("mcp_tools_perf")`, puis la globale `mcp_tools_perf`

Outils MCP de performance : métriques de la dernière frame, raison du limiteur de FPS, usage de la VRAM, et captures du profileur Optick (builds BNG_PROFILER=OPTICK seulement).

## Remarques

- profiler_run n'est pas bloquant : un job (core_jobsystem) attend delay puis capture pendant duration secondes puis sauvegarde le .opt ; un seul à la fois (« already running »).
- Chemin de sortie : par défaut <dossier utilisateur>/optick/optick_AAAA-MM-JJ_HH-MM-SS.opt ; un chemin relatif est placé sous optick/ ; un chemin absolu (lecteur ou UNC) est utilisé tel quel.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_perf.get_fps_limit_reason()` | Sources et plafonds actuels du limiteur de FPS (vsync, limites avant/arrière-plan, focus), via Engine.getCurrentFpsLimitReason. | 17 |
| `mcp_tools_perf.get_performance_metrics()` | Métriques de la dernière frame (timings, mémoire, compteurs) via Engine.Debug.getLastPerformanceMetrics, en JSON. | 9 |
| `mcp_tools_perf.get_vram_usage()` | Usage de la mémoire vidéo via Engine.Render.getVRAMUsage. | 22 |
| `mcp_tools_perf.profiler_run(args)` | Déclenche une capture Optick de `duration` secondes après `delay` et enregistre un fichier .opt ; renvoie son chemin et le délai de disponibilité. | 52 |
| `mcp_tools_perf.run_optick_ui()` | Lance l'interface externe Optick (comme le raccourci Ctrl+Alt+O) en appelant la fonction globale launchOptick si elle existe. | 89 |

### Détail des paramètres

#### `mcp_tools_perf.get_fps_limit_reason()`

Sources et plafonds actuels du limiteur de FPS (vsync, limites avant/arrière-plan, focus), via Engine.getCurrentFpsLimitReason.

- **renvoie** : string JSON ou erreur.
- **renvoie** : boolean true si indisponible.

#### `mcp_tools_perf.get_performance_metrics()`

Métriques de la dernière frame (timings, mémoire, compteurs) via Engine.Debug.getLastPerformanceMetrics, en JSON.

- **renvoie** : string JSON (objet vide si l'API manque).
- **renvoie** : boolean false.

#### `mcp_tools_perf.get_vram_usage()`

Usage de la mémoire vidéo via Engine.Render.getVRAMUsage.

- **renvoie** : string JSON (ou tostring si ce n'est pas une table).
- **renvoie** : boolean true si indisponible.

#### `mcp_tools_perf.profiler_run(args)`

Déclenche une capture Optick de `duration` secondes après `delay` et enregistre un fichier .opt ; renvoie son chemin et le délai de disponibilité.

- `args` (*table|nil*) : {duration?: number s (défaut 5), delay?: number s (défaut 0), path?: string}
- **renvoie** : string JSON {ok, path, duration, delay, readyInSeconds, note} ou erreur.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_perf.run_optick_ui()`

Lance l'interface externe Optick (comme le raccourci Ctrl+Alt+O) en appelant la fonction globale launchOptick si elle existe.

- **renvoie** : string JSON {ok=true} (même si launchOptick est absent).
- **renvoie** : boolean false.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils de performance. |

## Appels vers le moteur (C++)

- `Engine.` `getCurrentFpsLimitReason`
- `FS:` `directoryCreate`, `getUserPath`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/perf.lua`.*
