---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mainMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Barre de menu principale du World Editor : menus File, Edit, Camera, Object, View, Window, Help, plus titre du niveau, mode d'édition courant, notifications, barre d'état, métriques de scène (mémoire GPU/CPU), et boîtes de dialogue (À propos, mode sans échec, retour du niveau à l'original, sauvegarde/suppression/réinitialisation de layouts). Il fournit aux autres outils l'API editor.addWindowMenuItem (entrée dans le menu Window), editor.showNotification, editor.setStatusBar/hideStatusBar et editor.rebuildCollision.
--- Accès : extension `editor_mainMenu` : `extensions.load("editor_mainMenu")`, puis la globale `editor_mainMenu`
---@class editor_mainMenu
---@field dependencies table<integer, string> {"editor_layoutManager"}.
editor_mainMenu = {}

--- Appelé à l'activation de l'éditeur : applique aux gizmos les préférences gizmos.general.drawGizmoPlane et highlightSelectedMeshes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainMenu.lua:865
function editor_mainMenu.onEditorActivated() end

--- Dessine la barre de menu principale et les dialogues à chaque frame. Émet onEditorMainMenuBar (ou onEditorHeadlessMainMenuBar en headless).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainMenu.lua:692
function editor_mainMenu.onEditorGuiMainMenu() end

--- Enregistre les fenêtres de dialogue, ouvre la fenêtre de mode sans échec si besoin et détermine si le bouton « revert level to original » doit être proposé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainMenu.lua:872
function editor_mainMenu.onEditorInitialized() end

--- Restaure la liste des outils récents depuis l'état (chaînes non vides uniquement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainMenu.lua:921
---@param state table|nil État de l'éditeur.
function editor_mainMenu.onEditorLoadState(state) end

--- Réagit aux préférences ui.general.sceneMetric, gizmos.visualization.visTypes et ui.general.recentWindowMenuCount.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainMenu.lua:906
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_mainMenu.onEditorPreferenceValueChanged(path, value) end

--- Ajoute la liste des outils récents à l'état sauvegardé (state.windowMenuRecentTools).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainMenu.lua:916
---@param state table État de l'éditeur à compléter.
function editor_mainMenu.onEditorSaveState(state) end

--- Appelé au chargement : vide les listes de menus, crée la file de notifications (maxNotificationCount 100) et installe editor.addWindowMenuItem, showNotification, setStatusBar, hideStatusBar, rebuildCollision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainMenu.lua:847
function editor_mainMenu.onExtensionLoaded() end

--- Fonctions ajoutées à la table globale `editor` par ce module.
---@class editor_mainMenu_editor
local editor_mainMenu_editor = {}

--- Ajoute une entrée dans le menu Window de l'éditeur. Les entrées defaultToolWindow (Inspector, Scene Tree…) sont en tête du menu, séparées des autres ; les entrées sont triées par texte. Appelle le hook onEditorToolWindowOpened(itemText, "windowMenu") au clic.
---Source : lua/ge/extensions/editor/mainMenu.lua:804
---@param itemText string Texte de l'entrée.
---@param actionFunc function Callback appelé au clic.
---@param info table|nil Options : groupMenuName (sous-menu), experimental, gameplay (visible dans le menu Window de l'éditeur réduit).
---@param defaultToolWindow boolean|nil true pour une fenêtre ouverte par défaut, placée en haut du menu.
function editor_mainMenu_editor.addWindowMenuItem(itemText, actionFunc, info, defaultToolWindow) end

--- Masque la barre d'état. À appeler quand l'opération est terminée.
---Source : lua/ge/extensions/editor/mainMenu.lua:617
function editor_mainMenu_editor.hideStatusBar() end

--- Reconstruit la collision statique (be:reloadCollision, puis efface le drapeau) si nécessaire ou forcé, et affiche une notification.
---Source : lua/ge/extensions/editor/mainMenu.lua:143
---@param force boolean|nil true pour reconstruire même si Engine.getNeedCollisionRebuild() est faux.
function editor_mainMenu_editor.rebuildCollision(force) end

--- Définit le texte de la barre d'état et un callback ImGui optionnel (la barre n'est visible que si le texte est non vide).
---Source : lua/ge/extensions/editor/mainMenu.lua:611
---@param text string Texte affiché.
---@param uiCallback function|nil Dessine des éléments ImGui supplémentaires ; utiliser SameLine entre eux.
function editor_mainMenu_editor.setStatusBar(text, uiCallback) end

--- Ajoute une notification à la file ; elle remplace celle du même groupe si elle existe.
---Source : lua/ge/extensions/editor/mainMenu.lua:158
---@param text string Texte.
---@param icon any Icône (editor.icons.*) ; editor.icons.info par défaut.
---@param group string|nil Nom du groupe.
---@param duration number|nil Durée d'affichage en secondes (valeur par défaut sinon).
---@param doBeep boolean|nil Émet un bip.
function editor_mainMenu_editor.showNotification(text, icon, group, duration, doBeep) end

