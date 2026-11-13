---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/loadMapCmd.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_loadMapCmd` : exécute la commande de lancement 'openMap' (lien du type beamng:v1/openMap/{level:"levels/gridmap/info.json",camPos:[x,y,z],camRot:[x,y,z,w]}). Elle attend que le gestionnaire de mods soit prêt, démarre le niveau demandé en freeroam, puis, une fois le monde prêt, place la caméra libre, règle le FOV, l'heure et charge éventuellement une piste (trackBuilder). Le moddeur s'en sert rarement directement, mais peut appeler set() pour ouvrir une carte avec une caméra donnée.
--- Accès : extension `core_loadMapCmd` : `extensions.load("core_loadMapCmd")`, puis la globale `core_loadMapCmd`
---@class core_loadMapCmd
core_loadMapCmd = {}

--- Hook appelé après le démarrage d'un niveau ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:89
function core_loadMapCmd.onClientPostStartMission() end

--- Après un rechargement Lua : restaure le drapeau ignoreStartupCmd.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:133
---@param d table Table renvoyée par onSerialize.
function core_loadMapCmd.onDeserialized(d) end

--- Hook appelé au chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:79
function core_loadMapCmd.onExtensionLoaded() end

--- Hook appelé au déchargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:82
function core_loadMapCmd.onExtensionUnloaded() end

--- Hook émis par core_modmanager quand les mods sont montés : relance la tentative de changement de carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:85
function core_loadMapCmd.onModManagerReady() end

--- Avant un rechargement Lua : renvoie { ignoreStartupCmd = true } pour ne pas rejouer la commande de lancement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:129
---@return table  { ignoreStartupCmd = true }
function core_loadMapCmd.onSerialize() end

--- Hook appelé à chaque frame : retente le changement de carte tant qu'il est en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:93
---@param dtReal number Temps réel écoulé (s), non utilisé.
---@param dtSim number Temps de simulation écoulé (s), non utilisé.
---@param dtRaw number Temps brut (s), non utilisé.
function core_loadMapCmd.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand l'état du monde change. À l'état 2 (monde prêt), applique camPos/camRot (caméra libre), fov, timeOfDay et charge la piste demandée, puis oublie la commande.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/loadMapCmd.lua:97
---@param state integer Étape de chargement ; seule la valeur 2 déclenche l'action.
function core_loadMapCmd.onWorldReadyState(state) end

--- Enregistre une commande d'ouverture de carte et tente de la lancer (la carte démarre dès que la cible existe et que les mods sont prêts).
---Source : lua/ge/extensions/core/loadMapCmd.lua:64
---@param data table|nil Voir notes : { level, camPos, camRot, fov, timeOfDay, track }. nil : ne fait rien.
---@param startCmd boolean|nil Vrai si la commande vient de la ligne de commande de démarrage : ignorée après un rechargement Lua.
function core_loadMapCmd.set(data, startCmd) end

