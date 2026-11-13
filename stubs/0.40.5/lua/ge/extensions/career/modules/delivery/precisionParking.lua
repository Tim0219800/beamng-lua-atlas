---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/precisionParking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Évalue la précision de stationnement du véhicule du joueur à la destination d'une livraison (colis, matériaux ou véhicule) et applique des bonus ou pénalités de récompenses. Le score (2 à 20) combine l'alignement angulaire, l'écart latéral et l'écart longitudinal du centre de la boîte englobante par rapport à la place de parking ; il donne un niveau perfect/great/good/bad/horrible. Les bonus touchent l'argent, l'XP logistique, l'XP de compétence et la réputation de l'organisation.
--- Accès : extension `career_modules_delivery_precisionParking` : `extensions.load("career_modules_delivery_precisionParking")`, puis la globale `career_modules_delivery_precisionParking`
---@class career_modules_delivery_precisionParking
---@field dependencies table<integer, string> Extensions chargées avant : util_stepHandler.
career_modules_delivery_precisionParking = {}

--- Pour un colis ou des matériaux : évalue le véhicule du joueur à la place targetLocation.psPath et applique le bonus à cargo.rewards (money, logistics-materials ou logistics-delivery, réputation de l'organisation) ; stocke le détail dans cargo.precisionParking.
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:400
---@param cargo table Colis à livrer (rewards, organization, materialType).
---@param targetLocation table Destination contenant psPath, le chemin de la place de parking.
---@return table  Le colis, modifié si le score a pu être calculé.
function career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation) end

--- Pour une livraison de véhicule : calcule la précision à taskData.dropOffPsPath et ajoute le bonus à taskData.adjustedRewards, avec le détail dans taskData.breakdown.precisionParking. Renvoie taskData inchangé si les données manquent.
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:380
---@param taskData table Tâche de livraison avec dropOffPsPath, vehId, originalRewards, adjustedRewards, breakdown et offer.organization.
---@return table  taskData modifié.
function career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData) end

--- Calcule le score de stationnement d'un véhicule par rapport à une place (position, rotation, largeur et longueur optionnelles), selon la logique de parkingPointsNode.lua.
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:64
---@param vehId integer Identifiant du véhicule.
---@param targetParkingSpot table Place de parking avec pos (vec3), rot (quat) et optionnellement width, length.
---@return table|nil  Table avec precisionLevel, totalScore, angle, adjustedAngle, sideDist, forwardDist, sous-scores et tolérances ; nil si le véhicule est introuvable.
function career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot) end

--- Fonction de débogage : renvoie le score de précision d'un véhicule pour une place (le log est commenté dans le code).
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:426
---@param vehId integer Identifiant du véhicule.
---@param targetParkingSpot table Place de parking (pos, rot, width, length).
---@return table|nil  Données de précision.
function career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot) end

--- Convertit un résultat de précision en bonus : montants fixes et pourcentages pour l'argent (positif ou négatif), l'XP logistique, l'XP de compétence (good/great/perfect) et la réputation (bonus great/perfect, pénalité horrible). Sans donnée, renvoie un bonus nul de niveau 'none'.
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:171
---@param precisionData table|nil Résultat de calculateVehiclePrecisionScore.
---@return table  Table avec precisionLevel, totalScore, mesures et champs moneyFlat/Percent, logisticsFlat/Percent, skillFlat/Percent, reputationFlat/Percent.
function career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData) end

--- Renvoie la table de configuration (seuils de score et montants/pourcentages de récompense) pour l'UI ou le débogage.
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:415
---@return table  Table PRECISION_PARKING_CONFIG (référence, non copiée).
function career_modules_delivery_precisionParking.getPrecisionParkingConfig() end

--- Hook appelé à l'activation de la carrière : mémorise les références vers parcelManager, general, generator et vehicleTasks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:9
function career_modules_delivery_precisionParking.onCareerActivated() end

