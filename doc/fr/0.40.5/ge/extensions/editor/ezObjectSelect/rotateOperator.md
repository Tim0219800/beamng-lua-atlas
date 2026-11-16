# `editor_ezObjectSelect_rotateOperator`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua` · VM : Game Engine (GE) · 141 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_rotateOperator` : `extensions.load("editor_ezObjectSelect_rotateOperator")`, puis la globale `editor_ezObjectSelect_rotateOperator`

Opérateur modal « Rotate » (touche R) de l'outil Easy Select. Ouvre une session de transformation (historique « EasySelectRotate ») et fait tourner la sélection autour du pivot : sans contrainte l'axe est la direction de vue de la caméra, avec contrainte X/Y/Z c'est l'axe choisi (monde ou local). L'angle vient de l'angle écran souris-pivot ou d'une saisie numérique en degrés, avec magnétisme optionnel. Clic gauche/Entrée valide, clic droit/Échap annule.

## Remarques

- Le magnétisme n'est appliqué qu'à l'angle souris (pas à la saisie numérique) et si options.rotateSnapEnabled est vrai et rotateSnapSize > 0 (en degrés).
- Changer d'axe ou d'espace réinitialise la référence souris et l'angle à 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_rotateOperator.begin(options)` | Démarre la rotation. Renvoie false si déjà actif, session impossible ou pivot non projetable. | 66 |
| `editor_ezObjectSelect_rotateOperator.cancel()` | Annule la rotation en cours. | 105 |
| `editor_ezObjectSelect_rotateOperator.drawScreen()` | Dessine l'indicateur et le HUD (contrainte VIEW/axe, espace, angle en degrés ou texte saisi). | 125 |
| `editor_ezObjectSelect_rotateOperator.getObjectIds()` | Ids des objets de la session ({} si inactif). | 121 |
| `editor_ezObjectSelect_rotateOperator.isActive()` | Indique si l'opérateur est en cours. | 117 |
| `editor_ezObjectSelect_rotateOperator.setLocalSpace(localSpace)` | Bascule espace local/monde et réinitialise la référence souris. | 111 |
| `editor_ezObjectSelect_rotateOperator.update(options)` | Chaque frame : gère fin, contrainte, saisie, calcule l'angle (rad), applique transformSession.updateRotation et dessine le gizmo. | 86 |
| `editor_ezObjectSelect_rotateOperator.wantsBegin()` | True si la touche R vient d'être pressée. | 62 |

### Détail des paramètres

#### `editor_ezObjectSelect_rotateOperator.begin(options)`

Démarre la rotation. Renvoie false si déjà actif, session impossible ou pivot non projetable.

- `options` (*table|nil*) : {defaultLocal = boolean}
- **renvoie** : boolean true si démarré

#### `editor_ezObjectSelect_rotateOperator.cancel()`

Annule la rotation en cours.

- **renvoie** : boolean true si un opérateur était actif

#### `editor_ezObjectSelect_rotateOperator.getObjectIds()`

Ids des objets de la session ({} si inactif).

- **renvoie** : table 

#### `editor_ezObjectSelect_rotateOperator.isActive()`

Indique si l'opérateur est en cours.

- **renvoie** : boolean 

#### `editor_ezObjectSelect_rotateOperator.setLocalSpace(localSpace)`

Bascule espace local/monde et réinitialise la référence souris.

- `localSpace` (*boolean*) : true pour local
- **renvoie** : boolean false si le changement n'a pas eu lieu

#### `editor_ezObjectSelect_rotateOperator.update(options)`

Chaque frame : gère fin, contrainte, saisie, calcule l'angle (rad), applique transformSession.updateRotation et dessine le gizmo.

- `options` (*table|nil*) : {rotateSnapEnabled = boolean, rotateSnapSize = degrés}
- **renvoie** : string|nil "active" pendant l'opération, résultat de finish à la fin, nil si inactif

#### `editor_ezObjectSelect_rotateOperator.wantsBegin()`

True si la touche R vient d'être pressée.

- **renvoie** : boolean 

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/rotateOperator.lua`.*
