---@meta
-- tim19Atlas stub generated from lua/vehicle/damageTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre des états de dommage du véhicule, organisés par groupe puis par nom (ex. groupe 'energyStorage', nom du réservoir). Chaque changement est mis en file et envoyé à l'UI toutes les 1/3 s via le hook `DamageData`, avec des callbacks optionnels pour d'autres modules. Un moddeur appelle setDamage pour signaler une panne et getDamage pour la lire.
--- Accès : globale `damageTracker`
---@class damageTracker
damageTracker = {}

--- Lit l'état de dommage d'un couple groupe/nom.
---Source : lua/vehicle/damageTracker.lua:78
---@param group string Groupe.
---@param name string Nom.
---@return any  La valeur, ou false si absente.
function damageTracker.getDamage(group, name) end

--- Appelé à la création du véhicule : vide données, deltas, callbacks et temporisations.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/damageTracker.lua:106
function damageTracker.init() end

--- Ajoute un callback appelé à chaque envoi de DamageData avec (damageData, damageDataDelta). Ignoré si nil.
---Source : lua/vehicle/damageTracker.lua:91
---@param callback function function(damageData, damageDataDelta).
function damageTracker.registerDamageUpdateCallback(callback) end

--- Appelé au reset : vide données, deltas et temporisations (garde les callbacks).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/damageTracker.lua:98
function damageTracker.reset() end

--- Force l'envoi du hook DamageData et des callbacks à la prochaine frame (remet le minuteur à 0).
---Source : lua/vehicle/damageTracker.lua:82
function damageTracker.sendNow() end

--- Définit l'état de dommage d'un couple groupe/nom (annule toute temporisation en cours sur ce couple).
---Source : lua/vehicle/damageTracker.lua:46
---@param group string Groupe de dommage (ex. 'energyStorage').
---@param name string Nom dans le groupe.
---@param value boolean|number|string Valeur du dommage (en pratique true/false).
---@param notifyUI boolean|nil Si vrai, affiche un message à l'écran.
function damageTracker.setDamage(group, name, value, notifyUI) end

--- Comme setDamage mais programme un retour à timeoutValue après timeout secondes.
---Source : lua/vehicle/damageTracker.lua:72
---@param group string Groupe.
---@param name string Nom.
---@param value any Valeur immédiate.
---@param timeoutValue any Valeur appliquée à l'expiration.
---@param timeout number Délai en secondes.
---@param notifyUI boolean|nil Notifier l'UI à l'application immédiate.
function damageTracker.setDamageTemporary(group, name, value, timeoutValue, timeout, notifyUI) end

--- Vaut nop au repos ; devient updateGFXDirty quand un dommage change ou doit expirer. Envoie périodiquement DamageData et décompte les dommages temporaires. Appelé chaque frame par la boucle principale. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/damageTracker.lua:dyn
---@param dt number Pas de temps en secondes.
function damageTracker.updateGFX(dt) end

--- Indique si un envoi vient juste d'être armé (minuteur à sa valeur pleine) et qu'un premier joueur est assis.
---Source : lua/vehicle/damageTracker.lua:87
---@return boolean  true si l'envoi est imminent.
function damageTracker.willSend() end

