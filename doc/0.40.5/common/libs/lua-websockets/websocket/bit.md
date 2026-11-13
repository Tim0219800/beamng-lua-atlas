# `bxor`

*Fichier : `lua/common/libs/lua-websockets/websocket/bit.lua` · VM : Commun (GE + véhicule) · 11 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `bxor`

Petite couche de compatibilité pour les opérations sur bits de lua-websockets. Si la bibliothèque 'bit32' (Lua 5.2) existe, elle est renvoyée avec rol/ror ajoutés comme alias de lrotate/rrotate ; sinon le module renvoie la bibliothèque 'bit' de LuaJIT (BitOp). Aucune fonction propre : le module renvoie directement la table des opérations (band, bor, bxor, lshift, rshift…).

## Remarques

- Dans BeamNG (LuaJIT), c'est la branche 'bit' qui est utilisée, sauf si un module 'bit32' est disponible.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/bit.lua`.*
