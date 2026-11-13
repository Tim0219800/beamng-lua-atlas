# `editor_api_sketch`

*Fichier : `lua/ge/extensions/editor/api/sketch.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_sketch` : `extensions.load("editor_api_sketch")`, puis la globale `editor_api_sketch`

Module d'API de l'éditeur pour les « sketches » (croquis dans le monde). Dans cette version il n'est qu'une coquille : initialize(editor) ajoute à l'objet editor trois fonctions (createSketch, deleteSketch, getSketches) dont le corps est vide (commentaire TODO). Les hooks prévus sont listés en commentaire : onEditorSketchCreated, onEditorSketchDelete, onEditorSketchChanged.

## Remarques

- Les trois fonctions ne font rien et renvoient nil : elles sont encore à implémenter (TODO dans le code).
- Les hooks onEditorSketchCreated/Delete/Changed sont seulement cités en commentaire, rien ne les déclenche dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_sketch.initialize(editorInstance)` | Enregistre createSketch, deleteSketch et getSketches sur l'objet editor passé en argument. Appelé par le chargeur de l'API de l'éditeur. *(interne)* | 26 |

### Détail des paramètres

#### `editor_api_sketch.initialize(editorInstance)`

Enregistre createSketch, deleteSketch et getSketches sur l'objet editor passé en argument. Appelé par le chargeur de l'API de l'éditeur.

- `editorInstance` (*table*) : Objet editor global de l'éditeur sur lequel les fonctions sont ajoutées.

## Classe `editor`

Objet editor de l'éditeur, enrichi par initialize. Toutes ces méthodes sont des stubs vides.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.createSketch(position, size)` | Prévu pour créer un croquis. Corps vide (TODO). | 14 |
| `editor.deleteSketch(sketchObjectId)` | Prévu pour supprimer un croquis. Corps vide (TODO). | 18 |
| `editor.getSketches()` | Prévu pour lister les croquis. Corps vide (TODO), renvoie nil. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/sketch.lua`.*
