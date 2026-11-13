---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol4.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Implémentation du protocole MQTT 3.1.1 de luamqtt : construction (make_packet) et analyse (parse_packet) des paquets. Chargé par client.lua quand la version 4 est utilisée (défaut).
--- Accès : `require("libs/luamqtt/mqtt/protocol4")`
---@class libs_luamqtt_mqtt_protocol4
local libs_luamqtt_mqtt_protocol4 = {}

--- Construit un paquet à partir d'une table d'arguments dont le champ type est un packet_type (CONNECT, PUBLISH, SUBSCRIBE…).
---Source : lua/common/libs/luamqtt/mqtt/protocol4.lua:280
---@param args table type et champs propres au paquet.
---@return table|boolean  Paquet combiné prêt à envoyer, ou false et un message d'erreur.
function libs_luamqtt_mqtt_protocol4.make_packet(args) end

--- Analyse un paquet reçu à l'aide de read_func.
---Source : lua/common/libs/luamqtt/mqtt/protocol4.lua:313
---@param read_func function Fonction de lecture de n octets.
---@return table|boolean  Paquet analysé (métatable packet_mt), ou false et un message d'erreur.
function libs_luamqtt_mqtt_protocol4.parse_packet(read_func) end

return libs_luamqtt_mqtt_protocol4
