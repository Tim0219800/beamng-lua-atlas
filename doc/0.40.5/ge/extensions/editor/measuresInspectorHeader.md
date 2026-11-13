# `editor_measuresInspectorHeader`

*Fichier : `lua/ge/extensions/editor/measuresInspectorHeader.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_measuresInspectorHeader` : `extensions.load("editor_measuresInspectorHeader")`, puis la globale `editor_measuresInspectorHeader`

Petite extension de l'éditeur qui ajoute une ligne « Size: X x Y x Z » dans l'en-tête de l'inspecteur d'objets. Elle affiche la taille (boîte englobante, échelle comprise) de l'objet sélectionné, ou de la boîte englobante de la sélection s'il y en a plusieurs. Elle n'agit qu'une fois l'éditeur initialisé.

## Remarques

- Pour un seul objet : getObjBox() puis scale3F(getScale()), puis getExtents() ; pour plusieurs objets : editor.objectSelectionBBox:getExtents().
- Rien n'est affiché si la sélection ne contient pas d'objets (selection.object nil) ou si l'objet n'a pas getObjBox/getScale.
- Valeurs affichées avec 2 décimales, en mètres (unités du monde).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_measuresInspectorHeader.onEditorInitialized()` | Hook appelé quand l'éditeur est initialisé ; active l'affichage de la taille. *(interne)* *(hook)* | 52 |
| `editor_measuresInspectorHeader.onEditorInspectorHeaderGui(inspectorInfo)` | Hook appelé par l'inspecteur de l'éditeur pour dessiner son en-tête. Dessine le texte « Size » et son infobulle. Utilise inspectorInfo.selection si présent, sinon editor.selection. Ne fait rien tant que l'éditeur n'est pas initialisé. *(interne)* *(hook)* | 10 |
| `editor_measuresInspectorHeader.onExtensionLoaded()` | Hook de chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 49 |

### Détail des paramètres

#### `editor_measuresInspectorHeader.onEditorInspectorHeaderGui(inspectorInfo)`

Hook appelé par l'inspecteur de l'éditeur pour dessiner son en-tête. Dessine le texte « Size » et son infobulle. Utilise inspectorInfo.selection si présent, sinon editor.selection. Ne fait rien tant que l'éditeur n'est pas initialisé.

- `inspectorInfo` (*table*) : Informations de l'inspecteur ; le champ facultatif selection remplace editor.selection.

## Appels vers le moteur (C++)

- `obj:` `getObjBox`, `getScale`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/measuresInspectorHeader.lua`.*
