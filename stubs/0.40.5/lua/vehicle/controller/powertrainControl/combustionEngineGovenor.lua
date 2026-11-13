---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire « régulateur de régime » d'un moteur thermique (le nom du fichier contient la faute « Govenor »). Un PID calcule une commande de gaz pour que le régime du moteur suive une consigne qui varie linéairement de rpmTarget0 à rpmTarget1 selon l'entrée d'accélérateur ; la commande est publiée dans electrics.values.throttleGoverned (ou nom jbeam).
--- Accès : contrôleur `powertrainControl/combustionEngineGovenor` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_powertrainControl_combustionEngineGovenor
---@field type string "auxiliary".
---@field updateFixedStep function|nil Boucle PID, affectée dans init si le moteur est trouvé.
local controller_powertrainControl_combustionEngineGovenor = {}

--- Récupère le moteur, crée le PID, calcule les consignes de vitesse angulaire et les noms d'electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua:33
---@param jbeamData table Données jbeam du contrôleur.
function controller_powertrainControl_combustionEngineGovenor.init(jbeamData) end

--- Réinitialise le PID si le moteur existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua:27
---@param jbeamData table Données jbeam.
function controller_powertrainControl_combustionEngineGovenor.reset(jbeamData) end

return controller_powertrainControl_combustionEngineGovenor
