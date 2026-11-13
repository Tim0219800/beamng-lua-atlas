---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de « peinture » des nœuds de cadrage pour les vignettes de véhicules. Il permet de désactiver (ou réactiver) des nœuds du véhicule avec un pinceau circulaire dans la vue 3D de l'éditeur, afin qu'ils soient ignorés par le cadrage procédural (antennes, pièces qui dépassent…). La liste des nœuds désactivés est enregistrée par configuration (clé « modèle/config ») dans /settings/thumbnailNodeOutpaintConfig.json, dans la table configs. Il fournit aussi les données de nœuds utilisées par framing/procedural (position monde, nom, marque ignoreForThumbnailFraming, détection automatique des rétroviseurs externes), l'historique annuler/refaire de l'éditeur et des fonctions de dessin de débogage.
--- Accès : extension `util_screenshotCreator_nodeOutpaint` : `extensions.load("util_screenshotCreator_nodeOutpaint")`, puis la globale `util_screenshotCreator_nodeOutpaint`
---@class util_screenshotCreator_nodeOutpaint
---@field dependencies string[] Extensions chargées avant : ui_imgui, ui_imguiUtils, core_camera, core_vehicle_manager, util_screenshotCreator_settings.
util_screenshotCreator_nodeOutpaint = {}

--- Remplace les nœuds désactivés d'une config par un instantané (ou supprime l'entrée si vide) et sauvegarde. Utilisé par annuler/refaire.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:171
---@param configKey string Clé « modèle/config ».
---@param snapshot table|nil Table {cid = nom}.
---@return boolean  false si configKey est nil.
function util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot) end

--- Remet tabActive à false au début de chaque frame d'interface ; drawTab le remet à true si l'onglet est affiché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:424
function util_screenshotCreator_nodeOutpaint.beginUiFrame() end

--- Restaure l'état du pinceau (accepte aussi les anciennes clés nodeOutpaintEnabled et nodeOutpaintBrushRadius) ; rayon borné à 4..80.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:525
---@param data table|nil État sauvegardé.
function util_screenshotCreator_nodeOutpaint.deserialize(data) end

--- Dessine en debug 3D les données de cadrage : boîte des bornes (orange), OOBB du véhicule (cyan), centre, point de visée, axes, points de cadrage, nœuds de rétroviseurs et nœuds désactivés, avec libellés. Les options par défaut viennent de settings.getFramingContext().debug.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:433
---@param framingData table|nil framingData renvoyé par un mode de cadrage.
---@param options table|nil {drawBounds, drawOobb, drawInputs}.
function util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options) end

--- Dessine le contenu ImGui de l'onglet : case du pinceau, rayon, légende des couleurs, bouton « Auto-frame vehicle » (si options.autoFrame existe), liste des nœuds désactivés avec bouton Enable et « Enable all ».
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:358
---@param options table|nil {vehicle, configName, autoFrame = function}.
function util_screenshotCreator_nodeOutpaint.drawTab(options) end

--- Dessine une petite sphère de debug sur chaque nœud du véhicule, colorée selon son état (ignoré, désactivé, rétroviseur, actif).
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:499
---@param vehicle table Objet véhicule.
---@param explicitConfigName string|nil Nom de config imposé.
function util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName) end

--- Réactive tous les nœuds d'une config (supprime son entrée) avec historique et sauvegarde.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:241
---@param vehicleOrKey table|string Véhicule ou clé de config.
---@param explicitConfigName string|nil Nom de config imposé.
---@return boolean  false s'il n'y avait aucun nœud désactivé ou pas de clé.
function util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName) end

--- Termine le coup de pinceau en cours : s'il a modifié des nœuds, enregistre l'action « Paint Thumbnail Framing Nodes » dans l'historique et sauvegarde.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:251
function util_screenshotCreator_nodeOutpaint.finishStroke() end

--- Renvoie le chemin du fichier de configuration (/settings/thumbnailNodeOutpaintConfig.json).
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:543
---@return string  Chemin du fichier.
function util_screenshotCreator_nodeOutpaint.getConfigPath() end

--- Renvoie les pointeurs ImGui de l'interface.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:566
---@return table  {enabled = BoolPtr, brushRadius = FloatPtr}.
function util_screenshotCreator_nodeOutpaint.getControls() end

--- Renvoie la table des nœuds désactivés d'une config ({cid string = nom}). Renvoie une table vide non enregistrée si la config n'existe pas, sauf si create vaut true.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:67
---@param vehicleOrKey table|string Véhicule ou clé « modèle/config ».
---@param explicitConfigName string|nil Nom de config imposé quand le premier argument est un véhicule.
---@param create boolean|nil true pour créer et enregistrer en mémoire la table de la config.
---@return table<string, string>  Nœuds désactivés.
function util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create) end

