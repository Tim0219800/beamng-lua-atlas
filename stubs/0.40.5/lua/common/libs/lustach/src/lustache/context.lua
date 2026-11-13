---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/context.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lustache : contexte de rendu Mustache. Un contexte enveloppe la vue (table de données) courante, garde un lien vers le contexte parent (pile d'imbrication des sections) et un cache de résolution de noms. Le renderer s'en sert pour résoudre `{{nom}}`, `{{a.b.c}}` et `{{.}}`.
--- Accès : `require("libs/lustach/src/lustache/context")`
---@class libs_lustach_src_lustache_context
---@field __index table Auto-référence de la classe (la table `context` sert de métatable).
local libs_lustach_src_lustache_context = {}

--- Vide le cache de résolution de ce contexte.
---Source : lua/common/libs/lustach/src/lustache/context.lua:7
---@param self any
function libs_lustach_src_lustache_context.clear_cache(self) end

--- Résout un nom dans la vue courante puis, à défaut, dans les contextes parents. Gère les chemins à points (`a.b.c`) et le nom `.` (la vue elle-même). Le résultat est mis en cache.
---Source : lua/common/libs/lustach/src/lustache/context.lua:15
---@param self any
---@param name string Nom ou chemin à résoudre.
---@return any  Valeur trouvée, ou nil.
function libs_lustach_src_lustache_context.lookup(self, name) end

--- Crée un contexte pour `view` avec un parent optionnel et un cache vide.
---Source : lua/common/libs/lustach/src/lustache/context.lua:57
---@param self table Classe context (appel avec les deux-points).
---@param view any Données du contexte (table, nombre ou autre valeur).
---@param parent table|nil Contexte parent.
---@return table  Nouveau contexte {view, parent, cache}.
function libs_lustach_src_lustache_context.new(self, view, parent) end

--- Crée un contexte enfant pour `view` dont le parent est le contexte courant (entrée dans une section).
---Source : lua/common/libs/lustach/src/lustache/context.lua:11
---@param self any
---@param view any Données de la section.
---@return table  Contexte enfant.
function libs_lustach_src_lustache_context.push(self, view) end

return libs_lustach_src_lustache_context
