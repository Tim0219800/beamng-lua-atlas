# `editor_vehicleEditor_staticEditor_vePartPropertyView`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_vePartPropertyView` : `extensions.load("editor_vehicleEditor_staticEditor_vePartPropertyView")`, puis la globale `editor_vehicleEditor_staticEditor_vePartPropertyView`

Fenêtre « Part Properties » du Static Editor. Elle affiche dans un inspecteur générique les propriétés scalaires (hors tables) de la table sélectionnée dans l'éditeur (vEditor.propertyTableEditTarget), et écrit directement les modifications dans cette table. Les nombres sont éditables en float, les booléens en case à cocher, le reste en chaîne.

## Remarques

- Les clés '__astNodeIdx' et '__schemaProcessed' ainsi que toutes les valeurs de type table sont ignorées.
- L'inspecteur est créé avec editor/api/genericInspector ; le setter écrit newValue dans lastEditTarget[fieldName] (donc modifie la donnée JBeam en mémoire).
- Bug mineur : une chaîne éditée est réécrite telle quelle (string) même si le champ d'origine était un nombre converti en float ; seule la valeur du champ change, le type du champ n'est pas revalidé.
- Le champ type d'un entier est 'float' (tout number est traité comme float).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorGui()` | Hook de l'éditeur appelé à chaque frame : reconstruit la liste de champs quand la cible d'édition change, puis dessine l'inspecteur générique. *(interne)* *(hook)* | 39 |
| `editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor) et crée l'inspecteur générique avec son setter. *(interne)* *(hook)* | 55 |
| `editor_vehicleEditor_staticEditor_vePartPropertyView.open()` | Affiche la fenêtre « Part Properties » (editor.showWindow). | 51 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | Texte de l'entrée du menu Apps : « Part Properties ». |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua`.*
