---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imguiWire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prototype de « câble » ImGui : charge ui_imgui puis remplace chaque fonction de ui_imgui par un wrapper qui, au lieu d'appeler ImGui, enregistre l'appel (nom + arguments) dans un tampon. clear() exécute ensuite tout le tampon via ui_imgui et mémorise les valeurs de retour, qui sont renvoyées au prochain cycle aux appels identiques. Pensé pour envoyer des appels ImGui d'une VM à une autre (commentaires « send buf to GE / GE: execute »).
--- Accès : extension `ui_imguiWire` : `extensions.load("ui_imguiWire")`, puis la globale `ui_imguiWire`
---@class ui_imguiWire
ui_imguiWire = {}

--- Exécute tous les appels ImGui mémorisés dans l'ordre sur ui_imgui, garde les valeurs de retour non vides pour les appels du prochain cycle, puis vide le tampon et le cache d'identifiants.
---Source : lua/common/extensions/ui/imguiWire.lua:61
function ui_imguiWire.clear() end

