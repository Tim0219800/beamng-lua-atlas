---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Road Spline » de l'éditeur de niveaux : on trace une spline (nœuds + largeurs) et l'outil génère automatiquement des DecalRoads empilés en couches (chaussée, lignes centrales/de rive, fondus de bord, marques de pneus, fissures, rustines…), avec peinture optionnelle du terrain. Ce fichier est surtout l'interface ImGui (fenêtre « roadSplineEditor », mode d'édition « Road Spline ») ; la logique de données est dans editor/roadSpline/groupMgr et layerMgr. Il enregistre aussi l'entrée « Convert to Road Spline » dans le menu contextuel de l'arbre de scène pour convertir des DecalRoads existants. Utile à un moddeur surtout pour verrouiller/sélectionner une spline depuis un autre outil (Master Spline).
--- Accès : extension `editor_roadSpline` : `extensions.load("editor_roadSpline")`, puis la globale `editor_roadSpline`
---@class editor_roadSpline
editor_roadSpline = {}

--- Appelé à la sortie du niveau : supprime les groupes actifs non liés (les verrouillés et liés restent dans la liste) et recalcule la table id -> indice.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline.lua:1680
function editor_roadSpline.onClientEndMission() end

--- Hook de désérialisation après rechargement Lua : recrée les groupes, reprend les DecalRoads conservés des routes verrouillées (groupMgr.adopt) et recalcule la table id -> indice.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline.lua:162
---@param data table Valeur renvoyée par onSerialize.
function editor_roadSpline.onDeserialized(data) end

--- Appelé à chaque image par l'éditeur. Met à jour les groupes sales (même si l'outil est inactif), puis, si l'outil est actif, dessine la fenêtre principale, gère le polygone de sélection, la sélection de matériau, le fil de fer, les nœuds/poignées et le gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline.lua:1504
function editor_roadSpline.onEditorGui() end

--- Appelé à l'initialisation de l'éditeur : déclare le mode d'édition roadSplineEditor (« Road Spline »), enregistre la fenêtre de l'outil et celle de sélection de matériau, et ajoute « Convert to Road Spline » au menu contextuel de l'arbre de scène.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline.lua:1657
function editor_roadSpline.onEditorInitialized() end

--- Hook de sérialisation avant rechargement Lua. Renvoie la liste des groupes encodés ; pour une route verrouillée, mémorise les ids de ses DecalRoads (keptObjects) et laisse les objets dans la scène. Vide ensuite la liste des groupes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline.lua:144
---@return table  Tableau de groupes sérialisés (chaînes encodées par string.buffer).
function editor_roadSpline.onSerialize() end

--- Verrouille ou déverrouille la spline dont l'id est donné et la reconstruit immédiatement. Verrouillée (isEnabled = false), la route n'est plus reconstruite par l'outil et ses DecalRoads sont sauvegardés avec le niveau. Utilisée aussi par la Master Spline pour les splines enfants liées. Ne fait rien si l'id est inconnu.
---Source : lua/ge/extensions/editor/roadSpline.lua:86
---@param id string Identifiant (UUID) du groupe/spline.
---@param isLocked boolean true pour verrouiller (le dernier état affiché est d'abord reconstruit), false pour déverrouiller.
function editor_roadSpline.setLockedById(id, isLocked) end

--- Définit l'indice du nœud sélectionné dans la spline courante (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/roadSpline.lua:119
---@param idx integer Indice (à partir de 1) du nœud.
function editor_roadSpline.setSelectedNodeIdx(idx) end

--- Définit l'indice de la spline sélectionnée dans l'outil (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/roadSpline.lua:116
---@param idx integer Indice (à partir de 1) dans la liste des groupes.
function editor_roadSpline.setSelectedSplineIdx(idx) end

