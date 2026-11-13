---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/multiShaft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `multiShaft` : répartiteur de couple à N sorties (N = clé jbeam `numberOfOutputPorts`), par exemple pour un pont à plusieurs essieux ou une boîte de transfert à plus de deux sorties. Catégories `shaft` et `differential`. Le couple d'entrée est réparti à parts égales entre les sorties, corrigé par un couplage visqueux qui rapproche les vitesses de sortie de la moyenne. La vitesse d'entrée est la moyenne des vitesses de sortie. Il n'a ni mode, ni gestion des dégâts/usure, ni état sauvegardable.
--- Accès : type de composant powertrain `multiShaft` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_multiShaft
---@field deviceCategories table<string, boolean> {shaft=true, differential=true}.
---@field outputPorts table<integer, boolean> Valeur par défaut du module {[1]=true}, remplacée dans chaque device par {[1..N]=true} selon numberOfOutputPorts.
local powertrain_multiShaft = {}

--- Construit le répartiteur : crée les N ports de sortie, les noms outputAV<i>/outputTorque<i>, les lisseurs de couplage visqueux et la liste requiredExternalInertiaOutputs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/multiShaft.lua:87
---@param jbeamData table Données jbeam du composant (numberOfOutputPorts requis).
---@return table  Le device (classe `device`).
function powertrain_multiShaft.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_multiShaft_device
local powertrain_multiShaft_device = {}

--- Somme les inerties cumulées des N enfants (journalise un avertissement si leurs rapports cumulés diffèrent), puis calcule cumulativeInertia, viscousCoef (si non fourni) et les rapports cumulés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/multiShaft.lua:41
function powertrain_multiShaft_device:calculateInertia() end

--- Remet à zéro vitesses, couples, torqueDiff, lisseurs, mode 'connected' et relit gearRatio et friction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/multiShaft.lua:64
---@param jbeamData table Données jbeam du composant.
function powertrain_multiShaft_device:reset(jbeamData) end

--- Appelée à chaque pas physique : répartit le couple d'entrée (* gearRatio) à parts égales et soustrait le couple visqueux lissé de chaque sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/multiShaft.lua:20
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_multiShaft_device:torqueUpdate(dt) end

--- Appelée après construction du powertrain ; renvoie toujours true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/multiShaft.lua:37
---@return boolean  true.
function powertrain_multiShaft_device:validate() end

--- Appelée à chaque pas physique : inputAV = moyenne des vitesses de sortie * gearRatio, écrit dans le champ de vitesse du parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/multiShaft.lua:10
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_multiShaft_device:velocityUpdate(dt) end

return powertrain_multiShaft
