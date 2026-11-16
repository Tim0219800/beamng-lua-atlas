# `editor_heroRoadEditor_placeablesUI`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua` · VM : Game Engine (GE) · 512 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_placeablesUI` : `extensions.load("editor_heroRoadEditor_placeablesUI")`, puis la globale `editor_heroRoadEditor_placeablesUI`

Interface ImGui de l'onglet Features du Hero Road Editor, pour les éléments posables sur la route : passages piétons, amas de réparations, nids-de-poule, élargissements, carrefours et barrières. Elle affiche une liste unifiée (renommage, bouton « aller à » qui déplace la caméra, suppression), une rangée de boutons de placement (mode via roadPlaceables.setPlaceMode) puis les curseurs de l'élément sélectionné. Les modifications passent par groupMgr (copie profonde du groupe) et editor.history pour l'annulation.

## Remarques

- Chaque curseur (itemSlider) s'applique à un champ d'un élément (item[key]), pas à group[key] ; un bouton de remise à la valeur par défaut apparaît quand la valeur diffère du défaut.
- Pour les barrières, les curseurs lengthM (4 à 500 m), offsetM (0 à 5 m) et zOffsetM (-2 à 1 m) reconstruisent le mobilier en direct (barrierMgr.updateGroup puis be:reloadCollision).
- Passage piéton : curseur depthM de 1.5 à 8.0 m ; sa position t est recalée dans les extrémités de la route (groupMgr.clampCrossingT).
- Si le groupe a previewMesh == false et qu'un mode de placement est activé, previewMesh repasse à true (et isDirty) car il faut la collision du maillage pour poser les éléments.
- Le drapeau liveDrag est mis par un curseur 'live' maintenu ; heroRoadEditor le lit avec consumeLiveDrag au début de la frame suivante (pipeline à 1 frame de retard).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_placeablesUI.consumeLiveDrag()` | Indique si un curseur 'live' était maintenu à la frame précédente et remet le drapeau à false. La fenêtre d'outil est dessinée après le pipeline de glissement, donc heroRoadEditor l'appelle en début de frame suivante. *(interne)* | 31 |
| `editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx)` | Dessine tout l'onglet Features pour la route sélectionnée : liste unifiée des éléments posables (crossings, repairs, potholes, widenings, junctions, barriers), rangée de boutons d'ajout, puis les contrôles de l'élément sélectionné. | 377 |

### Détail des paramètres

#### `editor_heroRoadEditor_placeablesUI.consumeLiveDrag()`

Indique si un curseur 'live' était maintenu à la frame précédente et remet le drapeau à false. La fenêtre d'outil est dessinée après le pipeline de glissement, donc heroRoadEditor l'appelle en début de frame suivante.

- **renvoie** : boolean true si un curseur live était tenu.

#### `editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx)`

Dessine tout l'onglet Features pour la route sélectionnée : liste unifiée des éléments posables (crossings, repairs, potholes, widenings, junctions, barriers), rangée de boutons d'ajout, puis les contrôles de l'élément sélectionné.

- `selGroup` (*table|nil*) : Groupe Hero Road sélectionné ; nil affiche une liste vide ('No features yet.').
- `selectedGroupIdx` (*integer*) : Indice du groupe sélectionné, comparé à la sélection de roadPlaceables.

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua`.*
