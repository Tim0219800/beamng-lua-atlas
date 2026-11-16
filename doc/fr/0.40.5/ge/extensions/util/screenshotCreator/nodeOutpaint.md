# `util_screenshotCreator_nodeOutpaint`

*Fichier : `lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua` · VM : Game Engine (GE) · 581 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_nodeOutpaint` : `extensions.load("util_screenshotCreator_nodeOutpaint")`, puis la globale `util_screenshotCreator_nodeOutpaint`

Outil de « peinture » des nœuds de cadrage pour les vignettes de véhicules. Il permet de désactiver (ou réactiver) des nœuds du véhicule avec un pinceau circulaire dans la vue 3D de l'éditeur, afin qu'ils soient ignorés par le cadrage procédural (antennes, pièces qui dépassent…). La liste des nœuds désactivés est enregistrée par configuration (clé « modèle/config ») dans /settings/thumbnailNodeOutpaintConfig.json, dans la table configs. Il fournit aussi les données de nœuds utilisées par framing/procedural (position monde, nom, marque ignoreForThumbnailFraming, détection automatique des rétroviseurs externes), l'historique annuler/refaire de l'éditeur et des fonctions de dessin de débogage.

## Exemple

```lua
local veh = getPlayerVehicle(0)
local key = util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(veh)
local disabled = util_screenshotCreator_nodeOutpaint.getDisabledNodes(key) -- {["12"] = "nom du nœud", ...}
```

## Remarques

- Format du fichier de config : {configs = {["modèle/config"] = {[cid en string] = nom du nœud}}}. Une config sans nœud désactivé est supprimée de la table.
- La clé de config est normalisée : le dernier segment du chemin, sans extension .pc ni .jpg.
- Le pinceau (updateBrush) n'agit que si l'onglet est actif, que la case « Enable node brush » est cochée, qu'aucun travail de capture ne tourne et que la souris survole la vue 3D de l'éditeur ; Ctrl + clic gauche réactive les nœuds. Rayon : 4 à 80 px.
- Couleurs de débogage : cyan = actif, rouge = désactivé à la main, violet = ignoré par la pièce (ignoreForThumbnailFraming), orange = rétroviseur externe automatique.
- Les modifications passent par editor.history (annuler/refaire) quand l'éditeur est chargé ; la config est écrite sur disque à chaque modification.
- Les nœuds sont des tables {cid, key, name, ignoreForThumbnailFraming, automaticMirrorOutpaint, point} ; key est le cid converti en string.

**Dépendances (chargées avant) :** `ui_imgui`, `ui_imguiUtils`, `core_camera`, `core_vehicle_manager`, `util_screenshotCreator_settings`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot)` | Remplace les nœuds désactivés d'une config par un instantané (ou supprime l'entrée si vide) et sauvegarde. Utilisé par annuler/refaire. | 171 |
| `util_screenshotCreator_nodeOutpaint.beginUiFrame()` | Remet tabActive à false au début de chaque frame d'interface ; drawTab le remet à true si l'onglet est affiché. *(interne)* | 424 |
| `util_screenshotCreator_nodeOutpaint.deserialize(data)` | Restaure l'état du pinceau (accepte aussi les anciennes clés nodeOutpaintEnabled et nodeOutpaintBrushRadius) ; rayon borné à 4..80. | 525 |
| `util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options)` | Dessine en debug 3D les données de cadrage : boîte des bornes (orange), OOBB du véhicule (cyan), centre, point de visée, axes, points de cadrage, nœuds de rétroviseurs et nœuds désactivés, avec libellés. Les options par défaut viennent de settings.getFramingContext().debug. | 433 |
| `util_screenshotCreator_nodeOutpaint.drawTab(options)` | Dessine le contenu ImGui de l'onglet : case du pinceau, rayon, légende des couleurs, bouton « Auto-frame vehicle » (si options.autoFrame existe), liste des nœuds désactivés avec bouton Enable et « Enable all ». | 358 |
| `util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName)` | Dessine une petite sphère de debug sur chaque nœud du véhicule, colorée selon son état (ignoré, désactivé, rétroviseur, actif). | 499 |
| `util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName)` | Réactive tous les nœuds d'une config (supprime son entrée) avec historique et sauvegarde. | 241 |
| `util_screenshotCreator_nodeOutpaint.finishStroke()` | Termine le coup de pinceau en cours : s'il a modifié des nœuds, enregistre l'action « Paint Thumbnail Framing Nodes » dans l'historique et sauvegarde. | 251 |
| `util_screenshotCreator_nodeOutpaint.getConfigPath()` | Renvoie le chemin du fichier de configuration (/settings/thumbnailNodeOutpaintConfig.json). | 543 |
| `util_screenshotCreator_nodeOutpaint.getControls()` | Renvoie les pointeurs ImGui de l'interface. | 566 |
| `util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create)` | Renvoie la table des nœuds désactivés d'une config ({cid string = nom}). Renvoie une table vide non enregistrée si la config n'existe pas, sauf si create vaut true. | 67 |
| `util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create)` | Raccourci de getDisabledNodes pour une clé de config. | 551 |
| `util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier)` | Cherche un nœud du véhicule par clé (cid en string), par nom ou par cid. | 162 |
| `util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle)` | Liste tous les nœuds physiques du véhicule avec leur position monde et leurs marques. Lance au premier appel le selfCheck de détection de rétroviseurs. | 118 |
| `util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName)` | Calcule la clé « modèle/config » d'un véhicule, à partir de son jbeam et de explicitConfigName ou de vehicle.partConfig (normalisé). | 36 |
| `util_screenshotCreator_nodeOutpaint.isTabActive()` | Indique si l'onglet du pinceau est actif. | 559 |
| `util_screenshotCreator_nodeOutpaint.loadConfig(force)` | Charge le fichier de configuration en mémoire (une seule fois sauf force) ; crée une table vide si le fichier est absent ou invalide. | 45 |
| `util_screenshotCreator_nodeOutpaint.onDeserialized(data)` | Hook après rechargement ; identique à deserialize. *(interne)* *(hook)* | 525 |
| `util_screenshotCreator_nodeOutpaint.onExtensionLoaded()` | Hook : charge la configuration au chargement de l'extension. *(interne)* *(hook)* | 531 |
| `util_screenshotCreator_nodeOutpaint.onExtensionUnloaded()` | Hook : termine le coup de pinceau en cours au déchargement. *(interne)* *(hook)* | 535 |
| `util_screenshotCreator_nodeOutpaint.onSerialize()` | Hook de sérialisation ; identique à serialize. *(interne)* *(hook)* | 518 |
| `util_screenshotCreator_nodeOutpaint.onVehicleSpawned()` | Hook appelé quand un véhicule apparaît : termine le coup de pinceau en cours. *(interne)* *(hook)* | 539 |
| `util_screenshotCreator_nodeOutpaint.redo(actionData)` | Refait une modification : applique actionData.new. Callback d'editor.history. *(interne)* | 188 |
| `util_screenshotCreator_nodeOutpaint.saveConfig()` | Écrit la configuration sur disque (jsonWriteFile, indentée). | 57 |
| `util_screenshotCreator_nodeOutpaint.selfCheck()` | Test par assertions de la détection des rétroviseurs externes. *(interne)* | 104 |
| `util_screenshotCreator_nodeOutpaint.serialize()` | Renvoie {enabled, brushRadius} pour la sauvegarde de l'état. | 518 |
| `util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName)` | Désactive ou réactive un nœud pour une config, avec entrée d'historique annuler/refaire et sauvegarde sur disque. | 222 |
| `util_screenshotCreator_nodeOutpaint.setTabActive(value)` | Force l'état « onglet actif » ; en le désactivant, termine le coup de pinceau en cours. | 428 |
| `util_screenshotCreator_nodeOutpaint.undo(actionData)` | Annule une modification : applique actionData.old. Callback d'editor.history. *(interne)* | 183 |
| `util_screenshotCreator_nodeOutpaint.updateBrush(options)` | Met à jour le pinceau chaque frame : dessine le cercle, colore les nœuds dans la vue 3D (debugDrawer), et pendant un clic gauche désactive les nœuds sous le pinceau (Ctrl : les réactive). Le coup de pinceau est enregistré comme une action d'historique à la fin. | 263 |
| `util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options)` | Alias de updateBrush. | 263 |

