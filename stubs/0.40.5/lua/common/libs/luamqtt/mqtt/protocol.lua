---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Briques génériques du protocole MQTT (communes aux versions 3.1.1 et 5.0) de luamqtt : création et lecture d'entiers, chaînes UTF-8 et champs de longueur variable, en-tête fixe, constantes de types de paquets et codes CONNACK, identifiants de paquet, paquets combinés. Utilisé par protocol4.lua et protocol5.lua. Convention des fonctions parse_* : elles reçoivent read_func(n) qui lit n octets et renvoie la chaîne, ou false/nil et un message d'erreur.
--- Accès : `require("libs/luamqtt/mqtt/protocol")`
---@class libs_luamqtt_mqtt_protocol
---@field connack_packet_mt table Métatable des paquets CONNACK analysés.
---@field connack_rc table Table des codes de retour CONNACK.
---@field packet_mt table Métatable des paquets analysés (fournit notamment __tostring).
---@field packet_type table Types de paquets MQTT : CONNECT=1, CONNACK=2, PUBLISH=3, PUBACK=4, PUBREC=5, PUBREL=6, PUBCOMP=7, SUBSCRIBE=8, SUBACK=9, UNSUBSCRIBE=10, UNSUBACK=11, PINGREQ=12, PINGRESP=13, DISCONNECT=14, AUTH=15 (MQTT 5). Table aussi indexée dans l'autre sens (1 -> 'CONNECT').
local libs_luamqtt_mqtt_protocol = {}

--- Vrai si la valeur est un identifiant de paquet valide.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:265
---@param val any Valeur testée.
---@return boolean  Validité.
function libs_luamqtt_mqtt_protocol.check_packet_id(val) end

--- Vrai si la valeur est un QoS valide.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:258
---@param val any Valeur testée.
---@return boolean  Validité.
function libs_luamqtt_mqtt_protocol.check_qos(val) end

--- Combine plusieurs morceaux de données en un paquet combiné (se comporte comme une chaîne : tostring, len, append).
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:414
---@param ... any Morceaux.
---@return table  Paquet combiné.
function libs_luamqtt_mqtt_protocol.combine(...) end

--- Crée l'en-tête fixe d'un paquet.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:252
---@param ptype integer Type de paquet (packet_type).
---@param flags integer Drapeaux.
---@param len integer Longueur restante.
---@return string  En-tête.
function libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len) end

--- Crée une chaîne UTF-8 préfixée par sa longueur sur 2 octets.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:85
---@param str string Texte.
---@return string  Données.
function libs_luamqtt_mqtt_protocol.make_string(str) end

--- Crée les données d'un entier 16 bits.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:66
---@param val integer Valeur.
---@return string  2 octets.
function libs_luamqtt_mqtt_protocol.make_uint16(val) end

--- Données d'une propriété 2 octets avec contrôle de valeur non nulle.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:120
---@param value integer Valeur non nulle.
function libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value) end

--- Crée les données d'un entier 32 bits.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:75
---@param val integer Valeur.
---@return string  4 octets.
function libs_luamqtt_mqtt_protocol.make_uint32(val) end

--- Crée les données d'un entier 8 bits.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:57
---@param val integer Valeur.
---@return string  1 octet.
function libs_luamqtt_mqtt_protocol.make_uint8(val) end

--- Données d'une propriété 1 octet qui ne peut valoir que 0 ou 1.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:112
---@param value integer 0 ou 1.
function libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value) end

--- Encode un entier en champ de longueur variable (Remaining Length).
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:92
---@param len integer Valeur.
---@return string  Octets encodés.
function libs_luamqtt_mqtt_protocol.make_var_length(len) end

--- Données d'une propriété de longueur variable avec contrôle de valeur non nulle.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:128
---@param value integer Valeur non nulle.
function libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value) end

--- Renvoie l'identifiant de paquet suivant celui donné.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:272
---@param curr integer|nil Identifiant courant.
---@return integer  Identifiant suivant.
function libs_luamqtt_mqtt_protocol.next_packet_id(curr) end

--- Vrai si le paquet décrit par args (champ type, et qos pour PUBLISH) exige un identifiant de paquet. Lève une exception si args n'est pas une table ou si args.type n'est pas un nombre.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:372
---@param args table Arguments de création de paquet.
---@return boolean  Résultat.
function libs_luamqtt_mqtt_protocol.packet_id_required(args) end

--- Convertit un paquet analysé en texte lisible.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:443
---@param packet table Paquet.
---@return string  Représentation.
function libs_luamqtt_mqtt_protocol.packet_tostring(packet) end

--- Lit une chaîne UTF-8 préfixée par sa longueur. Renvoie false et un message en cas d'échec.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:138
---@param read_func function Fonction de lecture.
---@return string|boolean  Texte, ou false.
function libs_luamqtt_mqtt_protocol.parse_string(read_func) end

--- Lit un entier 16 bits.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:175
---@param read_func function Fonction de lecture.
function libs_luamqtt_mqtt_protocol.parse_uint16(read_func) end

--- Lit un entier 16 bits non nul.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:187
---@param read_func function Fonction de lecture.
function libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func) end

--- Lit un entier 32 bits.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:199
---@param read_func function Fonction de lecture.
function libs_luamqtt_mqtt_protocol.parse_uint32(read_func) end

--- Lit un entier 8 bits avec read_func.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:152
---@param read_func function Fonction de lecture.
---@return integer|boolean  Valeur, ou false et message.
function libs_luamqtt_mqtt_protocol.parse_uint8(read_func) end

--- Lit un octet qui doit valoir 0 ou 1.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:163
---@param read_func function Fonction de lecture.
function libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func) end

--- Lit un champ de longueur variable (Remaining Length).
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:217
---@param read_func function Fonction de lecture.
function libs_luamqtt_mqtt_protocol.parse_var_length(read_func) end

--- Lit un entier de longueur variable qui doit être non nul.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:238
---@param read_func function Fonction de lecture.
function libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func) end

--- Commence l'analyse d'un nouveau paquet : lit l'en-tête fixe et prépare un flux d'entrée (table avec read_func et available) pour le contenu. Renvoie le type, les drapeaux, le flux, etc.
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:476
---@param read_func function Fonction de lecture de la connexion.
function libs_luamqtt_mqtt_protocol.start_parse_packet(read_func) end

--- Métatable des données combinées créées par combine.
---@class libs_luamqtt_mqtt_protocol_combined_packet_mt
local libs_luamqtt_mqtt_protocol_combined_packet_mt = {}

--- Fait fonctionner la table comme une classe (accès aux méthodes tostring, len, append).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:409
---@param _ table Instance.
---@param key string Clé demandée.
function libs_luamqtt_mqtt_protocol_combined_packet_mt.__index(_, key) end

return libs_luamqtt_mqtt_protocol
