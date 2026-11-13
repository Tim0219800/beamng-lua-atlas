---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polygon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire de l'éditeur pour dessiner et modifier à la souris un polygone défini par l'utilisateur sur la carte (posé sur le terrain). Un seul polygone est géré par le module. L'outil hôte appelle handleUserPolygon chaque frame : clic pour ajouter un nœud, glissement pour déplacer, double-clic (plus de 2 nœuds) pour terminer, touche Suppr pour retirer le nœud sélectionné, Alt pour afficher/masquer le gizmo de translation. render, isDragging et isMouseOverEditable permettent à un outil qui pilote sa propre interaction de rester cohérent.
--- Accès : extension `editor_toolUtilities_polygon` : `extensions.load("editor_toolUtilities_polygon")`, puis la globale `editor_toolUtilities_polygon`
---@class editor_toolUtilities_polygon
editor_toolUtilities_polygon = {}

--- Commence immédiatement le glissement du nœud donné pendant l'appui souris courant, sans nouveau clic. Sans effet si l'indice est invalide.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:455
---@param nodeIdx integer Indice (à partir de 1) du nœud.
function editor_toolUtilities_polygon.beginDragNode(nodeIdx) end

--- Vide le polygone (lève dirty s'il contenait des nœuds).
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:124
function editor_toolUtilities_polygon.clearPolygon() end

--- Renvoie le drapeau dirty (polygone modifié depuis le dernier appel) puis le remet à false.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:132
---@return boolean  true si le polygone a changé.
function editor_toolUtilities_polygon.consumeDirty() end

--- Renvoie la table interne du polygone (liste de vec3, pas une copie).
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:90
---@return table  Liste de vec3.
function editor_toolUtilities_polygon.getPolygon() end

--- Gère tout le cycle de vie du polygone utilisateur : rendu, curseur, ajout, insertion sur une arête, glissement de nœuds, gizmo (Alt), suppression (Suppr), fin par double-clic. À appeler chaque frame tant que l'outil est actif.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:238
---@param doubleClickCallback function|nil Appelé avec une copie du polygone au double-clic quand il a plus de 2 nœuds.
---@param opts table|nil clearOnComplete (défaut true), doRender (défaut true), foreground (défaut false : dessin à travers la géométrie), snap = {ox, oy, step} (accrochage à une grille), segmentLabels (longueur de chaque segment), rigid (glisser un nœud déplace tout le polygone), ground, open.
function editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts) end

--- Vrai tant qu'un nœud est en cours de glissement ; permet à l'outil hôte de suspendre ses propres interactions de scène.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:451
---@return boolean  true pendant un glissement.
function editor_toolUtilities_polygon.isDragging() end

--- Vrai si la souris est sur un nœud ou une arête du polygone (une cible d'édition), pour donner priorité au polygone sur la sélection inter-outils.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:467
---@return boolean  true si survol d'un élément éditable.
function editor_toolUtilities_polygon.isMouseOverEditable() end

--- Vrai si le polygone a plus de 2 nœuds.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:121
---@return boolean  true si valide.
function editor_toolUtilities_polygon.isPolygonValid() end

--- Passe de dessin seule, sans entrée : affiche nœuds, arêtes et éventuellement les longueurs de segments. Utile quand l'outil hôte gère sa propre interaction (déplacement rigide par exemple). opts.hover fait aussi pulser le nœud sous le curseur.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:436
---@param opts table|nil { open, foreground, segmentLabels, hover }
function editor_toolUtilities_polygon.render(opts) end

--- Remplace le polygone par une copie des nœuds donnés (nil ou vide = effacer). Réinitialise le glissement et le gizmo, et lève le drapeau dirty.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:94
---@param nodes table|nil Liste de points {x,y,z} (vec3 ou équivalent).
function editor_toolUtilities_polygon.setPolygon(nodes) end

