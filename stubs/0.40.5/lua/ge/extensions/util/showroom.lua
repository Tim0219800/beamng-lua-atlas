---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/showroom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire de « showroom » : fait apparaître à la demande un préfabriqué de garage (art/prefabs/garage_simple.prefab) à la position fixe (0, 0, 1000) dans le niveau courant et permet d'y déplacer un véhicule. Le préfabriqué est chargé au premier appel qui a besoin de sa position (moveInside, getPosRot) et déchargé à la fin du niveau (onClientEndMission).
--- Accès : extension `util_showroom` : `extensions.load("util_showroom")`, puis la globale `util_showroom`
---@class util_showroom
util_showroom = {}

--- Renvoie la position et la rotation de l'intérieur du garage (charge le préfabriqué si besoin).
---Source : lua/ge/extensions/util/showroom.lua:39
---@return vec3  Position monde du garage (0, 0, 1000).
---@return quat  Rotation identité (0, 0, 0, 1).
function util_showroom.getPosRot() end

--- Indique si une position est dans le garage (distance au centre < 20 m). Sans argument, utilise la position du véhicule du joueur ou à défaut celle de la caméra.
---Source : lua/ge/extensions/util/showroom.lua:49
---@param pos vec3|nil Position monde à tester.
---@return boolean|nil  true si dedans ; false hors du garage ; nil si le préfabriqué n'est pas chargé.
function util_showroom.isInside(pos) end

--- Charge le garage si nécessaire, place le véhicule à sa position (setPosRot) puis appelle veh:autoplace(false) pour le poser.
---Source : lua/ge/extensions/util/showroom.lua:42
---@param veh table Objet véhicule à déplacer.
function util_showroom.moveInside(veh) end

--- Hook appelé à la fin du niveau : supprime le préfabriqué et recharge la collision (be:reloadCollision).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/showroom.lua:26
function util_showroom.onClientEndMission() end

