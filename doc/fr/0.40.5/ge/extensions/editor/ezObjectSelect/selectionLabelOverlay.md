# `editor_ezObjectSelect_selectionLabelOverlay`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua` · VM : Game Engine (GE) · 105 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionLabelOverlay` : `extensions.load("editor_ezObjectSelect_selectionLabelOverlay")`, puis la globale `editor_ezObjectSelect_selectionLabelOverlay`

Dessine les étiquettes (panneaux sombres à bordure colorée) de l'outil Easy Select avec la drawList imgui. Les étiquettes « followMouse » sont empilées près du curseur (décalage 18 px, côté gauche si elles sortent du viewport) ; les autres sont ancrées au-dessus de leur position écran. Les étiquettes prioritaires (label.priority == true) passent en premier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionLabelOverlay.draw(drawList, labels, mouse, viewport)` | Dessine toutes les étiquettes de la liste. | 68 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionLabelOverlay.draw(drawList, labels, mouse, viewport)`

Dessine toutes les étiquettes de la liste.

- `drawList` (*ImDrawList**) : Liste de dessin imgui
- `labels` (*table*) : Liste d'étiquettes {text, color (U32), followMouse, priority, position (ImVec2, si non followMouse)}
- `mouse` (*ImVec2*) : Position de la souris
- `viewport` (*ImGuiViewport*) : Viewport (Pos et Size) servant à garder les étiquettes visibles

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua`.*
