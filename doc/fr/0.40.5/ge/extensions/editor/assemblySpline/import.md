# `editor_assemblySpline_import`

*Fichier : `lua/ge/extensions/editor/assemblySpline/import.lua` · VM : Game Engine (GE) · 674 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_import` : `extensions.load("editor_assemblySpline_import")`, puis la globale `editor_assemblySpline_import`

Import pour l'outil Assembly Spline : convertit des objets TSStatic déjà posés dans le niveau (compatibles avec le kit d'assemblage, c'est-à-dire ayant des ancres nommées 'nail.*') en une assembly spline. Il reconstruit le kit d'assemblage et la molécule à partir des meshes, ajuste une polyligne sur les composants racine (fitPoly), crée la spline, supprime les TSStatic d'origine (et les groupes vides) et enregistre l'action dans l'historique d'annulation (undo/redo restaure les TSStatic sauvegardés). Utilisé par le menu clic droit de l'arbre de scène et par le polygone de sélection de l'outil.

## Remarques

- Un TSStatic est compatible s'il a au moins une ancre dont le nom commence par « nail. ».
- Il faut au moins 2 TSStatic compatibles, et au moins 2 composants racine ajustables en polyligne, sinon un avertissement est journalisé (logtag assemblySpline.import) et rien n'est converti.
- Les variations sont reconnues par le nom de fichier contenant « var » et de forme <base>_var...; le nom de base est reconstruit avec l'extension .dae.
- Après l'import la spline est marquée sale 2 frames plus tard (handleDelayedSplineUpdates) car il faut attendre la mise à jour du mesh de collision.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection)` | Convertit une sélection de TSStatic en assembly spline : filtre les compatibles, reconstruit le kit et la molécule, ajuste la polyligne, crée la spline, supprime les objets d'origine, recharge la collision (be:reloadCollision) et enregistre l'action « Convert TSStatics to Assembly Spline » dans editor.history. | 566 |
| `editor_assemblySpline_import.handleDelayedSplineUpdates()` | Mise à jour différée après un import : au bout de 2 appels, marque la dernière assembly spline comme sale pour la reconstruire une fois la collision mise à jour. Appelée à chaque frame par onEditorGui de assemblySpline. *(interne)* | 42 |
| `editor_assemblySpline_import.importFromPolygon(polygon)` | Cherche tous les TSStatic du niveau dont la position est dans le polygone et les convertit via convertTSStatics2AssemblySpline. | 651 |
| `editor_assemblySpline_import.validateToolCompatibleTSStatic(obj)` | Indique si l'objet est un TSStatic ayant au moins une ancre dont le nom commence par « nail. ». | 145 |

### Détail des paramètres

#### `editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection)`

Convertit une sélection de TSStatic en assembly spline : filtre les compatibles, reconstruit le kit et la molécule, ajuste la polyligne, crée la spline, supprime les objets d'origine, recharge la collision (be:reloadCollision) et enregistre l'action « Convert TSStatics to Assembly Spline » dans editor.history.

- `collection` (*integer[]|nil*) : Ids des objets TSStatic sélectionnés.

#### `editor_assemblySpline_import.importFromPolygon(polygon)`

Cherche tous les TSStatic du niveau dont la position est dans le polygone et les convertit via convertTSStatics2AssemblySpline.

- `polygon` (*table*) : Polygone de sélection (liste de points).

#### `editor_assemblySpline_import.validateToolCompatibleTSStatic(obj)`

Indique si l'objet est un TSStatic ayant au moins une ancre dont le nom commence par « nail. ».

- `obj` (*table|nil*) : Objet scène.
- **renvoie** : boolean true si compatible.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `delete`, `getAnchorNames`, `getClassName`, `getField`, `getGroup`, `getID`, `getName`, `getPosition`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/import.lua`.*