--- Raccourci de getDisabledNodes pour une clé de config.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:551
---@param configKey string Clé « modèle/config ».
---@param create boolean|nil true pour créer la table si absente.
---@return table<string, string>  Nœuds désactivés.
function util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create) end

--- Cherche un nœud du véhicule par clé (cid en string), par nom ou par cid.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:162
---@param vehicle table Objet véhicule.
---@param nodeIdentifier string|integer Clé, nom ou cid du nœud.
---@return table|nil  Nœud trouvé (voir getVehicleNodeData), sinon nil.
function util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier) end

--- Liste tous les nœuds physiques du véhicule avec leur position monde et leurs marques. Lance au premier appel le selfCheck de détection de rétroviseurs.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:118
---@param vehicle table Objet véhicule.
---@return table[]  Tableau de {cid, key, name, ignoreForThumbnailFraming, automaticMirrorOutpaint, point (vec3 monde)}.
function util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle) end

--- Calcule la clé « modèle/config » d'un véhicule, à partir de son jbeam et de explicitConfigName ou de vehicle.partConfig (normalisé).
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:36
---@param vehicle table Objet véhicule.
---@param explicitConfigName string|nil Nom de config imposé (prioritaire sur partConfig).
---@return string|nil  Clé « modèle/config », nil si le modèle ou la config manque.
---@return string|nil  Nom du modèle.
---@return string|nil  Nom de config normalisé.
function util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName) end

--- Indique si l'onglet du pinceau est actif.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:559
---@return boolean  tabActive.
function util_screenshotCreator_nodeOutpaint.isTabActive() end

--- Charge le fichier de configuration en mémoire (une seule fois sauf force) ; crée une table vide si le fichier est absent ou invalide.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:45
---@param force boolean|nil true pour relire le fichier même s'il est déjà chargé.
---@return table  Config {configs = {...}}.
function util_screenshotCreator_nodeOutpaint.loadConfig(force) end

--- Hook après rechargement ; identique à deserialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:525
---@param data table|nil État sauvegardé.
function util_screenshotCreator_nodeOutpaint.onDeserialized(data) end

--- Hook : charge la configuration au chargement de l'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:531
function util_screenshotCreator_nodeOutpaint.onExtensionLoaded() end

--- Hook : termine le coup de pinceau en cours au déchargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:535
function util_screenshotCreator_nodeOutpaint.onExtensionUnloaded() end

--- Hook de sérialisation ; identique à serialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:518
---@return table  État.
function util_screenshotCreator_nodeOutpaint.onSerialize() end

--- Hook appelé quand un véhicule apparaît : termine le coup de pinceau en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:539
function util_screenshotCreator_nodeOutpaint.onVehicleSpawned() end

--- Refait une modification : applique actionData.new. Callback d'editor.history.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:188
---@param actionData table {configKey, old, new}.
function util_screenshotCreator_nodeOutpaint.redo(actionData) end

--- Écrit la configuration sur disque (jsonWriteFile, indentée).
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:57
---@return boolean  Résultat de jsonWriteFile.
function util_screenshotCreator_nodeOutpaint.saveConfig() end

--- Test par assertions de la détection des rétroviseurs externes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:104
---@return boolean  Toujours true (sinon une assertion échoue).
function util_screenshotCreator_nodeOutpaint.selfCheck() end

--- Renvoie {enabled, brushRadius} pour la sauvegarde de l'état.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:518
---@return table  État du pinceau.
function util_screenshotCreator_nodeOutpaint.serialize() end

--- Désactive ou réactive un nœud pour une config, avec entrée d'historique annuler/refaire et sauvegarde sur disque.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:222
---@param vehicleOrKey table|string Véhicule ou clé de config.
---@param node table Nœud (avec key et name), tel que renvoyé par getVehicleNode.
---@param disabled boolean true pour désactiver, false pour réactiver.
---@param explicitConfigName string|nil Nom de config imposé.
---@return boolean  true si l'état a changé.
function util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName) end

--- Force l'état « onglet actif » ; en le désactivant, termine le coup de pinceau en cours.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:428
---@param value boolean true si l'onglet est actif.
function util_screenshotCreator_nodeOutpaint.setTabActive(value) end

--- Annule une modification : applique actionData.old. Callback d'editor.history.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:183
---@param actionData table {configKey, old, new}.
function util_screenshotCreator_nodeOutpaint.undo(actionData) end

--- Met à jour le pinceau chaque frame : dessine le cercle, colore les nœuds dans la vue 3D (debugDrawer), et pendant un clic gauche désactive les nœuds sous le pinceau (Ctrl : les réactive). Le coup de pinceau est enregistré comme une action d'historique à la fin.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:263
---@param options table|nil {active, workerRunning, vehicle, configName}.
function util_screenshotCreator_nodeOutpaint.updateBrush(options) end

--- Alias de updateBrush.
---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:263
---@param options table|nil Voir updateBrush.
function util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options) end

