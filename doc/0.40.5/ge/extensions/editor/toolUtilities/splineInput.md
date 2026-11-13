# `editor_toolUtilities_splineInput`

*Fichier : `lua/ge/extensions/editor/toolUtilities/splineInput.lua` · VM : Game Engine (GE) · 1310 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_splineInput` : `extensions.load("editor_toolUtilities_splineInput")`, puis la globale `editor_toolUtilities_splineInput`

Gestion partagée de la souris et du clavier pour tous les outils d'édition de splines de l'éditeur (une spline est une polyligne éditable le long d'une ligne centrale de largeur variable : routes, chemins). Gère la sélection et le glissement de nœuds, de poignées de largeur (ribs) et de hauteur (bars), le gizmo, l'ajout et l'insertion de nœuds, les jonctions et boucles, le copier-coller de profil (Ctrl+C / Ctrl+V), la suppression, l'annulation (via editor.history ou un remplacement fourni par l'outil) et la sélection entre outils. Les outils s'enregistrent avec registerSplineTool, ce qui permet de sélectionner une spline d'un autre outil en cliquant dessus.

## Exemple

```lua
local si = require('editor/toolUtilities/splineInput')
si.registerSplineTool(prefix, getSplines, getEditModeKey, deepCopy, deepCopyState, 'editor_meshSpline')
-- chaque frame, dans onEditorGui : si.handleSplineEvents(splines, out, ...)
```

## Remarques

- Constantes : largeur de spline de 3 à 200 m, hauteur de 0 à 70 m, vitesse par défaut d'un nœud 13.5 m/s (limite 70 m/s), distance max de jonction ou boucle 15 m, sensibilité de hauteur 1 m par pixel, délai d'apparition du texte d'aide 1 s.
- Les jonctions et boucles ne modifient la topologie que si Ctrl est maintenu au relâchement du glisser ; l'aperçu s'affiche dès qu'un candidat existe.
- Alt bascule le gizmo (out.isGizmoActive).
- eventOptions de handleSplineEvents : commitHistoryOverride(name, data, undoFn, redoFn, dontCallRedoNow), preserveNodeZ (glisser un nœud sur un plan horizontal à sa propre altitude), suppressAddNode (masque l'ajout de nœud pour la frame), midJoinRefusalFn, maxWidth (largeur max d'un glisser de rib), gizmoAnchorFn(spline, node) (point d'affichage du gizmo).
- Champs de `out` lus ou écrits : spline, node (indices sélectionnés), isGizmoActive, entre autres.
- Un outil hébergé dans un autre mode d'édition (onglets réseau du City Builder) doit se déclarer avec setHostedTool(prefix) tant que son onglet est ouvert.
- cancelDrag est exporté comme alias de clearDragState (efface tout l'état de glisser).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_splineInput.cancelDrag()` | Annule l'état de glisser en cours (alias de clearDragState) : efface spline, nœud, état avant, drapeaux rib, bar et aux. | 77 |
| `editor_toolUtilities_splineInput.getBestHitTarget(selSpline, mousePos, useRibs, useBars)` | Détection de hit qui départage par distance à la caméra : renvoie la meilleure cible (nœud, rib ou bar) la plus proche du rayon caméra, en vérifiant toujours les splines de tous les outils pour la sélection inter-outils. Les nœuds ont la priorité. | 478 |
| `editor_toolUtilities_splineInput.handleForeignNodeSelection(activePrefix)` | Sélection de nœuds d'un autre outil, pour les outils qui n'exécutent pas handleSplineEvents (outils polygones comme l'éditeur de zones de forêt). À chaque frame, survole les nœuds de splines d'autres outils (lueur et texte « select ») et, au clic, bascule vers cet outil et sélectionne le nœud, avec démarrage d'un glisser si l'outil cible le supporte. | 701 |
| `editor_toolUtilities_splineInput.handleNavGraphEvents(selSpline, nodes, deepCopyFunct, undoFunct, redoFunct, isBarsLimit, useBars)` | Traite les événements d'entrée pour un chemin dans un graphe de navigation : clic sur un nœud du graphe pour l'ajouter ou le retirer du chemin (avec sa vitesse et sa limite par défaut 13.5 m/s), glisser des bars de vitesse (de 0 à 70 m/s), curseur et textes d'aide. | 1171 |
| `editor_toolUtilities_splineInput.handleSplineEvents(splines, out, isRotEnabled, isConformToTerrain, useRibs, useBars, isBarsLimits, useCopyPaste, useGizmo, isLockShape, defaultSplineWidth, deepCopyFunct, deepCopyStateFunct, copyProfileFunct, pasteProfileFunct, afterEndDragCallback, joinFunct, undoFunct, redoFunct, undoStateFunct, redoStateFunct, midJoinFunct, canJoinFunct, canJoinAuxFunct, eventOptions)` | Traite les événements d'entrée des outils de splines pour une frame : survol, sélection, ajout et insertion de nœuds, glisser de nœuds, de ribs et de bars, gizmo, jonctions, copier-coller de profil, suppression, et validation des pas d'annulation. Met à jour la table `out` (spline et nœud sélectionnés, état du gizmo, etc.). | 775 |
| `editor_toolUtilities_splineInput.isDragging()` | Vrai si un glisser est en cours (nœud, nœud auxiliaire ou gizmo). | 97 |
| `editor_toolUtilities_splineInput.registerSplineTool(prefix, getSplinesFn, getEditModeKeyFn, deepCopyFn, deepCopyStateFn, uiModuleName, getAuxNodesFn, isNodeLockedFn)` | Enregistre un outil d'édition de splines pour les utilitaires d'entrée partagés. Rappelé avec le même préfixe (rechargement à chaud), il met à jour les callbacks de l'enregistrement existant ; ne fait rien si prefix est nil. Attention : à la mise à jour, getAuxNodesFn et isNodeLockedFn sont remplacés tels quels, même s'ils sont nil. | 665 |
| `editor_toolUtilities_splineInput.setHostedTool(prefix)` | Déclare qu'un outil est hébergé dans un autre mode d'édition : son préfixe sert alors de nom d'outil actif à la place du displayName du mode d'édition. | 103 |

### Détail des paramètres

#### `editor_toolUtilities_splineInput.getBestHitTarget(selSpline, mousePos, useRibs, useBars)`

Détection de hit qui départage par distance à la caméra : renvoie la meilleure cible (nœud, rib ou bar) la plus proche du rayon caméra, en vérifiant toujours les splines de tous les outils pour la sélection inter-outils. Les nœuds ont la priorité.

- `selSpline` (*table|nil*) : Spline sélectionnée.
- `mousePos` (*vec3*) : Position 3D de la souris.
- `useRibs` (*boolean*) : Tester aussi les poignées de largeur.
- `useBars` (*boolean*) : Tester aussi les poignées de hauteur.
- **renvoie** : table|nil Cible : champs type ('node', 'rib', 'bar'), splineIdx, nodeIdx, toolName, entre autres ; nil si rien.

#### `editor_toolUtilities_splineInput.handleForeignNodeSelection(activePrefix)`

Sélection de nœuds d'un autre outil, pour les outils qui n'exécutent pas handleSplineEvents (outils polygones comme l'éditeur de zones de forêt). À chaque frame, survole les nœuds de splines d'autres outils (lueur et texte « select ») et, au clic, bascule vers cet outil et sélectionne le nœud, avec démarrage d'un glisser si l'outil cible le supporte.

- `activePrefix` (*string*) : Préfixe de l'outil appelant, dont les splines sont ignorées.
- **renvoie** : boolean Vrai si un nœud étranger est sous le curseur, pour que l'appelant saute sa propre interaction de scène.

#### `editor_toolUtilities_splineInput.handleNavGraphEvents(selSpline, nodes, deepCopyFunct, undoFunct, redoFunct, isBarsLimit, useBars)`

Traite les événements d'entrée pour un chemin dans un graphe de navigation : clic sur un nœud du graphe pour l'ajouter ou le retirer du chemin (avec sa vitesse et sa limite par défaut 13.5 m/s), glisser des bars de vitesse (de 0 à 70 m/s), curseur et textes d'aide.

- `selSpline` (*table|nil*) : Spline sélectionnée (graphNodes, vels, velLimits, barPoints).
- `nodes` (*table*) : Nœuds du graphe de navigation.
- `deepCopyFunct` (*function*) : Copie profonde d'une spline.
- `undoFunct` (*function*) : Callback d'annulation.
- `redoFunct` (*function*) : Callback de rétablissement.
- `isBarsLimit` (*boolean*) : Utiliser velLimits (vrai) ou vels (faux) pour la hauteur des bars.
- `useBars` (*boolean|nil*) : Autoriser les bars (vrai par défaut).

#### `editor_toolUtilities_splineInput.handleSplineEvents(splines, out, isRotEnabled, isConformToTerrain, useRibs, useBars, isBarsLimits, useCopyPaste, useGizmo, isLockShape, defaultSplineWidth, deepCopyFunct, deepCopyStateFunct, copyProfileFunct, pasteProfileFunct, afterEndDragCallback, joinFunct, undoFunct, redoFunct, undoStateFunct, redoStateFunct, midJoinFunct, canJoinFunct, canJoinAuxFunct, eventOptions)`

Traite les événements d'entrée des outils de splines pour une frame : survol, sélection, ajout et insertion de nœuds, glisser de nœuds, de ribs et de bars, gizmo, jonctions, copier-coller de profil, suppression, et validation des pas d'annulation. Met à jour la table `out` (spline et nœud sélectionnés, état du gizmo, etc.).

- `splines` (*table*) : Collection des splines à gérer.
- `out` (*table*) : Table mise à jour pendant l'interaction : sélection (indice de spline, de nœud, de calque pour le cas « decal placement »), isGizmoActive, etc.
- `isRotEnabled` (*boolean*) : Gizmo de rotation autorisé.
- `isConformToTerrain` (*boolean*) : La spline doit épouser la surface dessous (commande verticale du gizmo).
- `useRibs` (*boolean*) : Utiliser les ribs (poignées de largeur).
- `useBars` (*boolean*) : Utiliser les bars (poignées de hauteur).
- `isBarsLimits` (*boolean*) : Les bars sont des limites (vrai) ou des vitesses (faux).
- `useCopyPaste` (*boolean*) : Activer le copier-coller de profil.
- `useGizmo` (*boolean*) : Utiliser le gizmo.
- `isLockShape` (*boolean*) : La forme de la spline est verrouillée.
- `defaultSplineWidth` (*number*) : Largeur par défaut d'un nouveau nœud, en mètres.
- `deepCopyFunct` (*function*) : Copie profonde d'une spline.
- `deepCopyStateFunct` (*function*) : Copie profonde de l'état d'une spline.
- `copyProfileFunct` (*function*) : Copie un profil.
- `pasteProfileFunct` (*function*) : Colle un profil.
- `afterEndDragCallback` (*function|nil*) : Appelée en fin de glisser avec (selSpline, wasAuxDrag, auxIdx, dragSplineIdx, dragNodeIdx).
- `joinFunct` (*function|nil*) : Appelée quand l'utilisateur forme une jonction.
- `undoFunct` (*function*) : Callback d'annulation d'une édition de spline.
- `redoFunct` (*function*) : Callback de rétablissement d'une édition de spline.
- `undoStateFunct` (*function|nil*) : Callback d'annulation de l'édition d'état complet.
- `redoStateFunct` (*function|nil*) : Callback de rétablissement de l'édition d'état complet.
- `midJoinFunct` (*function|nil*) : Appelée pour une jonction en milieu de spline.
- `canJoinFunct` (*function|nil*) : Dit si une jonction est permise (déduit du code).
- `canJoinAuxFunct` (*function|nil*) : Variante de canJoinFunct pour les nœuds auxiliaires (déduit du code).
- `eventOptions` (*table|nil*) : Options : commitHistoryOverride, preserveNodeZ, suppressAddNode, midJoinRefusalFn, maxWidth, gizmoAnchorFn.

#### `editor_toolUtilities_splineInput.isDragging()`

Vrai si un glisser est en cours (nœud, nœud auxiliaire ou gizmo).

- **renvoie** : boolean Glisser actif.

#### `editor_toolUtilities_splineInput.registerSplineTool(prefix, getSplinesFn, getEditModeKeyFn, deepCopyFn, deepCopyStateFn, uiModuleName, getAuxNodesFn, isNodeLockedFn)`

Enregistre un outil d'édition de splines pour les utilitaires d'entrée partagés. Rappelé avec le même préfixe (rechargement à chaud), il met à jour les callbacks de l'enregistrement existant ; ne fait rien si prefix est nil. Attention : à la mise à jour, getAuxNodesFn et isNodeLockedFn sont remplacés tels quels, même s'ils sont nil.

- `prefix` (*string*) : Préfixe d'affichage de l'outil (de splineMgr.getToolPrefixStr()).
- `getSplinesFn` (*function*) : Renvoie le tableau de splines de l'outil.
- `getEditModeKeyFn` (*function*) : Renvoie la clé du mode d'édition de l'éditeur pour cet outil.
- `deepCopyFn` (*function*) : Copie profonde d'une spline.
- `deepCopyStateFn` (*function*) : Copie profonde de tout l'état de l'outil.
- `uiModuleName` (*string*) : Nom du module d'UI (par ex. 'editor_meshSpline'), qui expose setSelectedSplineIdx et setSelectedNodeIdx.
- `getAuxNodesFn` (*function|nil*) : Facultatif : renvoie des positions de nœuds sélectionnables supplémentaires (tableau de vec3), mêmes règles de hit que les nœuds de route.
- `isNodeLockedFn` (*function|nil*) : Facultatif : isNodeLockedFn(spline, nodeIdx) renvoie vrai pour permettre la sélection mais pas le glissement, le gizmo ni la suppression.

#### `editor_toolUtilities_splineInput.setHostedTool(prefix)`

Déclare qu'un outil est hébergé dans un autre mode d'édition : son préfixe sert alors de nom d'outil actif à la place du displayName du mode d'édition.

- `prefix` (*string|nil*) : Préfixe de l'outil hébergé, nil pour annuler.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/splineInput.lua`.*
