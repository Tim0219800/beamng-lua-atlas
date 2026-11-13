# `editor_toolUtilities_simplex3`

*Fichier : `lua/ge/extensions/editor/toolUtilities/simplex3.lua` · VM : Game Engine (GE) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_simplex3` : `extensions.load("editor_toolUtilities_simplex3")`, puis la globale `editor_toolUtilities_simplex3`

Bruit simplex 3D (grille simpliciale de Ken Perlin, d'après la référence de Stefan Gustavson). Déterministe, continu avec dérivée première continue. Les indices de gradient (perm % 12 + 1) sont précalculés pour accélérer les appels massifs.

## Exemple

```lua
local simplex3 = extensions.editor_toolUtilities_simplex3
local n = simplex3.noise(x * 0.05, y * 0.05, z * 0.05)
```

## Remarques

- Valeur environ dans [-1, 1] (facteur d'échelle 32).
- La page auto signale une globale affectée « i » : ce sont des variables de boucle d'initialisation, pas de vraie globale.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_simplex3.noise(xin, yin, zin)` | Bruit simplex 3D au point (xin, yin, zin). | 55 |

### Détail des paramètres

#### `editor_toolUtilities_simplex3.noise(xin, yin, zin)`

Bruit simplex 3D au point (xin, yin, zin).

- `xin` (*number*) : Coordonnée x.
- `yin` (*number*) : Coordonnée y.
- `zin` (*number*) : Coordonnée z.
- **renvoie** : number Valeur de bruit, environ [-1, 1].

**Globales affectées :** `i`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/simplex3.lua`.*
