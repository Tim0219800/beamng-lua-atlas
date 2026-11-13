# `editor_waterObjectHelper`

*Fichier : `lua/ge/extensions/editor/waterObjectHelper.lua` · VM : Game Engine (GE) · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_waterObjectHelper` : `extensions.load("editor_waterObjectHelper")`, puis la globale `editor_waterObjectHelper`

Petite extension de l'éditeur de monde : quand on modifie dans l'inspecteur un champ de texture d'un objet d'eau, elle recharge les textures de l'objet. Elle ne réagit qu'aux champs rippleTex, foamTex, depthGradientTex et cubemap, et uniquement pour les objets de classe WaterObject.

## Remarques

- Le code ne vérifie pas que scenetree.findObjectById renvoie un objet non nil avant d'appeler object:isSubClassOf : un id invalide provoquerait une erreur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_waterObjectHelper.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook de l'éditeur appelé quand un champ de l'inspecteur change. Pour chaque id sélectionné, si le champ est rippleTex, foamTex, depthGradientTex ou cubemap et que l'objet est un WaterObject, appelle object:reloadTextures(). *(interne)* *(hook)* | 7 |

### Détail des paramètres

#### `editor_waterObjectHelper.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook de l'éditeur appelé quand un champ de l'inspecteur change. Pour chaque id sélectionné, si le champ est rippleTex, foamTex, depthGradientTex ou cubemap et que l'objet est un WaterObject, appelle object:reloadTextures().

- `selectedIds` (*table<integer, integer>*) : ids des objets sélectionnés
- `fieldName` (*string*) : nom du champ modifié
- `fieldValue` (*any*) : nouvelle valeur (non utilisée)
- `arrayIndex` (*integer|nil*) : indice dans le tableau pour un champ tableau (non utilisé)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/waterObjectHelper.lua`.*
