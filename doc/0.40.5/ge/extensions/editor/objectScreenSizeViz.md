# `editor_objectScreenSizeViz`

*Fichier : `lua/ge/extensions/editor/objectScreenSizeViz.lua` · VM : Game Engine (GE) · 268 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_objectScreenSizeViz` : `extensions.load("editor_objectScreenSizeViz")`, puis la globale `editor_objectScreenSizeViz`

Outil de débogage « Object Screen Size » (menu Debug) du World Editor. Pour les objets (editor.selection.object) et éléments de forêt (editor.selection.forestItem) sélectionnés, il calcule la distance à la caméra et la taille en pixels à l'écran de leur boîte englobante monde (projection des 8 coins avec le champ de vision de la caméra). Il peut dessiner la boîte (lignes orange), une ligne caméra-centre (magenta) et un rectangle de superposition à l'écran. Utile pour régler les distances de LOD et la taille visible des objets.

## Remarques

- worldToScreen01 renvoie nil pour un point derrière la caméra (profondeur <= 0) ; ces coins sont ignorés dans le calcul du rectangle.
- Aucune donnée n'est modifiée : l'outil est purement visuel.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_objectScreenSizeViz.onEditorGui()` | Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Object Screen Size » (cases à cocher d'affichage et résultats par objet sélectionné) et les lignes de debug. *(interne)* *(hook)* | 160 |
| `editor_objectScreenSizeViz.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (480x320) et l'entrée de menu « Object Screen Size » (groupe Debug). *(interne)* *(hook)* | 259 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`
- `obj:` `getClassName`, `getID`, `getName`, `getWorldBox`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/objectScreenSizeViz.lua`.*
