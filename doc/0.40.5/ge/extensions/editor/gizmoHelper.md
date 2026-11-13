# `editor_gizmoHelper`

*Fichier : `lua/ge/extensions/editor/gizmoHelper.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_gizmoHelper` : `extensions.load("editor_gizmoHelper")`, puis la globale `editor_gizmoHelper`

Petit utilitaire pour savoir si le gizmo d'axes de l'éditeur est dessiné. Un outil appelle gizmoDrawCalled() chaque frame où il dessine le gizmo ; à la frame suivante, si plus personne ne l'a dessiné, le module désélectionne l'élément du gizmo côté moteur (setAxisGizmoSelectedElement(-1)).

## Exemple

```lua
-- dans le onEditorGui d'un outil qui dessine le gizmo
editor_gizmoHelper.gizmoDrawCalled()
if editor_gizmoHelper.isGizmoVisible() then ... end
```

## Remarques

- isGizmoVisible reflète la frame précédente (gizmoDrawnLastFrame), pas la frame courante.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_gizmoHelper.gizmoDrawCalled()` | À appeler depuis un outil à chaque frame où il dessine le gizmo d'axes ; marque le gizmo comme dessiné pour la frame courante. | 17 |
| `editor_gizmoHelper.isGizmoVisible()` | Indique si le gizmo a été dessiné à la frame précédente. | 21 |
| `editor_gizmoHelper.onEditorGui()` | Hook appelé chaque frame par l'éditeur : si le gizmo était dessiné à la frame précédente mais pas à celle-ci, désélectionne l'élément du gizmo (-1) ; puis fait glisser l'indicateur de frame et le remet à faux. *(interne)* *(hook)* | 9 |

### Détail des paramètres

#### `editor_gizmoHelper.isGizmoVisible()`

Indique si le gizmo a été dessiné à la frame précédente.

- **renvoie** : boolean true si gizmoDrawCalled a été appelé à la frame précédente

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/gizmoHelper.lua`.*
