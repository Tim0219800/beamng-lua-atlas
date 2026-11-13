---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/unlockFlags.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drapeaux de déblocage de la carrière. Les définitions viennent des autres extensions via le hook onGetUnlockFlagDefinitions (chacune ajoute {unlockedFunction, icon, level, label} dans la table reçue) ; la valeur d'un drapeau est calculée à la demande avec unlockedFunction puis mise en cache, ou forcée avec setFlag.
--- Accès : extension `career_modules_unlockFlags` : `extensions.load("career_modules_unlockFlags")`, puis la globale `career_modules_unlockFlags`
---@class career_modules_unlockFlags
---@field dependencies string[] {"career_saveSystem"}.
career_modules_unlockFlags = {}

--- Retourne la valeur d'un drapeau (en l'évaluant via sa définition si besoin). false si le drapeau n'a pas de définition.
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:29
---@param flagName string Nom du drapeau.
---@return boolean  Valeur du drapeau.
function career_modules_unlockFlags.getFlag(flagName) end

--- Retourne la définition enregistrée d'un drapeau.
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:38
---@param flagName string Nom du drapeau.
---@return table|nil  Définition {unlockedFunction, icon, level, label} ou nil.
function career_modules_unlockFlags.getFlagDefinition(flagName) end

--- Hook appelé à l'activation de la carrière : vide le cache et recharge les définitions via le hook onGetUnlockFlagDefinitions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:59
function career_modules_unlockFlags.onCareerActivated() end

--- Hook de sauvegarde du profil ; ne fait rien dans cette version.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:23
---@param currentSavePath string Dossier de sauvegarde du profil.
function career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath) end

--- Vide le cache des valeurs de drapeaux (les définitions restent).
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:55
function career_modules_unlockFlags.resetFlags() end

--- Force la valeur d'un drapeau dans le cache et émet onUnlockFlagChanged.
---Source : lua/ge/extensions/career/modules/unlockFlags.lua:49
---@param flagName string Nom du drapeau.
---@param value boolean Nouvelle valeur.
function career_modules_unlockFlags.setFlag(flagName, value) end

