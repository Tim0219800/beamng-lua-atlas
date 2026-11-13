# `editor_roadArchitect_clothoid`

*Fichier : `lua/ge/extensions/editor/roadArchitect/clothoid.lua` · VM : Game Engine (GE) · 305 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_clothoid` : `extensions.load("editor_roadArchitect_clothoid")`, puis la globale `editor_roadArchitect_clothoid`

Évaluation de clothoïdes (spirales d'Euler, courbure variant linéairement avec l'abscisse) pour Road Architect. Le code est largement basé sur la bibliothèque Clothoids d'Enrico Bertolazzi et Marco Frego (licence BSD, copyright 2024 Bertolazzi, Frego et BeamNG) : les intégrales de Fresnel généralisées sont calculées en interne (fresnelCS, evalXYaSmall, evalXYaLarge, generalizedFresnelCS). Un moddeur s'en sert pour obtenir des points sur une courbe de raccordement progressive (routes, jonctions).

## Exemple

```lua
local clothoid = require('editor/roadArchitect/clothoid')
local p = clothoid.evaluate(vec3(0, 0, 0), 0, 0, 0.001, 20) -- point à 20 m, départ cap 0, courbure initiale 0, dKappa 0.001
```

## Remarques

- Seule evaluate est exportée ; les routines de Fresnel sont locales.
- Le vec3 renvoyé n'a que x et y renseignés (z = 0 par défaut) : la hauteur de start n'est pas reprise.
- Le cap theta0 est en radians ; p est la longueur d'arc depuis le point de départ (unités du monde, mètres).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_clothoid.evaluate(start, theta0, kappa, dKappa, p)` | Évalue une clothoïde au paramètre p (longueur d'arc, de 0 à la longueur géodésique totale) : calcule l'intégrale de Fresnel généralisée avec a = dKappa·p², b = kappa·p et c = theta0, puis renvoie start + p·(C, S). | 296 |

### Détail des paramètres

#### `editor_roadArchitect_clothoid.evaluate(start, theta0, kappa, dKappa, p)`

Évalue une clothoïde au paramètre p (longueur d'arc, de 0 à la longueur géodésique totale) : calcule l'intégrale de Fresnel généralisée avec a = dKappa·p², b = kappa·p et c = theta0, puis renvoie start + p·(C, S).

- `start` (*vec3*) : Point de départ de la spirale (seuls x et y sont utilisés).
- `theta0` (*number*) : Cap initial en radians.
- `kappa` (*number*) : Courbure initiale (1/m).
- `dKappa` (*number*) : Taux de variation de la courbure par unité de longueur (1/m²).
- `p` (*number*) : Abscisse curviligne à évaluer, entre 0 et la longueur de la spirale.
- **renvoie** : vec3 Position (x, y) du point sur la clothoïde, z à 0.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/clothoid.lua`.*
