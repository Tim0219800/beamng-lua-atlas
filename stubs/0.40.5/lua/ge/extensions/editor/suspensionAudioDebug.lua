---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/suspensionAudioDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite fenêtre de débogage de l'éditeur (menu Audio) qui trace les sons de suspension du véhicule joueur. À chaque frame elle demande au véhicule (queueLuaCommand) de renvoyer sounds.getBeamSounds() vers la GE dans editor_suspensionAudioDebug.beamSounds, puis affiche, pour chaque roue (avant/arrière, gauche/droite), des courbes sur 200 échantillons de l'impulsion, du pitch et du volume. La position de la roue est déduite de la position du noeud id1 de la poutre.
--- Accès : extension `editor_suspensionAudioDebug` : `extensions.load("editor_suspensionAudioDebug")`, puis la globale `editor_suspensionAudioDebug`
---@class editor_suspensionAudioDebug
editor_suspensionAudioDebug = {}

--- Hook de dessin appelé chaque frame : récupère les sons de poutres du véhicule, met à jour les historiques et dessine les courbes par roue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/suspensionAudioDebug.lua:19
function editor_suspensionAudioDebug.onEditorGui() end

--- Hook d'initialisation de l'éditeur : enregistre la fenêtre (500x200) et l'entrée de menu dans le groupe Audio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/suspensionAudioDebug.lua:134
function editor_suspensionAudioDebug.onEditorInitialized() end

--- Hook de chargement de l'extension ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/suspensionAudioDebug.lua:127
function editor_suspensionAudioDebug.onExtensionLoaded() end

--- Hook de déchargement de l'extension ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/suspensionAudioDebug.lua:131
function editor_suspensionAudioDebug.onExtensionUnloaded() end

--- Hook appelé au changement de véhicule : vide les historiques et remet le compteur à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/suspensionAudioDebug.lua:139
---@param oldVehicle any Ancien véhicule.
---@param newVehicle any Nouveau véhicule.
---@param player any Joueur concerné.
function editor_suspensionAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Affiche la fenêtre 'Suspension Audio Debug'.
---Source : lua/ge/extensions/editor/suspensionAudioDebug.lua:122
function editor_suspensionAudioDebug.open() end

