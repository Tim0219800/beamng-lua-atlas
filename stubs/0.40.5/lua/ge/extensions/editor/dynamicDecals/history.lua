---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « History » de l'outil Dynamic Decals. Affiche les piles d'annulation (Undo) et de rétablissement (Redo) de l'objet d'historique de l'API (api.getHistory()), permet d'annuler/rétablir jusqu'à une entrée choisie, de vider l'historique, et montre le contenu d'une action en info-bulle (dump tronqué à 20 lignes de 100 caractères).
--- Accès : extension `editor_dynamicDecals_history` : `extensions.load("editor_dynamicDecals_history")`, puis la globale `editor_dynamicDecals_history`
---@class editor_dynamicDecals_history
editor_dynamicDecals_history = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/history.lua:89
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_history.editorPreferenceValueChanged(path, value) end

--- Enregistre la préférence float `dynamicDecalsTool.history.sectionHeight` (défaut 256, de 64 à 1024).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/history.lua:83
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_history.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère l'API et enregistre la section « History » (ordre 1045).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/history.lua:93
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_history.setup(tool_in) end

