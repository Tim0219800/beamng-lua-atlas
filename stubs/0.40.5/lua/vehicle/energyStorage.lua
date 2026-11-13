---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des réservoirs d'énergie du véhicule (carburant, batterie, N2O, air comprimé…). Au init il charge dynamiquement chaque type depuis lua/vehicle/energyStorage/<type>.lua pour chaque entrée de la section jbeam `energyStorage`, enregistre les stockages auprès des périphériques du groupe motopropulseur (device.energyStorage), met à jour `remainingRatio` à chaque frame et relaie les événements de rupture de poutre, d'attelage et de condition de pièce. Un moddeur l'utilise pour retrouver un stockage par son nom (getStorage/getStorageSafe) et lire/modifier son énergie stockée.
--- Accès : globale `energyStorage`
---@class energyStorage
---@field nilStorage table Faux stockage 'magique' créé dans init : toute indexation ou tout appel renvoie lui-même, l'écriture est ignorée. Renvoyé par getStorageSafe quand le nom n'existe pas. Vaut {} (sans métatable) avant le premier init.
---@field updateGFX function Vaut nop (variable globale nop) tant qu'il n'y a aucun stockage ; remplacé dans init par la fonction de mise à jour par frame. (Le .md d'extraction signale nop comme non défini : c'est une globale du moteur.)
energyStorage = {}

--- Appelé par le moteur quand une poutre casse. Si la poutre est un déclencheur d'un stockage, appelle storage:onBreak() et marque le dommage dans damageTracker.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:170
---@param id integer Identifiant (cid) de la poutre cassée.
function energyStorage.beamBroke(id) end

--- Agrège la condition d'intégrité des stockages liés à la pièce (types 'energyStorage:<nom>'). integrityValue est le minimum des valeurs des stockages, integrityState une table par nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:258
---@param partTypeData table<integer, string> Liste de types de pièce, ex. {"energyStorage:mainTank"}.
---@return table  {integrityValue, integrityState, visualValue, visualState}.
---@return boolean  true si au moins un stockage sait fournir une condition d'intégrité.
---@return boolean  Condition visuelle disponible (toujours false).
function energyStorage.getPartCondition(partTypeData) end

--- Renvoie le stockage portant ce nom, ou nil s'il n'existe pas.
---Source : lua/vehicle/energyStorage.lua:214
---@param name string Nom du stockage (champ name du jbeam).
---@return table|nil  Le stockage ou nil.
function energyStorage.getStorage(name) end

--- Comme getStorage mais renvoie nilStorage (objet qui absorbe tous les accès et appels) si le nom est inconnu, avec un log de debug.
---Source : lua/vehicle/energyStorage.lua:218
---@param name string Nom du stockage.
---@return table  Le stockage ou nilStorage.
function energyStorage.getStorageSafe(name) end

--- Renvoie la table de tous les stockages indexée par nom.
---Source : lua/vehicle/energyStorage.lua:210
---@return table<string, table>  Stockages par nom.
function energyStorage.getStorages() end

--- Appelé à l'initialisation du véhicule : découvre les types disponibles, instancie les stockages du jbeam, les enregistre dans les périphériques du powertrain, construit la table des poutres déclencheuses de rupture et crée nilStorage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:30
function energyStorage.init() end

--- Hook appelé quand un coupleur s'attache ; relayé à storage:onCouplerAttached sans attachSpeed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:192
---@param nodeId integer Nœud du coupleur.
---@param obj2id integer Autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param attachSpeed number Vitesse d'attache (non transmise).
---@param attachEnergy number Énergie d'attache.
function energyStorage.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- Hook appelé quand un coupleur se détache ; relayé à storage:onCouplerDetached.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:201
---@param nodeId integer Nœud du coupleur.
---@param obj2id integer Autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param breakForce number Force de rupture.
function energyStorage.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook appelé quand un coupleur trouve un partenaire proche ; relayé à storage:onCouplerFound.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:183
---@param nodeId integer Nœud du coupleur de ce véhicule.
---@param obj2id integer Identifiant de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param nodeDist number Distance entre les deux nœuds (m).
function energyStorage.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist) end

--- Hook de désérialisation (sauvegarde) ; actuellement sans effet (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:278
---@param data table Données sérialisées.
function energyStorage.onDeserialize(data) end

--- Hook de sérialisation : renvoie {nom = storage:serialize()} pour les stockages qui ont serialize().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:289
---@return table<string, any>  Données sérialisées par nom de stockage.
function energyStorage.onSerialize() end

--- Appelé au reset du véhicule : appelle reset() de chaque stockage, remet leur dommage à false dans damageTracker et ré-enregistre les stockages auprès des périphériques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:147
function energyStorage.reset() end

--- Applique la condition de pièce (odomètre, intégrité, visuel) aux stockages liés à la pièce ; si integrity est une table avec la clé energyStorage, la valeur du stockage est prise par son nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage.lua:243
---@param partTypeData table<integer, string> Types de pièce 'energyStorage:<nom>'.
---@param odometer number Odomètre de la pièce (déduit du code).
---@param integrity number|table Intégrité ou table {energyStorage = {nom = valeur}}.
---@param visual any Condition visuelle transmise telle quelle.
function energyStorage.setPartCondition(partTypeData, odometer, integrity, visual) end

