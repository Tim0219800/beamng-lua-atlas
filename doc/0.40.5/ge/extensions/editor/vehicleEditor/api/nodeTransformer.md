# `editor_vehicleEditor_api_nodeTransformer`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_api_nodeTransformer` : `extensions.load("editor_vehicleEditor_api_nodeTransformer")`, puis la globale `editor_vehicleEditor_api_nodeTransformer`

Aide du Vehicle Editor pour déplacer les nœuds sélectionnés (vEditor.selectedNodes) avec le gizmo d'axes de l'éditeur. Le gizmo est centré sur la moyenne des positions des nœuds ; pendant le glissement, chaque nœud reçoit sa position d'origine plus le delta (en coordonnées locales, signe inversé).

## Remarques

- transformNodes() doit être appelée à chaque frame tant que des nœuds sont sélectionnés ; elle divise par #vEditor.selectedNodes sans vérifier qu'il est non nul (division par 0 -> inf/NaN si la sélection est vide).
- Désactive le plan, les hachures et la grille de déplacement du gizmo (worldEditorCppApi.setAxisGizmoRender*) quand on ne glisse pas.
- Le gizmo est en alignement local (editor.AxisGizmoAlignment_Local), orientation identité.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_api_nodeTransformer.transformNodes()` | Place et dessine le gizmo au centre des nœuds sélectionnés, gère début/fin/glissement et applique le décalage aux nœuds (node.pos). | 48 |

### Détail des paramètres

#### `editor_vehicleEditor_api_nodeTransformer.transformNodes()`

Place et dessine le gizmo au centre des nœuds sélectionnés, gère début/fin/glissement et applique le décalage aux nœuds (node.pos).

- **renvoie** : boolean true si un glissement du gizmo est en cours pendant cet appel.

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua`.*
