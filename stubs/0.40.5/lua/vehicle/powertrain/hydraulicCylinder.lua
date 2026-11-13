---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydraulicCylinder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vérin hydraulique : ce n'est PAS un composant powertrain autonome. C'est un « consommateur » hydraulique créé par hydraulicPump.new pour chaque entrée de `v.data.powertrainHydros` dont `connectedPump` est le nom de la pompe et dont `type` vaut 'hydraulicCylinder'. Le vérin pousse ou tire des poutres (repérées par `beamTags`) via obj:actuateBeam selon la position de la vanne (valeur electrics `directionElectricsName`, -1 à 1) et la pression fournie par la pompe, renvoie à la pompe le débit consommé, supporte plusieurs types de distributeur (float, closed, tandem, drop, bypass), des étages télescopiques et un mode de commande en position (PID).
--- Accès : type de composant powertrain `hydraulicCylinder` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class hydraulicCylinder
hydraulicCylinder = {}

--- Construit un vérin hydraulique : surfaces de piston et de tige (ou étages télescopiques), poutres à actionner depuis les tags beamTags, distributeur, lisseurs, PID de position. Appelée par hydraulicPump.new pour chaque consommateur déclaré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:592
---@param cylinderData table Données du vérin (entrée powertrainHydros fusionnée avec v.data[nom]).
---@param pumpDevice table Device hydraulicPump auquel le vérin est connecté (son nom sert à nommer les clés d'état).
---@return table  Le vérin (classe `cylinder`).
function hydraulicCylinder.new(cylinderData, pumpDevice) end

--- Objet renvoyé par new(cylinderData, pumpDevice). La méthode update change selon le type de distributeur (setValveType).
---@class hydraulicCylinder_cylinder
local hydraulicCylinder_cylinder = {}

--- Renvoie l'étage actif du vérin pour l'extension courante. Version conventionnelle : toujours le premier étage. Version télescopique : étage brut, avec surfaces interpolées si c'est une transition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:94
---@return table  Étage {stageExtendStart, stageExtendEnd, cylinderExtendArea, shaftArea, cylinderContractArea, regenAreaRatio, invRegenAreaRatio, cylinderActiveArea}.
function hydraulicCylinder_cylinder:getCylinderStage() end

--- Cherche dans la liste des étages celui qui contient l'extension courante, en partant de l'étage courant (recherche locale). Mémorise currentStageId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:40
---@return table  Étage trouvé (le premier par défaut avec un avertissement).
function hydraulicCylinder_cylinder:getRawCylinderStage() end

--- Renvoie l'état sauvegardable : clé '<pompe>_<vérin>_target_position' = extension courante en pourcentage (0..1).
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:563
---@return table  Table stateData.
function hydraulicCylinder_cylinder:getState() end

--- Crée la boucle sonore de mouvement (si movementLoopEvent est défini) et les lisseurs de vitesse et de volume.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:490
---@param cylinderData table Données du vérin (clés movementLoop*).
function hydraulicCylinder_cylinder:initSounds(cylinderData) end

--- Remet à zéro vitesse, lisseurs, position de vanne, mode (direct), position cible (position courante), PID, étage courant et réinitialise les valeurs electrics d'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:520
---@param jbeamData table Données du vérin (non utilisées ici).
function hydraulicCylinder_cylinder:reset(jbeamData) end

--- Remet à zéro le lisseur de vitesse du son de mouvement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:516
---@param cylinderData table Données du vérin (non utilisées).
function hydraulicCylinder_cylinder:resetSounds(cylinderData) end

--- Restaure la position cible (nombre fini, borné à 0..1) depuis data['<pompe>_<vérin>_target_position'] et passe en mode 'position' si l'écart dépasse la zone morte, sinon en mode 'direct'.
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:568
---@param data table|nil Table d'état produite par getState.
function hydraulicCylinder_cylinder:setState(data) end

--- Choisit le type de distributeur : 'float', 'closed', 'tandem', 'drop' ou 'bypass'. Un type invalide journalise une erreur et installe une fonction update vide.
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:399
---@param valveType string Type de distributeur.
function hydraulicCylinder_cylinder:setValveType(valveType) end

--- Appelée par la pompe à chaque pas physique (consumer:update). Calcule la force du vérin depuis la pression d'entrée et la surface active, actionne chaque poutre (obj:actuateBeam) avec limite de vitesse, force de glissement (pression de décharge) et traînée, met à jour extension, vitesse et débit consommé. Sa version dépend du distributeur : updateFloat, updateClosed, updateTandem, updateDrop, updateBypass ou updateDummy.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:106
---@param inputPressure number Pression d'accumulateur de la pompe en Pa.
---@param dt number Pas de temps en secondes.
---@return number  Débit consommé par le vérin en m³/s (>= 0).
---@return number  Débit renvoyé au réservoir en m³/s (non nul seulement pour tandem).
function hydraulicCylinder_cylinder:update(inputPressure, dt) end

--- Pour un étage de transition : interpole les surfaces entre les deux étages voisins selon l'extension (facteur 0 à 1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:28
---@param stage table Étage de transition à mettre à jour.
function hydraulicCylinder_cylinder:updateBlendedStage(stage) end

--- Appelée à chaque image par la pompe : lit la valeur electrics de direction (ou la position PID en mode position), calcule valvePosition, valveSign, les surfaces actives et le coefficient de traînée, puis publie l'extension et le pourcentage d'extension dans les electrics demandées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:456
---@param dt number Durée de l'image en secondes.
function hydraulicCylinder_cylinder:updateGFX(dt) end

--- Règle le volume de la boucle sonore de mouvement selon la vitesse du vérin (lissée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:478
---@param dt number Durée de l'image en secondes.
function hydraulicCylinder_cylinder:updateSounds(dt) end

--- Choisit la surface active de l'étage : surface d'extension si valveSign >= 0, surface de rétraction sinon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicCylinder.lua:452
---@param stage table Étage à mettre à jour.
function hydraulicCylinder_cylinder:updateStageActiveArea(stage) end

