---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/specialTriggers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Déclencheurs spéciaux pilotés par données : relie des BeamNGTrigger (ou zones) à l'affichage/masquage d'objets de scène (TSStatic, lumières PointLight/SpotLight, SimGroup) avec délais, ordre aléatoire et pas aléatoires, et à des commandes Lua (GE ou VM véhicule) à l'entrée/sortie d'un véhicule. Au démarrage du niveau il lit `triggers.json` dans le dossier du niveau. Un moddeur l'utilise pour animer des éclairages ou décors quand le joueur entre dans une zone, sans écrire de Lua. Global : freeroam_specialTriggers.
--- Accès : extension `freeroam_specialTriggers` : `extensions.load("freeroam_specialTriggers")`, puis la globale `freeroam_specialTriggers`
---@class freeroam_specialTriggers
---@field active boolean Interrupteur général : si false, les hooks de triggers sont ignorés.
---@field debugMode boolean Active les logs de debug (changements d'état, fins de délais).
freeroam_specialTriggers = {}

--- Crée un trigger (état initial inactif, activé) avec ses objets liés, ses alias et ses commandes ; calcule pour chaque groupe d'objets le nombre maximal d'enfants (maxIdx).
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:109
---@param key string Nom du trigger ou de la zone.
---@param data table|nil Données (voir notes).
function freeroam_specialTriggers.addTrigger(key, data) end

--- Renvoie la table interne de tous les triggers (y compris les alias).
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:206
---@return table<string, table>  Triggers.
function freeroam_specialTriggers.getTriggers() end

--- Lit un fichier de triggers (par défaut `triggers.json` dans le dossier du niveau courant, via getMissionFilename) et appelle setupTriggers.
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:195
---@param filePath string|nil Chemin du fichier JSON.
function freeroam_specialTriggers.loadTriggers(filePath) end

--- Hook des BeamNGTrigger : traite l'évènement enter/exit/tick d'un trigger connu (useTrigger).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:512
---@param data table {triggerName, event, subjectID}
function freeroam_specialTriggers.onBeamNGTrigger(data) end

--- Hook de fin de niveau : reset(true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:399
function freeroam_specialTriggers.onClientEndMission() end

--- Hook de démarrage de niveau : charge triggers.json du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:395
function freeroam_specialTriggers.onClientStartMission() end

--- Après rechargement Lua : restaure la table des triggers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:525
---@param data table Table renvoyée par onSerialize.
function freeroam_specialTriggers.onDeserialized(data) end

--- Avant rechargement Lua : renvoie {triggers} (voir bug dans les notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:518
---@return table  {triggers = ...}
function freeroam_specialTriggers.onSerialize() end

--- Hook par frame : fait avancer les délais et pas aléatoires de chaque groupe d'objets en temps simulé, applique les états, et appelle onTick (zones) toutes les 0,25 s s'il existe un trigger de type zone.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:403
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function freeroam_specialTriggers.onUpdate(dt, dtSim) end

--- Hook : si un véhicule devient inactif, le retire des triggers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:387
---@param vehId integer Id.
---@param active boolean Nouvel état actif.
function freeroam_specialTriggers.onVehicleActiveChanged(vehId, active) end

--- Hook : retire le véhicule des listes d'occupants de tous les triggers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:377
---@param vehId integer Id du véhicule.
function freeroam_specialTriggers.onVehicleDestroyed(vehId) end

--- Hook de changement de véhicule : envoie un évènement « exit » valide aux triggers pour lesquels le nouveau véhicule est un sujet valide (évite qu'un état reste bloqué).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:362
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
function freeroam_specialTriggers.onVehicleSwitched(oldId, newId) end

--- Supprime un trigger et ses alias ; restaure l'état d'origine des objets liés si useOrigState.
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:155
---@param key string Nom du trigger.
---@param useOrigState boolean|nil Restaurer les objets.
function freeroam_specialTriggers.removeTrigger(key, useOrigState) end

--- Réinitialise : avec useOrigState, supprime tous les triggers en restaurant l'état d'origine des objets ; efface la mémoire des états d'origine.
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:170
---@param useOrigState boolean|nil true pour restaurer les objets.
function freeroam_specialTriggers.reset(useOrigState) end

--- Active/désactive manuellement un trigger (simule un évènement enter/exit valide avec vehId 0, ce qui le maintient actif). Avec instant=true, applique immédiatement l'état aux objets sans délai.
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:313
---@param tName string Nom du trigger.
---@param active boolean|nil Nouvel état ; nil = inverser.
---@param instant boolean|nil Appliquer sans délai.
function freeroam_specialTriggers.setTriggerActive(tName, active, instant) end

--- Remet tout à zéro (reset(true)) puis crée un trigger par entrée de la table de données.
---Source : lua/ge/extensions/freeroam/specialTriggers.lua:184
---@param data table Table nom -> données de trigger (voir notes).
function freeroam_specialTriggers.setupTriggers(data) end

