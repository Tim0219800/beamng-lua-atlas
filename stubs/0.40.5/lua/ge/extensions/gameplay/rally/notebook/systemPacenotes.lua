---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détient la liste canonique des noms de pacenotes « système » du rallye (compte à rebours, avertissements de départ, vérifications radio/ceintures, faux départ…) et valide le tableau `system` d'un style de carnet. Chaque style doit fournir tous les noms de `required`, dans cet ordre ; les noms inconnus, doublons ou variantes sans texte sont rejetés. Utile à un moddeur qui écrit un style de copilote dans une nouvelle langue.
--- Accès : extension `gameplay_rally_notebook_systemPacenotes` : `extensions.load("gameplay_rally_notebook_systemPacenotes")`, puis la globale `gameplay_rally_notebook_systemPacenotes`
---@class gameplay_rally_notebook_systemPacenotes
---@field required string[] Noms obligatoires, dans l'ordre : precountdown, countdown5 à countdown1, countdowngo, warningSeconds60/30/15/10, commsCheck, beltsCheck, rescheduled, falseStart (15 entrées).
gameplay_rally_notebook_systemPacenotes = {}

--- Construit le tableau ordonné `system` d'un style à partir d'une table compacte nom -> texte. Chaque valeur peut être une chaîne, une table {text=...}, ou une liste de chaînes/tables (variantes). Les noms manquants ou de type invalide donnent une liste de variantes vide.
---Source : lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua:70
---@param localized table<string, string|table>|nil Textes localisés indexés par nom de pacenote système.
---@return table[]  Liste de { name = string, variants = { {text=string,...}, ... } } dans l'ordre de `required`.
function gameplay_rally_notebook_systemPacenotes.localized(localized) end

--- Vérifie qu'un tableau `system` est une liste ordonnée complète : entrées-tables avec `name` chaîne, noms reconnus, dans l'ordre de `required`, sans doublon, avec une liste `variants` non vide dont chaque élément a un `text` non vide.
---Source : lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua:82
---@param systemArray table Tableau à valider (typiquement renvoyé par localized).
---@param styleName string|nil Nom du style pour les messages de log ("?" par défaut).
---@return boolean  true si valide, false sinon (erreur journalisée).
function gameplay_rally_notebook_systemPacenotes.validate(systemArray, styleName) end

