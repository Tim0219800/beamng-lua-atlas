# `editor_sitesEditor_sortedListDisplay`

*Fichier : `lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua` · VM : Game Engine (GE) · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/sortedListDisplay")` (fichier sous extensions/ mais pas une extension classique)

Affichage générique d'une liste triée d'éléments de sites (lieux, zones, places de parking), utilisé comme onglet par l'éditeur de sites. Le module renvoie un constructeur de classe C qui reçoit un 'elementEditor' (locations, zones ou parkingSpots) auquel il délègue test de clic, création, suppression, gizmo et dessin de l'élément. Il gère la recherche par nom, la sélection multiple, le renommage, la couleur, les champs personnalisés (copier/coller) et les modifications annulables.

## Remarques

- Les éléments procéduraux (isProcedural) ne sont pas listés.
- Dans drawList, Ctrl ou Shift donne le mode 'toggle' ; la branche suivante (Shift seul donnerait 'add') est inatteignable.
- createByShift (défaut true) : Shift+clic crée un élément ; sinon un bouton 'Create...' est affiché. selectByClick (défaut true) : le clic sélectionne via elementEditor:hitTest ; sinon le clic est délégué à elementEditor:input.
- Si plusieurs éléments sont sélectionnés, les champs nom et couleur sont désactivés.

## Classe `C`

Objet renvoyé par le constructeur. Champs : key, index (id sélectionné en dernier), selections (liste d'ids), objects, sorted, elementEditor, activeTags, createByShift, selectByClick, windowDescription.

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_sortedListDisplay")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:adoptElement(id)` | Change la sélection de la liste sans appeler elementEditor:select, pour garder un glissement de gizmo en cours (utilisé après la duplication par Shift). | 112 |
| `C:draw(mouseInfo)` | Dessine l'onglet ; traite les entrées souris si le gizmo est permis. | 139 |
| `C:drawCustomFields(fields)` | Dessine le widget de champs personnalisés et les boutons Copy Fields / Paste Fields. | 288 |
| `C:drawList()` | Dessine la liste filtrable à gauche et le panneau d'édition de l'élément à droite. | 194 |
| `C:getCurrentSelected()` | Renvoie l'élément actuellement sélectionné. | 308 |
| `C:init(sitesEditor, key, elementEditor)` | Constructeur : prépare la sélection (editor.selection[key]), les champs personnalisés et la zone de recherche. | 9 |
| `C:input()` | Gère les clics dans le monde : création par Shift+clic, sélection par hitTest ou délégation à elementEditor:input. | 147 |
| `C:selectElement(id, mode)` | Sélectionne l'élément d'id donné (nil pour désélectionner), met à jour surbrillance, éditeur d'élément, tags et champs d'édition. | 66 |
| `C:selected()` | Appelé quand l'onglet devient actif : vide la sélection et passe les objets en dessin 'normal'. | 45 |
| `C:setField(name, value)` | Modifie un champ (name, color...) de tous les éléments sélectionnés via une action annulable. | 187 |
| `C:setSites(sites)` | Définit les sites édités, retient objects et sorted, les transmet à l'éditeur d'élément et recalcule les tags actifs. | 24 |
| `C:unselect()` | Appelé quand l'onglet est quitté : vide la sélection et passe les objets en dessin 'faded'. | 57 |
| `C:updateActiveTags()` | Recompte les tags utilisés par les éléments (table tag vers nombre). | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua`.*
