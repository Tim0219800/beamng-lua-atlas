# `editor_toolUtilities_perlin`

*Fichier : `lua/ge/extensions/editor/toolUtilities/perlin.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_perlin` : `extensions.load("editor_toolUtilities_perlin")`, puis la globale `editor_toolUtilities_perlin`

Bruit de Perlin 2D classique (table de permutation fixe de 256 entrées, courbe fade de Perlin améliorée), déterministe. Sert aux outils de l'éditeur pour générer des variations pseudo-aléatoires reproductibles.

## Exemple

```lua
local perlin = extensions.editor_toolUtilities_perlin
local n = perlin.noise(x * 0.1, y * 0.1) -- valeur lissée
```

## Remarques

- Le résultat est périodique de période 256 en x et en y (masque band(floor(x),255)).
- Utilise la fonction globale lerp du jeu.
- La page auto signale une globale affectée « i » : la boucle d'initialisation est en réalité `for i = 0, 255` (variable locale de boucle), donc fausse alerte.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_perlin.noise(x, y)` | Renvoie le bruit de Perlin 2D au point (x, y). Valeur continue, nulle aux coordonnées entières, d'amplitude voisine de [-1, 1] environ. | 49 |

### Détail des paramètres

#### `editor_toolUtilities_perlin.noise(x, y)`

Renvoie le bruit de Perlin 2D au point (x, y). Valeur continue, nulle aux coordonnées entières, d'amplitude voisine de [-1, 1] environ.

- `x` (*number*) : Coordonnée x.
- `y` (*number*) : Coordonnée y.
- **renvoie** : number Valeur de bruit.

**Globales affectées :** `i`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/perlin.lua`.*
