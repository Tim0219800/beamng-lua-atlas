---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/damageAssessment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Évalue les dégâts d'un véhicule : niveau global (aucun, léger, modéré, sévère) d'après map.objects[id].damage, et répartition par zone. Pour la répartition, la boîte orientée du véhicule est découpée en 27 cellules (3x3x3) dont on lit les dégâts de poutres et de collision ; les cellules sont regroupées en zones nommées (Front, Front Left, Rear, Top, Left…). Utilisé par gameplay_util_crashDetection pour dire où un impact a eu lieu.
--- Accès : extension `gameplay_util_damageAssessment` : `extensions.load("gameplay_util_damageAssessment")`, puis la globale `gameplay_util_damageAssessment`
---@class gameplay_util_damageAssessment
gameplay_util_damageAssessment = {}

--- Mesure l'hétérogénéité d'une série de dégâts : écart-type divisé par la moitié de maxValue, plafonné à 1.
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:272
---@param tableNumbers number[] Dégâts par cellule.
---@param maxValue number|nil Valeur de référence (500000 par défaut).
---@return number  0 (uniforme ou moins de 2 valeurs) à 1.
function gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue) end

--- Renvoie le niveau de dégâts global d'un véhicule d'après map.objects[vehId].damage.
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:149
---@param vehId integer Id du véhicule (doit exister dans map.objects).
---@return table  {damageName = "No damage"|"Minor"|"Moderate"|"Severe", damageSeverity = 0..3}
function gameplay_util_damageAssessment.getOverallDamageLevel(vehId) end

--- Lit les dégâts de poutres et de collision des 27 cellules du véhicule.
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:182
---@param vehId integer|nil Id du véhicule ; joueur 0 si nil.
---@return table<integer, table>  Indices 0 à 26 -> {sectionBeamDamage, sectionCollisionDamage}.
function gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId) end

--- Identique à getTextualCollisionDamageLocations mais sur les dégâts de poutres (déformation), pour savoir où le véhicule s'est abîmé.
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:408
---@param data table|nil Même format.
---@return table  Même format.
function gameplay_util_damageAssessment.getTextualBeamDamageLocations(data) end

--- Compare les dégâts de collision actuels à un état précédent et renvoie, par zone nommée, total, maximum, moyenne, variation, intensité et score. Sert à savoir où un impact a eu lieu.
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:403
---@param data table|nil {vehId, oldSectionsDamageRaw (sortie de getSectionsDamageInfoRaw), newSectionsDamageInfoRaw (facultatif)}.
---@return table  {damagedLocations (par nom de zone), mostDamagedLocation, totalDamage, bestDamageLocation, bestDamageScore}
function gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data) end

--- Hook appelé après rechargement : restaure le drapeau debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:418
---@param data table Table de onSerialize.
function gameplay_util_damageAssessment.onDeserialized(data) end

--- Hook appelé lors du rechargement des extensions : sauvegarde le drapeau debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:412
---@return table  {debug}
function gameplay_util_damageAssessment.onSerialize() end

--- Hook appelé à chaque image ; en mode debug, redessine les cellules du véhicule du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:422
function gameplay_util_damageAssessment.onUpdate() end

--- Active ou désactive le dessin de debug des cellules de dégâts.
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:428
---@param newDebug boolean true pour activer.
function gameplay_util_damageAssessment.setDebug(newDebug) end

