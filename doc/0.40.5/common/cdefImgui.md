# `cdefImgui`

*Fichier : `lua/common/cdefImgui.lua` · VM : Commun (GE + véhicule) · 8 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("cdefImgui")`

Déclaration FFI de la fonction de rappel C ImGuiInputTextCallbackLua(const void* data), utilisée côté moteur pour les callbacks de saisie de texte ImGui appelés depuis Lua.

## Remarques

- Aucune fonction Lua : un seul ffi.cdef, exécuté si ffi existe.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/cdefImgui.lua`.*
