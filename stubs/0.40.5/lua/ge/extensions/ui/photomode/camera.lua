---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra du mode photo : FOV, vitesse de la caméra libre, roulis, exposition (auto ou EV manuel), mouvement lissé, visibilité des nœuds fixes du NodeGrabber, signets de caméra (absolus dans le monde ou relatifs au véhicule du joueur) et presets de caméra. Le module passe par core_camera (via ui_photomode_shared.getCoreCameraFunction) et par commands.setFreeCamera pour basculer en caméra libre, et mémorise l'état d'entrée pour le restaurer à la sortie du mode photo. Il sert de backend au panneau caméra de l'UI du mode photo.
--- Accès : extension `ui_photomode_camera` : `extensions.load("ui_photomode_camera")`, puis la globale `ui_photomode_camera`
---@class ui_photomode_camera
---@field dependencies string[] {"ui_photomode_shared"}
ui_photomode_camera = {}

--- Passe en caméra libre au début de la session (sauf si la caméra d'entrée est « path » ou si la caméra libre est déjà active) et note qu'il faudra restaurer la caméra d'entrée à la sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/camera.lua:485
function ui_photomode_camera.activateSessionFreeCamera() end

--- Applique un preset de caméra : refuse un preset de scène d'un autre niveau (preset_level_mismatch), restaure le signet ou applique FOV et roulis, puis vitesse, lissage et exposition.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1225
---@param state table État de preset
---@return table  {state} ou {ok = false, reason}
function ui_photomode_camera.applyPresetState(state) end

--- Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : pos, rot, fov, speed, yawDeg, pitchDown, rollDeg.
---Source : lua/ge/extensions/ui/photomode/camera.lua:784
---@return table  Données de caméra
function ui_photomode_camera.buildMetadataState() end

--- Construit l'état de la caméra : sessionActive, disponibilité des signets, availability (exposure, nodeGrabber, smoothMovement), pos, rot, fov, speed, yawDeg, pitchDown, rollDeg, autoExposure, manualEV, nodeGrabberVisible, smoothMovement.
---Source : lua/ge/extensions/ui/photomode/camera.lua:751
---@return table  État de la caméra
function ui_photomode_camera.buildState() end

--- Preset « par défaut » construit à partir de l'état capturé à l'entrée de la session (fov, roulis, vitesse, lissage, exposition, levelId), ou nil si aucune session n'a été capturée.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1207
---@return table|nil  État par défaut
function ui_photomode_camera.captureDefaultPresetState() end

--- Mémorise la visibilité des nœuds fixes du NodeGrabber puis les masque pour la session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/camera.lua:436
function ui_photomode_camera.captureNodeGrabberRestoreState() end

--- État de caméra à enregistrer dans un preset. Type « vehicle » : signet relatif au véhicule (nil s'il est indisponible) ; type « scene » (défaut) : position absolue et levelId. Inclut aussi speed, smoothMovement, autoExposure, manualEV.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1170
---@param options table|nil {cameraPresetType = "vehicle"|"scene"}
---@return table|nil  État du preset
function ui_photomode_camera.capturePresetState(options) end

--- Capture l'état de la caméra à l'entrée de la session (pos, rot, fov, vitesse, roulis, lissage, exposition, nom de la caméra active). Appelée au début d'une session du mode photo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/camera.lua:467
function ui_photomode_camera.captureRestoreState() end

--- Renvoie l'état courant de la caméra (identique à buildState).
---Source : lua/ge/extensions/ui/photomode/camera.lua:1166
---@return table  État de la caméra
function ui_photomode_camera.getCameraState() end

--- Convertit les objets CameraBookmark de la scène (scenetree.findClassObjects) en presets temporaires de type camera (id __cameraBookmark_<id>, source cameraBookmark, position absolue). Liste vide si l'API est indisponible.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1314
---@return table[]  Presets temporaires
function ui_photomode_camera.getTemporaryPresetList() end

--- Remet les valeurs par défaut : mouvement lissé coupé, vitesse 15, roulis 0, exposition automatique avec EV manuel 10. Passe en caméra libre si nécessaire.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1129
---@return table  {state} ou {ok = false, reason}
function ui_photomode_camera.resetCameraDefaults() end

--- Déplace la caméra libre vers un signet (absolu : pos, rot, fov ; ou relatif : offset, rotOffset, fov calculés par rapport au véhicule joueur). Bascule en caméra libre si besoin. Accepte un signet {camera = {...}} ou directement le contenu.
---Source : lua/ge/extensions/ui/photomode/camera.lua:985
---@param bookmark table Signet absolu ou relatif
---@return table  {state} ou {ok = false, reason}
function ui_photomode_camera.restoreCameraBookmark(bookmark) end

--- Rétablit la visibilité des nœuds fixes mémorisée au début de la session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/camera.lua:452
function ui_photomode_camera.restoreNodeGrabberState() end

--- Restaure le signet absolu enregistré.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1106
---@return table  Résultat de restoreCameraBookmark, ou {ok = false, reason = "bookmark_unavailable"}
function ui_photomode_camera.restoreSavedFreeCameraBookmark() end

--- Restaure le signet relatif au véhicule enregistré ; l'efface s'il est invalide.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1117
---@return table  Résultat de restoreCameraBookmark, ou {ok = false, reason = "bookmark_unavailable"}
function ui_photomode_camera.restoreSavedRelativeCameraBookmark() end

--- Replace la caméra libre à la position/rotation (et FOV) capturées au début de la session.
---Source : lua/ge/extensions/ui/photomode/camera.lua:797
---@return table  {state} ou {ok = false, reason}
function ui_photomode_camera.restoreSessionCameraTransformState() end

--- Restaure le mode de caméra d'entrée, le FOV, la vitesse, le roulis, le lissage et l'exposition capturés. Appelée à la fin de la session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/camera.lua:703
function ui_photomode_camera.restoreState() end

--- Enregistre la position actuelle de la caméra comme signet de session : un signet absolu, et un signet relatif au véhicule joueur s'il est calculable.
---Source : lua/ge/extensions/ui/photomode/camera.lua:899
---@return table  {state} ou {ok = false, reason = "camera_state_unavailable", state}
function ui_photomode_camera.saveCurrentCameraBookmark() end

--- Modifie l'exposition de la caméra : autoExposure (booléen) et/ou manualEV (-20 à 20).
---Source : lua/ge/extensions/ui/photomode/camera.lua:930
---@param partialState table {autoExposure?, manualEV?}
---@return table  {state} ou {ok = false, reason, state}
function ui_photomode_camera.setCameraExposureState(partialState) end

--- Règle le FOV (borné à 10-120 degrés). Utilise la caméra libre (id 0) ou le véhicule joueur. Refusé avec la caméra « path ».
---Source : lua/ge/extensions/ui/photomode/camera.lua:914
---@param value number FOV en degrés
---@return table  {value} en cas de succès, sinon {ok = false, reason, value}
function ui_photomode_camera.setCameraFov(value) end

--- Règle le roulis de la caméra libre (-90 à 90 degrés) en conservant lacet et tangage actuels.
---Source : lua/ge/extensions/ui/photomode/camera.lua:969
---@param value number Roulis en degrés
---@return table  {value} ou {ok = false, reason, value}
function ui_photomode_camera.setCameraRoll(value) end

--- Active ou coupe le mouvement lissé de la caméra libre (réglage cameraFreeSmoothMovement) et prévient l'UI des réglages.
---Source : lua/ge/extensions/ui/photomode/camera.lua:1349
---@param value boolean|table Booléen, ou table dont le champ smoothMovement est lu
---@return table  {value, state} ou {ok = false, reason, state}
function ui_photomode_camera.setCameraSmoothMovement(value) end

--- Règle la vitesse de déplacement de la caméra (bornée à 2-300).
---Source : lua/ge/extensions/ui/photomode/camera.lua:953
---@param value number Vitesse de la caméra
---@return table  {value} ou {ok = false, reason, value}
function ui_photomode_camera.setCameraSpeed(value) end

--- Affiche ou masque les nœuds fixes du NodeGrabber (Engine.NodeGrabber_setFixedNodesVisible).
---Source : lua/ge/extensions/ui/photomode/camera.lua:1329
---@param value boolean|table Booléen, ou table dont le champ nodeGrabberVisible est lu
---@return table  {value, state} ou {ok = false, reason, state}
function ui_photomode_camera.setNodeGrabberVisible(value) end

