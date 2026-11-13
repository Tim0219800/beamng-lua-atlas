---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Point d'entrée de l'outil « Easy Select » de l'éditeur. Enregistre un mode d'édition (editor.editModes.ezObjectSelect, nom « Easy Select », action map « EZObjectSelect ») et une fenêtre d'outil, puis délègue le travail à editor/ezObjectSelect/controller. Les actions couper/copier/coller/dupliquer/tout sélectionner/désélectionner/supprimer sont relayées vers le mode standard editor.editModes.objectSelect. Les raccourcis molette sont documentés : Ctrl+molette cycle les objets superposés, Shift+molette tourne la sélection autour de Z monde (Ctrl+Shift : par pas de 1 degré).
--- Accès : extension `editor_ezObjectSelect` : `extensions.load("editor_ezObjectSelect")`, puis la globale `editor_ezObjectSelect`
---@class editor_ezObjectSelect
editor_ezObjectSelect = {}

--- Hook (orthographe du jeu « Aligment ») : relaie le changement d'alignement du gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:164
function editor_ezObjectSelect.onEditorAxisGizmoAligmentChanged() end

--- Hook : relaie le changement de mode du gizmo d'axes au contrôleur si le mode est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:160
---@param mode any Nouveau mode du gizmo
function editor_ezObjectSelect.onEditorAxisGizmoModeChanged(mode) end

--- Si le mode est actif, dessine le debug écran et la fenêtre de l'espace de travail (controller.drawWorkspace).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:86
function editor_ezObjectSelect.onEditorGui() end

--- Charge les préférences, réinitialise les filtres d'entrée, enregistre la fenêtre (390x460 x uiscale) et le mode d'édition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:77
function editor_ezObjectSelect.onEditorInitialized() end

--- Hook : invalide le cache (inspectorDynFieldChanged).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:148
function editor_ezObjectSelect.onEditorInspectorDynFieldChanged() end

--- Hook : invalide le cache (inspectorFieldChanged).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:144
function editor_ezObjectSelect.onEditorInspectorFieldChanged() end

--- Hook : invalide le cache de sélection (raison objectAdded).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:136
function editor_ezObjectSelect.onEditorObjectAdded() end

--- Hook : invalide le cache (prefabExploded).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:140
function editor_ezObjectSelect.onEditorPrefabExploded() end

--- Hook : pour gizmos.general.highlightSelectedMeshes rafraîchit la teinte de sélection si le mode est actif ; sinon relaie au contrôleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:152
---@param path string Chemin de préférence
---@param value any Nouvelle valeur
function editor_ezObjectSelect.onEditorPreferenceValueChanged(path, value) end

--- Hook : laisse le contrôleur enregistrer ses préférences.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:168
---@param prefsRegistry table Registre de préférences
function editor_ezObjectSelect.onEditorRegisterPreferences(prefsRegistry) end

--- Charge les préférences et réinitialise les filtres d'entrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:111
function editor_ezObjectSelect.onExtensionLoaded() end

--- Quitte le mode (retour à objectSelect) ou désactive le contrôleur, puis désenregistre la fenêtre et le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:95
function editor_ezObjectSelect.onExtensionUnloaded() end

--- Demande de centrer la caméra sur la sélection (focus).
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:128
function editor_ezObjectSelect.requestFocusShortcut() end

--- Transmet une touche du pavé numérique au contrôleur (préréglage de vue).
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:132
---@param preset any Préréglage (déduit du code : valeur transmise telle quelle)
function editor_ezObjectSelect.requestNumpadPreset(preset) end

--- Demande l'opération de rotation par raccourci.
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:120
function editor_ezObjectSelect.requestRotateShortcut() end

--- Demande l'opération d'échelle par raccourci.
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:124
function editor_ezObjectSelect.requestScaleShortcut() end

--- Demande l'opération de transformation (déplacement) par raccourci clavier.
---Source : lua/ge/extensions/editor/ezObjectSelect.lua:116
function editor_ezObjectSelect.requestTransformShortcut() end

