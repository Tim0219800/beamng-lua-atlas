# `editor_api_valueInspector`

*Fichier : `lua/ge/extensions/editor/api/valueInspector.lua` · VM : Game Engine (GE) · 1470 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/valueInspector")` (fichier sous extensions/ mais pas une extension classique)

Widget ImGui de l'inspecteur de champs de l'éditeur : affiche un champ (nom + valeur) sur deux colonnes et fournit l'éditeur adapté à son type (texte, float, int, bool, fichier, Point2F/3F/4F, rotation Euler, couleurs ColorF/ColorI, EaseF, RectF, matériau, datablock, annotation, SFX, etc.). Le module renvoie une fonction constructeur ; chaque appel crée un inspecteur indépendant. À l'import il ajoute aussi à editor des fonctions pour enregistrer des éditeurs, filtres et changeurs de libellé personnalisés par classe et nom de champ. Utile à un moddeur d'outil d'éditeur pour afficher des champs d'objet avec le même rendu que l'inspecteur du jeu.

## Exemple

```lua
local newInspector = require('editor/api/valueInspector')
local insp = newInspector()
insp.setValueCallback = function(name, value, idx, custom, editEnded) --[[ appliquer ]] end
insp:valueEditorGui('mass', 1200, nil, 'Mass', 'Masse en kg', 'float', 'TypeF32', nil, nil, nil, 0)
```

## Remarques

- Le module retourne function() sans paramètre : il n'y a pas d'options à passer au constructeur (init() fixe les valeurs par défaut).
- Champs d'instance utiles posés par init : inspectorName ('default'), setValueCallback(fieldName, fieldValue, arrayIndex, customData, editEndedBool) à fournir, selectionClassName (classe de la sélection, sert à trouver les éditeurs personnalisés), selectedIds, differentValuesFieldFlags (champs dont la valeur diffère entre objets sélectionnés, affichés en orange et gras), addTypeToTooltip.
- Les éditeurs/filtres/changeurs personnalisés sont indexés par la concaténation fieldName .. className.
- Fonctions ajoutées à editor à l'import : registerCustomFieldInspectorEditor, unregisterCustomFieldInspectorEditor, findCustomFieldEditor, registerCustomFieldInspectorFilter, unregisterCustomFieldInspectorFilter, findCustomFieldFilter, registerCustomFieldLabelChanger, unregisterCustomFieldLabelChanger, findCustomFieldLabelChanger, valueInspectorCopyPasteMenu, valueInspectorFilenameContextMenu, getAnnotations, getAnnotationsTbl.
- Le format de flottant dépend de la préférence ui.general.floatDigitCount, lue à chaque appel de valueEditorGui.
- Collage par Ctrl+C / Ctrl+V sur le nom du champ (préférence ui.general.inspectorFieldNameHoverCopyPaste) : le presse-papiers contient du JSON {copiedValue, copiedFieldType} ; le collage n'est refusé que si les types diffèrent et que la destination n'est pas une chaîne.
- Les tables de datablocks/annotations sont globales au module (partagées par tous les inspecteurs) et initialisées une fois.

## Classe `C`

Objet inspecteur renvoyé par le constructeur du module (require(...)()). Méthodes d'instance.

Le module renvoie un constructeur : `local obj = require("editor_api_valueInspector")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:deleteTexObjs()` | Vide le cache des textures d'aperçu utilisées dans le sélecteur de matériaux. | 504 |
| `C:displayMaterialPopupList(objectSet, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className)` | Comme displaySimSetPopupList mais pour les matériaux : popup avec aperçu des textures (cache texObjs) et filtre par nom ou tag. | 299 |
| `C:displaySimSetPopupList(objectSetArray, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className)` | Affiche un bouton « ... » et la valeur actuelle, et au clic une popup filtrable listant les objets des SimSet donnés pour en choisir un. | 212 |
| `C:init()` | Initialise les tampons ImGui (texte, entiers, flottants, booléen, combo) et les champs par défaut. Appelé automatiquement par le constructeur. | 426 |
| `C:initializeTables(force)` | Construit (une seule fois, sauf force) les tables globales d'annotations et de datablocks utilisées par les sélecteurs. | 492 |
| `C:reinitializeTables()` | Marque les tables globales comme à reconstruire au prochain initializeTables. | 488 |
| `C:setSimSetWindowFieldId(id)` | Définit l'id du champ dont la fenêtre popup de sélection SimSet est ouverte (nil pour la fermer). | 500 |
| `C:valueEditorGui(fieldName, fieldValue, arrayIndex, fieldLabel, fieldDesc, fieldType, fieldTypeName, customData, pasteCallback, contextMenuUI, indeterminateFlags)` | Dessine un champ complet : libellé (avec tooltip fieldDesc, menu copier/coller) et widget d'édition choisi selon fieldTypeName puis fieldType. Appelle un éditeur personnalisé s'il est enregistré pour (classe de sélection, fieldName). Toute modification est envoyée à self.setValueCallback. | 565 |

## Appels vers le moteur (C++)

- `Sim.` `findObject`, `findObjectById`, `findObjectByIdNoUpcast`, `findObjectByPersistID`, `getDataBlockSet`, `getMaterialSet`, `getRootGroup`, `getSFXAmbienceSet`, `getSFXDescriptionSet`, `getSFXEnvironmentSet`, `getSFXParameterGroup`, `getSFXStateSet`, `getSFXTrackSet`
- `obj:` `getClassName`, `getField`, `getID`, `getId`, `getName`
- `scenetree.` `findObject`, `findObjectById`
- `ui_imgui.` `Button`
- `worldEditorCppApi.` `findDerivedDatablockClassname`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/valueInspector.lua`.*
