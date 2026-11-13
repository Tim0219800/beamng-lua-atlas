---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteDecals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Décalques estampillés tels qu'un site les porte : flèches de circulation, texte EXIT peint, rustines de réparation d'asphalte. Ce sont des glyphes pris dans une planche (atlas) et posés en un point, orientés dans une direction, et non de la peinture tracée le long d'une ligne (c'est ce qui les distingue de siteMarks). Le module crée les DecalData (modèles), pose les instances via l'éditeur, les convertit vers/depuis le format du manifeste et les rend persistantes.
--- Accès : extension `editor_toolUtilities_siteDecals` : `extensions.load("editor_toolUtilities_siteDecals")`, puis la globale `editor_toolUtilities_siteDecals`
---@class editor_toolUtilities_siteDecals
editor_toolUtilities_siteDecals = {}

--- Estampille tout un plan d'un coup, en créant les modèles requis. tag distingue ces modèles de ceux des autres sites. Renvoie les instances et les identifiants de modèles, deux choses à nettoyer différemment : une instance part avec le site, un modèle est partagé par tous les décalques du site.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:90
---@param plan table|nil Liste d'enregistrements de décalques.
---@param tag string Étiquette du site.
---@param terrainZ function terrainZ(x, y) renvoie la hauteur du terrain.
---@return table  Instances de décalques.
---@return integer[]  Identifiants des modèles DecalData créés.
function editor_toolUtilities_siteDecals.build(plan, tag, terrainZ) end

--- Donne les modèles au niveau, ce qui fait survivre à la sauvegarde les décalques posés d'après eux : le gestionnaire de persistance garde les instances contre leur modèle, donc marquer les quelques modèles « sales » écrit tous les décalques. Sans effet si decalPersistMan n'existe pas.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:119
---@param tplIds integer[]|nil Identifiants de modèles renvoyés par build.
function editor_toolUtilities_siteDecals.commit(tplIds) end

--- Pose un décalque depuis son enregistrement : position (x, y) à la hauteur du terrain plus lift, normale vers le haut, tangente dirigée selon l'angle a.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:36
---@param tpl userdata Modèle DecalData.
---@param rec table { x, y, a, size, frame, lift }.
---@param terrainZ function terrainZ(x, y) renvoie la hauteur du terrain.
---@return any  Instance de décalque renvoyée par editor.addDecalInstanceWithTan.
function editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ) end

--- Angle de cap d'un décalque (atan2(ty, tx)) à partir du vecteur direction qu'un constructeur a déjà.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:130
---@param tx number Composante x de la direction.
---@param ty number Composante y de la direction.
---@return number  Angle en radians.
function editor_toolUtilities_siteDecals.facing(tx, ty) end

--- Convertit un plan de décalques au format du manifeste, local à l'origine de cuisson (ox, oy). Groupés par modèle (même mat, rows, cols, prio). Renvoie nil si le plan est vide.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:49
---@param plan table|nil Liste d'enregistrements de décalques.
---@param ox number x de l'origine de cuisson.
---@param oy number y de l'origine de cuisson.
---@return table|nil  { tpls = { {mat, rows, cols, prio, size}, ... }, items = { {t, x, y, a, size, frame, lift}, ... } }.
function editor_toolUtilities_siteDecals.localise(plan, ox, oy) end

--- L'inverse de localise : les décalques du manifeste comme plan, posés là où se trouve un placement et tournés sur son cap. (ox, oy) est le point du repère du site autour duquel le placement tourne.
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:69
---@param rec table|nil Enregistrement du manifeste { tpls, items }.
---@param px number x du placement.
---@param py number y du placement.
---@param yaw number|nil Cap en radians (défaut 0).
---@param ox number|nil x du pivot dans le repère du site (défaut 0).
---@param oy number|nil y du pivot (défaut 0).
---@return table|nil  Plan de décalques en coordonnées monde, ou nil s'il est vide.
function editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy) end

--- Retire des décalques posés (editor.deleteDecalInstance).
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:110
---@param objs table|nil Instances renvoyées par build.
function editor_toolUtilities_siteDecals.remove(objs) end

--- Récupère ou crée le DecalData d'un groupe de décalques, nommé d'après le site qui le dresse. Champs posés : material, frame, texRows, texCols, size, renderPriority (défaut 5).
---Source : lua/ge/extensions/editor/toolUtilities/siteDecals.lua:20
---@param name string Nom d'objet du modèle.
---@param spec table { mat, frame, rows, cols, size, prio }.
---@return userdata|nil  Objet DecalData, ou nil si la création échoue.
function editor_toolUtilities_siteDecals.template(name, spec) end

