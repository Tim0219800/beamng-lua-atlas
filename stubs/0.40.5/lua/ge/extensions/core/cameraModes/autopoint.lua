---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/autopoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet filtre renvoyé par le constructeur. Champs : isFilter, hidden, localOffset (vec3), refNodes {ref,left,back}, smX/smY/smZ (lisseurs).
---@class core_cameraModes_autopoint
local core_cameraModes_autopoint = {}

--- Initialise le filtre : isFilter et hidden à true, localOffset à (0,0,0) et ressort par défaut (rate 5, accel 1). Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/autopoint.lua:8
function core_cameraModes_autopoint:init() end

--- Mémorise les noeuds de référence du véhicule utilisés pour construire la base locale.
---Source : lua/ge/extensions/core/cameraModes/autopoint.lua:21
---@param centerNodeID integer Noeud central (ref)
---@param leftNodeID integer Noeud à gauche (left)
---@param backNodeID integer Noeud à l'arrière (back)
function core_cameraModes_autopoint:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Crée ou recrée les trois lisseurs temporels sigmoïdes (X, Y, Z) en conservant leur valeur courante.
---Source : lua/ge/extensions/core/cameraModes/autopoint.lua:15
---@param rate number Vitesse maximale de variation (unités par seconde)
---@param accel number Accélération du lissage
function core_cameraModes_autopoint:setSpring(rate, accel) end

--- Applique le décalage lissé à data.res.targetPos et oriente data.res.rot vers lui. Appelé par la caméra qui possède ce filtre.
---Source : lua/ge/extensions/core/cameraModes/autopoint.lua:28
---@param data table Données de frame : veh, dt, res {pos, targetPos, rot, fov}
---@return boolean  Toujours true
function core_cameraModes_autopoint:update(data) end

