---@meta
-- tim19Atlas stub generated from lua/ge/client/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Initialisation du client graphique (portage de client.cs de Torque). initClient prépare le rendu (postFx, renderManager, systèmes d'éclairage), crée les contrôles GameViewportCtrl « OnlyGui » et CefGui « maincef » (interface web), charge les datablocks (core/art/datablocks, art, assets) puis affiche le menu principal. reloadClient ne recharge que les systèmes d'éclairage et les post-effets.
--- Accès : `require("client/init")`
---@class client_init
local client_init = {}

--- Séquence complète d'initialisation du client : rendu de base, contrôles GUI, datablocks, audioData.cs s'il existe, puis loadMainMenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/init.lua:164
function client_init.initClient() end

--- Affiche le contrôle « OnlyGui » comme contenu du canvas (menu principal), si les deux objets existent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/init.lua:89
function client_init.loadMainMenu() end

--- Recharge les systèmes d'éclairage et les post-effets (reloadLightingSystems, reloadPostEffects), utile après un changement de configuration graphique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/init.lua:193
function client_init.reloadClient() end

return client_init
