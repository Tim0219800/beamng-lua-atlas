---@meta
-- tim19Atlas stub generated from lua/vehicle/particlefilter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre d'émission de particules lors des collisions de noeuds. main.lua remplit la table partagée particlefilter.particleData à chaque onNodeCollision puis appelle nodeCollision(p) : si la vitesse perpendiculaire dépasse un seuil lié à la profondeur de pénétration, il cherche dans la table des règles de particules (particles.getMaterialsParticlesTable, issue de particles.json) les règles correspondant à la paire de matériaux et, pour celles dont compareFunc(p) est vrai, émet les particules via obj:addParticleVelWidthTypeCount.
--- Accès : globale `particlefilter`
---@class particlefilter
---@field particleData table Table réutilisée (évite des allocations) décrivant la collision courante : id1 (noeud), pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialID1, materialID2. Remplie par main.lua:onNodeCollision.
particlefilter = {}

--- Évalue une collision de noeud et émet des particules si le seuil de vitesse est dépassé et si une règle de la paire de matériaux accepte (compareFunc). Appelée par main.lua:onNodeCollision à chaque collision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/particlefilter.lua:25
---@param p table Données de collision au format de particleData.
function particlefilter.nodeCollision(p) end

