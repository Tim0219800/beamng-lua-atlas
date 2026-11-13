---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/core/quickAccess.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Proxy côté véhicule du menu radial (quick access) du GE Lua : les modules du véhicule y déclarent des entrées de menu (addEntry), le GE demande la liste (requestItems) puis signale la sélection d'un élément (selectItem). Gère aussi les entrées du régulateur de vitesse (cruise control) et les catégories de base du menu véhicule.
--- Accès : extension `core_quickAccess` : `extensions.load (VM véhicule)("core_quickAccess")`, puis la globale `core_quickAccess`
---@class core_quickAccess
core_quickAccess = {}

--- Ajoute (ou remplace via uniqueID) une entrée de menu pour ce véhicule.
---Source : lua/vehicle/extensions/core/quickAccess.lua:20
---@param _args table Description de l'entrée (voir notes).
---@return boolean  true si ajoutée, false si le niveau est invalide.
function core_quickAccess.addEntry(_args) end

--- Augmente ou diminue la consigne du régulateur d'un cran (1 km/h ou 1 mph) si l'extension cruiseControl est chargée.
---Source : lua/vehicle/extensions/core/quickAccess.lua:181
---@param direction number Positif pour augmenter, négatif pour diminuer (0 et non-nombre sont ignorés).
function core_quickAccess.adjustCruiseSpeed(direction) end

--- Appelé au chargement : ajoute les catégories de base du menu véhicule (aides à la conduite, éclairage, actions rapides, fonctionnalités du véhicule, régulateur de vitesse).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/core/quickAccess.lua:305
function core_quickAccess.onExtensionLoaded() end

--- Hook d'initialisation du véhicule : déclare les entrées du régulateur de vitesse s'il y a des roues motrices.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/core/quickAccess.lua:188
function core_quickAccess.onInit() end

--- Obsolète : écrit une erreur dans le log (utiliser addEntry).
---Source : lua/vehicle/extensions/core/quickAccess.lua:333
function core_quickAccess.registerMenu() end

--- Interface pour le GE : génère l'arbre complet (exécute les generator) et le renvoie au GE via core_quickAccess.vehicleItemsCallback.
---Source : lua/vehicle/extensions/core/quickAccess.lua:102
---@param level string Niveau demandé (le GE reçoit l'arbre complet et le niveau).
---@return boolean  Toujours true.
function core_quickAccess.requestItems(level) end

--- Interface pour le GE : exécute l'action d'une entrée désignée par son id selon que le bouton est enfoncé ou relâché et selon l'index d'action (1 principal, 2 secondaire, 3 tertiaire). Le résultat est renvoyé au GE via vehicleItemSelectCallback.
---Source : lua/vehicle/extensions/core/quickAccess.lua:135
---@param id string Identifiant généré par requestItems.
---@param buttonDown boolean true à l'appui, false au relâchement.
---@param actionIndex integer 1, 2 ou 3.
---@return boolean|any  true, ou le résultat de itemSelectCallback en cas de goto/erreur.
function core_quickAccess.selectItem(id, buttonDown, actionIndex) end

--- Boucle temporaire (valeur nil au repos) qui compte 2 frames avant de notifier le GE d'une demande 'reload'. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/core/quickAccess.lua:dyn
---@param dt number Pas de temps en secondes.
function core_quickAccess.updateGFX(dt) end

