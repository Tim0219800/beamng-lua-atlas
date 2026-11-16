# `editor_shapeEditor`

*Fichier : `lua/ge/extensions/editor/shapeEditor.lua` · VM : Game Engine (GE) · 985 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_shapeEditor` : `extensions.load("editor_shapeEditor")`, puis la globale `editor_shapeEditor`

Éditeur de formes (Shape Editor) de l'éditeur de monde : fenêtre qui prévisualise un modèle 3D (.dae et autres) via l'objet C++ ShapePreview, avec une caméra orbitale et plusieurs onglets (Details, Render, Nodes, Sequence, Material, Imposter, et LOD WIP si createMeshLOD existe). Il permet d'exporter en Collada ou Wavefront obj, de lire les nodes, séquences d'animation et matériaux, de gérer l'imposteur et de générer des LOD. Les réglages de constructeur de mesh sont stockés dans un fichier .cs à côté du modèle (préfixe '//JSON:'). Un moddeur l'utilise pour inspecter un TSStatic ou un asset.

## Exemple

```lua
extensions.editor_shapeEditor.showShapeEditorLoadFile('/levels/GridMap/art/shapes/buildings/busstop_grid.dae')
```

## Remarques

- Le menu de la fenêtre est dans le groupe 'Assets' ; la fenêtre affiche 'too small' si sa zone de rendu fait moins de 150 px.
- Le bouton 'Open in Shape Editor' est ajouté à l'en-tête de l'inspecteur pour un TSStatic sélectionné.
- Préférence shapeEditor.general.autoOpenSelectedObject (bool, vrai par défaut) : charge automatiquement le modèle du TSStatic sélectionné si la fenêtre est visible.
- showShapeEditorLoadFile ne s'arrête pas quand le fichier n'existe pas : elle journalise 'File doesn't exist' puis continue de charger.
- Certains boutons (dumpShapeInfo, getTSShapeInfo) n'apparaissent que si beamng_buildtype vaut INTERNAL.
- onPreRender est commenté dans l'interface publique : le rendu se fait dans onEditorGui lorsque la zone est marquée sale.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_shapeEditor.onDeserialized(data)` | Hook de restauration après rechargement Lua : recrée ShapePreview, recharge le modèle et le matériau de surbrillance. *(interne)* *(hook)* | 927 |
| `editor_shapeEditor.onEditorDeactivated()` | Hook appelé à la désactivation de l'éditeur : restaure le matériau de l'aperçu et supprime le matériau de surbrillance. *(interne)* *(hook)* | 962 |
| `editor_shapeEditor.onEditorExitLevel()` | Hook appelé à la sortie du niveau : vide la forme de l'aperçu. *(interne)* *(hook)* | 938 |
| `editor_shapeEditor.onEditorGui()` | Hook de dessin appelé chaque frame : dessine la fenêtre, le rendu 3D et les onglets. *(interne)* *(hook)* | 436 |
| `editor_shapeEditor.onEditorInitialized()` | Hook d'initialisation de l'éditeur : crée ShapePreview, ajoute l'entrée de menu 'Shape Editor' (groupe Assets) et enregistre la fenêtre (800x600). *(interne)* *(hook)* | 67 |
| `editor_shapeEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook appelé pour dessiner l'en-tête de l'inspecteur : ajoute le bouton 'Open in Shape Editor' pour le premier objet sélectionné s'il est de classe TSStatic. *(interne)* *(hook)* | 899 |
| `editor_shapeEditor.onEditorObjectSelectionChanged()` | Hook appelé quand la sélection change : si la fenêtre est visible et la préférence autoOpenSelectedObject est active, charge le modèle du TSStatic sélectionné. *(interne)* *(hook)* | 942 |
| `editor_shapeEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook : enregistre la catégorie shapeEditor et la préférence general.autoOpenSelectedObject. *(interne)* *(hook)* | 952 |
| `editor_shapeEditor.onSerialize()` | Hook de sérialisation (rechargement Lua) : renvoie meshFile et highlightMaterialName. *(interne)* *(hook)* | 920 |
| `editor_shapeEditor.showShapeEditorLoadFile(filename)` | Charge un modèle dans l'aperçu : le définit dans ShapePreview, réinitialise l'orbite, affiche la fenêtre, lit les infos du shape (détails/LOD, séquences), le fichier .cs du mesh constructor et les réglages d'imposteur. | 907 |

### Détail des paramètres

#### `editor_shapeEditor.onDeserialized(data)`

Hook de restauration après rechargement Lua : recrée ShapePreview, recharge le modèle et le matériau de surbrillance.

- `data` (*table*) : Données renvoyées par onSerialize.

#### `editor_shapeEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook appelé pour dessiner l'en-tête de l'inspecteur : ajoute le bouton 'Open in Shape Editor' pour le premier objet sélectionné s'il est de classe TSStatic.

- `inspectorInfo` (*table*) : Infos de l'inspecteur ; sa clé selection.object contient les ids sélectionnés.

#### `editor_shapeEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook : enregistre la catégorie shapeEditor et la préférence general.autoOpenSelectedObject.

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_shapeEditor.onSerialize()`

Hook de sérialisation (rechargement Lua) : renvoie meshFile et highlightMaterialName.

- **renvoie** : table {meshFile, highlightMaterialName}.

#### `editor_shapeEditor.showShapeEditorLoadFile(filename)`

Charge un modèle dans l'aperçu : le définit dans ShapePreview, réinitialise l'orbite, affiche la fenêtre, lit les infos du shape (détails/LOD, séquences), le fichier .cs du mesh constructor et les réglages d'imposteur.

- `filename` (*string*) : Chemin du modèle 3D, ex. /levels/.../x.dae.

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `removeFile`
- `obj:` `deleteObject`, `getClassName`, `getModelFile`
- `scenetree.` `findObject`, `findObjectById`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/shapeEditor.lua`.*
