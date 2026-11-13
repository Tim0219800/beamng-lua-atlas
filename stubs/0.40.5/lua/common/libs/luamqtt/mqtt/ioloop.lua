---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/ioloop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boucle d'entrées/sorties de luamqtt : fait vivre plusieurs clients MQTT (et des fonctions utilisateur) dans un même thread, en mode non bloquant avec un petit délai réseau, ce qui permet les PINGREQ de keep_alive et la reconnexion. Ne fonctionne qu'avec les connecteurs luasocket standard.
--- Accès : `require("libs/luamqtt/mqtt/ioloop")`
---@class libs_luamqtt_mqtt_ioloop
local libs_luamqtt_mqtt_ioloop = {}

--- Crée une instance d'ioloop.
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:149
---@param args table timeout (défaut 0.005 s), sleep (défaut 0), sleep_function.
---@return table  Instance ioloop_mt.
function libs_luamqtt_mqtt_ioloop.create(args) end

--- Renvoie l'ioloop par défaut (singleton), créé à la demande.
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:163
---@param autocreate boolean Créer automatiquement (défaut true).
---@param args table Arguments de création.
---@return table|nil  Instance ioloop.
function libs_luamqtt_mqtt_ioloop.get(autocreate, args) end

--- Instance d'ioloop renvoyée par create/get.
---@class libs_luamqtt_mqtt_ioloop_ioloop_mt
local libs_luamqtt_mqtt_ioloop_ioloop_mt = {}

--- Initialise l'instance avec timeout, sleep et sleep_function _anon(défaut socket.sleep).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:53
---@param args table timeout (0.005 s), sleep (0), sleep_function.
function libs_luamqtt_mqtt_ioloop_ioloop_mt:__init(args) end

--- Ajoute un client MQTT ou une fonction de boucle. Pour un client, appelle client:set_ioloop(self) pour l'associer à la boucle.
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:66
---@param client table|function Client ou fonction.
---@return boolean  true, ou false et message d'erreur.
function libs_luamqtt_mqtt_ioloop_ioloop_mt:add(client) end

--- Si aucun délai réseau (timeout) n'a encore eu lieu pendant l'itération, appelle sleep_function(args.timeout) une seule fois (par défaut socket.sleep) pour ne pas tourner à vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:127
function libs_luamqtt_mqtt_ioloop_ioloop_mt:can_sleep() end

--- Effectue une itération : appelle _ioloop_iteration de chaque client et chaque fonction ajoutée, puis dort args.sleep secondes si sleep > 0.
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:109
function libs_luamqtt_mqtt_ioloop_ioloop_mt:iteration() end

--- Retire un client ou une fonction de l'ioloop.
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:85
---@param client table|function Client ou fonction.
---@return boolean  true, ou false et message d'erreur.
function libs_luamqtt_mqtt_ioloop_ioloop_mt:remove(client) end

--- Boucle bloquante : itère tant qu'il reste au moins un client dans l'ioloop.
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:136
function libs_luamqtt_mqtt_ioloop_ioloop_mt:run_until_clients() end

return libs_luamqtt_mqtt_ioloop
