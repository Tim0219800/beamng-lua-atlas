---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/brushes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des brosses (brushes) de l'outil Dynamic Decals : un preset enregistre l'état courant des propriétés de decal (textures color/alpha/metallic/normal/roughness, couleur, dégradé, rotation, échelle, skew, UV, masque alpha, SDF, miroir, intensités, wrap…). Les brosses sont stockées dans /art/dynamicDecals/brushes/brushes.json, listées dans l'onglet « Brushes » du navigateur (ordre 30) et inspectables (Use / Delete / Save). Un moddeur s'en sert pour sauvegarder ou recharger un réglage de decal.
--- Accès : extension `editor_dynamicDecals_brushes` : `extensions.load("editor_dynamicDecals_brushes")`, puis la globale `editor_dynamicDecals_brushes`
---@class editor_dynamicDecals_brushes
editor_dynamicDecals_brushes = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/brushes.lua:609
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_brushes.editorPreferenceValueChanged(path, value) end

--- Renvoie la liste des brosses chargées en mémoire.
---Source : lua/ge/extensions/editor/dynamicDecals/brushes.lua:599
---@return table[]  Liste des brosses (la table interne, pas une copie).
function editor_dynamicDecals_brushes.getBrushes() end

--- Dessine l'inspecteur d'une brosse sélectionnée : boutons Use (loadBrush), Delete et Save (visible seulement si brush.dirty), puis l'aperçu et les propriétés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/brushes.lua:306
---@param brush table Brosse sélectionnée (editor.selection["dynamicDecalBrush"]).
function editor_dynamicDecals_brushes.inspectorGui(brush) end

--- Applique à l'API (api.set*) toutes les propriétés d'une brosse : masque alpha, blend mode, couleur, textures, rotation, échelle, skew, dégradé, UV, SDF, etc.
---Source : lua/ge/extensions/editor/dynamicDecals/brushes.lua:135
---@param brush table Brosse (entrée de brushes.json, voir saveBrush pour les champs).
function editor_dynamicDecals_brushes.loadBrush(brush) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/brushes.lua:603
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_brushes.registerEditorPreferences(prefsRegistry) end

--- Crée une brosse à partir de l'état courant de l'API (api.get*), l'ajoute à la liste et écrit brushes.json.
---Source : lua/ge/extensions/editor/dynamicDecals/brushes.lua:55
---@param name string|nil Nom de la brosse ; par défaut le nom de la texture couleur.
function editor_dynamicDecals_brushes.saveBrush(name) end

--- Appelé par l'outil : récupère API, browser, selection et layerTypes_decal, charge brushes.json si présent, enregistre l'onglet « Brushes » du navigateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/brushes.lua:613
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_brushes.setup(tool_in) end

