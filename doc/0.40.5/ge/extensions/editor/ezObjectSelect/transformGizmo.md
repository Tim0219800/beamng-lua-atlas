# `editor_ezObjectSelect_transformGizmo`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_transformGizmo` : `extensions.load("editor_ezObjectSelect_transformGizmo")`, puis la globale `editor_ezObjectSelect_transformGizmo`

Guides visuels 3D de l'outil Easy Object Select pendant une translation, une mise à l'échelle ou une rotation. Dessinés avec debugDrawer : flèches (ligne + prisme) pour la translation, lignes + sphères pour l'échelle, anneau de 64 segments et arc d'angle pour la rotation. Les couleurs sont rouge/vert/bleu pour X/Y/Z ; la longueur du guide dépend de la distance à la caméra (0.16 × distance, bornée entre 1.5 et 30 m).

## Remarques

- Le paramètre constraint est {axis = "x"|"y"|"z", exclude = boolean} : sans exclude seul l'axe est dessiné, avec exclude les deux autres (contrainte de plan). Sans contrainte les trois axes sont dessinés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_transformGizmo.axisColors()` | Renvoie la table des couleurs d'axes {x, y, z} (ColorF). | 42 |
| `editor_ezObjectSelect_transformGizmo.drawRotation(pivot, axis, startVector, angle)` | Dessine l'anneau de rotation autour de l'axe donné et, si l'angle n'est pas nul, un arc épais de l'angle parcouru depuis le vecteur de départ. | 92 |
| `editor_ezObjectSelect_transformGizmo.drawScale(pivot, axes, constraint)` | Dessine les guides de mise à l'échelle (ligne terminée par une sphère) pour les axes concernés. | 64 |
| `editor_ezObjectSelect_transformGizmo.drawTranslate(pivot, axes, constraint)` | Dessine les flèches de translation depuis le pivot pour les axes concernés par la contrainte. | 46 |

### Détail des paramètres

#### `editor_ezObjectSelect_transformGizmo.axisColors()`

Renvoie la table des couleurs d'axes {x, y, z} (ColorF).

- **renvoie** : table<string, ColorF> Couleurs des axes x, y, z.

#### `editor_ezObjectSelect_transformGizmo.drawRotation(pivot, axis, startVector, angle)`

Dessine l'anneau de rotation autour de l'axe donné et, si l'angle n'est pas nul, un arc épais de l'angle parcouru depuis le vecteur de départ.

- `pivot` (*vec3*) : Centre de la rotation.
- `axis` (*vec3*) : Axe de rotation (normalisé en interne, défaut Z).
- `startVector` (*vec3|nil*) : Vecteur de départ projeté sur le plan de l'anneau.
- `angle` (*number|nil*) : Angle en radians.

#### `editor_ezObjectSelect_transformGizmo.drawScale(pivot, axes, constraint)`

Dessine les guides de mise à l'échelle (ligne terminée par une sphère) pour les axes concernés.

- `pivot` (*vec3*) : Centre de l'échelle.
- `axes` (*table<string, vec3>*) : Directions des axes x, y, z.
- `constraint` (*table|nil*) : Contrainte d'axe/plan, ou nil.

#### `editor_ezObjectSelect_transformGizmo.drawTranslate(pivot, axes, constraint)`

Dessine les flèches de translation depuis le pivot pour les axes concernés par la contrainte.

- `pivot` (*vec3*) : Point d'origine des flèches.
- `axes` (*table<string, vec3>*) : Directions des axes x, y, z (monde ou locales).
- `constraint` (*table|nil*) : Contrainte d'axe/plan ({axis, exclude}), ou nil pour les trois axes.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua`.*
