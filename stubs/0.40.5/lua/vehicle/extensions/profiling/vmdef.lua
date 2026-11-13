---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/profiling/vmdef.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce : jit.vmdef de LuaJIT (Mike Pall), fichier généré (« DO NOT EDIT ») qui contient les tables de noms de la VM LuaJIT : noms des bytecodes, des instructions IR du compilateur de traces, des fonctions rapides intégrées, des erreurs de trace, etc. Il est utilisé par les outils de LuaJIT (profileur, dump de traces). Aucune fonction : uniquement des données en lecture seule.
--- Accès : extension `profiling_vmdef` : `extensions.load (VM véhicule)("profiling_vmdef")`, puis la globale `profiling_vmdef`
---@class profiling_vmdef
---@field bcnames string Noms des opcodes de bytecode LuaJIT concaténés, 6 caractères par nom.
---@field ffnames table Noms des fonctions rapides intégrées (fast functions) de LuaJIT.
---@field ircall table Noms des fonctions C appelées depuis l'IR (CALL), indexés à partir de 0.
---@field irfield table<integer, string> Noms des champs d'objets internes lus par l'IR (str.len, func.env, tab.meta, tab.array, cdata.ptr…), indexés à partir de 0.
---@field irfpm table<integer, string> Fonctions mathématiques de l'opération IR FPMATH (floor, ceil, trunc, sqrt, exp, exp2, log, log2, log10, sin, cos, tan, other), indexées à partir de 0.
---@field irnames string Noms des instructions IR du compilateur de traces concaténés, 6 caractères par nom.
---@field traceerr table Messages d'erreur d'abandon de trace du compilateur JIT, indexés à partir de 0.
profiling_vmdef = {}

