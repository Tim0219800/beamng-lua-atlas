---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/nitrousOxideInjection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module d'injection de protoxyde d'azote (NOS) pour un moteur à combustion. Ce n'est PAS un composant powertrain indépendant : il n'exporte pas `new` ; c'est un module à état global dans le fichier (une seule instance par VM véhicule), initialisé par le moteur avec `init(device, data)`. Il lit trois valeurs electrics (armement, forçage, activation), ajoute du couple au moteur (`engine.nitrousOxideTorque`) selon une table par régime, consomme l'énergie des réservoirs `n2o` enregistrés et gère la purge des conduites (particules et son).
--- Accès : type de composant powertrain `nitrousOxideInjection` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_nitrousOxideInjection
---@field isActive boolean true si l'injection est en cours (conditions remplies, liquide présent, pas de purge).
---@field isArmed boolean true si le NOS est armé (electrics nitrousOxideArm >= 1).
---@field isExisting boolean Toujours true : permet de tester si le module de NOS est présent sur le véhicule.
---@field updateGFX function Fonction de mise à jour par image : nop jusqu'à init, puis la vraie fonction. Appelée par le moteur après avoir préparé nitrousOxideTorque.
---@field updateSounds function Fonction son : nop (la vraie fonction est vide).
local powertrain_nitrousOxideInjection = {}

--- Renvoie la table du couple additionnel (N·m) par tr/min de la courbe de couple du moteur (indexée comme torqueCurve, k+1), sans condition d'activation. Sert à tracer la courbe de couple avec NOS.
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:259
---@return table<integer, number>  Couple additionnel par régime (N·m).
function powertrain_nitrousOxideInjection.getAddedTorque() end

--- Renvoie le temps de purge restant en secondes (0 si aucune purge).
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:53
---@return number  Secondes restantes.
function powertrain_nitrousOxideInjection.getPurgeTimeRemaining() end

--- Renvoie la moyenne du niveau relatif (remainingRatio, 0..1) des réservoirs enregistrés, ou 0 s'il n'y en a pas. Utile pour une jauge.
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:57
---@return number  Niveau moyen 0..1.
function powertrain_nitrousOxideInjection.getTankRatio() end

--- Initialise le module pour un moteur : construit les tables de couple additionnel par tr/min (montée progressive de cutInStart à cutInRPM), lit les noms electrics, le rapport minimal, les valves de purge. Appelée par le moteur à combustion à l'initialisation ; avec data nil, désactive le module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:193
---@param device table Moteur à combustion (idleRPM, maxRPM, outputAV1, throttle, nitrousOxideTorque, engineVolumeCoef, invBurnEfficiencyCoef…).
---@param data table|nil Données jbeam de NOS (addedPower en kW, cutInRPM, electricsArmName…) ; nil pour désactiver.
function powertrain_nitrousOxideInjection.init(device, data) end

--- Lit l'événement et le volume du son de purge depuis le jbeam. Appelée à l'initialisation des sons du moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:248
---@param data table Données jbeam NOS (purgeSoundEvent, purgeSoundVolume).
function powertrain_nitrousOxideInjection.initSounds(data) end

--- Lance la purge des conduites de NOS pendant purgeTime secondes (particules et son aux valves) s'il y a des valves de purge et du liquide ; sinon remet le temps de purge à 0. Bloque l'injection pendant la purge.
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:49
---@param purgeTime number Durée de la purge en secondes.
function powertrain_nitrousOxideInjection.purgeLines(purgeTime) end

--- Enregistre un réservoir d'énergie (liquide de protoxyde) du moteur pour la consommation du NOS. Appelée par le moteur pour chaque stockage d'énergie du type attendu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:166
---@param storageName string Nom du stockage (energyStorage.getStorage).
function powertrain_nitrousOxideInjection.registerStorage(storageName) end

--- Remet à zéro les états (armement, forçage, purge, réservoirs enregistrés, énergie). Appelée au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:177
function powertrain_nitrousOxideInjection.reset() end

--- Arrête les sons de purge de toutes les valves. Appelée au reset des sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/nitrousOxideInjection.lua:253
function powertrain_nitrousOxideInjection.resetSounds() end

return powertrain_nitrousOxideInjection
