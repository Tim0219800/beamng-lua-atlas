# `editor_toolUtilities_dice`

*Fichier : `lua/ge/extensions/editor/toolUtilities/dice.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_dice` : `extensions.load("editor_toolUtilities_dice")`, puis la globale `editor_toolUtilities_dice`

Tirage pseudo-aléatoire déterministe pour les outils de l'éditeur : à partir d'une graine (seed), d'un sel (salt) qui distingue plusieurs décisions à une même adresse, et de jusqu'à cinq nombres (a à e) qui disent « où » (volume, étage, index de pièce…), renvoie toujours la même valeur. Utile pour des variations reproductibles (jitter) sans état.

## Exemple

```lua
local r = editor_toolUtilities_dice.roll(seed, 1, floor, bay)
local j = editor_toolUtilities_dice.spread(seed, 2, floor, bay)
```

## Remarques

- Les emplacements a à e absents (nil) comptent pour zéro, de même que seed et salt.
- Le calcul est modulo 2147483647 ; le résultat est dans [0,1).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e)` | Tirage déterministe dans [0,1) pour l'adresse (seed, salt, a..e). | 12 |
| `editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e)` | Même tirage que roll, ramené à l'intervalle -1..1 (écart dans un sens ou l'autre, pratique pour un jitter). | 24 |

### Détail des paramètres

#### `editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e)`

Tirage déterministe dans [0,1) pour l'adresse (seed, salt, a..e).

- `seed` (*number|nil*) : Graine
- `salt` (*number|nil*) : Sel distinguant les décisions d'une même adresse
- `a` (*number|nil*) : Composante d'adresse 1
- `b` (*number|nil*) : Composante d'adresse 2
- `c` (*number|nil*) : Composante d'adresse 3
- `d` (*number|nil*) : Composante d'adresse 4
- `e` (*number|nil*) : Composante d'adresse 5
- **renvoie** : number Valeur dans [0,1).

#### `editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e)`

Même tirage que roll, ramené à l'intervalle -1..1 (écart dans un sens ou l'autre, pratique pour un jitter).

- `seed` (*number|nil*) : Graine
- `salt` (*number|nil*) : Sel
- `a` (*number|nil*) : Composante d'adresse 1
- `b` (*number|nil*) : Composante d'adresse 2
- `c` (*number|nil*) : Composante d'adresse 3
- `d` (*number|nil*) : Composante d'adresse 4
- `e` (*number|nil*) : Composante d'adresse 5
- **renvoie** : number Valeur dans [-1,1).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/dice.lua`.*
