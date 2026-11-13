---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteMarks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marquages routiers tels qu'un site les porte : lignes de places, hachures, barres de cédez-le-passage, lignes d'axe d'allée, traces d'usure de pneus, fissures et zébras. Chacun est un DecalRoad, c'est-à-dire de la peinture posée SUR le sol et non de la géométrie : rien n'entre dans une coque, donc un parking cuit porte ce qu'il faut peindre et le repeint là où on le pose (même arrangement que pour l'eau). Le module crée les DecalRoad, convertit le plan vers/depuis le format du manifeste et les remet au niveau.
--- Accès : extension `editor_toolUtilities_siteMarks` : `extensions.load("editor_toolUtilities_siteMarks")`, puis la globale `editor_toolUtilities_siteMarks`
---@class editor_toolUtilities_siteMarks
editor_toolUtilities_siteMarks = {}

--- Peint tout un plan d'un coup. Renvoie les objets créés, pour que le demandeur puisse les remettre au niveau ou les retirer. Liste vide si plan ou folder manque.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:54
---@param plan table|nil Liste d'enregistrements de marques.
---@param folder userdata|nil Groupe de scène parent.
---@param terrainZ function terrainZ(x, y) renvoie la hauteur du terrain.
---@return table  Liste des DecalRoad créés.
function editor_toolUtilities_siteMarks.build(plan, folder, terrainZ) end

--- Remet les marques au niveau. Peintes par l'outil, elles n'appartenaient à rien et n'étaient pas écrites ; à partir de là elles sont celles du niveau et l'outil ne doit plus les supprimer.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:66
---@param objs table|nil DecalRoad renvoyés par build.
function editor_toolUtilities_siteMarks.commit(objs) end

--- Crée un DecalRoad depuis son enregistrement et l'ajoute à folder. Chaque nœud est à la hauteur du terrain (ou de rec.z pour une marque sur dalle) plus lift ; si closed, le premier point est rajouté à la fin. Renvoie nil s'il y a moins de 2 points ou si la création échoue.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:20
---@param folder userdata Groupe de scène parent.
---@param rec table Enregistrement de marque.
---@param terrainZ function terrainZ(x, y) renvoie la hauteur du terrain.
---@return userdata|nil  Objet DecalRoad.
function editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ) end

--- Le plan tel qu'un manifeste le porte, local à l'origine de cuisson. Renvoie { styles, runs } ou nil si rien. Chaque run : { s = indice de style, pts = plat, closed, fade, w (largeurs par nœud) }.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:82
---@param plan table|nil Liste d'enregistrements de marques.
---@param ox number x de l'origine.
---@param oy number y de l'origine.
---@param oz number|nil z de l'origine (pour les marques sur dalle).
---@return table|nil  { styles = {...}, runs = {...} }.
function editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz) end

--- L'inverse : les marques du manifeste comme plan, posées là où se trouve un placement et tournées sur son cap. (ox, oy) est le point du repère du site autour duquel le placement tourne (le milieu de son empreinte, pas l'origine de cuisson dans un coin). pz est la hauteur du placement, utile seulement aux marques posées sur l'une de ses propres dalles.
---Source : lua/ge/extensions/editor/toolUtilities/siteMarks.lua:129
---@param rec table|nil Enregistrement du manifeste { styles, runs }.
---@param px number x du placement.
---@param py number y du placement.
---@param yaw number|nil Cap en radians (défaut 0).
---@param ox number|nil x du pivot (défaut 0).
---@param oy number|nil y du pivot (défaut 0).
---@param pz number|nil Hauteur du placement (défaut 0).
---@return table|nil  Plan de marques en coordonnées monde, nil s'il est vide.
function editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz) end

