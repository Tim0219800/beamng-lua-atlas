# `editor_toolUtilities_roadPlaceables`

*Fichier : `lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua` · VM : Game Engine (GE) · 345 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_roadPlaceables` : `extensions.load("editor_toolUtilities_roadPlaceables")`, puis la globale `editor_toolUtilities_roadPlaceables`

Contrôleur partagé d'éléments « posables » pour les outils de route à splines de l'éditeur : placer, sélectionner, glisser et éditer des éléments positionnés le long de l'axe d'une route (par exemple passages piétons, groupes de réparations). Un outil peut porter plusieurs types (kind) ; chacun enregistre sa table « host » avec setHost, et placement, sélection, glissement et poignées sont indexés par type. Le module n'a aucune dépendance à un dossier d'outil non livré. L'état est global au module : un seul outil de route actif à la fois, chaque outil appelle reset() à l'activation et à la désactivation.

## Exemple

```lua
local rp = extensions.editor_toolUtilities_roadPlaceables
-- onActivate de l'outil :
rp.reset()
rp.setHost({kind = 'crossing', label = 'Crossing', getGroups = getGroups, isRoad = isRoad, itemsOf = itemsOf,
  extentOf = extentOf, frameAt = frameAt, tForPoint = tForPoint, clampT = clampT,
  addItem = addItem, removeItem = removeItem, deepCopy = deepCopy, undo = undo, redo = redo, defaultDepthM = 4})
