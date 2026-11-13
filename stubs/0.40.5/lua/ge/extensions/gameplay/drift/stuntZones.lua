---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des zones de cascade (stunt zones) du mode drift/Gymkhana. setStuntZones(zones) crée un objet par zone en chargeant le sous-module du type demandé (donut, driftThrough, hitPole, nearPole, dans gameplay/drift/stuntZones/<type>) ; ensuite, à chaque frame, tant que le joueur drifte, il appelle detectStunt() des zones disponibles où il se trouve. Quand une zone est réussie, elle émet onAnyStuntZoneAccomplished, que ce module relaie vers le stallingSystem et vers un sous-hook (onDonutDriftAccomplished, onDriftThroughAccomplished, onHitPoleAccomplished, onNearPoleAccomplished) pris en charge par gameplay_drift_scoring. Chargé par gameplay_drift_general en contexte inChallenge ; les zones viennent de gameplay_drift_saveLoad.loadDriftData.
--- Accès : extension `gameplay_drift_stuntZones` : `extensions.load("gameplay_drift_stuntZones")`, puis la globale `gameplay_drift_stuntZones`
---@class gameplay_drift_stuntZones
---@field dependencies string[] gameplay_drift_general, chargé avant.
gameplay_drift_stuntZones = {}

--- Supprime toutes les zones (poteaux et marqueurs inclus) et oublie les types de zones déjà approchés.
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:215
function gameplay_drift_stuntZones.clear() end

--- INTERNE : supprime une zone par id (appelle son clear s'il existe, puis la retire de la liste). Utilisé par les poteaux détruits.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:299
---@param id integer Id de la zone.
function gameplay_drift_stuntZones.clearStuntZone(id) end

--- Choisit la couleur d'un segment du cercle d'un donut : bleu (portion remplie), vert (prête), rouge/blanc (pendant le cooldown).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:63
---@param cooldownPerc number|nil Pourcentage de cooldown écoulé (100 = prêt).
---@param filledPerc number|nil Pourcentage du tour déjà effectué.
---@param t number Position du segment sur le cercle, de 0 à 1.
---@return ColorF  Couleur du segment.
function gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t) end

--- TEST : indique si le tracé des zones est activé (case imgui « Draw lines », vrai par défaut).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:333
---@return boolean  true si on dessine.
function gameplay_drift_stuntZones.getDrawLines() end

--- Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:349
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_stuntZones.getDriftDebugInfo() end

--- Couleur verte (zone prête).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:337
---@return ColorF  Vert.
function gameplay_drift_stuntZones.getGreenColor() end

--- Épaisseur de ligne de debug en fonction de la distance à la caméra (250 / distance).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:353
---@param linePos vec3 Position du point de la ligne.
---@return number  Épaisseur.
function gameplay_drift_stuntZones.getLineThickness(linePos) end

--- Couleur rouge (cooldown).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:345
---@return ColorF  Rouge.
function gameplay_drift_stuntZones.getRedColor() end

--- Renvoie la liste des objets de zone instanciés (chaque objet a data = {id, zoneData, nearDist, drawData}, activeData et les méthodes du type).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:312
---@return table[]  Zones actives.
function gameplay_drift_stuntZones.getStuntZones() end

--- Couleur blanche (cooldown).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:341
---@return ColorF  Blanc.
function gameplay_drift_stuntZones.getWhiteColor() end

--- Agrandit le pool global de decals jusqu'à max éléments (flèche rouge, fade 100 à 150). Dépend d'une variable globale decals non définie ici.
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:48
---@param max integer Taille minimale voulue du pool.
function gameplay_drift_stuntZones.increaseDecalPool(max) end

--- Hook : une zone est réussie ; informe le stallingSystem (processStuntZone) puis relaie le sous-hook demandé avec ses données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:361
---@param data table {stuntZoneId, subHookName, subHookData}.
function gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data) end

--- Hook : réactive le dessin des zones quand le debug change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:357
function gameplay_drift_stuntZones.onDriftDebugChanged() end

--- Hook : quand le drift s'arrête, remet à zéro l'angle cumulé des zones donut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:289
---@param isDrifting boolean Nouvel état de drift.
function gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting) end

--- Hook : supprime toutes les zones au déchargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:316
function gameplay_drift_stuntZones.onExtensionUnloaded() end

--- Hook : supprime toutes les zones avant un rechargement Lua (ne renvoie aucune donnée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:320
function gameplay_drift_stuntZones.onSerialize() end

--- Appelé à chaque frame : fenêtre de debug, puis (hors pause/gel) pour chaque zone disponible détecte l'approche (onNearStuntZoneFirst), appelle detectStunt() si le joueur drifte dans la zone, puis onUpdate de la zone et gestion du cooldown.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:167
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulé (cooldowns).
---@param dtRaw number Delta temps brut (inutilisé).
function gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : relaie la destruction d'un véhicule aux zones (les poteaux détruits se retirent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:325
---@param vehId integer Véhicule détruit.
function gameplay_drift_stuntZones.onVehicleDestroyed(vehId) end

--- Appelle reset() sur chaque zone (cooldowns, compteurs, poteaux remis en place).
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:209
function gameplay_drift_stuntZones.reset() end

--- Remplace toutes les zones par la liste donnée : vide les zones existantes (clear), calcule la distance « near », le score par défaut et les données de dessin, puis instancie chaque zone via require("gameplay/drift/stuntZones/<type>"). Les ids sont attribués de 1 à n.
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:224
---@param zones table[] Liste de {type, pos, scl, rot, cooldown, score}.
function gameplay_drift_stuntZones.setStuntZones(zones) end

