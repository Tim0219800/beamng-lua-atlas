---@meta
-- tim19Atlas stub generated from lua/vehicle/guistreams.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flux de données envoyés à l'UI (apps du HUD) à haute fréquence. Chaque flux a un nom (wheelInfo, engineInfo, stats, electrics, sensors, environment, genericGraphAdvanced…) ; l'UI indique ceux dont elle a besoin via setRequiredStreams, et seuls ceux-là sont calculés puis mis en file avec guihooks.queueStream. Accessible en globale `streams` (main.lua : streams = require('guistreams')). guihooks.lua appelle streams.update() lors de l'envoi.
--- Accès : globale `streams`
---@class streams
streams = {}

--- Ajoute une valeur au graphe générique avancé de l'UI (flux 'genericGraphAdvanced'), si ce flux est demandé.
---Source : lua/vehicle/guistreams.lua:151
---@param k string Nom de la série.
---@param val number Valeur courante.
function streams.drawGraph(k, val) end

--- Indique si au moins un flux est demandé (ou si la liste n'a jamais été définie). Utilisé par main.lua:onGraphicsStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:146
---@return boolean  true si des flux sont actifs.
function streams.hasActiveStreams() end

--- Vide les flux demandés et le cache des positions statiques de roues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:21
function streams.reset() end

--- Définit la liste des flux demandés par l'UI (remplace la précédente). Appelée par le moteur/l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:137
---@param state string[] Liste de noms de flux.
function streams.setRequiredStreams(state) end

--- Appelée par guihooks lors de l'envoi des flux : exécute le gestionnaire de chaque flux demandé (ceux de streamsHandlers) qui met ses données en file.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:128
function streams.update() end

--- Indique si un flux doit être envoyé cette frame (flux demandé par l'UI et envoi actif).
---Source : lua/vehicle/guistreams.lua:17
---@param name string Nom du flux.
---@return boolean|nil  Vrai si le flux doit être produit (peut renvoyer nil/false sinon).
function streams.willSend(name) end

--- Table locale (non exportée) des gestionnaires de flux, une fonction sans argument par nom de flux ; update() les appelle.
---@class streams_streamsHandlers
local streams_streamsHandlers = {}

--- Met en file electrics.values.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:100
function streams_streamsHandlers.electrics() end

--- Met en file controller.mainController.engineInfo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:89
function streams_streamsHandlers.engineInfo() end

--- Met en file température et pression ambiantes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:122
function streams_streamsHandlers.environment() end

--- Met en file accélérations, forces de volant, position, roulis/tangage/lacet et gravité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:104
function streams_streamsHandlers.sensors() end

--- Met en file obj:calcBeamStats() complété par tri_count et collidable_tri_count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:93
function streams_streamsHandlers.stats() end

--- Construit et met en file le flux 'wheelInfo' (voir notes pour le format par roue).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/guistreams.lua:26
function streams_streamsHandlers.wheelInfo() end

