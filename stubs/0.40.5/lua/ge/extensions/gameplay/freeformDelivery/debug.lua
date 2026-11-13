---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre imgui de debug « Freeform Delivery Debug » du mode de livraison libre. Quand elle est activée (setEnableDebugWindow(true)), elle collecte chaque frame l'état de la livraison courante et affiche des sections : état de la livraison, état du setup, attelages, véhicules, objectifs, zones cibles, itinéraires, places de parking et mise en veille des véhicules. Utile à un moddeur pour déboguer un fichier delivery.json.
--- Accès : extension `gameplay_freeformDelivery_debug` : `extensions.load("gameplay_freeformDelivery_debug")`, puis la globale `gameplay_freeformDelivery_debug`
---@class gameplay_freeformDelivery_debug
---@field dependencies string[] ui_imgui et gameplay_freeformDelivery_utils.
gameplay_freeformDelivery_debug = {}

--- Vide les données de debug collectées.
---Source : lua/ge/extensions/gameplay/freeformDelivery/debug.lua:663
function gameplay_freeformDelivery_debug.clearDebugData() end

--- Indique si la fenêtre de debug est activée.
---Source : lua/ge/extensions/gameplay/freeformDelivery/debug.lua:654
---@return boolean  true si activée.
function gameplay_freeformDelivery_debug.getEnableDebugWindow() end

--- Hook appelé avant le rendu de chaque frame : si la fenêtre est activée, met à jour les données de debug depuis gameplay_freeformDelivery_freeformDelivery puis dessine la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/debug.lua:638
---@param dtReal number Delta temps réel (inutilisé).
---@param dtSim number Delta temps simulé (inutilisé).
---@param dtRaw number Delta temps brut (inutilisé).
function gameplay_freeformDelivery_debug.onPreRender(dtReal, dtSim, dtRaw) end

--- Active ou désactive l'affichage de la fenêtre de debug. La désactivation vide les données collectées.
---Source : lua/ge/extensions/gameplay/freeformDelivery/debug.lua:645
---@param enabled boolean true pour afficher la fenêtre.
function gameplay_freeformDelivery_debug.setEnableDebugWindow(enabled) end

--- Inverse debugWindowOpen et logge le nouvel état ; sans effet visible (voir notes).
---Source : lua/ge/extensions/gameplay/freeformDelivery/debug.lua:658
function gameplay_freeformDelivery_debug.toggleDebugWindow() end

