---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Noyau de l'objet editor du World Editor : initialize(editor) y installe les constantes (FloatMin/Max, IntMin/Max, AuxControl_*), l'état (history, levelPath, dirty, editModes, selection) et les fonctions de base : création/ouverture/sauvegarde de niveaux, état « modifié » (dirty) du niveau et des outils, annuler/refaire, types de visualisation, visibilité/sélectionnabilité des classes d'objets, modes d'édition et actions copier/coller/supprimer routées vers le mode courant. Un moddeur d'outil d'éditeur s'en sert via editor.xxx.
--- Accès : extension `editor_api_core` : `extensions.load("editor_api_core")`, puis la globale `editor_api_core`
---@class editor_api_core
editor_api_core = {}

--- Installe constantes, variables d'état et fonctions sur l'objet editor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/core.lua:715
---@param editorInstance table Objet editor
function editor_api_core.initialize(editorInstance) end

--- Fonctions ajoutées à l'objet editor par initialize.
---@class editor_api_core_editor
local editor_api_core_editor = {}

--- Si des outils sont modifiés, ouvre la fenêtre modale saveDirtyTools et renvoie true.
---Source : lua/ge/extensions/editor/api/core.lua:544
---@return boolean  true si au moins un outil est modifié
function editor_api_core_editor.anyToolDirty() end

--- Sauvegarde une copie du niveau dans /temp/level_autosaves/<niveau>/<compteur>/ en tournant sur files.autoSave.maxAutoSaveCountPerSession, puis restaure levelPath et l'état dirty.
---Source : lua/ge/extensions/editor/api/core.lua:150
function editor_api_core_editor.autoSaveLevel() end

--- Si le niveau/les outils sont modifiés, affiche une boîte de dialogue : Oui sauvegarde, Annuler appelle Engine.cancelShutdown(), Non remet tout à propre.
---Source : lua/ge/extensions/editor/api/core.lua:553
---@param noCancelButton boolean|nil Si vrai, pas de bouton Annuler
function editor_api_core_editor.checkDirtyAndSave(noCancelButton) end

--- Vide l'historique d'annulation et de refaire ; les actions passées deviennent irréversibles.
---Source : lua/ge/extensions/editor/api/core.lua:309
function editor_api_core_editor.clearUndoHistory() end

--- Supprime tous les types de visualisation enregistrés.
---Source : lua/ge/extensions/editor/api/core.lua:371
function editor_api_core_editor.clearVisualizationTypes() end

--- Copier : appelle onCopy du mode courant puis le hook onEditorCopy.
---Source : lua/ge/extensions/editor/api/core.lua:474
function editor_api_core_editor.copy() end

--- Copie récursivement les fichiers de srcPath vers dstPath (FS:findFiles + FS:copyFile) et le logue.
---Source : lua/ge/extensions/editor/api/core.lua:20
---@param srcPath string Dossier source
---@param dstPath string Dossier destination
function editor_api_core_editor.copyDirectory(srcPath, dstPath) end

--- Copie un dossier de niveau (défaut levels/template/) vers un nouveau, remplace le nom de l'ancien niveau par le nouveau dans les .json/.cs et renomme les fichiers contenant l'ancien nom. Peut être long.
---Source : lua/ge/extensions/editor/api/core.lua:32
---@param srcPath string|nil Niveau source, levels/template/ si vide
---@param dstPath string Niveau destination
function editor_api_core_editor.copyLevelFolder(srcPath, dstPath) end

--- Couper : appelle onCut du mode d'édition courant puis le hook onEditorCut.
---Source : lua/ge/extensions/editor/api/core.lua:465
function editor_api_core_editor.cut() end

--- Supprime un objet par id s'il existe et n'est pas verrouillé, puis marque l'éditeur modifié.
---Source : lua/ge/extensions/editor/api/core.lua:275
---@param objectId integer ID de l'objet
---@return boolean  true si supprimé
function editor_api_core_editor.deleteObject(objectId) end

--- Supprimer la sélection : appelle onDeleteSelection du mode courant, émet onEditorDeleteSelection et vide editor.selection.
---Source : lua/ge/extensions/editor/api/core.lua:521
function editor_api_core_editor.deleteSelection() end

--- Désélectionner : appelle onDeselect du mode courant puis le hook onEditorDeselect.
---Source : lua/ge/extensions/editor/api/core.lua:512
function editor_api_core_editor.deselect() end

--- Pour l'UI : propose de sauver, ouvre un sélecteur de dossier sous /levels, copie le niveau template vers le nouveau dossier, puis newLevel() et openLevel().
---Source : lua/ge/extensions/editor/api/core.lua:569
function editor_api_core_editor.doNewLevel() end

--- Pour l'UI : propose de sauver, ouvre un sélecteur de dossier sous /levels et ouvre le niveau choisi.
---Source : lua/ge/extensions/editor/api/core.lua:584
function editor_api_core_editor.doOpenLevel() end

--- Pour l'UI : sauvegarde le niveau, ou appelle doSaveLevelAs si levelPath est vide.
---Source : lua/ge/extensions/editor/api/core.lua:596
function editor_api_core_editor.doSaveLevel() end

