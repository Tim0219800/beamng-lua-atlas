# `editor_ezObjectSelect_transformNumericInput`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua` · VM : Game Engine (GE) · 85 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_transformNumericInput` : `extensions.load("editor_ezObjectSelect_transformNumericInput")`, puis la globale `editor_ezObjectSelect_transformNumericInput`

Petit tampon de saisie numérique au clavier pour les opérations de transformation d'Easy Object Select (comme dans Blender : taper « 2.5 » pendant un déplacement). Lit les touches chiffres (rangée du haut et pavé numérique), point/virgule décimale, moins (inverse le signe) et retour arrière via ImGui, et maintient une chaîne dans un état {text, active}.

## Exemple

```lua
local ni = require("editor/ezObjectSelect/transformNumericInput")
local st = ni.newState()
ni.update(st)          -- chaque frame
local v = ni.value(st) -- nil tant que rien de valide n'est saisi
```

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_transformNumericInput.clear(state)` | Vide le texte et désactive la saisie. | 30 |
| `editor_ezObjectSelect_transformNumericInput.newState()` | Crée un état de saisie vide. | 26 |
| `editor_ezObjectSelect_transformNumericInput.update(state, ignoreTopRowFour)` | Traite les touches pressées cette frame : chiffres, un seul point décimal (préfixé d'un 0 si le texte est vide ou « - »), moins qui bascule le signe, retour arrière. | 40 |
| `editor_ezObjectSelect_transformNumericInput.value(state)` | Convertit le texte saisi en nombre. | 77 |

### Détail des paramètres

#### `editor_ezObjectSelect_transformNumericInput.clear(state)`

Vide le texte et désactive la saisie.

- `state` (*table*) : État créé par newState.

#### `editor_ezObjectSelect_transformNumericInput.newState()`

Crée un état de saisie vide.

- **renvoie** : table {text = "", active = false}.

#### `editor_ezObjectSelect_transformNumericInput.update(state, ignoreTopRowFour)`

Traite les touches pressées cette frame : chiffres, un seul point décimal (préfixé d'un 0 si le texte est vide ou « - »), moins qui bascule le signe, retour arrière.

- `state` (*table*) : État de saisie, modifié en place.
- `ignoreTopRowFour` (*boolean|nil*) : Si true, ignore la touche 4 de la rangée du haut pour cette frame (utile quand elle sert à autre chose).
- **renvoie** : boolean true si le texte a changé.

#### `editor_ezObjectSelect_transformNumericInput.value(state)`

Convertit le texte saisi en nombre.

- `state` (*table*) : État de saisie.
- **renvoie** : number|nil Valeur, ou nil si inactif, vide, « - » ou « . ».

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua`.*
