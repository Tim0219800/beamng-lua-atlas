---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulicSuspension.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de suspension hydraulique (type "auxiliary") : pilote la longueur de référence de poutres (vérins de suspension) regroupées en groupes nommés. Une pompe virtuelle limite la vitesse d'extension ; la descente se fait à vitesse fixe ; en mode « bleed » la poutre est relâchée (ressort nul, amortissement variable) et suit librement. Il joue aussi les sons de pompe et de décharge. Un moddeur appelle setGroupsPosition / setGroupsBleed / setGroupsMomentaryIncrease depuis des entrées ou d'autres contrôleurs.
--- Accès : contrôleur `hydraulicSuspension` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_hydraulicSuspension
---@field type string "auxiliary".
local controller_hydraulicSuspension = {}

--- Renvoie l'état de toutes les poutres pour la sauvegarde/synchronisation.
---Source : lua/vehicle/controller/hydraulicSuspension.lua:238
---@return table<string, number>  Table d'état (réutilisée).
function controller_hydraulicSuspension.getState() end

--- Construit les groupes de poutres à partir de la table hydraulique jbeam, mémorise les paramètres de pompe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulicSuspension.lua:166
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulicSuspension.init(jbeamData) end

--- Crée les sources sonores de pompe et de décharge sur pumpNode. Appelé par le gestionnaire de contrôleurs lors de l'initialisation des sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulicSuspension.lua:289
---@param jbeamData table Données jbeam du contrôleur.
function controller_hydraulicSuspension.initSounds(jbeamData) end

--- Remet toutes les poutres à leur position d'origine et en mode relâché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulicSuspension.lua:153
function controller_hydraulicSuspension.reset() end

--- Remet à zéro l'état des sons de pompe et de décharge.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulicSuspension.lua:305
function controller_hydraulicSuspension.resetSounds() end

--- Relâche les groupes : bleedCoef > 0 supprime le ressort et laisse la poutre suivre librement ; l'amortissement dépend de 1 - bleedCoef.
---Source : lua/vehicle/controller/hydraulicSuspension.lua:61
---@param groupNames string[] Noms de groupes.
---@param bleedCoef number 0 (pas de relâchement) à 1 (relâchement complet), borné.
function controller_hydraulicSuspension.setGroupsBleed(groupNames, bleedCoef) end

--- Active/désactive l'augmentation continue de la cible des groupes (à la vitesse de base de la pompe) tant que enabled est vrai, dans les limites min/max de chaque poutre.
---Source : lua/vehicle/controller/hydraulicSuspension.lua:77
---@param groupNames string[] Noms de groupes.
---@param enabled boolean Vrai pour monter en continu.
---@param speedCoef number|nil Multiplicateur de vitesse (1 par défaut).
function controller_hydraulicSuspension.setGroupsMomentaryIncrease(groupNames, enabled, speedCoef) end

--- Fixe la position cible de tous les groupes nommés : position 0 = extension min, 1 = extension max de chaque poutre. Désactive le bleed de ces poutres.
---Source : lua/vehicle/controller/hydraulicSuspension.lua:42
---@param groupNames string[] Noms de groupes (groupName dans la table hydraulique).
---@param position number 0..1, interpolation entre min et max de chaque poutre.
---@param speedCoef number|nil Multiplicateur de la vitesse de pompe (1 par défaut).
function controller_hydraulicSuspension.setGroupsPosition(groupNames, position, speedCoef) end

--- Restaure l'état renvoyé par getState (valeurs numériques valides uniquement).
---Source : lua/vehicle/controller/hydraulicSuspension.lua:248
---@param data table|nil Table d'état.
function controller_hydraulicSuspension.setState(data) end

--- Chaque pas physique : fait avancer chaque poutre vers sa position cible à la vitesse de pompe et applique la longueur et le ressort/amortissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulicSuspension.lua:132
---@param dt number Pas de temps (s).
function controller_hydraulicSuspension.updateFixedStep(dt) end

--- Chaque image : gère le son de pompe (volume 0.5, hauteur selon le débit) et le son de décharge selon les poutres relâchées qui raccourcissent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/hydraulicSuspension.lua:95
---@param dt number Pas de temps (s).
function controller_hydraulicSuspension.updateGFX(dt) end

return controller_hydraulicSuspension
