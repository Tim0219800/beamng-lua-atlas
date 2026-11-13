---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/messagesDebugger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre ImGui de débogage des messages à l'écran (événements UI « Message »). Elle permet de composer un message (texte, catégorie, icône, durée en secondes), de l'envoyer par guihooks.message, d'effacer une catégorie ou tous les messages, et d'activer un contournement du TTL côté interface. Utile pour tester l'affichage des messages et des liaisons [action=...].
--- Accès : extension `ui_messagesDebugger` : `extensions.load("ui_messagesDebugger")`, puis la globale `ui_messagesDebugger`
---@class ui_messagesDebugger
---@field dependencies table<integer, string> Extensions chargées avant : ui_imgui.
ui_messagesDebugger = {}

--- Ferme la fenêtre.
---Source : lua/ge/extensions/ui/messagesDebugger.lua:38
function ui_messagesDebugger.hide() end

--- Hook appelé à chaque image ; dessine la fenêtre si elle est ouverte (rien sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/messagesDebugger.lua:42
---@param dtReal number Temps réel écoulé (s), non utilisé.
---@param dtSim number Temps de simulation écoulé (s), non utilisé.
---@param dtRaw number Temps brut écoulé (s), non utilisé.
function ui_messagesDebugger.onUpdate(dtReal, dtSim, dtRaw) end

--- Ouvre la fenêtre « Messages Debugger ».
---Source : lua/ge/extensions/ui/messagesDebugger.lua:37
function ui_messagesDebugger.show() end

--- Inverse l'état d'ouverture de la fenêtre.
---Source : lua/ge/extensions/ui/messagesDebugger.lua:39
function ui_messagesDebugger.toggle() end

