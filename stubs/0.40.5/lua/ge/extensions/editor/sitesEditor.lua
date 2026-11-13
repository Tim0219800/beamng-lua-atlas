---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur des fichiers de 'sites' (*.sites.json) : lieux (locations), zones et places de parking (parkingSpots), avec leurs tags. Il ouvre la fenêtre 'Sites: Locations and Zones Editor' avec un menu File (New, Load, Save, Save as, Sites in Manager) et un menu Tools (tri par nom, numérotation des places, nommage par zone), et un onglet par sous-éditeur (editor/sitesEditor/*). Il crée le mode d'édition 'Edit Sites'. Un moddeur de cartes s'en sert pour placer des lieux et des places de parking.
--- Accès : extension `editor_sitesEditor` : `extensions.load("editor_sitesEditor")`, puis la globale `editor_sitesEditor`
---@class editor_sitesEditor
---@field onExtensionLoaded nil Champ exporté mais toujours nil (variable locale non définie dans le fichier).
editor_sitesEditor = {}

--- Indique si le mode d'édition actif est 'Edit Sites' (donc si les gizmos et clics sont permis).
---Source : lua/ge/extensions/editor/sitesEditor.lua:387
---@return boolean  true si le mode Edit Sites est actif.
function editor_sitesEditor.allowGizmo() end

--- Renvoie le lieu sélectionné dans l'onglet Locations.
---Source : lua/ge/extensions/editor/sitesEditor.lua:389
---@return table|nil  Lieu sélectionné ou nil.
function editor_sitesEditor.getCurrentLocation() end

--- Renvoie la place de parking sélectionnée dans l'onglet Parking Spots.
---Source : lua/ge/extensions/editor/sitesEditor.lua:391
---@return table|nil  Place sélectionnée ou nil.
function editor_sitesEditor.getCurrentParkingSpot() end

--- Renvoie l'objet sites en cours d'édition.
---Source : lua/ge/extensions/editor/sitesEditor.lua:388
---@return table  Sites courants.
function editor_sitesEditor.getCurrentSites() end

--- Renvoie la zone sélectionnée dans l'onglet Zones.
---Source : lua/ge/extensions/editor/sitesEditor.lua:390
---@return table|nil  Zone sélectionnée ou nil.
function editor_sitesEditor.getCurrentZone() end

--- Charge un fichier de sites via gameplay_sites_sitesManager.loadSites, le rend courant, le transmet à tous les sous-éditeurs et réinitialise leur sélection.
---Source : lua/ge/extensions/editor/sitesEditor.lua:30
---@param loadPath string Chemin du fichier .sites.json.
---@return table  Les sites courants (l'ancien objet si le chargement a échoué).
function editor_sitesEditor.loadSites(loadPath) end

--- Dessine le sous-menu 'Sites in Manager...' : liste des sites par niveau et ceux de /gameplay, avec Refresh, et charge celui choisi.
---Source : lua/ge/extensions/editor/sitesEditor.lua:216
function editor_sitesEditor.managerSites() end

--- Hook de restauration après rechargement Lua : réinjecte data.path dans les sites courants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor.lua:364
---@param data table Données renvoyées par onSerialize.
function editor_sitesEditor.onDeserialized(data) end

--- Hook appelé chaque frame de l'UI de l'éditeur : dessine la fenêtre, les menus, les onglets, met à jour les infos souris (rayon caméra) et dessine les sites en debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor.lua:79
function editor_sitesEditor.onEditorGui() end

--- Hook d'initialisation de l'éditeur : enregistre la fenêtre, le mode d'édition sitesEditMode, l'entrée de menu (groupe Gameplay) et crée les six sous-éditeurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor.lua:307
function editor_sitesEditor.onEditorInitialized() end

--- Hook : si la fenêtre de l'outil prend le focus, active le mode d'édition sitesEditMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor.lua:378
---@param windowName string Nom de la fenêtre.
function editor_sitesEditor.onEditorToolWindowGotFocus(windowName) end

--- Hook : si la fenêtre de l'outil est masquée, revient au mode objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor.lua:372
---@param windowName string Nom de la fenêtre masquée.
function editor_sitesEditor.onEditorToolWindowHide(windowName) end

--- Hook de sérialisation (rechargement Lua) : renvoie {path = sérialisation des sites courants}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor.lua:357
---@return table  Données à restaurer.
function editor_sitesEditor.onSerialize() end

--- Sérialise un objet sites et l'écrit en JSON au chemin donné ; met à jour sites.dir et sites.name et mémorise le dossier comme dernier chemin.
---Source : lua/ge/extensions/editor/sitesEditor.lua:21
---@param sites table Objet sites (gameplay/sites/sites).
---@param savePath string Chemin complet du fichier .sites.json.
function editor_sitesEditor.saveSites(sites, savePath) end

--- Sélectionne une zone dans l'onglet Zones (utilisé par le clic dans le monde).
---Source : lua/ge/extensions/editor/sitesEditor.lua:392
---@param elem integer Id de la zone (déduit du code).
---@param mode string|nil 'toggle' pour basculer, nil pour remplacer la sélection.
function editor_sitesEditor.selectZone(elem, mode) end

--- Efface la sélection d'objets, affiche la fenêtre de l'outil et active le mode d'édition sitesEditMode.
---Source : lua/ge/extensions/editor/sitesEditor.lua:284
function editor_sitesEditor.show() end