### Détail des paramètres

#### `util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot)`

Remplace les nœuds désactivés d'une config par un instantané (ou supprime l'entrée si vide) et sauvegarde. Utilisé par annuler/refaire.

- `configKey` (*string*) : Clé « modèle/config ».
- `snapshot` (*table|nil*) : Table {cid = nom}.
- **renvoie** : boolean false si configKey est nil.

#### `util_screenshotCreator_nodeOutpaint.deserialize(data)`

Restaure l'état du pinceau (accepte aussi les anciennes clés nodeOutpaintEnabled et nodeOutpaintBrushRadius) ; rayon borné à 4..80.

- `data` (*table|nil*) : État sauvegardé.

#### `util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options)`

Dessine en debug 3D les données de cadrage : boîte des bornes (orange), OOBB du véhicule (cyan), centre, point de visée, axes, points de cadrage, nœuds de rétroviseurs et nœuds désactivés, avec libellés. Les options par défaut viennent de settings.getFramingContext().debug.

- `framingData` (*table|nil*) : framingData renvoyé par un mode de cadrage.
- `options` (*table|nil*) : {drawBounds, drawOobb, drawInputs}.

#### `util_screenshotCreator_nodeOutpaint.drawTab(options)`

Dessine le contenu ImGui de l'onglet : case du pinceau, rayon, légende des couleurs, bouton « Auto-frame vehicle » (si options.autoFrame existe), liste des nœuds désactivés avec bouton Enable et « Enable all ».

