---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/extensionsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Extensions Editor » de l'éditeur : liste toutes les extensions d'éditeur (editor.allExtensionNames) et permet d'activer/désactiver leur chargement en cliquant sur l'icône. L'état est stocké dans editor.extensionsSettings[nom].disabled puis sauvegardé par editor.saveExtensionsSettings(). Un rechargement du Lua (Ctrl+L) est nécessaire pour appliquer le changement ; le mode sans échec de l'éditeur (Ctrl+F11) permet de désactiver une extension fautive.
--- Accès : extension `editor_extensionsEditor` : `extensions.load("editor_extensionsEditor")`, puis la globale `editor_extensionsEditor`
---@class editor_extensionsEditor
editor_extensionsEditor = {}

--- Dessine la fenêtre : texte d'aide et tableau à une colonne avec un bouton-icône par extension (coche = active, icône rouge « do_not_disturb » = désactivée). Un clic inverse le drapeau disabled et sauvegarde les réglages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/extensionsEditor.lua:15
function editor_extensionsEditor.onEditorGui() end

--- Enregistre la fenêtre « extensionsEditor » (taille 915x600) et l'entrée de menu « Extensions Editor ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/extensionsEditor.lua:59
function editor_extensionsEditor.onEditorInitialized() end

--- Hook vide (aucune préférence gérée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/extensionsEditor.lua:64
---@param path string Chemin de la préférence modifiée
---@param value any Nouvelle valeur
function editor_extensionsEditor.onEditorPreferenceValueChanged(path, value) end

--- Hook vide : n'enregistre aucune préférence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/extensionsEditor.lua:67
---@param prefsRegistry table Registre des préférences de l'éditeur
function editor_extensionsEditor.onEditorRegisterPreferences(prefsRegistry) end

