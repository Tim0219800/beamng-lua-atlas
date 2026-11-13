---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Places de stationnement telles qu'un site les porte et telles que le niveau les relit dans son fichier de sites. Une place n'est ni de la géométrie ni de la peinture : c'est une boîte que le jeu cherche quand il veut garer une voiture. Elle ne va donc pas dans une coque, mais dans city.sites.json du niveau (champ parkingSpots), seule sortie d'une cuisson de site qui n'est pas un fichier à elle. Elle attend la « gravure » : cuites en local et écrites à ce moment, les copies d'un parking ont chacune leurs places à leur endroit et à leur hauteur.
--- Accès : extension `editor_toolUtilities_siteSpots` : `extensions.load("editor_toolUtilities_siteSpots")`, puis la globale `editor_toolUtilities_siteSpots`
---@class editor_toolUtilities_siteSpots
---@field SPOT_H number Hauteur de la boîte d'une place, en mètres (3).
editor_toolUtilities_siteSpots = {}

--- Les places calculées par le solveur d'un site, locales à l'origine de cuisson. Chaque place entre sous la forme { x, y, yaw, w, d, n, dir } et sort arrondie au millimètre, n et dir omis pour une place simple droite. Renvoie nil si la liste est vide.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:38
---@param list table|nil Liste de places { x, y, yaw, w, d, n, dir }.
---@param ox number|nil x de l'origine (défaut 0).
---@param oy number|nil y de l'origine (défaut 0).
---@return table|nil  Liste de places locales.
function editor_toolUtilities_siteSpots.localise(list, ox, oy) end

--- L'inverse : les places du manifeste comme enregistrements parkingSpot (pos, rot, scl = {largeur, profondeur, SPOT_H}, isMultiSpot, spotAmount, spotOffset, spotDirection, spotRotation, color, customFields), posées là où se trouve un placement et tournées sur son cap. (ox, oy) est le pivot du site (milieu de son empreinte). groundZ(x, y) donne la hauteur du sol, car une place repose sur le sol où elle est et non sur le repère du placement. Aucun nom ici : ils doivent être uniques dans tout le fichier du niveau et sont attribués par write.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:62
---@param rec table|nil Places du manifeste.
---@param px number x du placement.
---@param py number y du placement.
---@param yaw number|nil Cap en radians (défaut 0).
---@param ox number|nil x du pivot (défaut 0).
---@param oy number|nil y du pivot (défaut 0).
---@param groundZ function|nil groundZ(x, y) renvoie la hauteur du sol (0 si absent).
---@return table|nil  Liste d'enregistrements parkingSpot, nil si vide.
function editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ) end

--- Annule un write : remet le tableau parkingSpots exactement comme il était.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:145
---@param undo table|nil Table renvoyée par write.
function editor_toolUtilities_siteSpots.restore(undo) end

--- Ajoute des places au fichier de sites du niveau, sous des noms commençant par prefix, en conservant l'existant. Écrit le fichier avec jsonWriteFile.
---Source : lua/ge/extensions/editor/toolUtilities/siteSpots.lua:108
---@param spots table|nil Enregistrements parkingSpot renvoyés par place ; leur name et oldId sont renseignés par cet appel.
---@param prefix string Préfixe des noms de places.
---@return table|nil  { path, prev } : ce qu'il faut pour annuler (le tableau tel qu'il était), ou nil s'il n'y avait rien à ajouter.
function editor_toolUtilities_siteSpots.write(spots, prefix) end

