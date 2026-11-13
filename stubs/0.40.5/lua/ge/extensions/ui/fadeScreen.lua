---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/fadeScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fondu au noir de l'écran piloté depuis Lua. Envoie l'évènement UI « LoadingScreen » (active + paramètres fadeIn/pause/fadeOut/data), règle les paramètres audio globaux FMOD g_FadeTimeMS et g_GameLoading, et prévient les autres extensions via le hook onScreenFadeState quand l'UI signale que l'écran est noir (1), que la pause est finie (2) ou que le fondu retour est terminé (3). Sert aux chargements de niveau, téléportations et transitions.
--- Accès : extension `ui_fadeScreen` : `extensions.load("ui_fadeScreen")`, puis la globale `ui_fadeScreen`
---@class ui_fadeScreen
---@field delayFrames number Nombre de frames d'attente avant de diffuser onScreenFadeState (3 par défaut).
ui_fadeScreen = {}

--- Alias de fadeSequence.
---Source : lua/ge/extensions/ui/fadeScreen.lua:61
---@param fadeIn number|nil Durée du fondu vers le noir.
---@param pause number|nil Durée de la pause.
---@param fadeOut number|nil Durée du fondu retour.
---@param screenData table|nil Contenu affiché pendant la pause.
---@param args table|nil Options.
function ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args) end

--- Revient du noir (LoadingScreen active=false avec fadeOut), remet g_GameLoading à 0. Alias : stop.
---Source : lua/ge/extensions/ui/fadeScreen.lua:42
---@param fade number|nil Durée du fondu retour en secondes (défaut 1).
---@param args table|nil Options ; useGlobalAudioFade=false pour ne pas toucher à l'audio global.
function ui_fadeScreen.fadeFromBlack(fade, args) end

--- Fondu complet : au noir, pause, puis retour. Alias : cycle.
---Source : lua/ge/extensions/ui/fadeScreen.lua:61
---@param fadeIn number|nil Durée du fondu vers le noir (défaut 1).
---@param pause number|nil Durée de la pause sur noir (minimum 0,05 s).
---@param fadeOut number|nil Durée du fondu retour (défaut fadeIn).
---@param screenData table|nil Contenu affiché pendant la pause : {image, title, text}.
---@param args table|nil Options transmises aux fondus (useGlobalAudioFade).
function ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args) end

--- Lance un fondu vers le noir et y reste. screenData est affiché pendant la pause. Règle aussi les paramètres audio globaux (sauf useGlobalAudioFade == false). Alias : start.
---Source : lua/ge/extensions/ui/fadeScreen.lua:15
---@param fade number|nil Durée du fondu en secondes (défaut 1).
---@param screenData table|nil Contenu affiché pendant la pause : {image, title, text}.
---@param args table|nil Options ; useGlobalAudioFade=false pour ne pas toucher à l'audio global.
function ui_fadeScreen.fadeToBlack(fade, screenData, args) end

--- Indique si l'écran est confirmé noir (après le délai de delayFrames frames).
---Source : lua/ge/extensions/ui/fadeScreen.lua:97
---@return boolean  true si l'écran est noir.
function ui_fadeScreen.isBlack() end

--- Hook par frame GUI : une fois le délai écoulé, diffuse les états en attente par extensions.hook('onScreenFadeState', state) et enchaîne le fadeFromBlack d'une séquence à l'état 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/fadeScreen.lua:75
function ui_fadeScreen.onGuiUpdate() end

--- Appelé par l'UI/le moteur quand l'état du fondu change (1, 2 ou 3) : met l'état en file et relance le compteur de frames ; onGuiUpdate le diffuse ensuite par onScreenFadeState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/fadeScreen.lua:70
---@param state integer 1 = noir atteint, 2 = fin de pause, 3 = fondu retour terminé.
function ui_fadeScreen.onScreenFadeStateDelayed(state) end

--- Alias de fadeToBlack.
---Source : lua/ge/extensions/ui/fadeScreen.lua:15
---@param fade number|nil Durée du fondu en secondes.
---@param screenData table|nil Contenu {image, title, text} affiché pendant la pause.
---@param args table|nil Options.
function ui_fadeScreen.start(fade, screenData, args) end

--- Alias de fadeFromBlack.
---Source : lua/ge/extensions/ui/fadeScreen.lua:42
---@param fade number|nil Durée du fondu retour en secondes.
---@param args table|nil Options.
function ui_fadeScreen.stop(fade, args) end