--- Pour l'UI : sélecteur de dossier, copie le dossier du niveau vers le nouveau puis saveLevelAs. Refuse /levels directement (il faut un sous-dossier).
---Source : lua/ge/extensions/editor/api/core.lua:606
function editor_api_core_editor.doSaveLevelAs() end

--- Dupliquer : appelle onDuplicate du mode courant puis le hook onEditorDuplicate.
---Source : lua/ge/extensions/editor/api/core.lua:494
function editor_api_core_editor.duplicate() end

--- Active/désactive le mode headless d'un outil : sauvegarde et charge les dispositions de fenêtres, renseigne editor.headless/headlessToolName et émet onEditorHeadlessChange(enabled, toolName).
---Source : lua/ge/extensions/editor/api/core.lua:625
---@param enabled boolean Activer ou non
---@param toolName string Nom de l'outil
function editor_api_core_editor.enableHeadless(enabled, toolName) end

--- Clé du mode courant dans editor.editModes, "" si aucun.
---Source : lua/ge/extensions/editor/api/core.lua:456
---@return string  Nom
function editor_api_core_editor.getCurrentEditModeName() end

--- Nom du niveau courant (dernier dossier du chemin de mission).
---Source : lua/ge/extensions/editor/api/core.lua:530
---@return string|nil  Nom du niveau
function editor_api_core_editor.getLevelName() end

--- Chemin du dossier du niveau courant, "" si inconnu.
---Source : lua/ge/extensions/editor/api/core.lua:539
---@return string  Chemin
function editor_api_core_editor.getLevelPath() end

--- Indique si une classe d'objets est sélectionnable.
---Source : lua/ge/extensions/editor/api/core.lua:398
---@param typeName string Nom de la classe
---@return boolean  true si sélectionnable
function editor_api_core_editor.getObjectTypeSelectable(typeName) end

--- Indique si une classe d'objets est rendue.
---Source : lua/ge/extensions/editor/api/core.lua:385
---@param typeName string Nom de la classe
---@return boolean  true si visible
function editor_api_core_editor.getObjectTypeVisible(typeName) end

--- Valeur courante d'un type de visualisation ; nil si le nom est inconnu.
---Source : lua/ge/extensions/editor/api/core.lua:338
---@param name string Nom du type
---@return boolean|nil  true si actif
function editor_api_core_editor.getVisualizationType(name) end

--- Liste des types de visualisation, triée par displayName si besoin.
---Source : lua/ge/extensions/editor/api/core.lua:356
---@return table[]  Types enregistrés
function editor_api_core_editor.getVisualizationTypes() end

--- Indique si cet outil est actuellement en mode headless.
---Source : lua/ge/extensions/editor/api/core.lua:647
---@param toolName string Nom de l'outil
---@return boolean  true si actif
function editor_api_core_editor.isHeadlessToolActive(toolName) end

--- Crée dans le dossier du niveau un fichier .link (JSON {path = targetPath}) qui pointe vers targetPath, et renvoie le chemin du lien (sans .link). Renvoie targetPath tel quel si aucun niveau n'est ouvert, "" si targetPath est vide.
---Source : lua/ge/extensions/editor/api/core.lua:665
---@param targetPath string Chemin de la ressource cible
---@return string  Chemin dans le niveau
function editor_api_core_editor.linkifyPath(targetPath) end

--- Coupe le canal audio maître (mémorise le volume) ou le rétablit.
---Source : lua/ge/extensions/editor/api/core.lua:651
---@param muteIt boolean|nil true ou nil pour couper, false pour rétablir
function editor_api_core_editor.muteAudio(muteIt) end

--- Remet l'éditeur à zéro pour un nouveau niveau : hooks onEditorExitLevel puis onEditorBeforeNewLevel, vide l'historique, levelPath = "", compteur d'autosave à 1, puis onEditorAfterNewLevel et resetDirty. Ne détruit pas le scenetree.
---Source : lua/ge/extensions/editor/api/core.lua:74
function editor_api_core_editor.newLevel() end

--- Ouvre un niveau existant : désactive les signaux Sim, hook onEditorBeforeOpenLevel, newLevel(), shutdown de l'éditeur puis core_levels.startLevel(path), puis hook onEditorAfterOpenLevel. Les modifications non sauvées sont perdues.
---Source : lua/ge/extensions/editor/api/core.lua:88
---@param path string Dossier du niveau, relatif à la racine du jeu
function editor_api_core_editor.openLevel(path) end

--- Coller : appelle onPaste du mode courant puis le hook onEditorPaste.
---Source : lua/ge/extensions/editor/api/core.lua:484
function editor_api_core_editor.paste() end

--- Cache et désactive l'éditeur.
---Source : lua/ge/extensions/editor/api/core.lua:265
function editor_api_core_editor.quitEditor() end

--- Quitte le jeu (quit()).
---Source : lua/ge/extensions/editor/api/core.lua:270
function editor_api_core_editor.quitGame() end

