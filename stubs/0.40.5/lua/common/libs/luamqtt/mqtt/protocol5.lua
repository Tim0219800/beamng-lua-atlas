---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol5.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Implémentation du protocole MQTT 5.0 de luamqtt : construction (make_packet) et analyse (parse_packet) des paquets, avec propriétés et propriétés utilisateur, codes de raison et paquet AUTH. Chargé par client.lua quand la version 5 est demandée.
--- Accès : `require("libs/luamqtt/mqtt/protocol5")`
---@class libs_luamqtt_mqtt_protocol5
local libs_luamqtt_mqtt_protocol5 = {}

--- Construit un paquet MQTT 5 à partir d'une table d'arguments dont le champ type est un packet_type ; gère properties et user_properties.
---Source : lua/common/libs/luamqtt/mqtt/protocol5.lua:687
---@param args table type et champs propres au paquet.
---@return table|boolean  Paquet combiné prêt à envoyer, ou false et un message d'erreur.
function libs_luamqtt_mqtt_protocol5.make_packet(args) end

--- Analyse un paquet MQTT 5 reçu à l'aide de read_func.
---Source : lua/common/libs/luamqtt/mqtt/protocol5.lua:806
---@param read_func function Fonction de lecture de n octets.
---@return table|boolean  Paquet analysé, ou false et un message d'erreur.
function libs_luamqtt_mqtt_protocol5.parse_packet(read_func) end

return libs_luamqtt_mqtt_protocol5
