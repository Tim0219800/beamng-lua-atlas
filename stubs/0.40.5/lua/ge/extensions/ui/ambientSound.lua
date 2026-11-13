---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/ambientSound.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit gestionnaire de « flux » de sons d'ambiance joués dans le canal audio 'AudioGui'. Chaque flux est décrit par un fichier JSON (clé data) contenant une liste de sons et un délai aléatoire entre deux lectures. update(dt) doit être appelé par l'appelant à chaque frame : il joue un son tiré au hasard, attend la fin du son plus le délai, puis en tire un autre.
--- Accès : extension `ui_ambientSound` : `extensions.load("ui_ambientSound")`, puis la globale `ui_ambientSound`
---@class ui_ambientSound
ui_ambientSound = {}

--- Retire de la liste le flux dont le streamID correspond.
---Source : lua/ge/extensions/ui/ambientSound.lua:90
---@param ID integer Identifiant de flux renvoyé par init.
function ui_ambientSound.deleteSoundSFX(ID) end

--- Charge un fichier JSON de flux sonore (clé data), l'ajoute à la liste des flux, tire un premier son au hasard et renvoie l'identifiant du flux. Si le fichier n'existe pas, journalise une erreur et ne renvoie rien.
---Source : lua/ge/extensions/ui/ambientSound.lua:69
---@param json string Chemin du fichier JSON décrivant le flux (champ data avec sounds, delay…).
---@return integer|nil  streamID du nouveau flux, ou nil si le fichier est introuvable.
function ui_ambientSound.init(json) end

--- Fixe le volume et la hauteur (pitch) d'un flux. fadeInTime est accepté mais pas utilisé.
---Source : lua/ge/extensions/ui/ambientSound.lua:33
---@param streamID integer Identifiant du flux.
---@param volume number Volume mémorisé dans le flux (non utilisé à la lecture, voir notes).
---@param pitch number Hauteur transmise à playOnce.
---@param fadeInTime number|nil Ignoré.
function ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime) end

--- Fait avancer tous les flux : joue le son courant s'il existe (FS:fileExists) via Engine.Audio.playOnce('AudioGui'), puis cumule le temps et passe à un nouveau son quand durée + délai sont écoulés.
---Source : lua/ge/extensions/ui/ambientSound.lua:44
---@param dt number Temps écoulé depuis la frame précédente, en secondes.
function ui_ambientSound.update(dt) end

