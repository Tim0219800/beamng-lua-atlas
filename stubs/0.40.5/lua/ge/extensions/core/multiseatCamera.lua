---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseatCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_multiseatCamera` : caméra partagée du mode multi-joueur local (multiseat) quand tous les joueurs voient le même écran. Elle calcule la position moyenne des véhicules des joueurs assignés, règle la distance de la caméra pour que tous soient visibles (distance maximale à la moyenne, x2 + 10 m, FOV 40) et la place sur le véhicule du joueur 0 via core_camera. Elle s'active quand le réglage 'multiseat' est vrai, qu'il y a plus d'un joueur, et que l'écran n'est pas partagé en split-screen (ou que le mode split est 'shared').
--- Accès : extension `core_multiseatCamera` : `extensions.load("core_multiseatCamera")`, puis la globale `core_multiseatCamera`
---@class core_multiseatCamera
---@field onUpdate function nop tant que la caméra n'est pas activée, puis la boucle de calcul de la caméra partagée.
core_multiseatCamera = {}

--- Avant un rechargement Lua : désactive la caméra partagée si elle était active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseatCamera.lua:106
function core_multiseatCamera.onSerialize() end

--- Hook appelé quand les réglages changent : active ou désactive la caméra partagée selon que le réglage multiseat est vrai, que render_splitScreen est chargé, qu'il y a plus d'un joueur et que le split-screen est inactif ou en mode 'shared'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseatCamera.lua:98
function core_multiseatCamera.onSettingsChanged() end

--- Hook appelé quand la configuration du split-screen change : la caméra partagée est active si le split-screen est désactivé ou en mode 'shared'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseatCamera.lua:102
---@param splitScreenEnabled boolean Split-screen actif.
---@param playerCount integer Nombre de joueurs (non utilisé).
---@param layout any Disposition (non utilisée).
---@param mode string Mode du split-screen, 'shared' pour un écran commun.
function core_multiseatCamera.onSplitScreenChanged(splitScreenEnabled, playerCount, layout, mode) end

