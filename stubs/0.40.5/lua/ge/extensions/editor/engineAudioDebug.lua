---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/engineAudioDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « Engine Audio Debug » (menu Audio) pour régler en direct le son moteur du véhicule joueur. Elle récupère les données de sons moteur côté véhicule (sounds.getEngineSoundData via queueLuaCommand), propose une liste de moteurs/sons et des curseurs (gain principal, on/off-load, shelves bas/haut, EQ bas/haut, fréquence fondamentale par nombre de cylindres, étouffement), affiche la direction d'échappement, et permet de copier les valeurs en JSON dans le presse-papiers ou de tout remettre à 0. Les fréquences en Hz sont converties en valeurs FMOD (table 20 Hz à 22 kHz).
--- Accès : extension `editor_engineAudioDebug` : `extensions.load("editor_engineAudioDebug")`, puis la globale `editor_engineAudioDebug`
---@class editor_engineAudioDebug
---@field onDebugDrawActive nil Exporté mais toujours nil (variable locale non définie).
---@field onUpdate function nop tant que la fenêtre est fermée ; fonction de dessin/mise à jour quand elle est ouverte.
editor_engineAudioDebug = {}

--- Hook : recharge les données moteur à l'entrée dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:297
function editor_engineAudioDebug.onEditorActivated() end

--- Hook : masque l'affichage de la direction d'échappement du moteur sélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:290
function editor_engineAudioDebug.onEditorDeactivated() end

--- Enregistre la fenêtre (500x200) et l'entrée de menu (groupe Audio).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:279
function editor_engineAudioDebug.onEditorInitialized() end

--- Hook appelé au masquage d'une fenêtre d'outil ; si c'est la fenêtre du module, remet onUpdate à nop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:301
---@param windowName string Nom de la fenêtre
function editor_engineAudioDebug.onEditorToolWindowHide(windowName) end

--- Hook appelé à l'affichage d'une fenêtre d'outil ; si c'est la fenêtre du module, active onUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:308
---@param windowName string Nom de la fenêtre
function editor_engineAudioDebug.onEditorToolWindowShow(windowName) end

--- Hook appelé au chargement : lit les données de sons moteur du véhicule joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:275
function editor_engineAudioDebug.onExtensionLoaded() end

--- Hook appelé au changement de véhicule ; recharge les données si l'éditeur est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:284
---@param oldVehicle any Ancien véhicule
---@param newVehicle any Nouveau véhicule
---@param player any Joueur concerné
function editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Affiche la fenêtre « Engine Audio Debug » et force un rafraîchissement des valeurs.
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:269
function editor_engineAudioDebug.open() end

