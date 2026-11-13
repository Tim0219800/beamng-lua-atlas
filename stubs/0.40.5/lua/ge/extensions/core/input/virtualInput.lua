---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/virtualInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_input_virtualInput` : création de périphériques d'entrée virtuels (axes, boutons, POV) via le VirtualInputManager C++ et émission d'évènements sur ceux-ci. Un moddeur s'en sert pour injecter des commandes (volant, pédales, boutons) comme si un vrai contrôleur était branché ; les évènements passent par le système de bindings normal sous le nom de périphérique 'vinput<instance>'.
--- Accès : extension `core_input_virtualInput` : `extensions.load("core_input_virtualInput")`, puis la globale `core_input_virtualInput`
---@class core_input_virtualInput
core_input_virtualInput = {}

--- Enregistre un périphérique virtuel auprès du VirtualInputManager et le mémorise dans M.devices.
---Source : lua/ge/extensions/core/input/virtualInput.lua:9
---@param productName string Nom du produit affiché.
---@param vidpid string Identifiant vendor/product ; sert à retrouver le périphérique avec getDeviceInfo.
---@param axes integer Nombre d'axes (déduit du code).
---@param buttons integer Nombre de boutons (déduit du code).
---@param povs integer Nombre de POV/chapeaux (déduit du code).
---@return integer|nil  Numéro d'instance (>= 0) ; nil si le manager est absent ou l'instance < 0 (erreur loguée).
---@return table|nil  {productName, vidpid, axes, buttons, povs}.
function core_input_virtualInput.createDevice(productName, vidpid, axes, buttons, povs) end

--- Désenregistre le périphérique 'vinput<deviceInstance>' et le retire de M.devices.
---Source : lua/ge/extensions/core/input/virtualInput.lua:26
---@param deviceInstance integer Instance renvoyée par createDevice.
function core_input_virtualInput.deleteDevice(deviceInstance) end

--- Envoie un évènement de périphérique virtuel au moteur (mgr:emitEvent('vinput', ...)). Ne fait rien si le manager est absent.
---Source : lua/ge/extensions/core/input/virtualInput.lua:48
---@param deviceInstance integer Instance du périphérique.
---@param objType any Type d'objet d'entrée (axe, bouton, POV) : valeur du moteur.
---@param objectInstance integer Indice de l'axe/bouton/POV.
---@param action any Type d'action (valeur du moteur).
---@param val number Valeur de l'évènement.
function core_input_virtualInput.emit(deviceInstance, objType, objectInstance, action, val) end

--- Cherche un périphérique virtuel déjà créé par son vidpid.
---Source : lua/ge/extensions/core/input/virtualInput.lua:38
---@param vidpid string Identifiant recherché.
---@return integer|nil  Instance, ou nil si aucun.
---@return table|nil  Infos du périphérique.
function core_input_virtualInput.getDeviceInfo(vidpid) end

