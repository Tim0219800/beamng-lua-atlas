---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/fileDialog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte de dialogue de fichiers ImGui de l'éditeur (ouvrir / enregistrer un fichier ou choisir un dossier) sur le système de fichiers virtuel du jeu (FS). Elle offre navigation, dossiers récents, favoris, tri par colonnes, recherche, filtres par type de fichier, aperçu d'images (jpg, jpeg, png, dds), création de dossier et confirmation d'écrasement. Un moddeur d'outil d'éditeur l'appelle via openFile / saveFile avec un callback.
--- Accès : extension `editor_fileDialog` : `extensions.load("editor_fileDialog")`, puis la globale `editor_fileDialog`
---@class editor_fileDialog
editor_fileDialog = {}

--- Hook d'activation de l'éditeur ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/fileDialog.lua:918
function editor_fileDialog.onEditorActivated() end

--- Hook de désactivation de l'éditeur ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/fileDialog.lua:921
function editor_fileDialog.onEditorDeactivated() end

--- Hook appelé chaque frame GUI de l'éditeur : dessine la fenêtre « fileDialog » si elle est visible (la masque si aucun cache de fichiers n'existe), plus la fenêtre de recherche intelligente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/fileDialog.lua:409
function editor_fileDialog.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre les fenêtres (fileDialog 640x480, recentDirsWindow, smartSearchItems), les icônes d'images, restaure la visibilité des colonnes et masque la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/fileDialog.lua:924
function editor_fileDialog.onEditorInitialized() end

--- Hook appelé pour déclarer les préférences de la catégorie « files / fileDialog ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/fileDialog.lua:956
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_fileDialog.onEditorRegisterPreferences(prefsRegistry) end

--- Hook de chargement de l'extension ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/fileDialog.lua:915
function editor_fileDialog.onExtensionLoaded() end

--- Ouvre la boîte de dialogue en mode « Open ». Appelle callbackFn avec les informations du fichier (ou dossier) choisi.
---Source : lua/ge/extensions/editor/fileDialog.lua:907
---@param callbackFn function function(data) ; data = {path, action, filename, filepath, filetype}.
---@param filenameSuffix table|nil Filtres {{libellé, motif}, …} ; défaut {{"Any files", "*"}}. Ignoré si selectFolder.
---@param selectFolder boolean|nil true pour choisir un dossier.
---@param defaultPath string|nil Dossier de départ (défaut "/").
---@param preview boolean|nil Afficher un aperçu des fichiers.
---@param caseSensitivePattern boolean|nil Filtre de motif sensible à la casse.
---@return boolean  true si la boîte s'ouvre, false si déjà ouverte ou callback invalide.
function editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern) end

--- Ouvre la boîte de dialogue en mode « Save » (pas d'aperçu). Ajoute l'extension du filtre choisi au nom saisi si elle manque et demande confirmation en cas d'écrasement.
---Source : lua/ge/extensions/editor/fileDialog.lua:911
---@param callbackFn function function(data), même format que openFile.
---@param filenameSuffix table|nil Filtres {{libellé, motif}, …}.
---@param selectFolder boolean|nil true pour choisir un dossier.
---@param defaultPath string|nil Dossier de départ.
---@param overwriteDialogText string|nil Texte de la confirmation d'écrasement (défaut : « Are you sure you want to overwrite this file »).
---@return boolean  true si la boîte s'ouvre.
function editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText) end

