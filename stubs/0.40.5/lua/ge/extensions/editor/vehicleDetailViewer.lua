---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleDetailViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil d'éditeur « Vehicle Detail Viewer » (menu Window > Vehicles, aussi F11 > Window > Experimental). Ouvre des fenêtres imgui qui affichent des vues orthographiques du véhicule joueur (Left, Right, Top, Bottom, Front, Back) rendues dans une texture via RenderViewManagerInstance, avec zoom, déplacement par glisser et double-clic de remise à zéro. Chaque vue est calée sur la boîte englobante orientée du véhicule (getSpawnWorldOOBB). Les dispositions peuvent être sauvegardées dans /settings/vehicleDetails/*.vehicleDetailSetting.json (défaut : default.vehicleDetailSetting.json).
--- Accès : extension `editor_vehicleDetailViewer` : `extensions.load("editor_vehicleDetailViewer")`, puis la globale `editor_vehicleDetailViewer`
---@class editor_vehicleDetailViewer
editor_vehicleDetailViewer = {}

--- Restaure les vues et recrée les pointeurs imgui windowOpen. Aussi utilisé pour charger un fichier de disposition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleDetailViewer.lua:297
---@param data table|nil Table de onSerialize ou contenu du fichier de disposition.
function editor_vehicleDetailViewer.onDeserialized(data) end

--- Ajoute l'entrée de menu 'Vehicle Detail Viewer' (groupe Vehicles) qui active l'outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleDetailViewer.lua:614
function editor_vehicleDetailViewer.onEditorInitialized() end

--- Appelé au chargement de l'extension : affiche un message et liste les fichiers de disposition disponibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleDetailViewer.lua:600
function editor_vehicleDetailViewer.onExtensionLoaded() end

--- Appelé au déchargement : détruit les vues de rendu restantes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleDetailViewer.lua:605
function editor_vehicleDetailViewer.onExtensionUnloaded() end

--- Appelé chaque frame avant le rendu : crée les modèles de vues pour le véhicule joueur, charge la disposition par défaut, dessine chaque fenêtre de vue et déclenche le rendu orthographique ; nettoie quand tout est fermé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleDetailViewer.lua:488
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_vehicleDetailViewer.onPreRender(dtReal, dtSim, dtRaw) end

--- Avant rechargement Lua : détruit les vues de rendu et renvoie {views} sans les objets non sérialisables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleDetailViewer.lua:274
---@return table  {views = table}
function editor_vehicleDetailViewer.onSerialize() end

--- Appelé quand un véhicule apparaît : oublie les vues pour les recréer avec le nouveau véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleDetailViewer.lua:595
---@param vehicleId integer ID du véhicule.
function editor_vehicleDetailViewer.onVehicleSpawned(vehicleId) end