--- Refait la ou les dernières opérations annulées.
---Source : lua/ge/extensions/editor/api/core.lua:293
---@param steps integer|nil Nombre d'étapes, 1 par défaut
function editor_api_core_editor.redo(steps) end

--- Enregistre un type de visualisation personnalisé.
---Source : lua/ge/extensions/editor/api/core.lua:366
---@param typeData table name, displayName, type (editor.varTypes), getter/setter si Custom, callback optionnel
function editor_api_core_editor.registerVisualizationType(typeData) end

--- Vide la liste des outils modifiés et remet cleanExit à true.
---Source : lua/ge/extensions/editor/api/core.lua:252
function editor_api_core_editor.resetAllDirtyTools() end

--- Marque le niveau comme propre, efface le flag de scène du moteur et remet cleanExit à true.
---Source : lua/ge/extensions/editor/api/core.lua:258
function editor_api_core_editor.resetDirty() end

--- Retire un outil de la liste des outils modifiés.
---Source : lua/ge/extensions/editor/api/core.lua:248
---@param name string Nom de l'outil
function editor_api_core_editor.resetDirtyTool(name) end

--- Dessine la fenêtre modale « Save Tool Windows Data » listant les outils modifiés (Save All, Save Selected, Don't Save Any, Cancel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/core.lua:177
function editor_api_core_editor.saveDirtyToolsUi() end

--- Sauvegarde le MissionGroup dans <levelPath>main (via __main), avec hooks onEditorBeforeSaveLevel/onEditorAfterSaveLevel, resetDirty, notification, et copie de sauvegarde si la préférence files.autoSave.saveBackupCopy est active (hooks onEditorBefore/AfterSaveLevelBackup).
---Source : lua/ge/extensions/editor/api/core.lua:115
function editor_api_core_editor.saveLevel() end

--- Change editor.levelPath et le nom de mission (info.json) puis sauvegarde le niveau à cet emplacement.
---Source : lua/ge/extensions/editor/api/core.lua:143
---@param levelPath string Dossier cible
function editor_api_core_editor.saveLevelAs(levelPath) end

--- Tout sélectionner : appelle onSelectAll du mode courant puis le hook onEditorSelectAll.
---Source : lua/ge/extensions/editor/api/core.lua:503
function editor_api_core_editor.selectAll() end

--- Active un mode d'édition : désactive l'ancien (onDeactivate, hook onEditorEditModeDeactivated, pop de son actionMap), active le nouveau (onActivate, hook onEditorEditModeActivated, push de son actionMap en priorité maximale) puis émet onEditorEditModeChanged(old, new). Champs du mode : displayName, onActivate, onDeactivate, onUpdate, onCut, onCopy, onPaste, onDuplicate, onSelectAll, onDeselect, onDeleteSelection, onToolbar, actionMap, icon, iconTooltip, hideObjectIcons.
---Source : lua/ge/extensions/editor/api/core.lua:419
---@param newEditMode table|nil Table du mode d'édition (nil pour aucun)
function editor_api_core_editor.selectEditMode(newEditMode) end

--- Marque le niveau comme modifié et enregistre l'info d'arrêt non propre (préférences general.internal.cleanExit/lastLevel).
---Source : lua/ge/extensions/editor/api/core.lua:238
function editor_api_core_editor.setDirty() end

--- Déclare un outil comme ayant des données non sauvées, avec sa fonction de sauvegarde.
---Source : lua/ge/extensions/editor/api/core.lua:243
---@param name string Nom de l'outil
---@param saveFn function Fonction appelée pour sauver les données
function editor_api_core_editor.setDirtyTool(name, saveFn) end

--- Autorise ou interdit la sélection d'une classe d'objets.
---Source : lua/ge/extensions/editor/api/core.lua:392
---@param typeName string Nom de la classe
---@param selectable boolean Sélectionnable
function editor_api_core_editor.setObjectTypeSelectable(typeName, selectable) end

--- Rend visible/invisible une classe d'objets C++ dans l'éditeur.
---Source : lua/ge/extensions/editor/api/core.lua:378
---@param typeName string Nom de la classe
---@param visible boolean Visibilité
function editor_api_core_editor.setObjectTypeVisible(typeName, visible) end

--- Change l'instance d'historique utilisée (utile pour un undo par fenêtre/panneau). nil rétablit l'historique par défaut.
---Source : lua/ge/extensions/editor/api/core.lua:300
---@param history table|nil Instance d'historique
function editor_api_core_editor.setUndoHistory(history) end

--- Active/désactive un type de visualisation enregistré (selon son type ConVar/LuaVar/Custom/Setting) puis appelle son callback éventuel. Ignore un nom inconnu.
---Source : lua/ge/extensions/editor/api/core.lua:316
---@param name string Nom du type
---@param on boolean true pour activer
function editor_api_core_editor.setVisualizationType(name, on) end

--- Annule la ou les dernières opérations de l'historique courant.
---Source : lua/ge/extensions/editor/api/core.lua:287
---@param steps integer|nil Nombre d'étapes, 1 par défaut
function editor_api_core_editor.undo(steps) end

