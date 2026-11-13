---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/nodegrabberGamepad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_nodegrabberGamepad` : pilote le 'nodegrabber' (attraper et tirer un nœud du véhicule avec la souris ou la manette) pour les entrées manette et souris. Elle active l'action map 'Nodegrabber', bascule temporairement la caméra du joueur vers la caméra 'relative' placée comme la caméra actuelle, règle la force de traction (0 à 100) et affiche la légende des touches. Les appels sont normalement déclenchés par les actions d'entrée (nodegrabberPadMode, nodegrabberGrab, nodegrabberStrength...), pas par du code de mod.
--- Accès : extension `core_nodegrabberGamepad` : `extensions.load("core_nodegrabberGamepad")`, puis la globale `core_nodegrabberGamepad`
---@class core_nodegrabberGamepad
---@field dependencies string[] { 'ui_bindingsLegend' }.
---@field state table État du nodegrabber (voir notes).
core_nodegrabberGamepad = {}

--- Ajoute `value` à la force de traction (bornée à 0..100), l'applique au nodegrabber et affiche le message UI si la valeur arrondie a changé.
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:203
---@param value number Variation de force.
function core_nodegrabberGamepad.addStrength(value) end

--- Action d'entrée de réglage de la force : bouton binaire (filterType 0) = addStrength(value × 5) ; axe analogique = mémorise la valeur et onUpdate l'applique en continu.
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:209
---@param value number Valeur de l'entrée.
---@param filterType integer 0 pour un bouton, autre pour un axe.
function core_nodegrabberGamepad.changeStrength(value, filterType) end

--- Restaure la force normale et fixe (épingle) le nœud actuellement ciblé via be.nodeGrabber:fixCurrentNode.
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:198
function core_nodegrabberGamepad.fixCurrentNode() end

--- Action d'entrée 'grab' : attrape ou relâche selon le périphérique (souris = clic simulé ; autre = setGrab).
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:180
---@param value number Valeur de l'axe ou du bouton (0 = relâché).
---@param deviceName string Nom du périphérique d'entrée (commençant par 'mouse' pour une souris).
function core_nodegrabberGamepad.grab(value, deviceName) end

--- Quand les filtres d'actions changent : annule l'interaction si nodegrabberRender ou nodegrabberGrab est bloquée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:253
function core_nodegrabberGamepad.onActionFilterUpdated() end

--- Avant le remplacement d'un véhicule : annule l'interaction si concerné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:251
---@param vehicleId integer Id du véhicule.
function core_nodegrabberGamepad.onBeforeVehicleReplaced(vehicleId) end

--- Quand le mode de caméra change : désactive le mode manette (hors grab et souris) si la nouvelle caméra n'est pas 'relative'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:258
---@param cameraName string Nom du nouveau mode de caméra.
function core_nodegrabberGamepad.onCameraModeChanged(cameraName) end

--- Quand l'interface CEF change de visibilité : annule l'interaction si elle devient invisible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:245
---@param cefVisible boolean Interface visible.
function core_nodegrabberGamepad.onCefVisibilityChanged(cefVisible) end

--- À la fin du niveau : annule toute interaction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:244
function core_nodegrabberGamepad.onClientEndMission() end

--- Quand un objet est supprimé : annule l'interaction seulement s'il s'agit d'un rechargement (isReloading).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:252
---@param vehicleId integer Id de l'objet.
---@param isReloading boolean true si c'est un rechargement du véhicule.
function core_nodegrabberGamepad.onDespawnObject(vehicleId, isReloading) end

--- Au déchargement : annule toute interaction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:243
function core_nodegrabberGamepad.onExtensionUnloaded() end

--- Quand une caméra globale est activée : désactive le mode manette (hors grab et souris).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:259
---@param cameraName string|nil Nom de la caméra globale.
function core_nodegrabberGamepad.onGlobalCameraSet(cameraName) end

--- Quand l'action map de menu s'active : annule l'interaction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:246
---@param enabled boolean Action map de menu active.
function core_nodegrabberGamepad.onMenuActionMapEnabled(enabled) end

--- Appelé par le nodegrabber natif quand un nœud est attrapé ou relâché : met à jour state.grabbing, la légende souris et l'affichage des nœuds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:169
---@param grabbed boolean true si un nœud est actuellement attrapé.
function core_nodegrabberGamepad.onNodegrab(grabbed) end

--- Avant un rechargement Lua : annule toute interaction et renvoie M.state.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:237
---@return table  M.state.
function core_nodegrabberGamepad.onSerialize() end

--- Hook par frame : en mode manette actif et si l'axe de force est non nul, ajoute strengthAxis × 50 × dtReal à la force.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:217
---@param dtReal number Temps réel écoulé (s).
function core_nodegrabberGamepad.onUpdate(dtReal) end

--- Quand un véhicule est remis à zéro : annule l'interaction si c'est le véhicule suivi ou le véhicule joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:250
---@param vehicleId integer Id du véhicule.
function core_nodegrabberGamepad.onVehicleResetted(vehicleId) end

--- Attrape (value > 0, avec la force value × strength) ou relâche (restaure la force normale) le nœud ciblé.
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:188
---@param value number Intensité 0..1 (> 0 = attraper).
function core_nodegrabberGamepad.setGrab(value) end

--- Active ou désactive le mode souris. Activer le mode souris désactive d'abord le mode manette.
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:159
---@param enabled boolean true pour activer.
function core_nodegrabberGamepad.setMouseActive(enabled) end

--- Active ou désactive le mode manette du nodegrabber (caméra relative, mode contrôleur, action map et légende).
---Source : lua/ge/extensions/core/nodegrabberGamepad.lua:176
function core_nodegrabberGamepad.toggleActive() end

