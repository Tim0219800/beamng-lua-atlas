---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/colorHistory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Color History » de l'outil Dynamic Decals. Garde en préférence editor (`dynamicDecalsTool.colorHistory.history`) la liste des dernières couleurs utilisées (RGBA) et permet de les réappliquer comme couleur de decal ou de fill layer, ou de les supprimer. La taille maximale est la préférence `maxHistoryCount` (défaut 10, de 2 à 128).
--- Accès : extension `editor_dynamicDecals_colorHistory` : `extensions.load("editor_dynamicDecals_colorHistory")`, puis la globale `editor_dynamicDecals_colorHistory`
---@class editor_dynamicDecals_colorHistory
editor_dynamicDecals_colorHistory = {}

--- Ajoute la couleur en tête de l'historique (retire d'abord une entrée identique), tronque à maxHistoryCount et enregistre la préférence.
---Source : lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:15
---@param color Point4F Couleur avec champs x, y, z, w (RGBA).
function editor_dynamicDecals_colorHistory.addColorToHistory(color) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:61
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_colorHistory.editorPreferenceValueChanged(path, value) end

--- Dessine la liste : pour chaque couleur un widget, les boutons « Set as decal color » (api.setDecalColor), « Set as fill layer color » (api.setFillLayerColor) et une icône de suppression. Utilisé comme contenu de la section et de l'éditeur de la préférence `history`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:29
---@param guiId string Suffixe pour rendre les identifiants ImGui uniques.
function editor_dynamicDecals_colorHistory.onGui(guiId) end

--- Enregistre la sous-catégorie `dynamicDecalsTool.colorHistory` : `history` (table, éditée par onGui) et `maxHistoryCount` (int, défaut 10, min 2, max 128).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:52
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_colorHistory.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère l'API et docs, enregistre la section « Color History » (ordre 122) et sa page de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorHistory.lua:76
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_colorHistory.setup(tool_in) end

