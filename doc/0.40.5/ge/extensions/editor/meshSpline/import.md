# `editor_meshSpline_import`

*Fichier : `lua/ge/extensions/editor/meshSpline/import.lua` · VM : Game Engine (GE) · 648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_import` : `extensions.load("editor_meshSpline_import")`, puis la globale `editor_meshSpline_import`

Import dans l'outil Mesh Spline : transforme des objets TSStatic déjà placés dans le niveau en une mesh spline équivalente. Les TSStatic sont ordonnés en polyligne (editor/toolUtilities/fitPoly), simplifiés (RDP), analysés (motif de meshes, capuchons de début et de fin) puis convertis ; les objets d'origine sont supprimés, leurs groupes vides aussi, et l'opération est enregistrée dans l'historique (undo/redo). Appelé depuis meshSpline.lua (menu contextuel du scenetree ou polygone de sélection).

## Remarques

- Il faut au moins 2 TSStatic avec un shapeName non vide, sinon l'import s'arrête avec un avertissement dans le log.
- Après l'import, be:reloadCollision() est appelé et la dernière spline est marquée « dirty » 2 images plus tard (handleDelayedSplineUpdates), le temps que la collision soit à jour : il faut appeler handleDelayedSplineUpdates chaque image (meshSpline.onEditorGui le fait).
- Les TSStatic supprimés sont sauvegardés (id, nom, shapeName, position, rotation, échelle, groupe) pour permettre l'undo.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_import.convertTSStatics2MeshSpline(collection)` | Convertit les TSStatic donnés en une mesh spline : filtre les TSStatic valides, les ordonne en polyligne, crée la spline, supprime les objets d'origine (et leurs groupes devenus vides), enregistre l'action d'historique et déclenche le rechargement de la collision. | 508 |
| `editor_meshSpline_import.handleDelayedSplineUpdates()` | Gère la mise à jour différée après un import : si un import vient d'avoir lieu, compte les images ; à la 2e, marque la dernière mesh spline comme isDirty pour forcer sa reconstruction une fois la collision rechargée. *(interne)* | 35 |
| `editor_meshSpline_import.importFromPolygon(polygon)` | Importe une mesh spline à partir d'un polygone de sélection dessiné par l'utilisateur : collecte les TSStatic dont la position est dans le polygone (pos:inPolygon) puis les convertit. | 627 |

### Détail des paramètres

#### `editor_meshSpline_import.convertTSStatics2MeshSpline(collection)`

Convertit les TSStatic donnés en une mesh spline : filtre les TSStatic valides, les ordonne en polyligne, crée la spline, supprime les objets d'origine (et leurs groupes devenus vides), enregistre l'action d'historique et déclenche le rechargement de la collision.

- `collection` (*integer[]*) : Identifiants d'objets (typiquement editor.selection.object).

#### `editor_meshSpline_import.importFromPolygon(polygon)`

Importe une mesh spline à partir d'un polygone de sélection dessiné par l'utilisateur : collecte les TSStatic dont la position est dans le polygone (pos:inPolygon) puis les convertit.

- `polygon` (*table*) : Polygone de sélection (liste de points) fourni par toolUtilities/polygon.

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `delete`, `getClassName`, `getField`, `getGroup`, `getID`, `getName`, `getObjBox`, `getPosition`, `getWorldBox`, `registerObject`, `setField`, `setPosRot`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/import.lua`.*
