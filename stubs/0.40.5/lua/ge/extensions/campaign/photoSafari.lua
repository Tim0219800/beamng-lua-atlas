---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/photoSafari.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de la mission « photo safari » de la campagne : le joueur doit photographier des lieux. À l'acceptation, un fichier JSON liste les lieux (clés = noms de triggers) avec leurs indices (hints), l'objet cible (objectName) et le trigger closeToPhoto. Les triggers BeamNG (onBeamNGTrigger) débloquent des indices et ouvrent le mode photo ; takepiccheck, appelée par photomode.js, vérifie que la cible est entièrement dans le champ de la caméra et assez proche.
--- Accès : extension `campaign_photoSafari` : `extensions.load("campaign_photoSafari")`, puis la globale `campaign_photoSafari`
---@class campaign_photoSafari
---@field accept boolean Vrai quand la mission a été acceptée et son JSON chargé.
---@field photomodeOpen boolean Vrai quand le joueur est dans le trigger d'un lieu et peut prendre la photo.
---@field targetObj string|nil Nom de l'objet de scène à photographier.
campaign_photoSafari = {}

--- Charge le fichier JSON de la mission (jsonReadFile), met accept à true, remet à zéro indices, lieux trouvés et vus, et mémorise les hints de chaque lieu. Ne fait rien si le fichier n'existe pas.
---Source : lua/ge/extensions/campaign/photoSafari.lua:22
---@param file string Chemin du JSON de la mission photo safari.
function campaign_photoSafari.missionaccepted(file) end

--- Hook appelé quand un trigger est franchi. Ignore tout sauf le véhicule du joueur. À l'entrée dans un trigger d'indice : débloque l'indice suivant de chaque lieu non trouvé ; dans un trigger de lieu : mémorise location/targetObj et ouvre le mode photo ; dans closeToPhoto : calcule la distance caméra-objet. À la sortie, referme le mode photo ou closeToPhoto.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/photoSafari.lua:40
---@param data table Données du trigger : subjectID, event ('enter'/'exit'), triggerName.
function campaign_photoSafari.onBeamNGTrigger(data) end

--- Vérifie la photo : refuse si le joueur n'est pas assez proche, sinon teste la distance de la caméra à l'objet et que la boîte englobante de l'objet est entièrement dans le frustum (Engine.sceneGetCameraFrustum). En cas de succès, marque le lieu comme trouvé. Affiche le message résultat.
---Source : lua/ge/extensions/campaign/photoSafari.lua:144
---@return boolean|nil  true si la photo est valide, false sinon, nil si le lieu est déjà trouvé ou si le joueur est trop loin.
function campaign_photoSafari.takepiccheck() end

