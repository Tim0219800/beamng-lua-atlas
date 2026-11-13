---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/reproGuard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garde de sécurité pour la commande de schéma v1/runRepro : décide si une ligne de commande décodée peut être transmise à run_repro.bat, d'après une liste blanche de motifs glob. La logique pure (isAllowed) est séparée de la lecture du fichier de liste blanche (loadPatterns).
--- Accès : extension `core_reproGuard` : `extensions.load("core_reproGuard")`, puis la globale `core_reproGuard`
---@class core_reproGuard
core_reproGuard = {}

--- Fonction pure : teste si command satisfait la liste de motifs. Refuse une commande vide, avec caractère interdit, une liste vide, ou dont un segment ne correspond à aucun motif.
---Source : lua/ge/extensions/core/reproGuard.lua:64
---@param command string Ligne de commande décodée.
---@param patterns string[] Motifs glob autorisés.
---@return boolean  true si autorisée.
---@return string  'ok' ou la raison du refus (empty command, forbidden shell metacharacter, empty allowlist, no command segments, segment not allowed: ...).
function core_reproGuard.isAllowed(command, patterns) end

--- Raccourci : charge les motifs depuis le disque puis appelle isAllowed.
---Source : lua/ge/extensions/core/reproGuard.lua:106
---@param command string Ligne de commande.
---@return boolean  true si autorisée.
---@return string  Raison.
function core_reproGuard.isCommandAllowed(command) end

--- Lit les motifs autorisés depuis le fichier JSON de liste blanche. Journalise une erreur et renvoie {} si le fichier est absent ou mal formé.
---Source : lua/ge/extensions/core/reproGuard.lua:95
---@return string[]  Motifs permissions.allow, ou {}.
function core_reproGuard.loadPatterns() end

