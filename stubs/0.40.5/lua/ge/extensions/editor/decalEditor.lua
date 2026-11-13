---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de decals du World Editor (mode d'édition « Edit Decal », fenêtre « Decal Editor », action map « DecalEditor »). Deux onglets : « Templates » (liste des DecalData avec * pour les modifiés ; créer, supprimer, enregistrer un ou tous les templates) et « Instances » (liste et propriétés des decals posés, remplacement de template, duplication). En mode Templates, un clic sur le terrain crée une instance du template sélectionné ; les instances sont visualisées par des sphères de debug colorées par id, sélectionnables à la souris (Ctrl+clic = multi-sélection) et déplaçables avec le gizmo d'axes (Maj + glisser = dupliquer). Toutes les actions sont annulables via editor.history, et les decals sont enregistrés avant la sauvegarde du niveau.
--- Accès : extension `editor_decalEditor` : `extensions.load("editor_decalEditor")`, puis la globale `editor_decalEditor`
---@class editor_decalEditor
editor_decalEditor = {}

--- Hook appelé quand l'alignement du gizmo (local/monde) change ; si des instances sont sélectionnées en mode Edit Decal, replace le gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalEditor.lua:282
function editor_decalEditor.onEditorAxisGizmoAligmentChanged() end

--- Hook appelé avant la sauvegarde du niveau ; enregistre tous les templates de decals (editor.saveDecals).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalEditor.lua:1335
function editor_decalEditor.onEditorBeforeSaveLevel() end

--- Hook appelé à chaque frame de l'éditeur ; si le mode Edit Decal est actif, dessine la fenêtre (curseur d'opacité des sphères, case « Show info labels », onglets Templates et Instances).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalEditor.lua:1359
function editor_decalEditor.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : déclare editor.editModes.decalEditMode (onActivate, onDeactivate, onUpdate, onDeleteSelection, icône create_decal, raccourcis auxiliaires) et enregistre la fenêtre 400x600.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalEditor.lua:1316
function editor_decalEditor.onEditorInitialized() end

--- Hook appelé quand un champ change dans l'inspecteur ; pour chaque DecalData modifié, le marque dirty dans scenetree.decalPersistMan et notifie les instances qui l'utilisent (editor.notifyDecalModified).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalEditor.lua:1339
---@param selectedIds integer[] ids des objets sélectionnés
---@param fieldName string champ modifié
---@param fieldValue any nouvelle valeur
---@param arrayIndex integer index dans le champ tableau
function editor_decalEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook appelé pour dessiner l'en-tête de l'inspecteur ; en mode Edit Decal, affiche l'aperçu du matériau du template sélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalEditor.lua:1017
---@param inspectorInfo table infos de l'inspecteur (inutilisé)
function editor_decalEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook appelé au chargement de l'extension ; écrit « initialized » dans le journal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/decalEditor.lua:1301
function editor_decalEditor.onExtensionLoaded() end

