# `telemetry_performanceMetrics`

*Fichier : `lua/ge/extensions/telemetry/performanceMetrics.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceMetrics` : `extensions.load("telemetry_performanceMetrics")`, puis la globale `telemetry_performanceMetrics`

Petit module utilitaire (chargé par require) de la télémétrie de performance : lecture sûre de variables du VariableRegistry, état de focus du programme et cause d'un plafond de FPS choisi par le joueur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceMetrics.getLimitedBy()` | Dit quel plafond de FPS choisi par le joueur s'applique : 'background' (limite en arrière-plan sans focus), 'vr' (session OpenXR), 'limiter' (fpsLimitEnabled), 'vsync', sinon nil. Sert à ne pas confondre un FPS bloqué à 60 avec une machine incapable de faire mieux. | 23 |
| `telemetry_performanceMetrics.isFocused()` | Indique si la fenêtre du jeu a le focus (true si Engine.isProgramFocused n'existe pas). | 17 |
| `telemetry_performanceMetrics.readAvailable(name)` | Comme readNumber mais renvoie nil au lieu de -1 (valeur indisponible). | 12 |
| `telemetry_performanceMetrics.readNumber(name)` | Lit une variable du VariableRegistry en nombre ; renvoie -1 si elle est absente, non numérique, NaN ou infinie. | 7 |

### Détail des paramètres

#### `telemetry_performanceMetrics.getLimitedBy()`

Dit quel plafond de FPS choisi par le joueur s'applique : 'background' (limite en arrière-plan sans focus), 'vr' (session OpenXR), 'limiter' (fpsLimitEnabled), 'vsync', sinon nil. Sert à ne pas confondre un FPS bloqué à 60 avec une machine incapable de faire mieux.

- **renvoie** : string|nil 'background', 'vr', 'limiter', 'vsync' ou nil.

#### `telemetry_performanceMetrics.isFocused()`

Indique si la fenêtre du jeu a le focus (true si Engine.isProgramFocused n'existe pas).

- **renvoie** : boolean true si le programme a le focus.

#### `telemetry_performanceMetrics.readAvailable(name)`

Comme readNumber mais renvoie nil au lieu de -1 (valeur indisponible).

- `name` (*string*) : Nom de la variable.
- **renvoie** : number|nil Valeur >= 0, ou nil.

#### `telemetry_performanceMetrics.readNumber(name)`

Lit une variable du VariableRegistry en nombre ; renvoie -1 si elle est absente, non numérique, NaN ou infinie.

- `name` (*string*) : Nom de la variable (ex. '$fps::avg').
- **renvoie** : number Valeur, ou -1.

## Appels vers le moteur (C++)

- `Engine.` `isProgramFocused`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceMetrics.lua`.*