- `options` (*table|nil*) : {vehicle, configName, autoFrame = function}.

#### `util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName)`

Dessine une petite sphère de debug sur chaque nœud du véhicule, colorée selon son état (ignoré, désactivé, rétroviseur, actif).

- `vehicle` (*table*) : Objet véhicule.
- `explicitConfigName` (*string|nil*) : Nom de config imposé.

#### `util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName)`

Réactive tous les nœuds d'une config (supprime son entrée) avec historique et sauvegarde.

- `vehicleOrKey` (*table|string*) : Véhicule ou clé de config.
- `explicitConfigName` (*string|nil*) : Nom de config imposé.
- **renvoie** : boolean false s'il n'y avait aucun nœud désactivé ou pas de clé.

#### `util_screenshotCreator_nodeOutpaint.getConfigPath()`

Renvoie le chemin du fichier de configuration (/settings/thumbnailNodeOutpaintConfig.json).

- **renvoie** : string Chemin du fichier.

#### `util_screenshotCreator_nodeOutpaint.getControls()`

Renvoie les pointeurs ImGui de l'interface.

- **renvoie** : table {enabled = BoolPtr, brushRadius = FloatPtr}.

#### `util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create)`

Renvoie la table des nœuds désactivés d'une config ({cid string = nom}). Renvoie une table vide non enregistrée si la config n'existe pas, sauf si create vaut true.

- `vehicleOrKey` (*table|string*) : Véhicule ou clé « modèle/config ».
- `explicitConfigName` (*string|nil*) : Nom de config imposé quand le premier argument est un véhicule.
- `create` (*boolean|nil*) : true pour créer et enregistrer en mémoire la table de la config.
- **renvoie** : table<string, string> Nœuds désactivés.

#### `util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create)`

Raccourci de getDisabledNodes pour une clé de config.

- `configKey` (*string*) : Clé « modèle/config ».
- `create` (*boolean|nil*) : true pour créer la table si absente.
- **renvoie** : table<string, string> Nœuds désactivés.

#### `util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier)`

Cherche un nœud du véhicule par clé (cid en string), par nom ou par cid.

- `vehicle` (*table*) : Objet véhicule.
- `nodeIdentifier` (*string|integer*) : Clé, nom ou cid du nœud.
- **renvoie** : table|nil Nœud trouvé (voir getVehicleNodeData), sinon nil.

#### `util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle)`

Liste tous les nœuds physiques du véhicule avec leur position monde et leurs marques. Lance au premier appel le selfCheck de détection de rétroviseurs.

