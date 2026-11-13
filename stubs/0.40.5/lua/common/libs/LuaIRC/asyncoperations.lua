---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/asyncoperations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Métatable des connexions IRC connectées (les méthodes sont appelées avec ':' sur l'objet renvoyé par irc.new).
---@class libs_LuaIRC_asyncoperations_meta
local libs_LuaIRC_asyncoperations_meta = {}

--- Rejoint un salon, avec une clé (mot de passe) facultative.
---Source : lua/common/libs/LuaIRC/asyncoperations.lua:48
---@param channel string Nom du salon (ex. #beamng)
---@param key string|nil Clé du salon, si protégé
function libs_LuaIRC_asyncoperations_meta:join(channel, key) end

--- Quitte un salon. Si le suivi des utilisateurs est actif, supprime le salon de self.channels.
---Source : lua/common/libs/LuaIRC/asyncoperations.lua:56
---@param channel string Nom du salon
function libs_LuaIRC_asyncoperations_meta:part(channel) end

--- Envoie une ligne brute au serveur (suffixée de \r\n). Si des arguments supplémentaires sont donnés, msg est passé à string.format. Déclenche le hook OnSend avant l'envoi ; en cas d'erreur socket autre que timeout/wantwrite, déclenche OnDisconnect, ferme la connexion et lève l'erreur.
---Source : lua/common/libs/LuaIRC/asyncoperations.lua:11
---@param msg string Ligne IRC, ou format string.format si des arguments suivent
---@param ... any Arguments de formatage (facultatifs)
function libs_LuaIRC_asyncoperations_meta:send(msg, ...) end

--- Envoie un message PRIVMSG à un salon ou un utilisateur. Un message multi-lignes est découpé en une commande par ligne.
---Source : lua/common/libs/LuaIRC/asyncoperations.lua:34
---@param target string Salon ou pseudo destinataire
---@param msg string Texte à envoyer
function libs_LuaIRC_asyncoperations_meta:sendChat(target, msg) end

--- Comme sendChat mais avec la commande NOTICE (une commande par ligne du message).
---Source : lua/common/libs/LuaIRC/asyncoperations.lua:41
---@param target string Salon ou pseudo destinataire
---@param msg string Texte à envoyer
function libs_LuaIRC_asyncoperations_meta:sendNotice(target, msg) end

--- Envoie une commande MODE. La table peut contenir add (modes à ajouter) et/ou remove (modes à retirer) ; au moins l'un des deux est obligatoire (assert).
---Source : lua/common/libs/LuaIRC/asyncoperations.lua:73
---@param t table {target = cible (défaut : son propre pseudo), add = 'chaîne de modes', remove = 'chaîne de modes'}
function libs_LuaIRC_asyncoperations_meta:setMode(t) end

--- Active ou désactive le suivi des utilisateurs par salon (self.track_users). En désactivant, vide self.channels.
---Source : lua/common/libs/LuaIRC/asyncoperations.lua:64
---@param b boolean true pour suivre, false pour arrêter
function libs_LuaIRC_asyncoperations_meta:trackUsers(b) end

