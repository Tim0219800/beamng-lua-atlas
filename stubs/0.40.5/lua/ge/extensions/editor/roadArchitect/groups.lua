---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/groups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des groupes de Road Architect (éditeur GE). Deux notions coexistent : les groupes prefab (modèles de routes réutilisables, comme carrefours ou ronds-points, chargés depuis des fichiers JSON ou créés par l'utilisateur) et les groupes placés (ensembles de nœuds de routes déjà présents dans la session). Le module sait auditionner un prefab (caméra en rotation à 1000 m d'altitude), le placer dans la session, créer un groupe à partir d'un polygone, sérialiser, sauvegarder, charger et déplacer la caméra sur un groupe.
--- Accès : extension `editor_roadArchitect_groups` : `extensions.load("editor_roadArchitect_groups")`, puis la globale `editor_roadArchitect_groups`
---@class editor_roadArchitect_groups
---@field groups table Tableau des modèles de groupes prefab disponibles, chaque élément ayant la forme { name = string, roads = table[] }. C'est la même table que celle remplie par getDefaultGroups, createPrefabGroup et load.
editor_roadArchitect_groups = {}

--- Copie les routes du groupe prefab gIdx dans roadMgr.roads pour l'audition : routes centrées sur l'origine, élevées à la pose d'audition (+1000 m) et cachées. Recalcule la carte des routes, et recadre la caméra si on est déjà en vue de groupe.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:117
---@param gIdx integer Indice du groupe dans groups.
function editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx) end

--- Place le groupe prefab gIdx dans la session : copie ses routes avec des noms UUID uniques (Engine.generateUUID), visibles, enregistre un groupe placé (nom 32 caractères, liste des nœuds) puis supprime les routes cachées.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:158
---@param gIdx integer Indice du groupe dans groups.
---@param isConformGroupToTerrain boolean Si vrai, les routes copiées sont plaquées au terrain.
---@return string[]  Noms (UUID) des routes ajoutées.
function editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain) end

--- Copie profonde d'un groupe placé, avec le nom converti du tampon imgui en string.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:240
---@param pg table Groupe placé { name = tampon imgui, list = {{r = nom de route, n = indice de nœud}} }.
---@return table  { name = string, list = table }.
function editor_roadArchitect_groups.copyPlacedGroup(pg) end

--- Crée un groupe placé à partir des nœuds de routes situés dans un polygone 2D (le polygone est aplati à z = 0 en place). Les routes de jonction et les ponts sont ignorés. Ne crée rien si aucun nœud n'est dans le polygone ; le groupe est nommé « New Group ».
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:207
---@param gPolygon vec3[] Sommets du polygone ; modifiés en place (z = 0).
---@param roads table[] Routes à tester.
function editor_roadArchitect_groups.createGroup(gPolygon, roads) end

--- Transforme un groupe placé en groupe prefab : copie chaque route concernée (une fois) avec un nouveau nom UUID et ajoute à groups un élément nommé « User N ».
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:247
---@param g table Groupe placé (champ list de {r, n}).
function editor_roadArchitect_groups.createPrefabGroup(g) end

--- Reconstruit un groupe prefab à partir d'un groupe sérialisé via roadMgr.deserialiseRoad.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:315
---@param gSer table Groupe sérialisé { name, roads }.
---@return table  Groupe { name, roads }.
function editor_roadArchitect_groups.deserialiseGroup(gSer) end

--- Charge les 12 groupes prefab par défaut depuis les fichiers JSON roadArchitect/groups/. Ne fait rien si groups n'est pas vide.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:351
function editor_roadArchitect_groups.getDefaultGroups() end

--- Renvoie la collection des groupes placés de la session.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:380
---@return table[]  Groupes placés.
function editor_roadArchitect_groups.getPlacedGroups() end

--- Place la caméra en vue d'audition du groupe si on n'y est pas déjà : mémorise la pose de caméra actuelle, remet le chrono à zéro et appelle la mise à jour de pose. Renvoie le temps ajusté.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:105
---@param gIdx integer Indice du groupe à auditionner.
---@param timer table Chronomètre ; appelle timer:stopAndReset() à l'entrée en vue de groupe.
---@param time number Temps courant ; remplacé par 0 lors du premier appel.
---@return number  0.0 si la vue vient d'être activée, sinon time inchangé.
function editor_roadArchitect_groups.goToGroupView(gIdx, timer, time) end

--- Rend la caméra à la pose mémorisée avant la vue de groupe et quitte l'état de vue de groupe.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:297
function editor_roadArchitect_groups.goToOldView() end

--- Met la caméra libre à la verticale du groupe placé, regardant vers le bas, à une hauteur calculée d'après le champ de vision pour tout cadrer. Ne fait rien si l'emprise est inférieure à 0,1 m en x et y.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:405
---@param idx integer Indice du groupe placé.
function editor_roadArchitect_groups.goToPlacedGroup(idx) end

--- Ouvre une boîte de dialogue d'ouverture JSON, lit le groupe (data.group), le désérialise et l'ajoute à groups via importGroup.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:338
function editor_roadArchitect_groups.load() end

--- Fait tourner la caméra d'audition d'un pas de pi/500 autour du centre d'audition (appelé à chaque frame par l'interface).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:198
function editor_roadArchitect_groups.manageRotateCam() end

--- Retire un groupe placé et supprime ses routes, sauf celles qui appartiennent encore à un autre groupe. Appelle ensuite updateGroupsAfterRoadRemove.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:389
---@param groupIdx integer Indice du groupe placé.
function editor_roadArchitect_groups.removePlacedGroupHard(groupIdx) end

--- Retire un groupe placé de la collection sans toucher aux routes qu'il contient.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:386
---@param groupIdx integer Indice du groupe placé.
function editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx) end

--- Ouvre une boîte de dialogue d'enregistrement JSON et écrit groups[idx] (sérialisé) dans le fichier choisi, sous la forme { data = { group = ... } }.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:325
---@param idx integer Indice du groupe à sauvegarder.
function editor_roadArchitect_groups.save(idx) end

--- Sérialise un groupe prefab en table { name, roads } via roadMgr.serialiseRoad.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:305
---@param g table Groupe prefab { name, roads }.
---@return table  Groupe sérialisé, utilisable par jsonWriteFile.
function editor_roadArchitect_groups.serialiseGroup(g) end

--- Remplace la collection des groupes placés.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:383
---@param pg table[] Nouvelle collection.
function editor_roadArchitect_groups.setPlacedGroups(pg) end

--- Parcourt les groupes placés et supprime ceux dont au moins une route n'existe plus dans roadMgr.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:364
function editor_roadArchitect_groups.updateGroupsAfterRoadRemove() end

