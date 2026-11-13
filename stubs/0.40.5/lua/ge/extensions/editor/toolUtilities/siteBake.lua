---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteBake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transforme ce qu'un éditeur vient de construire dans le monde en ce que porte un manifeste de site. Un site est conçu à un endroit de la carte et placé ailleurs : toutes les cuissons soustraient donc leur origine (ox, oy, oz) à tout avant d'écrire (géométrie, transformations du kit, lampes, plantations, plan du sol). L'origine choisie importe peu au placeur (il se recale sur les bornes lues) mais doit être la MÊME pour toutes les listes d'un manifeste. Les coordonnées de plan sont arrondies au millimètre.
--- Accès : extension `editor_toolUtilities_siteBake` : `extensions.load("editor_toolUtilities_siteBake")`, puis la globale `editor_toolUtilities_siteBake`
---@class editor_toolUtilities_siteBake
editor_toolUtilities_siteBake = {}

--- L'étendue de tout ce que la cuisson place (sommets des parts et positions des instances, relatifs à l'origine), pour que le placeur cadre un site, le choisisse sous le curseur et sache la place qu'il lui faut avant de charger un maillage. Renvoie deux coins nuls si rien.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:253
---@param parts table|nil Parts de maillage avec verts.
---@param instances table|nil Instances avec px, py, pz.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@param oz number z de l'origine.
---@return table  Coin minimal {x,y,z}.
---@return table  Coin maximal {x,y,z}.
function editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz) end

--- Regroupe les placements du kit par forme. Un groupe par maillage distinct devient un seul dessin instancié à l'arrivée : une place avec deux cents bornes identiques coûte une forme et deux cents transformations.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:109
---@param instances table|nil Liste d'instances { shape, px, py, pz, ax, ay, az, ux, uy, uz, scl, glow, street, stand }.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@param oz number z de l'origine.
---@return table  Liste de groupes { shape, xf (12 nombres par instance), glow, street, stand }.
function editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz) end

--- Relit les repères de pièces du kit déjà posées dans la scène et les ajoute à out comme des enregistrements d'instance acceptés par groupInstances. Accepte indifféremment des entrées de kit (champ obj) ou les objets eux-mêmes ; les objets disparus ou sans shapeName sont ignorés ; la lueur nocturne (nightEmissive) est relue.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:153
---@param list table|nil Liste d'entrées { obj } ou d'objets de scène.
---@param out table|nil Liste à compléter (créée si nil).
---@return table  Enregistrements { shape, glow, px, py, pz, ax.., ux.., scl = {x,y,z} }.
function editor_toolUtilities_siteBake.harvestKit(list, out) end

--- Nombre de pièces que dresse une liste de groupes (taille de xf divisée par 12), pour un affichage avant écriture.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:183
---@param groups table|nil Groupes renvoyés par groupInstances.
---@return number  Nombre de pièces.
function editor_toolUtilities_siteBake.instanceCount(groups) end

--- Les formes auxquelles le site demande que le sol soit taillé, dans son repère. Chaque feature devient { quad = 4 coins {x,y,z locaux}, mode, band } ou { rings, z, mode, band }. Ignore tout ce à quoi sert la feature (palier, rampe, mur de soutènement).
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:59
---@param features table|nil Liste de features { quad } ou { rings, z }, avec mode ('carve' par défaut) et band.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@param oz number z de l'origine.
---@return table|nil  Liste de features locales, nil s'il n'y en a pas.
function editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz) end

--- Les lampes qui accompagnent les pièces, dans le repère du site. La couleur vient de glow ou de col (blanc par défaut). Un projecteur (dx présent) sort avec dir et cone ; une ampoule non.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:190
---@param lights table|nil Liste d'enregistrements de lumière { px, py, pz, radius, brightness, glow|col, street, dx, dy, dz, cone }.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@param oz number z de l'origine.
---@return table|nil  Liste de lampes locales, nil si vide.
function editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz) end

--- La peinture de terrain qu'un site pose, dans son repère. Chaque couche { m, ring } ou { m, xs, ys } (cellule par cellule) sort nommée par couche de matériau du terrain.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:87
---@param coats table|nil Liste de couches : m = indice de matériau, ring ou xs/ys.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@return table|nil  Liste { layer, ring } ou { layer, cells = {x1,y1,x2,y2,...} } ; nil si aucun bloc de terrain ou rien à peindre.
function editor_toolUtilities_siteBake.localPaint(coats, ox, oy) end

--- Plantation sous forme d'ancres : { items } pour des plantes déjà dispersées (x, y, sp, s, a), ou { points, species, speciesWeights, size, vary, seed, drape, street } pour une dispersion à refaire (la graine est déjà calculée, pour obtenir les mêmes plantes aux mêmes endroits).
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:211
---@param anchors table|nil Ancres de l'éditeur.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@param oz number z de l'origine.
---@return table|nil  Liste d'ancres locales, nil si vide.
function editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz) end

--- Une polyligne de la même façon (sans minimum de points). Sert aussi pour des normales unitaires avec une origine nulle.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:34
---@param pts table|nil Liste de points {x,y}.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@return table  Polyligne locale.
function editor_toolUtilities_siteBake.localPts(pts, ox, oy) end

--- Un polygone de plan, local à l'origine de cuisson, arrondi au millimètre. Renvoie nil si moins de 3 points, pour qu'un appelant puisse collecter le retour directement dans une liste.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:26
---@param ring table|nil Liste de points {x,y}.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@return table|nil  Anneau local.
function editor_toolUtilities_siteBake.localRing(ring, ox, oy) end

--- Une liste d'anneaux locaux ; nil si aucun n'était un polygone (une clé absente du manifeste signifie « ce site n'en a pas »).
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:42
---@param rings table|nil Liste d'anneaux.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@return table|nil  Liste d'anneaux locaux.
function editor_toolUtilities_siteBake.localRings(rings, ox, oy) end

--- Nombre de plantes qu'une cuisson porterait, sur toutes les ancres (items ou points). Uniquement pour un affichage.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:242
---@param anchors table|nil Ancres de plantation.
---@return integer  Nombre de plantes.
function editor_toolUtilities_siteBake.plantCount(anchors) end

