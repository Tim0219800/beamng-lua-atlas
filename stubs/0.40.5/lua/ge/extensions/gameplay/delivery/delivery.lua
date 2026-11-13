---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/delivery/delivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet livraison renvoyé par le constructeur du module. Champs : vehId, state ('disabled' au départ), timer (s), events, pickup {pos, radius}, locations, roundtripDistance (m), locationIndex, failReason, sites, baseTime, timePerKm.
---@class gameplay_delivery_delivery
local gameplay_delivery_delivery = {}

--- Calcule la distance en mètres du trajet ramassage -> lieux dans l'ordre -> ramassage, en additionnant la longueur des chemins sur le graphe routier et les distances au point de route le plus proche.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:66
---@return number  Distance totale en mètres.
function gameplay_delivery_delivery:calculateRoundtrip() end

--- Teste l'échec : dégâts supérieurs à maxDamage (failReason 'damage') ou temps écoulé (failReason 'time') ; le chronomètre ne décroît pas si isPartiallyInsideLocationOneFrame est vrai. En cas d'échec, state = 'failed'.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:137
---@param dt number Delta temps (s).
function gameplay_delivery_delivery:checkFail(dt) end

--- Vide la table d'évènements.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:133
function gameplay_delivery_delivery:clearEvents() end

--- Retourne le lieu de livraison courant, uniquement en état 'active'.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:165
---@return table|nil  Lieu (objet de sites), nil sinon.
function gameplay_delivery_delivery:getCurrentLocation() end

--- Facteur de récompense proportionnel à l'avancement : ((locationIndex - 1) / nombre de lieux) × locationRewardFactor (0.5).
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:26
---@return number  Facteur entre 0 et 0.5 ; 0 s'il n'y a pas de lieux.
function gameplay_delivery_delivery:getCurrentRewardFactor() end

--- Initialise l'état (disabled, timer 0, listes vides) et les paramètres d'échec. Appelée par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:7
function gameplay_delivery_delivery:init() end

--- Valide la livraison courante : lève l'évènement proceedDelivery et passe au lieu suivant ; après le dernier, passe à l'état 'return'.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:114
---@return boolean  true si toutes les livraisons sont faites (état 'return').
function gameplay_delivery_delivery:proceedDelivery() end

--- Choisit count lieux de self.sites.locations dont customFields.tags contient le tag ; mélange la liste s'il y en a plus que count.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:40
---@param tag string Tag recherché dans customFields.tags.
---@param count integer Nombre de lieux à choisir.
---@return table  Lieux choisis (voir notes sur les cas limites).
function gameplay_delivery_delivery:selectLocations(tag, count) end

--- Définit les paramètres du temps imparti.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:95
---@param baseTime number Temps de base en secondes.
---@param timePerKm number Secondes supplémentaires par kilomètre d'aller-retour.
function gameplay_delivery_delivery:setTimeParameters(baseTime, timePerKm) end

--- Prépare la livraison : mémorise sites et point de ramassage, choisit les lieux, calcule la distance et le chronomètre, puis passe à l'état 'start'.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:100
---@param sites table Objet sites avec locations.objects.
---@param pickupPos vec3|table Position de ramassage.
---@param pickupRadius number Rayon de ramassage (m).
---@param tag string Tag des lieux de livraison.
---@param count integer Nombre de livraisons.
function gameplay_delivery_delivery:setup(sites, pickupPos, pickupRadius, tag, count) end

--- Passe à l'état 'active' et sélectionne le premier lieu (locationIndex = 1).
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:109
function gameplay_delivery_delivery:startDelivery() end

--- Mise à jour par image : en état 'active', vérifie les conditions d'échec. Sans effet si l'état est 'disabled'.
---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:124
---@param dt number Delta temps (s).
function gameplay_delivery_delivery:update(dt) end

