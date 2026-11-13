---@meta
-- tim19Atlas stub generated from lua/ge/client/lighting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Choisit et active le gestionnaire de lumière (light manager) du jeu. Il charge tous les fichiers init.lua des sous-dossiers de lua/ge/client/lighting/ (advanced, basic, shadowMaps), puis tente d'abord $pref::lightManager, sinon parcourt les noms de la réglage defaultLightManagerNames. Si aucun ne fonctionne, le jeu se ferme avec « Failed to set a light manager! ».
--- Accès : `require("client/lighting")`
---@class client_lighting
local client_lighting = {}

--- Charge les modules d'éclairage et active un light manager via setLightManager ; quitte le jeu avec un message d'erreur si aucun n'est utilisable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting.lua:61
function client_lighting.initLightingSystems() end

--- Même logique que initLightingSystems, appelée par reloadClient.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/lighting.lua:7
function client_lighting.reloadLightingSystems() end

return client_lighting
