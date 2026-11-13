---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/tutorial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détermine si les tutoriels de livraison (colis, véhicules, matériaux) sont encore actifs et fournit les listes de tâches du tutoriel pour la page de progression de carrière. Un tutoriel est actif tant que l'XP de la branche correspondante (logistics-delivery, logistics-vehicleDelivery, logistics-materials) vaut 0 ; le résultat est mis en cache et invalidé quand cette XP change, ce qui débloque aussi un succès.
--- Accès : extension `career_modules_delivery_tutorial` : `extensions.load("career_modules_delivery_tutorial")`, puis la globale `career_modules_delivery_tutorial`
---@class career_modules_delivery_tutorial
career_modules_delivery_tutorial = {}

--- Renvoie l'état des tutoriels colis et véhicule : unlocked, isActive et la liste de tâches, pour l'UI.
---Source : lua/ge/extensions/career/modules/delivery/tutorial.lua:114
---@return table  {parcel = {unlocked, isActive, tasks, headerLabel}, vehicle = {…}}.
function career_modules_delivery_tutorial.getTutorialInfo() end

--- Vrai tant que l'XP de logistics-delivery est 0 (résultat mis en cache).
---Source : lua/ge/extensions/career/modules/delivery/tutorial.lua:25
---@return boolean  Tutoriel de colis actif.
function career_modules_delivery_tutorial.isCargoDeliveryTutorialActive() end

--- Vrai tant que l'XP de logistics-materials est 0 (mis en cache).
---Source : lua/ge/extensions/career/modules/delivery/tutorial.lua:39
---@return boolean  Tutoriel de matériaux actif.
function career_modules_delivery_tutorial.isMaterialsDeliveryTutorialActive() end

--- Vrai tant que l'XP de logistics-vehicleDelivery est 0 (mis en cache).
---Source : lua/ge/extensions/career/modules/delivery/tutorial.lua:32
---@return boolean  Tutoriel de livraison de véhicules actif.
function career_modules_delivery_tutorial.isVehicleDeliveryTutorialActive() end

--- Hook appelé à l'activation de la carrière : mémorise les extensions de livraison utilisées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/tutorial.lua:8
function career_modules_delivery_tutorial.onCareerActivated() end

--- Hook de la page de progression : remplit tasklistData.headerLabel et tasklistData.tasks ({label, description, done}) pour 'delivery-introduction' (installer un conteneur, charger un colis du tutoriel, livrer), 'vehicle-delivery-introduction' (récupérer le véhicule, livrer) ou 'materials-introduction'. Si le tutoriel est terminé, une seule tâche « terminé » est renvoyée.
---Source : lua/ge/extensions/career/modules/delivery/tutorial.lua:132
---@param tasklistData table Table à remplir.
---@param tasklistId string 'delivery-introduction', 'vehicle-delivery-introduction' ou 'materials-introduction'.
function career_modules_delivery_tutorial.onCareerProgressPageGetTasklistData(tasklistData, tasklistId) end

--- Hook appelé quand des attributs du joueur changent : invalide le cache du tutoriel concerné et débloque le succès associé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/tutorial.lua:46
---@param change table<string, number> Attributs modifiés (clés logistics-delivery, logistics-vehicleDelivery, logistics-materials).
---@param reason any Raison du changement (non utilisée).
function career_modules_delivery_tutorial.onPlayerAttributesChanged(change, reason) end

