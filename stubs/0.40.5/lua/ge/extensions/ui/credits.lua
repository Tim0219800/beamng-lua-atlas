---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/credits.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Joue la musique des crédits (évènement FMOD « event:>Music>credits » sur le canal AudioGui) avec des fondus de volume. Le chargement de l'extension lance la musique avec un fondu d'entrée de 0,4 s ; le déchargement supprime la source sonore.
--- Accès : extension `ui_credits` : `extensions.load("ui_credits")`, puis la globale `ui_credits`
---@class ui_credits
ui_credits = {}

--- Hook appelé au chargement de l'extension : lance startWithFade avec la durée par défaut (0,4 s).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/credits.lua:123
function ui_credits.onExtensionLoaded() end

--- Hook appelé au déchargement : arrête et supprime la source sonore et libère le groupe de paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/credits.lua:127
function ui_credits.onExtensionUnloaded() end

--- Hook appelé à chaque frame : fait avancer le fondu en cours et appelle son callback à la fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/credits.lua:132
---@param dtReal number Temps réel écoulé depuis la dernière frame (s).
function ui_credits.onUpdate(dtReal) end

--- Crée la source sonore des crédits si besoin, la démarre à volume 0 si elle ne joue pas encore, puis fait un fondu vers le volume 1.
---Source : lua/ge/extensions/ui/credits.lua:85
---@param duration number|nil Durée du fondu en secondes (défaut 0,4).
---@return boolean  false si la source sonore n'a pas pu être créée, sinon true.
function ui_credits.startWithFade(duration) end

--- Fait un fondu vers 0 puis arrête et supprime la source, puis appelle onStopped. S'il n'y a pas de son, arrête immédiatement.
---Source : lua/ge/extensions/ui/credits.lua:105
---@param duration number|nil Durée du fondu en secondes (défaut 0,4).
---@param onStopped function|nil Callback sans argument appelé une fois la musique arrêtée.
function ui_credits.stopWithFade(duration, onStopped) end

