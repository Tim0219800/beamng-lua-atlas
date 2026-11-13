---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/sitePad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Une plate-forme de terrain plane (« pad ») sur laquelle un outil de site peut dessiner, et le sol propre du site taillé dedans. enter aplatit un carré de 300 m à 50 m d'altitude (niveau de référence du site) en mémorisant le sol réel ; leave le remet tel qu'il était ; carve y taille le plan de sol du site (terrasse, rampe, marches, sous-sol) pour qu'on le voie en dessinant ; suspend/resume l'enlèvent le temps d'une sauvegarde de niveau. Un seul pad à la fois (un seul outil tient l'écran).
--- Accès : extension `editor_toolUtilities_sitePad` : `extensions.load("editor_toolUtilities_sitePad")`, puis la globale `editor_toolUtilities_sitePad`
---@class editor_toolUtilities_sitePad
editor_toolUtilities_sitePad = {}

--- Taille le plan de sol du site dans le pad, pour qu'une place en contrebas, une terrasse ou un escalier soient VISIBLES pendant le dessin. features est la même liste que celle cuite pour le placeur. La dernière coupe est d'abord annulée (une coupe se fond dans le sol autour, et se fondre dans un sol déjà abaissé grignoterait le pad à chaque fois) ; sans features, c'est tout ce que fait l'appel.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:150
---@param features table|nil Liste de features { quad } ou { rings, z } avec mode et band.
---@param prio number|nil Sur sol réel, bande de priorité du site ; ce qui l'emporte à proximité entre dans la même passe à sa propre priorité.
---@return boolean  false s'il n'y a pas de pad.
function editor_toolUtilities_sitePad.carve(features, prio) end

--- Hauteur d'origine d'une cellule de la grille de hauteurs du pad (avant la pose), dans les unités de la grille (depuis la base du bloc) ; nil hors du pad.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:206
---@param gx integer Colonne de la grille.
---@param gy integer Ligne de la grille.
---@return number|nil  Hauteur en repère de grille.
function editor_toolUtilities_sitePad.cellZ(gx, gy) end

--- Où un outil doit centrer son pad d'après les bornes de ce qu'il tient déjà (centre de la boîte englobante des points). Sans points, la visée de la caméra (util.lookAtGround), là où les outils posent une forme de départ.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:126
---@param ring table|nil Liste de points {x,y}.
---@return number  x du centre.
---@return number  y du centre.
function editor_toolUtilities_sitePad.centreFor(ring) end

--- De combien le sol du pad est sous le niveau de référence ; nil sans pad.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:229
---@return number|nil  Abaissement en mètres.
function editor_toolUtilities_sitePad.drop() end

--- Aplatit le carré centré sur (cx, cy) en mémorisant ce qui s'y trouvait, pour que leave le remette. Un pad déjà posé est d'abord remis (deux pads qui se chevauchent perdraient le sol réel). Appelle d'abord beforeEnterFn s'il n'y avait pas de pad.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:89
---@param cx number x du centre.
---@param cy number y du centre.
---@param drop number|nil Abaisse le sol de cette distance SOUS le niveau de référence (un outil dont le site a du sol propre dessous, sous-sol ou cour anglaise, peut ainsi voir dedans). Le site reste à level() : le niveau de référence et la surface taillée se séparent.
---@param real boolean|nil Laisse le sol tel quel et ne fait que le mémoriser : un site dessiné autour de sa parcelle est conçu sur le sol où il se tiendra. Un tel pad n'a pas de niveau de référence ; level n'est pas pour lui.
---@return boolean  true si le pad est posé.
function editor_toolUtilities_sitePad.enter(cx, cy, drop, real) end

--- Le sol en (x, y) tel qu'il était avant la pose du pad ou toute coupe ; nil hors du pad. Ce dont un niveau se mesure : mesuré sur la coupe, chaque coupe déplacerait le niveau de la suivante.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:219
---@param x number x monde.
---@param y number y monde.
---@return number|nil  Hauteur z monde.
function editor_toolUtilities_sitePad.groundZ(x, y) end

--- Vrai si un pad est posé.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:203
---@return boolean  true si pad posé.
function editor_toolUtilities_sitePad.isDown() end

--- Remet le sol comme il était. Seulement les hauteurs : ce que l'outil a construit sur le pad part par son propre démontage. Tout ce qui a été taillé DANS le pad part avec lui.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:61
---@return boolean  false s'il n'y avait pas de pad.
function editor_toolUtilities_sitePad.leave() end

--- Le niveau monde (50 m) contre lequel un site posé sur le pad est TRACÉ. À utiliser pour tout ce qui se tient sur la planche à dessin à la place d'un échantillonnage du sol, qui n'est plus plat une fois que le site y a taillé ses formes.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:239
---@return number  Niveau de référence (PAD_Z = 50).
function editor_toolUtilities_sitePad.level() end

--- Recoupe le pad à un autre abaissement, là où il se trouve. Sa coupe tombe avec lui : elle avait été taillée dans l'ancien sol. Renvoie false sans pad ou si l'abaissement est inchangé.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:232
---@param d number Nouvel abaissement en mètres.
---@return boolean  true si le pad a été refait.
function editor_toolUtilities_sitePad.redrop(d) end

--- Remet le pad en place après suspend, avec la même taille de coupe.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:195
---@return boolean  true si le pad et sa coupe sont rétablis.
function editor_toolUtilities_sitePad.resume() end

--- Enregistre qui rend une dernière fois le sol réel avant qu'un pad ne le mémorise : fn() s'exécute à l'entrée d'un éditeur (seulement s'il n'y avait pas déjà de pad).
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:215
---@param fn function fn() sans argument.
function editor_toolUtilities_sitePad.setBeforeEnter(fn) end

--- Enregistre qui répond à ce qui l'emporte sur un site en sol réel : fn(x0, y0, x1, y1) renvoie ces features, chacune avec sa bande.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:212
---@param fn function fn(x0, y0, x1, y1) -> liste de features.
function editor_toolUtilities_sitePad.setHeld(fn) end

--- Enlève le pad du sol le temps d'une sauvegarde de niveau, en retenant sa position et ce qui y était taillé. Une sauvegarde écrit le terrain tel qu'elle le trouve : une planche à dessin restée là serait écrite comme vrai sol.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:186
---@return boolean  false s'il n'y avait pas de pad.
function editor_toolUtilities_sitePad.suspend() end

