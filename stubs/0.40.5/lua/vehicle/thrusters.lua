---@meta
-- tim19Atlas stub generated from lua/vehicle/thrusters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applique des poussées au véhicule : propulseurs jbeam (section 'thrusters', commandés par une valeur electrics ou en mode 'auto' qui fabrique une poussée proportionnelle à la vitesse relative entre deux noeuds), impulsions de force entre deux noeuds, et accélérations/vitesses imposées à un cluster de noeuds. Un moddeur ou un outil (scénarios, script) s'en sert pour pousser ou lancer un véhicule pendant une durée donnée. Le module n'est actif dans la boucle de physique que lorsqu'il y a quelque chose à appliquer.
--- Accès : globale `thrusters`
---@class thrusters
---@field update function nop, ou la fonction de physique de ce module quand au moins un propulseur, impulsion ou cluster est actif. Appelée à chaque pas de physique. ⚠ nop est un global du jeu.
---@field updateGFX function nop, ou la fonction qui recalcule les poussées commandées par electrics à chaque frame graphique si le véhicule a des thrusters jbeam.
thrusters = {}

--- Impose une accélération linéaire (et angulaire facultative) au cluster de noeuds contenant nodeId pendant dt secondes (obj:applyClusterLinearAngularAccel). Une seule accélération par nodeId à la fois : un nouvel appel remplace l'ancien.
---Source : lua/vehicle/thrusters.lua:124
---@param accel vec3 Accélération linéaire en m/s² (modifiée sur place en fin de durée).
---@param dt number|nil Durée en secondes (lastDt par défaut).
---@param nodeId integer|nil Noeud du cluster (noeud ref par défaut, ou 0).
---@param angularAccel vec3|nil Accélération angulaire en rad/s² (zéro par défaut).
function thrusters.applyAccel(accel, dt, nodeId, angularAccel) end

--- Applique une force constante entre deux noeuds pendant dt secondes ; si l'impulsion existe déjà pour cette paire de noeuds, met à jour sa force et sa durée.
---Source : lua/vehicle/thrusters.lua:95
---@param n1 integer Noeud (cid) auquel la force est appliquée en premier.
---@param n2 integer Noeud (cid) de l'autre extrémité.
---@param force number Force en N (obj:applyForce(n1, n2, force)).
---@param dt number Durée en secondes (à fournir : voir bug dans notes).
function thrusters.applyImpulse(n1, n2, force, dt) end

--- Comme applyImpulse mais entre le noeud ref et le noeud back du véhicule (refNodes[0].ref et .back), c'est-à-dire selon l'axe longitudinal du châssis.
---Source : lua/vehicle/thrusters.lua:109
---@param force number Force en N.
---@param dt number Durée en secondes.
function thrusters.applyImpulseBody(force, dt) end

--- Fait atteindre une vitesse donnée au cluster en une durée dt, en appliquant l'accélération (velocity - vitesse actuelle hors roues) / dt. Ne fait rien si dt vaut 0.
---Source : lua/vehicle/thrusters.lua:137
---@param velocity vec3 Vitesse cible en m/s.
---@param dt number|nil Durée en secondes (lastDt par défaut).
---@param nodeId integer|nil Noeud du cluster (noeud ref par défaut).
function thrusters.applyVelocity(velocity, dt, nodeId) end

--- Renvoie la durée restante d'une accélération appliquée par applyAccel/applyVelocity sur ce noeud.
---Source : lua/vehicle/thrusters.lua:132
---@param nodeId integer Noeud du cluster.
---@return number  Durée restante en secondes (0 s'il n'y en a pas).
function thrusters.getAccelDt(nodeId) end

--- Charge les propulseurs jbeam du véhicule (séparés en auto et commandés), remet à zéro les impulsions et choisit update/updateGFX. Si le véhicule n'a pas de thrusters, met les deux à nop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/thrusters.lua:148
function thrusters.init() end

--- Indique si le module est actuellement appelé à chaque pas de physique (M.update == update).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/thrusters.lua:144
---@return boolean  true s'il y a des poussées en cours.
function thrusters.isPhysicsStepUsed() end

--- Identique à init (M.reset = init) : réinitialise les propulseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/thrusters.lua:148
function thrusters.reset() end

