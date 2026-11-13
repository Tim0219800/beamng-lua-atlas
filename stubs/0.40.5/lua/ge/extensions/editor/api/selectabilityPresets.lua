---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/selectabilityPresets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère des préréglages (presets) de « sélectionnabilité » des types d'objets dans l'éditeur du monde : quelles classes d'objets (TSStatic, Prefab, BeamNGVehicle…) peuvent être cliquées/sélectionnées. Préréglages : current, all, staticsAndProps (BeamNGVehicle, Prefab, PrefabInstance, TSStatic), default (masque capturé à la première initialisation). Il lit/écrit via editor.getObjectTypeSelectable / setObjectTypeSelectable et la préférence gizmos.visualization.selectable. Un outil peut prendre temporairement le contrôle du masque avec beginScope/endScope.
--- Accès : extension `editor_api_selectabilityPresets` : `extensions.load("editor_api_selectabilityPresets")`, puis la globale `editor_api_selectabilityPresets`
---@class editor_api_selectabilityPresets
editor_api_selectabilityPresets = {}

--- Applique un préréglage (all, staticsAndProps ou default) au masque de sélectionnabilité. Si persist est vrai et qu'aucun scope n'est actif, enregistre aussi le masque dans les préférences.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:72
---@param presetId string 'all', 'staticsAndProps' ou 'default' ('current' est refusé).
---@param persist boolean|nil Sauvegarder dans la préférence gizmos.visualization.selectable (et sur disque si saveVisualizationSettings est actif).
---@param owner table|nil Propriétaire du scope : doit correspondre au propriétaire courant si un scope est actif.
---@return boolean  true si appliqué, false si preset inconnu/'current' ou scope détenu par un autre.
function editor_api_selectabilityPresets.applyPreset(presetId, persist, owner) end

--- Prend temporairement le contrôle du masque : sauvegarde le masque et les préférences actuels puis applique le preset, sans le persister. Si le scope existe déjà, renvoie si l'owner est le même.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:83
---@param owner table Table identifiant l'appelant (comparée par identité).
---@param presetId string 'all', 'staticsAndProps' ou 'default'.
---@param ownerLabel string|nil Nom affiché dans drawControls (« X is temporarily controlling this mask »).
---@return boolean  true si le scope est actif pour cet owner.
function editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel) end

--- Dessine en ImGui la ligne de boutons « Presets » : All, Statics and Props, Restore Default (avec persistance). Désactivés pendant un scope, avec un texte indiquant qui contrôle le masque. À appeler depuis une fenêtre d'éditeur.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:163
function editor_api_selectabilityPresets.drawControls() end

--- Termine le scope : restaure le masque, les préférences et le preset actif sauvegardés, puis sauvegarde les préférences si saveVisualizationSettings est actif.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:102
---@param owner table Doit être le propriétaire du scope.
---@return boolean  true si restauré, false s'il n'y a pas de scope ou autre owner.
function editor_api_selectabilityPresets.endScope(owner) end

--- Renvoie l'id du preset actif.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:155
---@return string  'current', 'all', 'staticsAndProps' ou 'default'.
function editor_api_selectabilityPresets.getActivePresetId() end

--- Renvoie le libellé affichable du preset actif.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:159
---@return string  Ex. 'Statics and Props'.
function editor_api_selectabilityPresets.getActivePresetLabel() end

--- Renvoie le propriétaire du scope actif, ou nil.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:120
---@return table|nil  owner du scope.
function editor_api_selectabilityPresets.getScopeOwner() end

--- Capture le masque de sélectionnabilité actuel comme masque « default » s'il n'est pas déjà capturé. Appelé automatiquement par les autres fonctions.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:68
function editor_api_selectabilityPresets.initialize() end

--- Indique si un scope temporaire est actif.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:124
---@return boolean  true si scope actif.
function editor_api_selectabilityPresets.isScoped() end

--- Marque le preset actif comme 'current' (masque modifié à la main). Sans effet pendant un scope.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:128
---@return boolean  false si un scope est actif, sinon true.
function editor_api_selectabilityPresets.markCurrent() end

--- Compare le masque réel aux presets all, staticsAndProps, default et met activePresetId sur le premier qui correspond, sinon 'current'.
---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:134
---@return boolean  false si un scope est actif, sinon true.
function editor_api_selectabilityPresets.syncActivePresetFromMask() end

