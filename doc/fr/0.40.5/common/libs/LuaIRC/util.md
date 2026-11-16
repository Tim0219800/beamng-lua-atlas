# `libs_LuaIRC_util`

*Fichier : `lua/common/libs/LuaIRC/util.lua` · VM : Commun (GE + véhicule) · 137 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/LuaIRC/util")`

Partie de la bibliothèque tierce LuaIRC (client IRC). Module "irc" : analyse des lignes du protocole IRC (parse), des pseudos et préfixes (parseNick, parsePrefix, parseAccess), validation de pseudo, générateur de pseudo de secours, et mise en forme mIRC (couleurs, gras, souligné).

## Exemple

```lua
local prefix, cmd, params = irc.parse(":nick!user@host PRIVMSG #chan :salut")
-- prefix = "nick!user@host", cmd = "PRIVMSG", params = {"#chan", "salut"}
```

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `bold(text)` | Entoure le texte de l'octet de contrôle gras mIRC (0x02). | 105 |
| `checkNick(nick)` | Vérifie qu'un pseudo ne contient que des caractères IRC valides et ne commence pas par un chiffre ou un tiret. | 114 |
| `defaultNickGenerator(nick)` | Génère un pseudo de remplacement en incrémentant le code d'un caractère choisi au hasard (revient à 65 si hors de 65..125). Utilisé quand le pseudo est refusé (codes 432/433). | 118 |
| `parse(line)` | Découpe une ligne IRC brute en préfixe (sans le ':' initial), commande et liste de paramètres. Le paramètre final introduit par ' :' est ajouté en dernier. | 14 |
| `parseAccess(accessString)` | Convertit une chaîne de symboles en table {op, halfop, voice} (@ = op, % = halfop, + = voice). | 67 |
| `parseNick(nick)` | Sépare les symboles d'accès (@, +) du pseudo, comme dans une liste NAMES. | 53 |
| `parsePrefix(prefix)` | Analyse un préfixe nick!user@host en table {access, nick, username, host}. Sans préfixe valide, seuls les droits d'accès par défaut sont remplis. | 58 |
| `underline(text)` | Entoure le texte de l'octet de contrôle souligné mIRC (0x1F). | 110 |

**Globales affectées :** `color`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaIRC/util.lua`.*
