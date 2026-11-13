---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/followTheWhiteRabbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit easter egg (référence à Matrix) : une fois chargée, l'extension crée un contexte de console « neo », l'active et affiche un mini jeu d'aventure textuel. Dans ce contexte, la commande « throttle » répond « You crash. Game over. » ; les autres commandes sont ignorées.
--- Accès : extension `util_followTheWhiteRabbit` : `extensions.load("util_followTheWhiteRabbit")`, puis la globale `util_followTheWhiteRabbit`
---@class util_followTheWhiteRabbit
util_followTheWhiteRabbit = {}

--- Hook appelé quand une commande est exécutée dans la console. Ignore tout contexte autre que 'neo' ; pour la commande 'throttle', affiche « You crash. Game over. ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/followTheWhiteRabbit.lua:18
---@param context string Contexte de console actif
---@param cmd string Commande saisie
function util_followTheWhiteRabbit.onConsoleExecuteCommand(context, cmd) end

--- Appelé au chargement de l'extension : désactive l'horodatage des logs de la console, ajoute et active le contexte 'neo' puis affiche le texte d'introduction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/followTheWhiteRabbit.lua:9
function util_followTheWhiteRabbit.onExtensionLoaded() end

