---@meta
-- tim19Atlas stub generated from lua/vehicle/protocols/outgauge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Protocole UDP OutGauge (compatible Live For Speed) : envoie vitesse, régime, rapport, pression de turbo, températures, carburant, entrées pédales et voyants du véhicule pour des tableaux de bord externes. Chargé par protocols.lua ; adresse, port et fréquence viennent des réglages protocols_outgauge_address, _port, _maxUpdateRate. Utilise le pas graphique (coût faible).
--- Accès : `require("protocols/outgauge")`
---@class protocols_outgauge
local protocols_outgauge = {}

--- Remplit le paquet à partir de electrics.values (vitesse, régime, rapport, turbo, températures, carburant, pédales, voyants).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:84
---@param o cdata Struct C du paquet à remplir (mise à zéro avant l'appel).
---@param dtSim number Temps de simulation accumulé depuis le dernier envoi (non utilisé).
function protocols_outgauge.fillStruct(o, dtSim) end

--- Adresse IP de destination (réglage protocols_outgauge_address).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:19
---@return string  Adresse IP.
function protocols_outgauge.getAddress() end

--- Fréquence maximale d'envoi en Hz (réglage protocols_outgauge_maxUpdateRate).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:21
---@return number  Hz.
function protocols_outgauge.getMaxUpdateRate() end

--- Port UDP de destination (réglage protocols_outgauge_port).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:20
---@return integer  Numéro de port.
function protocols_outgauge.getPort() end

--- Renvoie la définition C du paquet OutGauge (texte passé à ffi.cdef).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:28
---@return string  Corps de la struct C.
function protocols_outgauge.getStructDefinition() end

--- Cherche les contrôleurs de type shiftLights pour savoir si le voyant de changement de rapport est disponible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:13
function protocols_outgauge.init() end

--- Indique que ce protocole est mis à jour dans la boucle graphique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:23
---@return boolean  Toujours false.
function protocols_outgauge.isPhysicsStepUsed() end

--- Réinitialisation du protocole (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols/outgauge.lua:18
function protocols_outgauge.reset() end

return protocols_outgauge
