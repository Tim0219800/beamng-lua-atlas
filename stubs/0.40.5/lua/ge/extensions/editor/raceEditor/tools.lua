---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Tools (windowDescription = 'Tools'). Instanciée avec init(raceEditor).
---@class editor_raceEditor_tools
local editor_raceEditor_tools = {}

--- Modifie le même champ de plusieurs pathnodes en une seule action d'historique (valeurs anciennes mémorisées pour l'annulation).
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:113
---@param field string Champ du pathnode (pos, normal, radius…).
---@param newDataMap table<integer, any> Associe l'ID du pathnode à la nouvelle valeur.
function editor_raceEditor_tools:changeFieldMulti(field, newDataMap) end

--- Crée un SimGroup « <nom du chemin>_decoration » (suffixe numérique si le nom existe déjà) dans MissionGroup et y place un objet par transformée : TSStatic pour un .dae, prefab (spawnPrefab) pour un .prefab / .prefab.json, selon le côté (l/r). Mémorise le groupe comme dernier groupe créé.
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:42
---@param transforms table Liste de transformées {side='l'|'r', pos, rot, scl} issues de pathnode:getSideTransforms.
function editor_raceEditor_tools:createDecoration(transforms) end

--- Affiche une ligne « nom » avec icône coche ou croix selon classification[field].
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:298
---@param classification table Résultat de path:classify().
---@param name string Libellé.
---@param field string Clé testée.
---@param tt string|nil Infobulle.
function editor_raceEditor_tools:displayClassification(classification, name, field, tt) end

--- Appelé à chaque frame : dessine l'interface des outils.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:38
function editor_raceEditor_tools:draw() end

--- Dessine tout le contenu : décorations latérales, outils sur les pathnodes et outils de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:129
function editor_raceEditor_tools:drawGeneralInfo() end

--- Affiche une icône coche si le fichier existe (FS:fileExists), sinon une icône d'erreur, avec infobulle du chemin.
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:92
---@param f string Chemin de fichier.
function editor_raceEditor_tools:existsIcon(f) end

--- Renvoie les paramètres de décoration latérale saisis dans la fenêtre, à passer à pathnode:getSideTransforms.
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:123
---@return vec3  Décalage de position.
---@return vec3  Décalage de rotation en radians (degrés saisis × π/180).
---@return vec3  Échelle.
---@return string  Mode d'alignement : terrain, pathnode ou absolute.
function editor_raceEditor_tools:getSideTransformParameters() end

--- Mémorise raceEditor et initialise les décalages de position, rotation et échelle des décorations.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:19
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_tools:init(raceEditor) end

--- Appelé quand l'onglet devient actif ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:35
function editor_raceEditor_tools:selected() end

--- Liste déroulante de sélection d'un objet du chemin pour un champ (voir notes : non fonctionnelle et inutilisée ici).
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:311
---@param name string Libellé.
---@param objects table Collection (objects, sorted) de nœuds ou positions.
---@param fieldName string Champ du chemin.
---@param clrI ColorI|nil Couleur de fond du texte.
---@param tt string|nil Infobulle.
function editor_raceEditor_tools:selector(name, objects, fieldName, clrI, tt) end

--- Définit le chemin de course édité.
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:32
---@param path table Objet gameplay/race/path.
function editor_raceEditor_tools:setPath(path) end

--- Appelé quand l'onglet est quitté ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/tools.lua:36
function editor_raceEditor_tools:unselect() end

