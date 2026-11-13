---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Alimente l'app « tasks » (liste de tâches en haut à gauche) pendant une livraison libre. Il affiche un en-tête (nom de la livraison), une tâche par objectif actif (placement, playerInVehicle, engineRunning, coupled, unhitched), une tâche groupée « ne pas abîmer la cargaison » pour les objectifs damage, les objectifs de distance quand leur seuil d'alerte est dépassé, et un message d'invite à choisir une route. La liste n'est reconstruite que lorsqu'un hash d'état des objectifs change.
--- Accès : extension `gameplay_freeformDelivery_tasklist` : `extensions.load("gameplay_freeformDelivery_tasklist")`, puis la globale `gameplay_freeformDelivery_tasklist`
---@class gameplay_freeformDelivery_tasklist
---@field dependencies string[] gameplay_freeformDelivery_utils, gameplay_freeformDelivery_routes et core_groundMarkers.
gameplay_freeformDelivery_tasklist = {}

--- Efface l'en-tête, les tâches et les messages de route de l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:409
function gameplay_freeformDelivery_tasklist.cleanup() end

--- Affiche l'app « tasks », vide la liste, réinitialise les caches, envoie l'en-tête (nom de la livraison), construit la liste initiale et le message de route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:314
---@param delivery table Données de livraison (name...).
function gameplay_freeformDelivery_tasklist.setup(delivery) end

--- Appelée chaque frame : met à jour le message d'odomètre, calcule un hash de l'état des objectifs (y compris la progression des objectifs multi-véhicules) et reconstruit la liste si quelque chose a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:345
---@param profiler table|nil Profileur optionnel (méthode add).
function gameplay_freeformDelivery_tasklist.update(profiler) end

--- Retire les anciens messages de route et, s'il existe des routes mais pas de guidage actif (core_groundMarkers.currentlyHasTarget) et que l'invite n'a pas encore été montrée, affiche le message invitant à choisir une route via la grande carte. Appelée par routes.lua.
---Source : lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:122
function gameplay_freeformDelivery_tasklist.updateRouteMessage() end

