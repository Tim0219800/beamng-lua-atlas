---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entoure le texte de l'octet de contrôle gras mIRC (0x02).
---Source : lua/common/libs/LuaIRC/util.lua:105
---@param text string Texte
---@return string  Texte en gras IRC
function bold(text) end

--- Vérifie qu'un pseudo ne contient que des caractères IRC valides et ne commence pas par un chiffre ou un tiret.
---Source : lua/common/libs/LuaIRC/util.lua:114
---@param nick string Pseudo
---@return boolean  true si valide
function checkNick(nick) end

--- Génère un pseudo de remplacement en incrémentant le code d'un caractère choisi au hasard (revient à 65 si hors de 65..125). Utilisé quand le pseudo est refusé (codes 432/433).
---Source : lua/common/libs/LuaIRC/util.lua:118
---@param nick string Pseudo refusé
---@return string  Nouveau pseudo
function defaultNickGenerator(nick) end

--- Découpe une ligne IRC brute en préfixe (sans le ':' initial), commande et liste de paramètres. Le paramètre final introduit par ' :' est ajouté en dernier.
---Source : lua/common/libs/LuaIRC/util.lua:14
---@param line string Ligne reçue du serveur
---@return string|nil  Préfixe
---@return string  Commande ou code numérique
---@return table<integer, string>  Paramètres
function parse(line) end

--- Convertit une chaîne de symboles en table {op, halfop, voice} (@ = op, % = halfop, + = voice).
---Source : lua/common/libs/LuaIRC/util.lua:67
---@param accessString string Symboles d'accès
---@return table  {op = boolean, halfop = boolean, voice = boolean}
function parseAccess(accessString) end

--- Sépare les symboles d'accès (@, +) du pseudo, comme dans une liste NAMES.
---Source : lua/common/libs/LuaIRC/util.lua:53
---@param nick string Ex. "@bob"
---@return table  {op, halfop, voice}
---@return string  Pseudo sans symboles
function parseNick(nick) end

--- Analyse un préfixe nick!user@host en table {access, nick, username, host}. Sans préfixe valide, seuls les droits d'accès par défaut sont remplis.
---Source : lua/common/libs/LuaIRC/util.lua:58
---@param prefix string|nil Préfixe de la ligne
---@return table  {access, nick, username, host}
function parsePrefix(prefix) end

--- Entoure le texte de l'octet de contrôle souligné mIRC (0x1F).
---Source : lua/common/libs/LuaIRC/util.lua:110
---@param text string Texte
---@return string  Texte souligné IRC
function underline(text) end

---@type table
color = nil
