# `libs_luamqtt_mqtt_bitwrap`

*Fichier : `lua/common/libs/luamqtt/mqtt/bitwrap.lua` · VM : Commun (GE + véhicule) · 12 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/bitwrap")`

Enveloppe autour du module de bits : renvoie directement require('bit') (BitOp) sous Lua 5.1 ou LuaJIT, require('bit32') sous Lua 5.2, sinon le module bit53. Sous BeamNG (LuaJIT), c'est la bibliothèque 'bit'. Utilisé par protocol.lua pour band, bor, lshift, rshift. Aucune fonction propre.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/bitwrap.lua`.*
