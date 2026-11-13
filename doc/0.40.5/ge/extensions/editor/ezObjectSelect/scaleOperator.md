# `editor_ezObjectSelect_scaleOperator`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua` · VM : Game Engine (GE) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_scaleOperator` : `extensions.load("editor_ezObjectSelect_scaleOperator")`, puis la globale `editor_ezObjectSelect_scaleOperator`

Opérateur modal « Scale » (touche S) de l'outil Easy Select. Au démarrage il ouvre une session de transformation (modalOperatorCommon.begin, historique « EasySelectScale ») ; le facteur d'échelle est la distance souris-pivot à l'écran divisée par la distance initiale (ou une valeur saisie au clavier), bornée à [0.0001, 100000]. Contraintes d'axe X/Y/Z, Shift+axe pour exclure un axe, double appui pour l'espace local. Clic gauche/Entrée valide, clic droit/Échap annule.

## Remarques

- Le suivi radial n'est actif qu'après que la souris s'est éloignée d'au moins 10 px (x uiscale) du pivot ; avant cela le facteur vaut 1.
- Refuse de démarrer si un opérateur ou une transformSession est déjà actif.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_scaleOperator.begin(options)` | Démarre l'opérateur sur la sélection. Renvoie false si déjà actif, si la session n'a pas pu démarrer ou si le pivot n'est pas projetable à l'écran (la session est alors annulée). | 46 |
| `editor_ezObjectSelect_scaleOperator.cancel()` | Annule l'opérateur en cours (restaure les objets). | 97 |
| `editor_ezObjectSelect_scaleOperator.drawScreen()` | Dessine l'indicateur près du pivot et le HUD (contrainte UNIFORM/axe, WORLD/LOCAL, facteur « 1.000x », aide des touches). | 115 |
| `editor_ezObjectSelect_scaleOperator.getObjectIds()` | Ids des objets manipulés par la session ({} si inactif). | 111 |
| `editor_ezObjectSelect_scaleOperator.isActive()` | Indique si l'opérateur est en cours. | 107 |
| `editor_ezObjectSelect_scaleOperator.setLocalSpace(localSpace)` | Bascule espace local/monde pour la contrainte courante. | 103 |
| `editor_ezObjectSelect_scaleOperator.update()` | À appeler chaque frame : gère fin demandée, contraintes, saisie numérique, calcule le facteur, l'applique via transformSession.updateScale et dessine le gizmo. | 67 |
| `editor_ezObjectSelect_scaleOperator.wantsBegin()` | Renvoie true si la touche S vient d'être pressée. | 42 |

### Détail des paramètres

#### `editor_ezObjectSelect_scaleOperator.begin(options)`

Démarre l'opérateur sur la sélection. Renvoie false si déjà actif, si la session n'a pas pu démarrer ou si le pivot n'est pas projetable à l'écran (la session est alors annulée).

- `options` (*table|nil*) : {defaultLocal = boolean} : espace local par défaut
- **renvoie** : boolean true si démarré

#### `editor_ezObjectSelect_scaleOperator.cancel()`

Annule l'opérateur en cours (restaure les objets).

- **renvoie** : boolean true si un opérateur était actif

#### `editor_ezObjectSelect_scaleOperator.getObjectIds()`

Ids des objets manipulés par la session ({} si inactif).

- **renvoie** : table liste d'ids

#### `editor_ezObjectSelect_scaleOperator.isActive()`

Indique si l'opérateur est en cours.

- **renvoie** : boolean 

#### `editor_ezObjectSelect_scaleOperator.setLocalSpace(localSpace)`

Bascule espace local/monde pour la contrainte courante.

- `localSpace` (*boolean*) : true pour l'espace local
- **renvoie** : boolean résultat de modalOperatorCommon.setLocalSpace

#### `editor_ezObjectSelect_scaleOperator.update()`

À appeler chaque frame : gère fin demandée, contraintes, saisie numérique, calcule le facteur, l'applique via transformSession.updateScale et dessine le gizmo.

- **renvoie** : string|nil "active" tant que l'opérateur tourne ; sinon résultat de finish (valeur résolue et complétion) ; nil si inactif

#### `editor_ezObjectSelect_scaleOperator.wantsBegin()`

Renvoie true si la touche S vient d'être pressée.

- **renvoie** : boolean touche S pressée cette frame

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/scaleOperator.lua`.*
