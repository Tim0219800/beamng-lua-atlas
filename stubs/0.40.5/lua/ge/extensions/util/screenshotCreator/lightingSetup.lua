---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/lightingSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prépare l'éclairage de studio pour les vignettes de véhicules et le remet en état ensuite. Il retrouve dans la scène (scenetree) les objets marqués par le champ dynamique thumbnailRole : des SpotLight (rôles key, fill, rim, top, groundFill, horizonFill) et des TSStatic « lightplane » servant de cartes de réflexion (horizonCard, shoulderCard, topCard, cameraCard). adjust() les place autour du véhicule en fonction de la caméra et de la boîte englobante, règle leur intensité en lux, applique une correction d'exposition, ajuste le SSAO, affiche ou masque le marquage de parking (champ thumbnailLayer = parkingMarkup) et cache les occupants du véhicule. restore() annule tout (transformations, champs de lumière, visibilité).
--- Accès : extension `util_screenshotCreator_lightingSetup` : `extensions.load("util_screenshotCreator_lightingSetup")`, puis la globale `util_screenshotCreator_lightingSetup`
---@class util_screenshotCreator_lightingSetup
---@field dependencies string[] Extensions chargées avant : util_screenshotCreator_settings et util_screenshotCreator_vehicleSetup.
---@field onClientEndMission function Alias de M.restore : restaure l'éclairage à la fin du niveau.
---@field onExit function Alias de M.restore : restaure l'éclairage à la fermeture du jeu.
---@field onExtensionUnloaded function Alias de M.restore : restaure l'éclairage au déchargement de l'extension.
util_screenshotCreator_lightingSetup = {}

--- Met en place l'éclairage de capture pour ce véhicule et cette caméra : projecteurs du rig, cartes de réflexion, SSAO, marquage de parking, masquage des occupants, et activation du masque de rendu des cartes sur la vue principale.
---Source : lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:876
---@param vehicle table Objet véhicule à photographier.
---@param camera table Caméra résolue : {pos = vec3, rot = quat, ...} (résultat du cadrage).
---@return boolean  true si tout a été appliqué, false en cas d'échec (l'état est alors restauré).
function util_screenshotCreator_lightingSetup.adjust(vehicle, camera) end

--- Efface le champ thumbnailLayer de tous les objets de marquage de parking.
---Source : lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:719
---@return integer  Nombre d'objets dont le tag a été effacé.
function util_screenshotCreator_lightingSetup.clearMarkupTags() end

--- Compte les objets de la scène marqués thumbnailLayer = parkingMarkup.
---Source : lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:714
---@return integer  Nombre d'objets de marquage.
function util_screenshotCreator_lightingSetup.getMarkupCount() end

--- Cache temporairement les cartes de réflexion actives (setHidden et setRenderEnabled(false)) pour une capture « Tech ». À rappeler avec restoreReflectionCardsAfterTechCapture.
---Source : lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:295
---@return boolean  false si un masquage est déjà en cours (appel imbriqué) ou en cas d'erreur (visibilité restaurée).
function util_screenshotCreator_lightingSetup.hideReflectionCardsForTechCapture() end

--- Annule tous les changements faits par adjust : masque de vue, SSAO, marquage, occupants, cartes de réflexion et lumières (transformation et champs intensity, innerAngle, outerAngle, range, castShadows). Les états non restaurés sont conservés pour une nouvelle tentative.
---Source : lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:334
---@return boolean  true si tout a été restauré exactement.
function util_screenshotCreator_lightingSetup.restore() end

--- Rétablit la visibilité d'origine des cartes cachées par hideReflectionCardsForTechCapture.
---Source : lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:260
---@return boolean  true si toutes les cartes ont retrouvé leur état.
function util_screenshotCreator_lightingSetup.restoreReflectionCardsAfterTechCapture() end

--- Test interne par assertions sur la géométrie des cartes (direction, transformation, côté arrière, rotation autour de l'axe vertical).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/lightingSetup.lua:548
---@return boolean  Toujours true (sinon une assertion échoue).
function util_screenshotCreator_lightingSetup.selfCheck() end

