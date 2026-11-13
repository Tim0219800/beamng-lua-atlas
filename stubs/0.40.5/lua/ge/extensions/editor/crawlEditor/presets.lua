---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/presets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet presets de l'éditeur Crawl. Champs principaux : presets (categories + metadata), PRESETS_FILE, PRESET_CATEGORIES, showSave*Dialog, showPresetManager(Ptr), *PresetName (buffers ImGui de 256 caractères).
---@class editor_crawlEditor_presets
local editor_crawlEditor_presets = {}

--- Supprime un composant de frontière via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:632
---@param id any identifiant du composant
function editor_crawlEditor_presets:deleteBoundaryComponent(id) end

--- Supprime le preset de frontière et sauvegarde le fichier. Renvoie false, nil si le preset n'existe pas.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:469
---@param name string nom du preset
---@return boolean  succès
---@return string|nil  chemin du fichier
function editor_crawlEditor_presets:deleteBoundaryPreset(name) end

--- Supprime un composant de chemin via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:636
---@param id any identifiant du composant
function editor_crawlEditor_presets:deletePathnodeComponent(id) end

--- Supprime le preset de chemin et sauvegarde le fichier.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:484
---@param name string nom du preset
---@return boolean  succès
---@return string|nil  chemin du fichier
function editor_crawlEditor_presets:deletePathnodePreset(name) end

--- Supprime un composant de trail via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:628
---@param id any identifiant du composant
function editor_crawlEditor_presets:deleteTrailComponent(id) end

--- Supprime le preset de trail et sauvegarde le fichier.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:499
---@param name string nom du preset
---@return boolean  succès
---@return string|nil  chemin du fichier
function editor_crawlEditor_presets:deleteTrailPreset(name) end

--- Dessine les fenêtres ImGui de sauvegarde (frontière, chemin, trail) et le gestionnaire de composants ; appelé à chaque frame par l'éditeur Crawl.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:791
function editor_crawlEditor_presets:drawDialogs() end

--- Dessine les sous-menus ImGui listant les composants de trail, frontière et chemin (clic = chargement dans crawlData) et l'entrée « Manage Components... ». Mémorise crawlData, trails et waypoints pour les dialogues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:697
---@param crawlData table données crawl courantes (champ trails)
---@param trails table module trails de l'éditeur
---@param waypoints table module waypoints de l'éditeur
function editor_crawlEditor_presets:drawMenu(crawlData, trails, waypoints) end

--- Écrit un preset (table complète) dans un fichier JSON indépendant.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:640
---@param category string trails, boundaries ou pathnodes
---@param name string nom du preset
---@param filepath string fichier de destination
---@return boolean  succès
---@return string|nil  filepath
function editor_crawlEditor_presets:exportPreset(category, name, filepath) end

--- Liste les composants de frontière du niveau courant via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:543
---@return table  liste de composants
function editor_crawlEditor_presets:getAllBoundaryComponents() end

--- Liste les composants de chemin du niveau courant via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:548
---@return table  liste de composants
function editor_crawlEditor_presets:getAllPathnodeComponents() end

--- Liste les composants de trail du niveau courant via saveSystem (dossier /levels/<niveau>/crawls/).
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:538
---@return table  liste de composants (avec id et name)
function editor_crawlEditor_presets:getAllTrailComponents() end

--- Renvoie le buffer ImGui (256 caractères) du nom saisi pour une frontière.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:693
---@return userdata  im.ArrayChar
function editor_crawlEditor_presets:getBoundaryPresetName() end

--- Liste les presets de frontières sous forme de tableau {name, preset} (ordre non garanti, issu de pairs).
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:514
---@return table[]  liste de {name, preset}
function editor_crawlEditor_presets:getBoundaryPresets() end

--- Renvoie le buffer ImGui du nom saisi pour un chemin.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:694
---@return userdata  im.ArrayChar
function editor_crawlEditor_presets:getPathnodePresetName() end

--- Liste les presets de chemins sous forme de {name, preset}.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:522
---@return table[]  liste de {name, preset}
function editor_crawlEditor_presets:getPathnodePresets() end

--- Indique si la fenêtre de gestion des composants est affichée.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:687
---@return boolean  état
function editor_crawlEditor_presets:getShowPresetManager() end

--- Renvoie le BoolPtr ImGui lié à la fenêtre de gestion.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:692
---@return userdata  im.BoolPtr
function editor_crawlEditor_presets:getShowPresetManagerPtr() end

--- Indique si le dialogue de sauvegarde de frontière est affiché.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:681
---@return boolean  état
function editor_crawlEditor_presets:getShowSaveBoundaryDialog() end

--- Indique si le dialogue de sauvegarde de chemin est affiché.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:683
---@return boolean  état
function editor_crawlEditor_presets:getShowSavePathnodeDialog() end

--- Indique si le dialogue de sauvegarde de trail est affiché.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:685
---@return boolean  état
function editor_crawlEditor_presets:getShowSaveTrailDialog() end

--- Renvoie le buffer ImGui du nom saisi pour un trail.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:695
---@return userdata  im.ArrayChar
function editor_crawlEditor_presets:getTrailPresetName() end

