# `editor_toolUtilities_simplex`

*Fichier : `lua/ge/extensions/editor/toolUtilities/simplex.lua` · VM : Game Engine (GE) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_simplex` : `extensions.load("editor_toolUtilities_simplex")`, puis la globale `editor_toolUtilities_simplex`

Bruit simplex 2D (grille simpliciale de Perlin) avec table de permutation fixe, donc déterministe. Optimisé pour des millions d'échantillons (facteurs de déformation précalculés, gradients dans deux tableaux plats, indices de gradient précalculés). Utilisé par les outils de l'éditeur pour des variations pseudo-aléatoires reproductibles.

## Exemple

```lua
local simplex = extensions.editor_toolUtilities_simplex
local n = simplex.noise(x * 0.05, y * 0.05)
```

## Remarques

- Valeur continue, environ dans [-1, 1] (facteur d'échelle 70).
- Périodique de 256 cellules en i et j (i % 256, j % 256).
- La page auto signale une globale affectée « i » : ce sont des variables de boucle `for i = ...`, pas de vraie globale.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_simplex.noise(xin, yin)` | Bruit simplex 2D au point (xin, yin). | 54 |

### Détail des paramètres

#### `editor_toolUtilities_simplex.noise(xin, yin)`

Bruit simplex 2D au point (xin, yin).

- `xin` (*number*) : Coordonnée x.
- `yin` (*number*) : Coordonnée y.
- **renvoie** : number Valeur de bruit, environ [-1, 1].

**Globales affectées :** `i`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/simplex.lua`.*
