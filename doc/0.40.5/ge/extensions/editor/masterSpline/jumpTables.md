# `editor_masterSpline_jumpTables`

*Fichier : `lua/ge/extensions/editor/masterSpline/jumpTables.lua` · VM : Game Engine (GE) · 389 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_jumpTables` : `extensions.load("editor_masterSpline_jumpTables")`, puis la globale `editor_masterSpline_jumpTables`

Module utilitaire de l'outil Master Spline : regroupe des tables de dispatch indexées par le type de lien d'une couche (préfixe d'outil de meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline). Chaque table associe à ce type la fonction de l'outil compatible correspondant (créer, restaurer, délier, supprimer, verrouiller, sérialiser…). Utile pour comprendre comment une Master Spline pilote ses splines enfants.

## Remarques

- Toutes les tables sont indexées par la chaîne renvoyée par getToolPrefixStr() de chaque outil (layer.linkType).
- Le module n'exporte que des tables, aucune fonction ; l'appel se fait par jumps.xxxJumpTable[linkType](...).
- eachObjectJumpTable ne couvre que mesh et assembly (seuls outils dont les modifications manuelles peuvent être restaurées après annulation d'un déverrouillage).
- Pour la route (roadSpline), les fonctions viennent de groupMgr (groupes) et non d'un splineMgr.

## Champs

| Champ | Type | Description |
|---|---|---|
| `createJumpTable` | table<string, function> | Crée une nouvelle spline dans l'outil cible (addNewMeshSpline, addNewAssemblySpline, addNewDecalSpline, addNewGroup, addNewTreeSpline). |
| `eachObjectJumpTable` | table<string, function(id: any, fn: function)> | Itère sur les objets d'une spline liée (eachObjectById), pour splineLock ; mesh et assembly seulement. |
| `getLastCreatedSplineJumpTable` | table<string, function> | Renvoie la dernière spline de la liste de l'outil (ou nil si vide) ; optimisé pour undo/redo. |
| `removeJumpTable` | table<string, function> | Supprime une spline liée (removeLinkedXxx de chaque outil). |
| `restoreJumpTable` | table<string, function(data: table)> | Restaure une spline à partir de données : copie profonde, ajout à la liste de l'outil, recalcul de la table id vers indice ; renvoie la spline. |
| `serializeJumpTable` | table<string, function(linkedSplineId: any)> | Renvoie une copie profonde de la spline liée (deepCopyXxx), ou nil si introuvable. |
| `setLinkJumpTable` | table<string, function> | setLink de chaque outil : définit l'état de lien d'une couche. |
| `setLinkedSplineDirtyJumpTable` | table<string, function(id: any)> | Met isDirty = true sur la spline liée, si elle existe. |
| `setLockedJumpTable` | table<string, function(id: any, isLocked: boolean)> | Verrouille/déverrouille une spline enfant via le setLockedById de l'outil ; suit le verrou de sa Master Spline. |
| `setNameJumpTable` | table<string, function(id: any, splineName: string)> | Renomme la spline liée (champ name) ; pour mesh, assembly et road, renomme aussi le dossier de l'arbre de scène (sceneTreeFolderId) et rafraîchit la fenêtre de l'arbre. |
| `toolNavigation` | table<string, table> | Pour chaque type : uiModule (nom de l'extension, ex. 'editor_meshSpline'), getModeKey, getSplines et getIdToIdxMap, pour naviguer vers l'outil compatible. |
| `unlinkJumpTable` | table<string, function(linkedSplineId: any)> | Délie la spline : isLink = false, linkId = nil, isDirty = true. |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/jumpTables.lua`.*
