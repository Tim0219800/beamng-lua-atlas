# `editor_sitesEditor_locations`

*Fichier : `lua/ge/extensions/editor/sitesEditor/locations.lua` · VM : Game Engine (GE) · 152 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/locations")` (fichier sous extensions/ mais pas une extension classique)

Sous-éditeur 'Locations' de l'éditeur de sites. Le module renvoie un constructeur de classe C (appelé avec sitesEditor et la clé 'locations'). Il gère la sélection, le test de clic (sphère de rayon node.radius), le gizmo de translation et de mise à l'échelle (le rayon du lieu), la création et la suppression avec historique annulable (editor.history). Il est utilisé avec sortedListDisplay comme éditeur d'élément.

## Exemple

```lua
local locations = require('/lua/ge/extensions/editor/sitesEditor/locations')(editor_sitesEditor, 'locations')
```

## Remarques

- Le rayon minimal d'un lieu est 0.1 (math.max(0.1, ...)).
- Dans drawElement, le texte 'Closest Road' affiche les deux noeuds renvoyés par map.findClosestRoad.

## Classe `C`

Objet renvoyé par le constructeur du module. Champs : sitesEditor, key, current (lieu sélectionné), sites, list.

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_locations")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de glissement du gizmo : mémorise la position et le rayon de départ. | 69 |
| `C:create(pos)` | Crée un lieu à la position donnée (action annulable 'Create Location') et le renvoie. | 121 |
| `C:dragging()` | Pendant le glissement : en mode translation met à jour pos, en mode échelle recalcule radius (minimum 0.1) à partir du facteur du gizmo. | 74 |
| `C:drawElement(loc)` | Dessine l'éditeur de l'élément : gizmo (si allowGizmo) et texte du segment de route le plus proche. | 134 |
| `C:endDragging()` | Fin de glissement : enregistre une action annulable 'Update Transform of ...' (ancienne et nouvelle pos/radius). | 93 |
| `C:hitTest(mouseInfo, objects)` | Renvoie le lieu le plus proche de la caméra dont la sphère (rayon node.radius) est traversée par le rayon souris. | 28 |
| `C:init(sitesEditor, key)` | Constructeur (appelé par le module) : mémorise sitesEditor et la clé, sans sélection. | 9 |
| `C:remove(loc)` | Supprime un lieu (action annulable 'Remove Location'). | 128 |
| `C:select(loc)` | Sélectionne un lieu et place le gizmo sur lui. | 21 |
| `C:setSites(sites)` | Définit les sites édités, retient la liste sites[key] et désélectionne. | 15 |
| `C:updateTransform()` | Place le gizmo sur la position du lieu courant. | 45 |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/locations.lua`.*