--- Liste les presets de trails sous forme de {name, preset}.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:530
---@return table[]  liste de {name, preset}
function editor_crawlEditor_presets:getTrailPresets() end

--- Lit un fichier de preset, vérifie nom, catégorie et données, l'ajoute à la catégorie (écrase un preset de même nom) et sauvegarde.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:657
---@param filepath string fichier à lire
---@param category string catégorie attendue
---@return boolean  succès
---@return string|nil  fichier de presets
function editor_crawlEditor_presets:importPreset(filepath, category) end

--- Initialise la table de presets vide, les états des dialogues et les buffers ImGui, calcule le chemin du fichier de presets pour le niveau courant puis appelle loadPresets().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:36
function editor_crawlEditor_presets:init() end

--- Charge un composant de frontière par id via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:558
---@param id any identifiant du composant
---@return table|nil  frontière chargée
function editor_crawlEditor_presets:loadBoundaryComponent(id) end

--- Valide puis désérialise le preset de frontière nommé.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:400
---@param name string nom du preset
---@return table|nil  frontière reconstruite
---@return string|nil  fichier de presets
function editor_crawlEditor_presets:loadBoundaryPreset(name) end

--- Charge un composant de chemin par id via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:563
---@param id any identifiant du composant
---@return table|nil  chemin chargé
function editor_crawlEditor_presets:loadPathnodeComponent(id) end

--- Valide puis désérialise le preset de chemin nommé.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:423
---@param name string nom du preset
---@return table|nil  chemin reconstruit
---@return string|nil  fichier de presets
function editor_crawlEditor_presets:loadPathnodePreset(name) end

--- Lit le fichier JSON de presets ; s'il n'existe pas, écrit immédiatement un fichier vide via savePresets().
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:280
function editor_crawlEditor_presets:loadPresets() end

--- Charge un composant de trail par id via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:553
---@param id any identifiant du composant
---@return table|nil  trail chargé
function editor_crawlEditor_presets:loadTrailComponent(id) end

--- Valide puis désérialise le preset de trail nommé.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:446
---@param name string nom du preset
---@return table|nil  trail reconstruit
---@return string|nil  fichier de presets
function editor_crawlEditor_presets:loadTrailPreset(name) end

--- Renomme la frontière puis l'enregistre comme composant via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:588
---@param name string nom, non vide
---@param boundary table frontière
---@return boolean  succès
---@return any  résultat de saveSystem
function editor_crawlEditor_presets:saveBoundaryComponent(name, boundary) end

--- Sérialise une frontière (boundary:onSerialize) et l'enregistre comme preset de catégorie boundaries, puis sauvegarde le fichier. Échoue si le nom est vide ou si la frontière n'a aucun sommet.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:307
---@param name string nom du preset
---@param boundary table objet frontière avec méthode onSerialize
---@return boolean  succès
---@return string|nil  chemin du fichier
function editor_crawlEditor_presets:saveBoundaryPreset(name, boundary) end

--- Renomme le chemin puis l'enregistre comme composant via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:608
---@param name string nom, non vide
---@param path table chemin
---@return boolean  succès
---@return any  résultat de saveSystem
function editor_crawlEditor_presets:savePathnodeComponent(name, path) end

--- Enregistre un chemin (nom, description, nœuds avec position, rotation, rayon par défaut 6.0, flags) comme preset pathnodes.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:338
---@param name string nom du preset
---@param path table chemin avec liste nodes
---@return boolean  succès
---@return string|nil  chemin du fichier
function editor_crawlEditor_presets:savePathnodePreset(name, path) end

--- Met à jour la date de modification, crée le dossier si besoin (FS:directoryCreate) et écrit tout le fichier de presets.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:289
---@return boolean  succès
---@return string|nil  chemin écrit
function editor_crawlEditor_presets:savePresets() end

--- Renomme le trail (trail.name = name) puis l'enregistre comme composant via saveSystem.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:568
---@param name string nom, non vide
---@param trail table trail à sauvegarder
---@return boolean  succès
---@return any  résultat de saveSystem
function editor_crawlEditor_presets:saveTrailComponent(name, trail) end

--- Sérialise un trail complet (chemin + frontière) et l'enregistre comme preset trails.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:369
---@param name string nom du preset
---@param trail table trail à sauvegarder
---@return boolean  succès
---@return string|nil  chemin du fichier
function editor_crawlEditor_presets:saveTrailPreset(name, trail) end

--- Affiche/masque la fenêtre de gestion et synchronise le pointeur ImGui.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:688
---@param show boolean afficher
function editor_crawlEditor_presets:setShowPresetManager(show) end

--- Affiche/masque le dialogue de sauvegarde de frontière.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:682
---@param show boolean afficher
function editor_crawlEditor_presets:setShowSaveBoundaryDialog(show) end

--- Affiche/masque le dialogue de sauvegarde de chemin.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:684
---@param show boolean afficher
function editor_crawlEditor_presets:setShowSavePathnodeDialog(show) end

--- Affiche/masque le dialogue de sauvegarde de trail.
---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:686
---@param show boolean afficher
function editor_crawlEditor_presets:setShowSaveTrailDialog(show) end