-- chaque frame :
rp.handlePlacement(groups); rp.drawHandles(groups, selGroup, false)
```

## Remarques

- Champs obligatoires de host : kind (string unique), label (nom pour invites et noms d'annulation), getGroups(), isRoad(g), itemsOf(g), extentOf(item), frameAt(g, t01) -> centre, p0, p1 (nil si pas prêt), tForPoint(g, worldPt, extentM) -> t01, clampT(g, t01, extentM) -> t01, addItem(g, t01) -> item|nil, removeItem(g, idx), deepCopy(g), undo, redo (callbacks de editor.history:commitAction), defaultDepthM.
- Les éléments portent leur position normalisée t (0..1, défaut 0.5) le long de la route ; les poignées sont aux bords de chaussée (p0/p1), pas sur l'axe.
- Le paramètre kind est optionnel partout : il se résout en kind explicite, sinon dernier type survolé, sinon premier type enregistré.
- Le rayon de sélection des poignées est adaptatif (0.2 * sqrt(distance) * 0.9) et doit rester aligné avec splineInput.
- drawEditor affiche un éditeur ImGui pour un élément de type passage piéton (titre « Pedestrian Crossing », curseur de profondeur 1.5 à 8 m, étendue latérale, suppression) : utile seulement pour un host avec depthM et lateral.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind)` | Route un clic sur une poignée : CTRL la supprime (avec entrée d'annulation) ; un clic simple la sélectionne et démarre le glissement le long de la route (un seul clic-glisser la déplace). | 127 |
| `editor_toolUtilities_roadPlaceables.drawEditor()` | Éditeur compact ImGui de l'élément sélectionné de type passage piéton (profondeur, étendue latérale, suppression). | 268 |
| `editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected)` | Dessine poignées et surbrillance des éléments existants, tous types confondus, seulement pour la route sélectionnée ou la route possédant l'élément sélectionné. | 222 |
| `editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind)` | Lueur de survol et invite pour l'élément sous le curseur cette frame (invite « drag to move, or CTRL to delete »). | 251 |
| `editor_toolUtilities_roadPlaceables.getSelection()` | Renvoie la sélection courante. | 83 |
| `editor_toolUtilities_roadPlaceables.handlePlacement(groups)` | Aperçu fantôme et clic pour ajouter tant que le mode placement est actif (routes seulement ; visée par rayon caméra contre l'axe, donc aussi sur les sections surélevées). Sélectionne l'élément ajouté. | 147 |
| `editor_toolUtilities_roadPlaceables.handleSelectDrag(groups)` | Glissement le long de la route de la poignée sélectionnée ; la sélection commence le glissement. | 194 |
| `editor_toolUtilities_roadPlaceables.hasSelection(kind)` | Vrai si un élément est sélectionné (du type donné si kind est fourni). | 79 |
| `editor_toolUtilities_roadPlaceables.isDragging()` | Vrai pendant un glissement le long de la route. | 78 |
| `editor_toolUtilities_roadPlaceables.isPlaceMode(kind)` | Indique si le mode placement est actif (pour ce type si kind est donné, sinon pour n'importe lequel). L'outil hôte possède le bouton Add et pilote ces accesseurs. | 76 |
| `editor_toolUtilities_roadPlaceables.reset()` | Efface tout : registre des hôtes, mode placement, sélection et glissement. À appeler dans onActivate et onDeactivate de l'outil hôte. | 86 |
| `editor_toolUtilities_roadPlaceables.select(kind, gi, ci)` | Sélectionne un élément pour qu'une liste de l'hôte puisse le mettre en évidence. | 82 |
| `editor_toolUtilities_roadPlaceables.setHost(host)` | Enregistre l'hôte d'un type d'élément posable. À appeler dans onActivate de l'outil, après reset(). | 58 |
| `editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind)` | Active ou désactive le mode placement pour un type (kind résolu : explicite, survolé ou unique). | 77 |
| `editor_toolUtilities_roadPlaceables.underMouse()` | Cherche la poignée d'élément la plus proche sous le curseur parmi tous les types (rayon de la caméra contre sphères aux bords de chaussée). Mémorise aussi le type survolé. | 95 |

### Détail des paramètres

#### `editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind)`

Route un clic sur une poignée : CTRL la supprime (avec entrée d'annulation) ; un clic simple la sélectionne et démarre le glissement le long de la route (un seul clic-glisser la déplace).

- `groups` (*table*) : Groupes (routes).
- `gi` (*integer*) : Indice du groupe.
- `ci` (*integer*) : Indice de l'élément.
- `ctrlDown` (*boolean*) : CTRL enfoncé.
- `kind` (*string|nil*) : Type ; sinon survolé ou unique.
- **renvoie** : string 'deleted', 'selected' ou 'none'.

#### `editor_toolUtilities_roadPlaceables.drawEditor()`

Éditeur compact ImGui de l'élément sélectionné de type passage piéton (profondeur, étendue latérale, suppression).

- **renvoie** : boolean false quand la sélection a disparu (l'hôte réinitialise alors son type de sélection).

#### `editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected)`

Dessine poignées et surbrillance des éléments existants, tous types confondus, seulement pour la route sélectionnée ou la route possédant l'élément sélectionné.

- `groups` (*table*) : Groupes (routes).
- `selGroup` (*integer|nil*) : Indice de la route sélectionnée.
- `showSelected` (*boolean*) : true si la sélection globale de l'hôte est actuellement l'un de ces éléments (style sélectionné contre survol).

#### `editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind)`

Lueur de survol et invite pour l'élément sous le curseur cette frame (invite « drag to move, or CTRL to delete »).

- `groups` (*table*) : Groupes (routes).
- `gi` (*integer*) : Indice du groupe.
- `ci` (*integer*) : Indice de l'élément.
- `kind` (*string|nil*) : Type ; sinon survolé ou unique.

#### `editor_toolUtilities_roadPlaceables.getSelection()`

Renvoie la sélection courante.

- **renvoie** : string|nil kind.
- **renvoie** : integer|nil gi.
- **renvoie** : integer|nil ci.

#### `editor_toolUtilities_roadPlaceables.handlePlacement(groups)`

Aperçu fantôme et clic pour ajouter tant que le mode placement est actif (routes seulement ; visée par rayon caméra contre l'axe, donc aussi sur les sections surélevées). Sélectionne l'élément ajouté.

- `groups` (*table*) : Groupes (routes).
- **renvoie** : boolean true si un élément a été ajouté cette frame.

#### `editor_toolUtilities_roadPlaceables.handleSelectDrag(groups)`

Glissement le long de la route de la poignée sélectionnée ; la sélection commence le glissement.

- `groups` (*table*) : Groupes (routes).
- **renvoie** : boolean true tant que le module possède la frame (l'hôte saute alors le glissement de nœud/aux par défaut).

#### `editor_toolUtilities_roadPlaceables.hasSelection(kind)`

Vrai si un élément est sélectionné (du type donné si kind est fourni).

- `kind` (*string|nil*) : Type à tester.
- **renvoie** : boolean true si sélection.

#### `editor_toolUtilities_roadPlaceables.isDragging()`

Vrai pendant un glissement le long de la route.

- **renvoie** : boolean true si glissement en cours.

#### `editor_toolUtilities_roadPlaceables.isPlaceMode(kind)`

Indique si le mode placement est actif (pour ce type si kind est donné, sinon pour n'importe lequel). L'outil hôte possède le bouton Add et pilote ces accesseurs.

- `kind` (*string|nil*) : Type à tester.
- **renvoie** : boolean true si en mode placement.

#### `editor_toolUtilities_roadPlaceables.select(kind, gi, ci)`

Sélectionne un élément pour qu'une liste de l'hôte puisse le mettre en évidence.

- `kind` (*string*) : Type de l'élément.
- `gi` (*integer*) : Indice du groupe (route).
- `ci` (*integer*) : Indice de l'élément dans le groupe.

#### `editor_toolUtilities_roadPlaceables.setHost(host)`

Enregistre l'hôte d'un type d'élément posable. À appeler dans onActivate de l'outil, après reset().

- `host` (*table*) : Table hôte avec kind, label, getGroups, isRoad, itemsOf, extentOf, frameAt, tForPoint, clampT, addItem, removeItem, deepCopy, undo, redo, defaultDepthM.

#### `editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind)`

Active ou désactive le mode placement pour un type (kind résolu : explicite, survolé ou unique).

- `on` (*boolean*) : true pour armer.
- `kind` (*string|nil*) : Type à armer.

#### `editor_toolUtilities_roadPlaceables.underMouse()`

Cherche la poignée d'élément la plus proche sous le curseur parmi tous les types (rayon de la caméra contre sphères aux bords de chaussée). Mémorise aussi le type survolé.

- **renvoie** : integer|nil gi, indice du groupe.
- **renvoie** : integer|nil ci, indice de l'élément.
- **renvoie** : string|nil kind.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua`.*
