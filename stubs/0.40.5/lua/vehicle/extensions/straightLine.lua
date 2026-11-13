---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/straightLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pilote automatique de direction très simple : un PID corrige la direction pour que le véhicule roule vers un point cible (ou tout droit, 20 m devant sa position initiale). Il envoie la commande via input.event("steering", valeur, 1) à chaque frame. Ne contrôle ni gaz ni frein.
--- Accès : extension `straightLine` : `extensions.load (VM véhicule)("straightLine")`, puis la globale `straightLine`
---@class straightLine
straightLine = {}

--- Hook appelé à l'initialisation du véhicule (extensions.hook('onInit')) : efface la cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/straightLine.lua:59
function straightLine.onInit() end

--- Hook appelé au reset du véhicule ; même fonction que onInit : efface la cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/straightLine.lua:59
function straightLine.onReset() end

--- Active la conduite vers une cible. Sans cible, vise le point situé 20 m devant le véhicule dans la direction actuelle (projetée à l'horizontale). Crée le PID de direction selon le mode.
---Source : lua/vehicle/extensions/straightLine.lua:33
---@param target vec3|nil Position cible ; nil = 20 m droit devant.
---@param mode string "offroad" pour un PID plus agressif, autre valeur pour le PID standard. Ne doit pas être nil.
function straightLine.setTargetDirection(target, mode) end

--- Arrête l'assistance : envoie input.event('steering', 0, 0) et efface la cible.
---Source : lua/vehicle/extensions/straightLine.lua:53
function straightLine.stop() end

--- Appelé à chaque frame graphique via extensions.hook('updateGFX'). Si une cible est définie, calcule l'erreur d'angle et envoie la direction PID par input.event('steering', ...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/straightLine.lua:15
---@param dt number Pas de temps en secondes, passé au PID.
function straightLine.updateGFX(dt) end

