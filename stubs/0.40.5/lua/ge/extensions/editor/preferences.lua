---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/preferences.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Preferences » de l'éditeur de monde. Elle affiche à gauche la liste des pages (catégories du registre editor.preferencesRegistry) et à droite les préférences de la page choisie via un valueInspector, avec un filtre de recherche et un bouton « Reset All To Defaults ». Le module enregistre aussi les catégories general, camera et ui avec leurs préférences par défaut (échelle UI, vitesse de la caméra libre, etc.) et réagit aux changements de valeur. Un moddeur d'outil d'éditeur peut ouvrir la fenêtre avec editor.showPreferences(categorie).
--- Accès : extension `editor_preferences` : `extensions.load("editor_preferences")`, puis la globale `editor_preferences`
---@class editor_preferences
editor_preferences = {}

--- Appelé au rechargement de l'extension (après un rechargement Lua) avec l'état sauvegardé ; restaure la page de préférences courante (currentCategoryName).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:435
---@param state table Table renvoyée par onSerialize ({currentCategoryName}).
function editor_preferences.onDeserialized(state) end

--- Appelé à l'ouverture de l'éditeur ; applique l'échelle UI de la préférence ui.general.scale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:447
function editor_preferences.onEditorActivated() end

--- Appelé à la fermeture de l'éditeur ; remet l'échelle UI à 1 et, si la préférence camera.general.setVehicleCameraWhenExitingEditor est vraie (et que ce n'est pas la caméra libre du jeu ni editor.skipCameraOnExit), repasse sur la caméra de jeu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:439
function editor_preferences.onEditorDeactivated() end

--- Appelé à chaque frame par l'éditeur. Dessine la fenêtre Preferences : liste des pages, recherche, contenu de la page (ou de toutes les pages si « All ») et bouton de réinitialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:237
function editor_preferences.onEditorGui() end

--- Enregistre la fenêtre (800x600), configure le valueInspector (nom « preferencesInspector », classe « Preferences », callback d'écriture via editor.setPreference), construit les pages et installe editor.showPreferences et editor.updatePreferencePages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:408
function editor_preferences.onEditorInitialized() end

--- Appelé quand une préférence change. Répercute immédiatement certaines valeurs : ui.general.scale / dpiAware (échelle UI), iconButtonSize, showCompleteSceneTree (rafraîchit l'arbre de scène), et les réglages de la caméra libre (vitesse, lissage de déplacement et de rotation).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:321
---@param path string Chemin de la préférence, ex. « camera.general.freeCameraMoveSpeed ».
---@param value any Nouvelle valeur.
function editor_preferences.onEditorPreferenceValueChanged(path, value) end

--- Appelé lors de l'enregistrement des préférences : déclare les catégories general, camera, ui (« User Interface ») et leurs sous-catégories avec valeurs par défaut, descriptions et bornes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:341
---@param prefsRegistry table Registre de préférences de l'éditeur (registerCategory, registerSubCategory).
function editor_preferences.onEditorRegisterPreferences(prefsRegistry) end

--- Appelé au chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:309
function editor_preferences.onExtensionLoaded() end

--- Appelé avant un rechargement Lua ; renvoie {currentCategoryName = ...} pour conserver la page affichée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/preferences.lua:431
---@param state table Non utilisé.
---@return table  État à sauvegarder.
function editor_preferences.onSerialize(state) end

--- La table globale editor (pas créée ici) : le module y installe deux fonctions pendant onEditorInitialized.
---@class editor_preferences_editor
local editor_preferences_editor = {}

--- Ouvre la fenêtre Preferences. Si categoryName est donné, sélectionne cette page.
---Source : lua/ge/extensions/editor/preferences.lua:304
---@param categoryName string|nil Nom de catégorie (ex. « ui », « camera », « all »).
function editor_preferences_editor.showPreferences(categoryName) end

--- Reconstruit la liste des pages à partir du registre : enregistre la catégorie « general », ne garde que les catégories ayant au moins un élément non caché, et ajoute la page « All ».
---Source : lua/ge/extensions/editor/preferences.lua:386
function editor_preferences_editor.updatePreferencePages() end

