---@meta
-- tim19Atlas stub generated from lua/vehicle/protocols/motionSim.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Protocole UDP « MotionSim » (format 'BNG1') pour piloter une plateforme de mouvement : envoie position, vitesse, accélération (sans gravité), vecteur haut, angles, vitesses et accélérations angulaires du véhicule joueur. Chargé et géré par protocols.lua (jamais appelé directement). Adresse, port et fréquence viennent des réglages protocols_motionSim_address, _port et _maxUpdateRate. Utilise le pas de physique, donc coûteux mais précis (jusqu'à 2000 Hz).
--- Accès : `require("protocols/motionSim")`
---@class protocols_motionSim
local protocols_motionSim = {}

--- Remplit le paquet avec les valeurs courantes de protocols.lua (position, vitesse, accélération, vecteur haut, angles, vitesses et accélérations angulaires).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:42
---@param o cdata Struct C du paquet à remplir.
---@param dtSim number Temps de simulation accumulé depuis le dernier envoi (non utilisé ici).
function protocols_motionSim.fillStruct(o, dtSim) end

--- Adresse IP de destination, lue dans le réglage protocols_motionSim_address.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:14
---@return string  Adresse IP (par défaut typique 127.0.0.1).
function protocols_motionSim.getAddress() end

--- Fréquence maximale d'envoi en Hz, lue dans le réglage protocols_motionSim_maxUpdateRate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:16
---@return number  Hz.
function protocols_motionSim.getMaxUpdateRate() end

--- Port UDP de destination, lu dans le réglage protocols_motionSim_port.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:15
---@return integer  Numéro de port.
function protocols_motionSim.getPort() end

--- Renvoie la définition C de la structure du paquet (texte passé à ffi.cdef).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:23
---@return string  Corps de la struct C.
function protocols_motionSim.getStructDefinition() end

--- Initialisation du protocole (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:12
function protocols_motionSim.init() end

--- Indique que ce protocole est mis à jour à chaque pas de physique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:18
---@return boolean  Toujours true.
function protocols_motionSim.isPhysicsStepUsed() end

--- Réinitialisation du protocole (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/motionSim.lua:13
function protocols_motionSim.reset() end

return protocols_motionSim
