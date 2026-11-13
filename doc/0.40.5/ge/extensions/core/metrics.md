# `core_metrics`

*Fichier : `lua/ge/extensions/core/metrics.lua` · VM : Game Engine (GE) · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_metrics` : `extensions.load("core_metrics")`, puis la globale `core_metrics`

Extension GE `core_metrics` : fenêtre d'affichage des performances (FPS, temps CPU/GPU, mémoire, statistiques de rendu). Elle s'affiche en haut à gauche avec ImGui, ou en texte de débogage 3D si ImGui est masqué. La fonction toggle() fait défiler les modes d'affichage. Un moddeur l'utilise surtout pour mesurer l'effet de son mod sur le framerate.

## Exemple

```lua
extensions.load('core_metrics')
core_metrics.toggle()  -- mode 1 : ligne FPS compacte
core_metrics.toggle()  -- mode 2 : tableau FPS/percentiles + mémoire
```

## Remarques

- currentMode : 0 désactivé, 1 petit (une ligne), 2 simple (tableau et mémoire), 3 complet (statistiques GFX, terrain, ground cover, forêt, ombres, lumières). Le commentaire du code mentionne seulement 0, 1, 2, mais toggle fait (mode + 1) % 4, donc 4 modes existent.
- toggle() active aussi l'overlay de timing GPU (Engine.Debug.setGpuTimingOverlayVisible) quand le mode n'est pas 0, écrit les infos mémoire dans le log en mode 2, et décharge l'extension (extensions.unload) quand on revient au mode 0.
- onInit passe l'extension en déchargement manuel (setExtensionUnloadMode(M, 'manual')) pour qu'elle reste chargée.
- Bug probable : getConsoleNumber ajoute déjà '$' devant le nom de variable (VariableRegistry.get('$'..nom)). Les appels du mode 3 passent des noms commençant déjà par '$' (ex. '$GFXDeviceStatistics::polyCount'), ce qui donne '$$...' : ces valeurs valent probablement le défaut -1 / nil et peuvent même faire échouer string.format (%d) si tonumber renvoie nil. 'GroundCover::renderedShapes' est au contraire sans '$' (le préfixe est ajouté).
- Bug probable : la variable `tableFlags` passée à im.BeginTable n'est définie nulle part dans le fichier (nil). De plus la division 1000 / fps::min etc. peut donner l'infini si la valeur vaut 0.
- Les valeurs lues viennent du registre de variables du moteur : fps::instantaneous, fps::avg, fps::min, fps::max, fps::p90/p95/p99, fps::cpuTime, fps::gpuTime (< 0 = indisponible, affiché N/A), fps::waitForGPU, fps::instantaneousUncap.

**Dépendances (chargées avant) :** `ui_imgui`, `ui_visibility`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_metrics.onDeserialized(d)` | Après un rechargement Lua : restaure currentMode (d.currentMode, sans valeur par défaut) et l'overlay GPU. *(interne)* *(hook)* | 307 |
| `core_metrics.onInit()` | Hook d'initialisation : déchargement manuel et état de l'overlay GPU selon currentMode. *(interne)* *(hook)* | 298 |
| `core_metrics.onSerialize()` | Avant un rechargement Lua : mémorise le mode courant. *(interne)* *(hook)* | 303 |
| `core_metrics.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : dessine la fenêtre de métriques (ImGui) ou, si ImGui est masqué, du texte de débogage dans la vue 3D. Ne fait rien en mode 0. *(interne)* *(hook)* | 44 |
| `core_metrics.toggle()` | Passe au mode d'affichage suivant (0 -> 1 -> 2 -> 3 -> 0). Au retour à 0, l'extension se décharge. | 15 |

### Détail des paramètres

#### `core_metrics.onDeserialized(d)`

Après un rechargement Lua : restaure currentMode (d.currentMode, sans valeur par défaut) et l'overlay GPU.

- `d` (*table*) : Table renvoyée par onSerialize.

#### `core_metrics.onSerialize()`

Avant un rechargement Lua : mémorise le mode courant.

- **renvoie** : table { currentMode }

#### `core_metrics.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : dessine la fenêtre de métriques (ImGui) ou, si ImGui est masqué, du texte de débogage dans la vue 3D. Ne fait rien en mode 0.

- `dtReal` (*number*) : Temps réel écoulé (s), non utilisé.
- `dtSim` (*number*) : Temps de simulation écoulé (s), non utilisé.
- `dtRaw` (*number*) : Temps brut écoulé (s), non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `currentMode` | integer | Mode d'affichage courant : 0 désactivé, 1 petit, 2 simple, 3 complet. Sauvegardé dans onSerialize. |
| `dependencies` | string[] | { 'ui_imgui', 'ui_visibility' }. |

## Appels vers le moteur (C++)

- `Engine.` `isProgramFocused`
- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/metrics.lua`.*