- `vehicle` (*table*) : Objet véhicule.
- **renvoie** : table[] Tableau de {cid, key, name, ignoreForThumbnailFraming, automaticMirrorOutpaint, point (vec3 monde)}.

#### `util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName)`

Calcule la clé « modèle/config » d'un véhicule, à partir de son jbeam et de explicitConfigName ou de vehicle.partConfig (normalisé).

- `vehicle` (*table*) : Objet véhicule.
- `explicitConfigName` (*string|nil*) : Nom de config imposé (prioritaire sur partConfig).
- **renvoie** : string|nil Clé « modèle/config », nil si le modèle ou la config manque.
- **renvoie** : string|nil Nom du modèle.
- **renvoie** : string|nil Nom de config normalisé.

#### `util_screenshotCreator_nodeOutpaint.isTabActive()`

Indique si l'onglet du pinceau est actif.

- **renvoie** : boolean tabActive.

#### `util_screenshotCreator_nodeOutpaint.loadConfig(force)`

Charge le fichier de configuration en mémoire (une seule fois sauf force) ; crée une table vide si le fichier est absent ou invalide.

- `force` (*boolean|nil*) : true pour relire le fichier même s'il est déjà chargé.
- **renvoie** : table Config {configs = {...}}.

#### `util_screenshotCreator_nodeOutpaint.onDeserialized(data)`

Hook après rechargement ; identique à deserialize.

- `data` (*table|nil*) : État sauvegardé.

#### `util_screenshotCreator_nodeOutpaint.onSerialize()`

Hook de sérialisation ; identique à serialize.

- **renvoie** : table État.

#### `util_screenshotCreator_nodeOutpaint.redo(actionData)`

Refait une modification : applique actionData.new. Callback d'editor.history.

- `actionData` (*table*) : {configKey, old, new}.

#### `util_screenshotCreator_nodeOutpaint.saveConfig()`

Écrit la configuration sur disque (jsonWriteFile, indentée).

- **renvoie** : boolean Résultat de jsonWriteFile.

#### `util_screenshotCreator_nodeOutpaint.selfCheck()`

Test par assertions de la détection des rétroviseurs externes.

- **renvoie** : boolean Toujours true (sinon une assertion échoue).

#### `util_screenshotCreator_nodeOutpaint.serialize()`

Renvoie {enabled, brushRadius} pour la sauvegarde de l'état.

- **renvoie** : table État du pinceau.

#### `util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName)`

Désactive ou réactive un nœud pour une config, avec entrée d'historique annuler/refaire et sauvegarde sur disque.

- `vehicleOrKey` (*table|string*) : Véhicule ou clé de config.
- `node` (*table*) : Nœud (avec key et name), tel que renvoyé par getVehicleNode.
- `disabled` (*boolean*) : true pour désactiver, false pour réactiver.
- `explicitConfigName` (*string|nil*) : Nom de config imposé.
- **renvoie** : boolean true si l'état a changé.

#### `util_screenshotCreator_nodeOutpaint.setTabActive(value)`

Force l'état « onglet actif » ; en le désactivant, termine le coup de pinceau en cours.

- `value` (*boolean*) : true si l'onglet est actif.

#### `util_screenshotCreator_nodeOutpaint.undo(actionData)`

Annule une modification : applique actionData.old. Callback d'editor.history.

- `actionData` (*table*) : {configKey, old, new}.

#### `util_screenshotCreator_nodeOutpaint.updateBrush(options)`

Met à jour le pinceau chaque frame : dessine le cercle, colore les nœuds dans la vue 3D (debugDrawer), et pendant un clic gauche désactive les nœuds sous le pinceau (Ctrl : les réactive). Le coup de pinceau est enregistré comme une action d'historique à la fin.

- `options` (*table|nil*) : {active, workerRunning, vehicle, configName}.

#### `util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options)`

Alias de updateBrush.

- `options` (*table|nil*) : Voir updateBrush.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : ui_imgui, ui_imguiUtils, core_camera, core_vehicle_manager, util_screenshotCreator_settings. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua`.*
