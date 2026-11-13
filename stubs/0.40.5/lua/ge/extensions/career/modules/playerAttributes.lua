---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerAttributes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre central des attributs du joueur en carrière : money, beamXP, vouchers, un attribut par branche/compétence (branch.attributeKey) et <orgId>Reputation par organisation. Chaque attribut a une valeur, des gains et des pertes cumulés par tag (+ "all"), et éventuellement min/max. Toute modification passe par addAttributes (ou setAttributes) qui met à jour les statistiques, tient le journal des changements, écrit dans career_modules_log et émet le hook onPlayerAttributesChanged(change, reason). Sauvegarde dans career/playerAttributes.json et career/attributeLog.json.
--- Accès : extension `career_modules_playerAttributes` : `extensions.load("career_modules_playerAttributes")`, puis la globale `career_modules_playerAttributes`
---@class career_modules_playerAttributes
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
---@field logAttributeChange nil Toujours nil : référence une variable locale inexistante dans le fichier (bug).
career_modules_playerAttributes = {}

--- Ajoute les variations données aux attributs (création si absent), met à jour gains/losses par tag, enregistre l'entrée dans attributeLog, écrit un log carrière et émet onPlayerAttributesChanged(change, reason).
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:66
---@param change table<string, number> Variation par attribut (positif = gain, négatif = perte).
---@param reason {label: string|table, tags: string[]}|nil Raison : libellé et liste de tags.
function career_modules_playerAttributes.addAttributes(change, reason) end

--- Renvoie la table de tous les attributs (référence directe, non copiée).
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:152
---@return table<string, table>  Attributs par nom.
function career_modules_playerAttributes.getAllAttributes() end

--- Renvoie l'objet complet d'un attribut {value, gains, losses, min, max}.
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:145
---@param attributeName string Nom de l'attribut.
---@return table|nil  Attribut, nil s'il n'existe pas.
function career_modules_playerAttributes.getAttribute(attributeName) end

--- Renvoie le journal des changements d'attributs ({attributeChange, reason, time}).
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:320
---@return table[]  Entrées du journal.
function career_modules_playerAttributes.getAttributeLog() end

--- Renvoie la valeur numérique d'un attribut (0 s'il n'existe pas).
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:148
---@param attributeName string Nom de l'attribut.
---@return number  Valeur.
function career_modules_playerAttributes.getAttributeValue(attributeName) end

--- Renvoie le titre (clé de traduction) de l'écran d'historique : gameplay ou financier (défaut).
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:215
---@param historyType string "gameplay" ou autre pour le financier.
---@return {title: string}  Titre.
function career_modules_playerAttributes.getCareerHistoryInfo(historyType) end

--- Historique des changements d'argent, du plus récent au plus ancien.
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:207
---@param limit integer|nil Nombre maximal (tout si nil).
---@return table[]  Lignes d'historique.
function career_modules_playerAttributes.getFinancialHistory(limit) end

--- Historique des récompenses de gameplay (changements dont les tags contiennent gameplay), avec noms d'affichage et icônes.
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:211
---@param limit integer|nil Nombre maximal (tout si nil).
---@return table[]  Lignes d'historique.
function career_modules_playerAttributes.getGameplayHistory(limit) end

--- Historique financier récent (les 5 derniers changements d'argent par défaut), du plus récent au plus ancien.
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:203
---@param limit integer|nil Nombre maximal, 5 par défaut.
---@return {reason: any, time: integer, rewards: table[]}[]  Lignes d'historique.
function career_modules_playerAttributes.getRecentFinancialChanges(limit) end

--- Renvoie la clé de traduction d'affichage d'un attribut : money, beamXP, vouchers, reputation, XP de branche {txt, context} ou la clé brute.
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:22
---@param attributeKey string Clé d'attribut.
---@return string|table  Clé de traduction ou table {txt, context}.
function career_modules_playerAttributes.getRewardDisplayName(attributeKey) end

--- Hook : crée l'attribut <orgId>Reputation (min/max de career_modules_reputation) pour chaque organisation qui n'en a pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:294
---@param active boolean Rien si false.
function career_modules_playerAttributes.onCareerActive(active) end

--- Hook : si la carrière est active, initialise les attributs puis charge playerAttributes.json et attributeLog.json avec conversions de compatibilité (renvoie false sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:226
function career_modules_playerAttributes.onExtensionLoaded() end

--- Hook d'intégration au journal de bord (corps vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:307
---@param _ any Non utilisé.
function career_modules_playerAttributes.onLogbookGetEntries(_) end

--- Hook de sauvegarde : écrit playerAttributes.json et attributeLog.json dans <save>/career/.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:288
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath) end

--- Fixe des valeurs absolues en appelant addAttributes avec la différence par rapport à la valeur actuelle.
---Source : lua/ge/extensions/career/modules/playerAttributes.lua:136
---@param newValues table<string, number> Nouvelle valeur par attribut.
---@param reason table|nil Même format que pour addAttributes.
function career_modules_playerAttributes.setAttributes(newValues, reason) end

