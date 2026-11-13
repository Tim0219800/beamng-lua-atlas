---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/decals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des decals de Road Architect. Pour une route donnée, crée un « jeu de decals » : DecalRoad invisibles (matériau road_invisible) par section de voies de type road_lane servant au graphe de navigation, plus les couches visuelles (route, ligne centrale, bords, séparations de voies, lignes de jonction début/fin) posées comme DecalRoad ou instances de decals via l'éditeur. Il garde en mémoire les sections d'asphalte, les decals et les templates par nom de route, et sait tout retirer de la scène.
--- Accès : extension `editor_roadArchitect_decals` : `extensions.load("editor_roadArchitect_decals")`, puis la globale `editor_roadArchitect_decals`
---@class editor_roadArchitect_decals
editor_roadArchitect_decals = {}

--- Crée le jeu de decals d'une route : calcule les sections de voies road_lane, crée pour chacune un DecalRoad (si road.isDrivable) avec voies gauche/droite, sens unique et drivabilité 1, puis les couches visuelles activées par l'utilisateur. Les objets créés sont ajoutés au dossier donné.
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:91
---@param road table Route Road Architect (nom, profil, renderData, isDrivable, isOverObject…).
---@param folder any Objet dossier (SimGroup) de la scène recevant les DecalRoad créés (déduit du code : appelle folder:addObject).
function editor_roadArchitect_decals.createDecal(road, folder) end

--- Supprime tous les templates de decals (les instances doivent déjà avoir été supprimées) et vide les tables templates.
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:477
function editor_roadArchitect_decals.removeTemplates() end

--- Tente de retirer de la scène le jeu de decals portant ce nom : supprime les DecalRoad principaux, les couches DecalRoad et les instances de decals, puis vide les tables associées. Sans effet si le nom est inconnu.
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:447
---@param name string Nom de la route dont on retire les decals.
function editor_roadArchitect_decals.tryRemove(name) end

--- Retire de la scène tous les jeux de decals connus (asphalte puis decals), vide les tables, puis supprime les templates.
---Source : lua/ge/extensions/editor/roadArchitect/decals.lua:488
function editor_roadArchitect_decals.tryRemoveAll() end

