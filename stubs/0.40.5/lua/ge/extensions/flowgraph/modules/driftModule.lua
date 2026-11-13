---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/driftModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 0, dépend de gameplay_drift_general) qui relaie les évènements du gameplay de drift vers les nœuds flowgraph. Il écoute les hooks onDriftSpinout, onDriftCrash, onDonutDriftScored, onTightDriftScored et onDriftCompletedScored, et conserve chaque évènement dans une table de callbacks avec une durée de vie (ttl) de 2 ticks que les nœuds peuvent lire.
--- Accès : `require("extensions/flowgraph/modules/driftModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_driftModule
flowgraph_modules_driftModule = {}

--- Enregistre (ou remplace) un évènement avec ttl = 2 et des données. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param name string nom de l'évènement (tight, donut, spinout, crash, scored…)
---@param data table|nil données associées
function flowgraph_modules_driftModule.addCallback(name, data) end

--- Renvoie la table des callbacks (clé = nom, valeur = {ttl, data}). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@return table<string, table>  callbacks par nom
function flowgraph_modules_driftModule.getCallBacks() end

--- Appelé à la création du module : appelle resetModule(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.init() end

--- Hook : donut marqué ; enregistre 'donut' avec {score}. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param score number score obtenu
function flowgraph_modules_driftModule.onDonutDriftScored(score) end

--- Relaie vers gameplay_drift_drift.onDonutZoneReactivated(). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onDonutZoneReactivated() end

--- Hook : drift terminé et compté ; enregistre 'scored' avec addedScore, cachedScore et combo. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param data table champs addedScore, cachedScore, combo
function flowgraph_modules_driftModule.onDriftCompletedScored(data) end

--- Hook : crash en drift ; enregistre 'crash'. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onDriftCrash() end

--- Hook : le joueur a fait un tête-à-queue ; enregistre 'spinout'. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onDriftSpinout() end

--- Hook : drift serré marqué ; enregistre 'tight' avec {score}. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param score number score obtenu
function flowgraph_modules_driftModule.onTightDriftScored(score) end

--- Appelé à chaque mise à jour du manager : décrémente le ttl de chaque callback positif. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onUpdate() end

--- Recrée la table callbacks avec tous les évènements à ttl = 0. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.resetModule() end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/driftModule.lua
---@class flowgraph_modules_driftModule_C
local flowgraph_modules_driftModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:38
---@param name any
---@param data any
function flowgraph_modules_driftModule_C:addCallback(name, data) end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:34
function flowgraph_modules_driftModule_C:getCallBacks() end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:21
function flowgraph_modules_driftModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:57
---@param score any
function flowgraph_modules_driftModule_C:onDonutDriftScored(score) end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:65
function flowgraph_modules_driftModule_C:onDonutZoneReactivated() end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:61
---@param data any
function flowgraph_modules_driftModule_C:onDriftCompletedScored(data) end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:49
function flowgraph_modules_driftModule_C:onDriftCrash() end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:45
function flowgraph_modules_driftModule_C:onDriftSpinout() end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:53
---@param score any
function flowgraph_modules_driftModule_C:onTightDriftScored(score) end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:25
function flowgraph_modules_driftModule_C:onUpdate() end

---Source : lua/ge/extensions/flowgraph/modules/driftModule.lua:10
function flowgraph_modules_driftModule_C:resetModule() end

