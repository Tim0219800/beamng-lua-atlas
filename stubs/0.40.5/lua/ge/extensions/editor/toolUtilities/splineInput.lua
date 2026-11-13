---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion partagée de la souris et du clavier pour tous les outils d'édition de splines de l'éditeur (une spline est une polyligne éditable le long d'une ligne centrale de largeur variable : routes, chemins). Gère la sélection et le glissement de nœuds, de poignées de largeur (ribs) et de hauteur (bars), le gizmo, l'ajout et l'insertion de nœuds, les jonctions et boucles, le copier-coller de profil (Ctrl+C / Ctrl+V), la suppression, l'annulation (via editor.history ou un remplacement fourni par l'outil) et la sélection entre outils. Les outils s'enregistrent avec registerSplineTool, ce qui permet de sélectionner une spline d'un autre outil en cliquant dessus.
--- Accès : extension `editor_toolUtilities_splineInput` : `extensions.load("editor_toolUtilities_splineInput")`, puis la globale `editor_toolUtilities_splineInput`
---@class editor_toolUtilities_splineInput
editor_toolUtilities_splineInput = {}

--- Annule l'état de glisser en cours (alias de clearDragState) : efface spline, nœud, état avant, drapeaux rib, bar et aux.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:77
function editor_toolUtilities_splineInput.cancelDrag() end

--- Détection de hit qui départage par distance à la caméra : renvoie la meilleure cible (nœud, rib ou bar) la plus proche du rayon caméra, en vérifiant toujours les splines de tous les outils pour la sélection inter-outils. Les nœuds ont la priorité.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:478
---@param selSpline table|nil Spline sélectionnée.
---@param mousePos vec3 Position 3D de la souris.
---@param useRibs boolean Tester aussi les poignées de largeur.
---@param useBars boolean Tester aussi les poignées de hauteur.
---@return table|nil  Cible : champs type ('node', 'rib', 'bar'), splineIdx, nodeIdx, toolName, entre autres ; nil si rien.
function editor_toolUtilities_splineInput.getBestHitTarget(selSpline, mousePos, useRibs, useBars) end

--- Sélection de nœuds d'un autre outil, pour les outils qui n'exécutent pas handleSplineEvents (outils polygones comme l'éditeur de zones de forêt). À chaque frame, survole les nœuds de splines d'autres outils (lueur et texte « select ») et, au clic, bascule vers cet outil et sélectionne le nœud, avec démarrage d'un glisser si l'outil cible le supporte.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:701
---@param activePrefix string Préfixe de l'outil appelant, dont les splines sont ignorées.
---@return boolean  Vrai si un nœud étranger est sous le curseur, pour que l'appelant saute sa propre interaction de scène.
function editor_toolUtilities_splineInput.handleForeignNodeSelection(activePrefix) end

--- Traite les événements d'entrée pour un chemin dans un graphe de navigation : clic sur un nœud du graphe pour l'ajouter ou le retirer du chemin (avec sa vitesse et sa limite par défaut 13.5 m/s), glisser des bars de vitesse (de 0 à 70 m/s), curseur et textes d'aide.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:1171
---@param selSpline table|nil Spline sélectionnée (graphNodes, vels, velLimits, barPoints).
---@param nodes table Nœuds du graphe de navigation.
---@param deepCopyFunct function Copie profonde d'une spline.
---@param undoFunct function Callback d'annulation.
---@param redoFunct function Callback de rétablissement.
---@param isBarsLimit boolean Utiliser velLimits (vrai) ou vels (faux) pour la hauteur des bars.
---@param useBars boolean|nil Autoriser les bars (vrai par défaut).
function editor_toolUtilities_splineInput.handleNavGraphEvents(selSpline, nodes, deepCopyFunct, undoFunct, redoFunct, isBarsLimit, useBars) end

--- Traite les événements d'entrée des outils de splines pour une frame : survol, sélection, ajout et insertion de nœuds, glisser de nœuds, de ribs et de bars, gizmo, jonctions, copier-coller de profil, suppression, et validation des pas d'annulation. Met à jour la table `out` (spline et nœud sélectionnés, état du gizmo, etc.).
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:775
---@param splines table Collection des splines à gérer.
---@param out table Table mise à jour pendant l'interaction : sélection (indice de spline, de nœud, de calque pour le cas « decal placement »), isGizmoActive, etc.
---@param isRotEnabled boolean Gizmo de rotation autorisé.
---@param isConformToTerrain boolean La spline doit épouser la surface dessous (commande verticale du gizmo).
---@param useRibs boolean Utiliser les ribs (poignées de largeur).
---@param useBars boolean Utiliser les bars (poignées de hauteur).
---@param isBarsLimits boolean Les bars sont des limites (vrai) ou des vitesses (faux).
---@param useCopyPaste boolean Activer le copier-coller de profil.
---@param useGizmo boolean Utiliser le gizmo.
---@param isLockShape boolean La forme de la spline est verrouillée.
---@param defaultSplineWidth number Largeur par défaut d'un nouveau nœud, en mètres.
---@param deepCopyFunct function Copie profonde d'une spline.
---@param deepCopyStateFunct function Copie profonde de l'état d'une spline.
---@param copyProfileFunct function Copie un profil.
---@param pasteProfileFunct function Colle un profil.
---@param afterEndDragCallback function|nil Appelée en fin de glisser avec (selSpline, wasAuxDrag, auxIdx, dragSplineIdx, dragNodeIdx).
---@param joinFunct function|nil Appelée quand l'utilisateur forme une jonction.
---@param undoFunct function Callback d'annulation d'une édition de spline.
---@param redoFunct function Callback de rétablissement d'une édition de spline.
---@param undoStateFunct function|nil Callback d'annulation de l'édition d'état complet.
---@param redoStateFunct function|nil Callback de rétablissement de l'édition d'état complet.
---@param midJoinFunct function|nil Appelée pour une jonction en milieu de spline.
---@param canJoinFunct function|nil Dit si une jonction est permise (déduit du code).
---@param canJoinAuxFunct function|nil Variante de canJoinFunct pour les nœuds auxiliaires (déduit du code).
---@param eventOptions table|nil Options : commitHistoryOverride, preserveNodeZ, suppressAddNode, midJoinRefusalFn, maxWidth, gizmoAnchorFn.
function editor_toolUtilities_splineInput.handleSplineEvents(splines, out, isRotEnabled, isConformToTerrain, useRibs, useBars, isBarsLimits, useCopyPaste, useGizmo, isLockShape, defaultSplineWidth, deepCopyFunct, deepCopyStateFunct, copyProfileFunct, pasteProfileFunct, afterEndDragCallback, joinFunct, undoFunct, redoFunct, undoStateFunct, redoStateFunct, midJoinFunct, canJoinFunct, canJoinAuxFunct, eventOptions) end

--- Vrai si un glisser est en cours (nœud, nœud auxiliaire ou gizmo).
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:97
---@return boolean  Glisser actif.
function editor_toolUtilities_splineInput.isDragging() end

--- Enregistre un outil d'édition de splines pour les utilitaires d'entrée partagés. Rappelé avec le même préfixe (rechargement à chaud), il met à jour les callbacks de l'enregistrement existant ; ne fait rien si prefix est nil. Attention : à la mise à jour, getAuxNodesFn et isNodeLockedFn sont remplacés tels quels, même s'ils sont nil.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:665
---@param prefix string Préfixe d'affichage de l'outil (de splineMgr.getToolPrefixStr()).
---@param getSplinesFn function Renvoie le tableau de splines de l'outil.
---@param getEditModeKeyFn function Renvoie la clé du mode d'édition de l'éditeur pour cet outil.
---@param deepCopyFn function Copie profonde d'une spline.
---@param deepCopyStateFn function Copie profonde de tout l'état de l'outil.
---@param uiModuleName string Nom du module d'UI (par ex. 'editor_meshSpline'), qui expose setSelectedSplineIdx et setSelectedNodeIdx.
---@param getAuxNodesFn function|nil Facultatif : renvoie des positions de nœuds sélectionnables supplémentaires (tableau de vec3), mêmes règles de hit que les nœuds de route.
---@param isNodeLockedFn function|nil Facultatif : isNodeLockedFn(spline, nodeIdx) renvoie vrai pour permettre la sélection mais pas le glissement, le gizmo ni la suppression.
function editor_toolUtilities_splineInput.registerSplineTool(prefix, getSplinesFn, getEditModeKeyFn, deepCopyFn, deepCopyStateFn, uiModuleName, getAuxNodesFn, isNodeLockedFn) end

--- Déclare qu'un outil est hébergé dans un autre mode d'édition : son préfixe sert alors de nom d'outil actif à la place du displayName du mode d'édition.
---Source : lua/ge/extensions/editor/toolUtilities/splineInput.lua:103
---@param prefix string|nil Préfixe de l'outil hébergé, nil pour annuler.
function editor_toolUtilities_splineInput.setHostedTool(prefix) end

