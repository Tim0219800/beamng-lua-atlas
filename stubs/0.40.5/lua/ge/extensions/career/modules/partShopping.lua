---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/partShopping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boutique de pièces de la carrière (écran « personnalisation de pièces » de l'ordinateur du garage). Pour un véhicule de l'inventaire, il génère la liste des pièces compatibles par slot (pièces neuves du JBeam avec leur valeur, plus pièces en stockage de l'inventaire à coût nul), tient un panier (partsIn / partsOut), prévisualise le résultat en refaisant apparaître le véhicule avec les pièces choisies, ajoute automatiquement les pièces nécessaires dans les sous-slots, retire les pièces devenues incompatibles et applique l'achat (paiement, mise à jour de l'inventaire de pièces, sauvegarde).
--- Accès : extension `career_modules_partShopping` : `extensions.load("career_modules_partShopping")`, puis la globale `career_modules_partShopping`
---@class career_modules_partShopping
---@field dependencies table<integer, string> Extensions chargées avant : career_career, gameplay_achievement.
career_modules_partShopping = {}

--- Valide l'achat : ne fait rien si le joueur ne peut pas payer le total TTC. Sinon remplace le véhicule de l'inventaire par la prévisualisation, déplace les pièces retirées en stockage, ajoute/met à jour les pièces installées, paie (tags partsBought, buying), sauvegarde le véhicule, joue le son et émet onPartShoppingTransactionComplete.
---Source : lua/ge/extensions/career/modules/partShopping.lua:972
function career_modules_partShopping.applyShopping() end

--- Annule la session : émet onPartShoppingCancelled, refait apparaître le véhicule d'origine (spawnVehicle option 2) et ferme le menu.
---Source : lua/ge/extensions/career/modules/partShopping.lua:910
function career_modules_partShopping.cancelShopping() end

--- Titre de fil d'Ariane pour la route de catégorie : « pièces de cargo » pour category == "cargo", sinon « toutes les pièces ».
---Source : lua/ge/extensions/career/modules/partShopping.lua:1000
---@param category string Paramètre de route category.
---@return string  Titre traduit.
function career_modules_partShopping.getCategoryBreadcrumbTitle(category) end

--- Renvoie la liste des pièces proposées (partsInShop).
---Source : lua/ge/extensions/career/modules/partShopping.lua:1020
---@return table[]  Pièces de la boutique.
function career_modules_partShopping.getPartsInShop() end

--- Renvoie le panier {partsIn, partsOut, partsInList, partsOutList, slotList, taxes, total}.
---Source : lua/ge/extensions/career/modules/partShopping.lua:1024
---@return table  Panier.
function career_modules_partShopping.getShoppingCart() end

--- Titre de fil d'Ariane pour la route de slot : nom lisible du dernier segment du chemin.
---Source : lua/ge/extensions/career/modules/partShopping.lua:1010
---@param slotPath string Paramètre de route slotPath.
---@return string|nil  Nom du slot, nil si inconnu.
function career_modules_partShopping.getSlotBreadcrumbTitle(slotPath) end

--- Ajoute une pièce au panier (sans effet hors session), complète automatiquement les sous-slots vides avec des pièces de l'inventaire ou par défaut, met à jour la prévisualisation et émet onPartShoppingPartInstalled.
---Source : lua/ge/extensions/career/modules/partShopping.lua:855
---@param part table Pièce de la boutique (containingSlot, name, partPath, finalValue...).
function career_modules_partShopping.installPart(part) end

--- Installe la pièce de la boutique identifiée par son partShopId.
---Source : lua/ge/extensions/career/modules/partShopping.lua:870
---@param partShopId integer Identifiant de la pièce dans partsInShop.
function career_modules_partShopping.installPartByPartShopId(partShopId) end

--- Indique si une session d'achat est active.
---Source : lua/ge/extensions/career/modules/partShopping.lua:994
---@return boolean  true si active.
function career_modules_partShopping.isShoppingSessionActive() end

--- Hook de l'ordinateur : ajoute la fonction « personnalisation de pièces » (ordre 1) pour chaque véhicule du garage, désactivée si le véhicule est à réparer, si le véhicule de départ n'est pas acheté ou si career_modules_permissions refuse partBuying/vehicleModification.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partShopping.lua:1028
---@param menuData table Données du menu (computerFacility, vehiclesInGarage...).
---@param computerFunctions table Fonctions à compléter (vehicleSpecific[inventoryId]).
function career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions) end

--- Cycle de vie du routeur UI : mémorise la sélection (catégorie, slot, panneau) déduite de la route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partShopping.lua:445
---@param context any Contexte du routeur.
---@param toRoute table Route cible (name, params).
---@param fromRoute any Route précédente.
---@param data table routeData.
function career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data) end

--- Cycle de vie du routeur UI : renormalise la sélection puis envoie les données de la boutique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partShopping.lua:451
---@param context any Contexte du routeur.
---@param toRoute table Route cible.
---@param fromRoute any Route précédente.
---@param data table routeData.
function career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook : une fois la sauvegarde du véhicule terminée après un achat, ferme le menu si la fermeture était différée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partShopping.lua:922
function career_modules_partShopping.onVehicleSaveFinished() end

--- Retire du panier la pièce du slot donné (restaure la pièce d'origine si elle convient encore au slot).
---Source : lua/ge/extensions/career/modules/partShopping.lua:879
---@param slot string Chemin du slot (containingSlot).
function career_modules_partShopping.removePartBySlot(slot) end

--- Demande à l'UI de quitter l'écran (guihooks partShoppingRequestExit).
---Source : lua/ge/extensions/career/modules/partShopping.lua:918
function career_modules_partShopping.requestExit() end

--- Régénère la boutique et envoie à l'UI (guihooks partShoppingData) : pièces, arbre de slots, panier, noms, liste de recherche, pièces filtrées selon la route, carte slot -> pièce installée et argent du joueur.
---Source : lua/ge/extensions/career/modules/partShopping.lua:414
function career_modules_partShopping.sendShoppingDataToUI() end

--- Crée la laisse capsule entre l'ordinateur et le véhicule ; quand elle est franchie, cancelShopping est appelé.
---Source : lua/ge/extensions/career/modules/partShopping.lua:516
function career_modules_partShopping.setupTether() end

--- Démarre une session pour un véhicule (celui donné, le courant, sinon celui du garage le plus proche). Répare d'abord par l'assurance si le véhicule est abîmé, puis prépare le panier, génère la boutique, pose la laisse, ouvre l'écran et fige le véhicule.
---Source : lua/ge/extensions/career/modules/partShopping.lua:531
---@param inventoryId integer|nil Id d'inventaire du véhicule.
---@param _originComputerId string|nil Id de l'ordinateur d'origine (sert au retour et à la laisse).
function career_modules_partShopping.startShopping(inventoryId, _originComputerId) end

--- Rappel appelé par le véhicule avec ses conditions de pièces après le respawn de prévisualisation : recopie l'arbre de pièces, met à jour le panier, renvoie les données à l'UI et refige le véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/partShopping.lua:456
---@param currentPartConditions table|nil Conditions de pièces lues sur le véhicule.
function career_modules_partShopping.updatePreviewVehicle(currentPartConditions) end

