---@meta
-- tim19Atlas stub generated from lua/common/jit/vmdef.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fichier généré (« DO NOT EDIT ») de LuaJIT : tables de noms internes utilisées par les modules jit.dump, jit.bc, jit.v et le profileur pour afficher bytecodes, instructions IR, fonctions rapides (fast functions) et causes d'abandon de trace. Le fichier vérifie au chargement que jit.version == « LuaJIT 2.1.1788767029 », sinon l'assertion échoue (« LuaJIT core/library version mismatch »). Un moddeur n'a normalement aucune raison de l'utiliser.
--- Accès : `require("jit/vmdef")`
---@class jit_vmdef
---@field bcnames string Noms des opcodes de bytecode LuaJIT concaténés (6 caractères chacun).
---@field ffnames table Noms des fonctions rapides (fast functions) de LuaJIT.
---@field ircall table Noms des fonctions C appelées depuis l'IR.
---@field irfield table Noms des champs de structures pour l'IR (FLOAD/XLOAD).
---@field irfpm table Noms des fonctions math pour FPMATH.
---@field irnames string Noms des opcodes de la représentation intermédiaire (IR) concaténés.
---@field traceerr table Messages d'erreur des traces abandonnées.
local jit_vmdef = {}

return jit_vmdef
