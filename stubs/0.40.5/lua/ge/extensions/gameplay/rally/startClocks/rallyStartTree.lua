---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affichage LED du panneau d'horloge de départ (« rally start tree ») de BeamNG. Il retrouve dans la scène les TSStatic utilisant la forme s_rally_start_tree.dae, puis dessine dans deux textures (couleur et opacité, 900x540) une grille de LED : feux tricolores (R/A/G), horloge à 6 chiffres en vert, libellé d'étape en ambre et compte à rebours en rouge. Aide aussi à choisir l'orientation de l'affichage vers un point cible. Module simple (table C), sans constructeur.
--- Accès : extension `gameplay_rally_startClocks_rallyStartTree` : `extensions.load("gameplay_rally_startClocks_rallyStartTree")`, puis la globale `gameplay_rally_startClocks_rallyStartTree`
---@class gameplay_rally_startClocks_rallyStartTree
---@field textures table Définition des deux textures dynamiques : color (clearColor transparent) et opacity (clearColor noir), chacune avec tag, width et height.
gameplay_rally_startClocks_rallyStartTree = {}

--- Dessine l'état complet de l'afficheur dans les textures : feux, horloge, libellé d'étape et compte à rebours (format « -N », « M:SS » ou un ou deux chiffres).
---Source : lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua:130
---@param textures table {color, opacity} : objets texture ciblés
---@param display table {clock=string "HH:MM:SS" style, label=string, countdown=string, semaphore="R"|"A"|"G"}
function gameplay_rally_startClocks_rallyStartTree.draw(textures, display) end

--- Parcourt les TSStatic de la scène et renvoie ceux dont shapeName est la forme du start tree.
---Source : lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua:66
---@return table[]  Liste de {anchor, shapeName (forme d'affichage), transform, scale}
function gameplay_rally_startClocks_rallyStartTree.findClocks() end

--- Calcule un vecteur de visée pour l'affichage d'une horloge : combine la tangente et la normale de la surface de la horloge, orientées dans le sens de la route et vers l'intérieur, selon que l'horloge est à droite ou à gauche de la ligne de départ.
---Source : lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua:178
---@param clock table Élément renvoyé par findClocks (utilise clock.anchor)
---@param startLine table {pos, rot} de la ligne de départ ; rot nécessaire
---@param targetPos vec3 Position de la cible (côté où se trouve la horloge par rapport à la route)
---@return vec3|nil  Direction composée ; nil si la rotation est absente ou dégénérée
function gameplay_rally_startClocks_rallyStartTree.getView(clock, startLine, targetPos) end

