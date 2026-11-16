# `gameplay_crawl_debug`

*Fichier : `lua/ge/extensions/gameplay/crawl/debug.lua` · VM : Game Engine (GE) · 363 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_debug` : `extensions.load("gameplay_crawl_debug")`, puis la globale `gameplay_crawl_debug`

Fenêtre de debug ImGui « Crawl Debug Window » du mode crawl, réservée aux développeurs (désactivée par défaut). Une fois activée, elle affiche pour le premier crawler actif : infos du parcours, position et vitesse du véhicule, statut dans la zone, points de pénalité (seuil DNF à 50), cooldowns d'infractions, point de récupération, point de sortie de zone (DNF à 10 m), liste des noeuds avec temps, journal des 20 derniers évènements et statut du parcours. Les données viennent de gameplay_crawl_utils.getCrawlState.

## Exemple

```lua
gameplay_crawl_debug.setEnableDebugWindow(true)
```

## Remarques

- La fenêtre s'ouvre à onCrawlStarted seulement si enableDebugWindow est vrai.
- Dans drawDebugWindow, im.Begin reçoit une nouvelle im.BoolPtr(debugWindowOpen) à chaque image : le bouton de fermeture de la fenêtre ne modifie donc pas debugWindowOpen (la fermeture n'est détectée que par la valeur de retour).
- getBoundaryStatus lit gameplay_crawl_general.activeTrail.boundary et appelle boundary:containsPoint2D.
- Seul le premier crawler actif trouvé est affiché.

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_debug.clearDebugData()` | Vide les données affichées. | 351 |
| `gameplay_crawl_debug.getEnableDebugWindow()` | Indique si la fenêtre de debug est activée. | 347 |
| `gameplay_crawl_debug.onCrawlComplete(eventData)` | Hook appelé à la fin d'un crawl : marque les données comme terminées (isFinished). *(interne)* *(hook)* | 292 |
| `gameplay_crawl_debug.onCrawlDisqualified(eventData)` | Hook appelé en cas de disqualification : marque les données comme terminées et disqualifiées. *(interne)* *(hook)* | 299 |
| `gameplay_crawl_debug.onCrawlStarted(eventData)` | Hook appelé au début d'un crawl : ouvre la fenêtre si le debug est activé. *(interne)* *(hook)* | 285 |
| `gameplay_crawl_debug.onExtensionLoaded()` | Hook appelé au chargement de l'extension : réinitialise l'état de la fenêtre. *(interne)* *(hook)* | 307 |
| `gameplay_crawl_debug.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension : réinitialise l'état de la fenêtre. *(interne)* *(hook)* | 313 |
| `gameplay_crawl_debug.onPreRender(dtReal, dtSim, dtRaw)` | Hook appelé avant le rendu : met à jour les données depuis le premier crawler actif et dessine la fenêtre. *(interne)* *(hook)* | 319 |
| `gameplay_crawl_debug.setEnableDebugWindow(enabled)` | Active ou désactive la fenêtre de debug ; la désactivation la ferme et vide les données. | 338 |

### Détail des paramètres

#### `gameplay_crawl_debug.getEnableDebugWindow()`

Indique si la fenêtre de debug est activée.

- **renvoie** : boolean État.

#### `gameplay_crawl_debug.onCrawlComplete(eventData)`

Hook appelé à la fin d'un crawl : marque les données comme terminées (isFinished).

- `eventData` (*table*) : Données de l'évènement (non utilisées).

#### `gameplay_crawl_debug.onCrawlDisqualified(eventData)`

Hook appelé en cas de disqualification : marque les données comme terminées et disqualifiées.

- `eventData` (*table*) : Données de l'évènement (non utilisées).

#### `gameplay_crawl_debug.onCrawlStarted(eventData)`

Hook appelé au début d'un crawl : ouvre la fenêtre si le debug est activé.

- `eventData` (*table*) : Données de l'évènement (non utilisées).

#### `gameplay_crawl_debug.onPreRender(dtReal, dtSim, dtRaw)`

Hook appelé avant le rendu : met à jour les données depuis le premier crawler actif et dessine la fenêtre.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_crawl_debug.setEnableDebugWindow(enabled)`

Active ou désactive la fenêtre de debug ; la désactivation la ferme et vide les données.

- `enabled` (*boolean*) : true pour activer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {'ui_imgui'}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/debug.lua`.*
