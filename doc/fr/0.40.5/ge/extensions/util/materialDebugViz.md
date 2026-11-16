# `util_materialDebugViz`

*Fichier : `lua/ge/extensions/util/materialDebugViz.lua` · VM : Game Engine (GE) · 432 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_materialDebugViz` : `extensions.load("util_materialDebugViz")`, puis la globale `util_materialDebugViz`

Visualisations de débogage des matériaux (PBR) pour l'éditeur et les outils de rendu. Il définit 22 modes (aucun, quad overdraw, fil de fer, niveau de mipmap, couleur de base, opacité, métallique, rugosité, normales monde, occlusion ambiante, émissif, vernis, rugosité du vernis, UV0/UV1 avec damier et grille, matériau déprécié, nombre de couches, uniformité du Draw ID). Chaque mode active un drapeau de débogage dans le moteur (materialDebugSetFlag / enableMaterialDebug). Quand un mode est actif, une fenêtre de légende ImGui s'affiche en bas de l'écran (dégradé, pastilles de couleur et explications).

## Exemple

```lua
extensions.load('util_materialDebugViz')
extensions.util_materialDebugViz.set('Material_Roughness')
extensions.util_materialDebugViz.set('Material_None')
```

## Remarques

- Noms de modes valides pour set : Material_None, Material_TriSize, Material_Wireframe, Material_Mip, Material_BaseColor, Material_Opacity, Material_Metallic, Material_Roughness, Material_NormalsWS, Material_AmbientOcclusion, Material_Emissive, Material_ClearCoat, Material_ClearCoatRoughness, Material_UV0, Material_UV0Checkerboard, Material_UV0ColorGrid, Material_UV1, Material_UV1Checkerboard, Material_UV1ColorGrid, Material_MaterialDeprecated, Material_LayerCount, Material_DrawIdUniformity.
- Les modes Quad Overdraw, Mip et Draw ID Uniformity ne fonctionnent qu'avec Vulkan ou Direct3D12 (indiqué dans la légende).
- Bug : dans drawLegendWindow, `editor.getPreference(...) or true` vaut toujours true quand la préférence vaut false (false or true), donc la préférence gizmos.visualization.showMaterialDebugLegend ne peut jamais masquer la légende.
- M.onUpdate est une alias de drawLegendWindow : la légende est dessinée à chaque frame, au plus une fois par identifiant de frame de rendu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_materialDebugViz.drawLegendWindow()` | Dessine la fenêtre de légende du mode actif (au centre horizontal, à 80 % de la hauteur de la vue). Ne dessine rien si aucun mode n'est actif ou s'il n'a pas de légende. Aussi branchée comme onUpdate. | 361 |
| `util_materialDebugViz.getIndexPtr()` | Renvoie le pointeur ImGui entier (IntPtr) contenant l'index du mode courant (à partir de 0), utilisable avec un combo ImGui. | 359 |
| `util_materialDebugViz.getTypes()` | Renvoie la liste des modes de visualisation (tables {type='Custom', name, displayName, setter, getter}), nil avant le chargement. | 358 |
| `util_materialDebugViz.onExtensionLoaded()` | Appelé au chargement : construit la table des modes de visualisation (type, name, displayName, setter, getter) et sélectionne l'index du mode déjà actif dans le moteur. *(interne)* *(hook)* | 257 |
| `util_materialDebugViz.onUpdate()` | Hook appelé chaque frame ; alias de drawLegendWindow. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `util_materialDebugViz.set(mode)` | Active un mode de visualisation par son nom ; sans argument ou avec Material_None, désactive la visualisation. Logue une erreur pour un nom inconnu. | 410 |

### Détail des paramètres

#### `util_materialDebugViz.getIndexPtr()`

Renvoie le pointeur ImGui entier (IntPtr) contenant l'index du mode courant (à partir de 0), utilisable avec un combo ImGui.

- **renvoie** : userdata im.IntPtr de l'index courant

#### `util_materialDebugViz.getTypes()`

Renvoie la liste des modes de visualisation (tables {type='Custom', name, displayName, setter, getter}), nil avant le chargement.

- **renvoie** : table[]|nil Modes disponibles

#### `util_materialDebugViz.set(mode)`

Active un mode de visualisation par son nom ; sans argument ou avec Material_None, désactive la visualisation. Logue une erreur pour un nom inconnu.

- `mode` (*string|nil*) : Nom du mode, par exemple Material_Roughness

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/materialDebugViz.lua`.*
