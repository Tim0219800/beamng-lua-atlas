---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires des modèles de routes (road templates) de l'éditeur. Lit les fichiers levels/<niveau>/roadtemplates/*.road.json, mémorise matériaux et noms de matériaux des modèles, puis applique le modèle de chaque DecalRoad qui en référence un : crée des routes enfants, des décorations et des decals le long de la route. Tout est inactif tant que la préférence roadTemplates.general.loadTemplates est à false.
--- Accès : extension `editor_roadUtils` : `extensions.load("editor_roadUtils")`, puis la globale `editor_roadUtils`
---@class editor_roadUtils
---@field onEditorInitialized nil Toujours nil : affectation explicite sans effet.
editor_roadUtils = {}

--- Renvoie les noms de matériaux des modèles, dans le même ordre que getMaterials.
---Source : lua/ge/extensions/editor/roadUtils.lua:287
---@return string[]  Noms de matériaux.
function editor_roadUtils.getMaterialNames() end

--- Renvoie la liste des textures (objets editor.texObj) des matériaux des modèles chargés par reloadTemplates.
---Source : lua/ge/extensions/editor/roadUtils.lua:283
---@return table  Tableau indexé de textures ImGui.
function editor_roadUtils.getMaterials() end

--- Renvoie les chemins des fichiers *.road.json trouvés par le dernier reloadTemplates.
---Source : lua/ge/extensions/editor/roadUtils.lua:291
---@return string[]  Chemins de fichiers.
function editor_roadUtils.getRoadTemplateFiles() end

--- Supprime les decals précédents de la route (champ decalIDs) puis recrée ceux définis par le modèle et stocke leurs ids dans le champ dynamique decalIDs.
---Source : lua/ge/extensions/editor/roadUtils.lua:97
---@param road userdata Objet DecalRoad.
---@param template table|nil Données du modèle déjà lues ; si nil, relues depuis le champ template de la route.
function editor_roadUtils.reloadDecals(road, template) end

--- Supprime les anciennes décorations de la route (champ decorationIDs) puis recrée celles du modèle. Ignore les routes enfants, les routes sans modèle ou avec useTemplate différent de "true".
---Source : lua/ge/extensions/editor/roadUtils.lua:43
---@param road userdata Objet DecalRoad.
function editor_roadUtils.reloadDecorations(road) end

--- Relit les fichiers .road.json du niveau courant, reconstruit les listes de matériaux (texture colorMap, ou warnMat.dds si le matériau est introuvable) puis ré-applique à chaque DecalRoad utilisant un modèle : routes enfants, décorations et decals. Recharge enfin les collisions (be:reloadCollision). Sort tout de suite si la préférence est off ou s'il n'y a pas de niveau.
---Source : lua/ge/extensions/editor/roadUtils.lua:234
function editor_roadUtils.reloadTemplates() end

--- Supprime les routes enfants d'une route puis recrée, d'après son modèle, une route enfant par entrée supplémentaire de template.roads (largeur relative ou absolue, décalage latéral horizPosRelative). La première entrée du modèle est collée sur la route elle-même.
---Source : lua/ge/extensions/editor/roadUtils.lua:172
---@param road userdata Objet DecalRoad portant les champs dynamiques template/useTemplate.
function editor_roadUtils.updateChildRoads(road) end

