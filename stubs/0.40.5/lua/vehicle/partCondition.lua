---@meta
-- tim19Atlas stub generated from lua/vehicle/partCondition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système d'usure et d'état des pièces du véhicule (kilométrage, intégrité/dommages, état visuel dont la peinture vieillie). Il découvre quelles pièces (parts) contiennent quoi (devices de powertrain, réservoirs, flexbodies, poutres cassables/déformables), appelle powertrain, energyStorage et beamstate pour appliquer ou lire leur condition, et gère des instantanés (snapshots) pour pouvoir remettre le véhicule dans son état de spawn au reset. Le Lua du jeu l'utilise pour sauvegarder et recharger l'état d'un véhicule (garage, carrière) : initConditions à l'apparition, getConditions pour sauvegarder.
--- Accès : globale `partCondition`
---@class partCondition
partCondition = {}

--- Ré-applique un snapshot mémorisé (réinitialise l'état de pose puis initConditions). Erreur loguée si la clé est absente.
---Source : lua/vehicle/partCondition.lua:50
---@param snapshotKey string Nom du snapshot.
function partCondition.applyConditionSnapshot(snapshotKey) end

--- Mémorise l'état courant (getConditions) sous une clé.
---Source : lua/vehicle/partCondition.lua:40
---@param snapshotKey string Nom du snapshot.
function partCondition.createConditionSnapshot(snapshotKey) end

--- Supprime tous les snapshots et la clé de reset.
---Source : lua/vehicle/partCondition.lua:65
function partCondition.deleteConditionSnapshots() end

--- Appel « à l'aveugle » : initialise un état neuf si aucune condition n'a encore été posée (sinon ne fait rien).
---Source : lua/vehicle/partCondition.lua:558
---@param fallbackOdometer number|nil Odomètre de repli.
---@param fallbackIntegrityValue number|nil Intégrité de repli.
---@param fallbackVisualValue number|nil État visuel de repli.
function partCondition.ensureConditionsInit(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue) end

--- Lit l'état courant de toutes les pièces : kilométrage, intégrité (min des sous-systèmes), état visuel (dont peinture) et états détaillés par sous-système, prêts pour être sauvegardés ou repassés à initConditions.
---Source : lua/vehicle/partCondition.lua:489
---@return table|boolean  Table partId -> condition, ou false si rien n'a encore été initialisé.
function partCondition.getConditions() end

--- Renvoie l'odomètre total de la pièce racine (slotType 'main') : valeur de base + distance depuis la pose.
---Source : lua/vehicle/partCondition.lua:262
---@return number  Odomètre de la pièce principale.
function partCondition.getRootPartOdometerValue() end

--- Renvoie la distance parcourue depuis la pose de la condition de la pièce racine (trajet).
---Source : lua/vehicle/partCondition.lua:268
---@return number  Distance du trajet.
function partCondition.getRootPartTripValue() end

--- Applique l'état de chaque pièce du véhicule à partir d'une table sauvegardée (ou un état neuf si nil), via powertrain, energyStorage, beamstate et la peinture, puis crée le snapshot « reset ».
---Source : lua/vehicle/partCondition.lua:515
---@param partsCondition table|nil Table partId -> {odometer, integrityValue, visualValue, integrityState, visualState} ; nil = véhicule neuf.
---@param fallbackOdometer number|nil Odomètre pour les pièces sans donnée (0 par défaut).
---@param fallbackIntegrityValue number|nil Intégrité 0..1 par défaut (1).
---@param fallbackVisualValue number|nil État visuel 0..1 par défaut (1).
---@param defaultPaints table|nil Peintures par défaut (3 entrées) remplaçant celles du jbeam pour une valeur visuelle numérique.
function partCondition.initConditions(partsCondition, fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue, defaultPaints) end

--- Efface les conditions mémorisées et, si un snapshot de reset existe, le ré-applique. Appelée par main.lua au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/partCondition.lua:474
function partCondition.reset() end

--- Applique le même jeu de peintures vieillies à toutes les pièces actives.
---Source : lua/vehicle/partCondition.lua:356
---@param paints table Tableau de 1 à 3 peintures.
---@param paintOdometer number Usure de la peinture.
function partCondition.setAllPartPaints(paints, paintOdometer) end

--- Applique les 3 peintures (couleur de base, rugosité, métal, vernis) aux flexbodies d'une pièce en envoyant des commandes setMeshColor / setMeshPaintData au GE.
---Source : lua/vehicle/partCondition.lua:273
---@param partId string Identifiant (chemin) de la pièce.
---@param paints table Tableau de 3 peintures {baseColor = {r,g,b,a (0..1)}, roughness, metallic, clearcoat, clearcoatRoughness}.
function partCondition.setPartMeshPaints(partId, paints) end

--- Mémorise les peintures d'une pièce (les entrées 2 et 3 copient la 1 si absentes), les vieillit selon l'odomètre de peinture et les applique aux meshes.
---Source : lua/vehicle/partCondition.lua:348
---@param partId string Identifiant de la pièce.
---@param paints table Tableau de 1 à 3 peintures.
---@param paintOdometer number Usure de la peinture (0 = neuve).
function partCondition.setPartPaints(partId, paints, paintOdometer) end

--- Choisit le snapshot appliqué par reset().
---Source : lua/vehicle/partCondition.lua:70
---@param snapshotKey string|nil Clé du snapshot de reset ; nil pour ne rien restaurer.
function partCondition.setResetSnapshotKey(snapshotKey) end

--- Debug : initialise un état de test (odomètre 812812000, intégrité 1, visuel 1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/partCondition.lua:564
function partCondition.testInit() end

--- Debug : charge partConditionTest.json et l'applique avec initConditions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/partCondition.lua:569
function partCondition.testLoad() end

--- Debug : initialise si nécessaire puis écrit getConditions() dans partConditionTest.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/partCondition.lua:575
function partCondition.testSave() end

