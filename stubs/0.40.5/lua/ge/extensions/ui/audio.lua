---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/audio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Joue les sons d'interface (canal audio « AudioGui ») à partir du fichier ui/soundClasses.json. Chaque classe de son contient des évènements ; un évènement simple joue un sfx une fois, un évènement « source » crée et réutilise une source audio gérée (play, setParameters, stopBeforePlay, recreateBeforePlay). Sert aussi aux sons de l'appui long (bng_hold_activate : start, complete, cancel).
--- Accès : extension `ui_audio` : `extensions.load("ui_audio")`, puis la globale `ui_audio`
---@class ui_audio
ui_audio = {}

--- Joue l'évènement « cancel » de la classe bng_hold_activate (appui long relâché trop tôt).
---Source : lua/ge/extensions/ui/audio.lua:140
---@param instanceId any Identifiant d'instance de la source gérée.
function ui_audio.cancelHoldActivateSound(instanceId) end

--- Joue l'évènement « complete » de la classe bng_hold_activate (appui long abouti).
---Source : lua/ge/extensions/ui/audio.lua:136
---@param instanceId any Identifiant d'instance de la source gérée.
function ui_audio.completeHoldActivateSound(instanceId) end

--- Hook appelé par le moteur au premier update : lit ui/soundClasses.json dans M.ui_sound_classes ({} si absent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/audio.lua:10
function ui_audio.onFirstUpdate() end

--- Joue l'évènement eventName de la classe className. Ne fait rien si la classe ou l'évènement n'existe pas. Évènement simple : joue le sfx une fois sur AudioGui ; évènement source : crée/réutilise la source, applique les paramètres puis la lance (play(-1)).
---Source : lua/ge/extensions/ui/audio.lua:119
---@param className string Nom de la classe de sons dans soundClasses.json.
---@param eventName string Nom de l'évènement dans la classe.
---@param instanceId any Identifiant d'instance optionnel pour avoir une source distincte par composant UI (déduit du code : concaténé à la clé de cache).
function ui_audio.playEventSound(className, eventName, instanceId) end

--- Joue l'évènement « start » de la classe bng_hold_activate (début d'un appui long).
---Source : lua/ge/extensions/ui/audio.lua:132
---@param instanceId any Identifiant d'instance de la source gérée.
function ui_audio.startHoldActivateSound(instanceId) end

