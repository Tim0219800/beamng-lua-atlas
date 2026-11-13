---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/bounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les limites de la zone du tutoriel de carrière. Il vérifie que le joueur reste dans les zones actives des sites du tutoriel ; sinon il affiche un avertissement avec un compte à rebours de 5 s dans la liste de tâches, puis déclenche un retour automatique via des callbacks (hooks onCareerTutorial...). Peut aussi dessiner les zones actives en debug.
--- Accès : extension `gameplay_tutorial_bounds` : `extensions.load("gameplay_tutorial_bounds")`, puis la globale `gameplay_tutorial_bounds`
---@class gameplay_tutorial_bounds
gameplay_tutorial_bounds = {}

--- Quitte l'état hors limites et remet à zéro sites, zones actives, zones désactivées et debug.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:278
function gameplay_tutorial_bounds.cleanup() end

--- Renvoie la liste triée des noms de zones actives.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:188
---@return string[]  Noms triés par ordre alphabétique.
function gameplay_tutorial_bounds.getActiveZoneNames() end

--- Indique si le dessin debug des zones est actif.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:205
---@return boolean  État du dessin debug.
function gameplay_tutorial_bounds.getDebugDrawBounds() end

--- Renvoie la table interne zoneEnabled (nom -> booléen), référence directe.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:197
---@return table<string, boolean>  Zones explicitement activées/désactivées.
function gameplay_tutorial_bounds.getEnabledZones() end

--- Indique si une zone est activée (true par défaut si jamais réglée).
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:183
---@param zoneName string Nom de la zone.
---@return boolean  État d'activation.
function gameplay_tutorial_bounds.getZoneEnabled(zoneName) end

--- Indique si le joueur est dans les limites. Renvoie true si le tutoriel n'est pas actif.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:209
---@return boolean  true si dans une zone active et activée (ou si rien à contrôler).
function gameplay_tutorial_bounds.isInBounds() end

--- Hook de rendu appelé chaque frame ; dessine les zones actives si le debug est activé et le tutoriel actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:271
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps de simulation.
---@param dtRaw number Delta temps brut.
function gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw) end

--- Définit la liste des zones dans lesquelles le joueur est autorisé (remplace la liste précédente).
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:170
---@param names string[]|nil Noms de zones ; nil vide la liste (plus de limite).
function gameplay_tutorial_bounds.setActiveZones(names) end

--- Remplace tout ou partie des callbacks de sortie de limites ; les clés absentes conservent leur callback actuel.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:71
---@param newCallbacks table Clés possibles : onOutOfBoundsStarted, onOutOfBoundsEnded, onOutOfBoundsTimedOut(currentStepId), onOutOfBoundsWhileNotAllowed.
function gameplay_tutorial_bounds.setCallbacks(newCallbacks) end

--- Définit la fonction qui renvoie l'identifiant de l'étape courante du tutoriel (transmis au callback de timeout).
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:63
---@param getter function Fonction sans argument renvoyant l'id d'étape (string) ou nil.
function gameplay_tutorial_bounds.setCurrentStepGetter(getter) end

--- Active ou coupe le dessin debug des zones actives (jaune semi-transparent), effectué dans onPreRender.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:201
---@param enabled boolean true pour dessiner.
function gameplay_tutorial_bounds.setDebugDrawBounds(enabled) end

--- Définit la fonction qui indique si le tutoriel est actif. Une valeur non fonctionnelle la remet à une fonction renvoyant false.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:55
---@param getter function Fonction sans argument renvoyant un booléen.
function gameplay_tutorial_bounds.setRuntimeActiveGetter(getter) end

--- Définit l'objet de sites (avec zones) utilisé pour tester les limites. S'il est nil, update le charge depuis gameplay_tutorial_setup.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:166
---@param newSites table|nil Objet sites avec sites.zones.byName / sites.zones.objects ou la méthode getZonesForPosition.
function gameplay_tutorial_bounds.setSites(newSites) end

--- Active ou désactive temporairement une zone sans la retirer de la liste active.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:179
---@param zoneName string Nom de la zone.
---@param enabled boolean false pour ignorer cette zone.
function gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled) end

--- À appeler chaque frame : si le tutoriel est actif, teste les limites ; hors limites, affiche l'avertissement avec compte à rebours, et après 5 s déclenche (via un job de 1 s de pause) le callback onOutOfBoundsTimedOut. Si le retour automatique n'est pas autorisé (gameplay_tutorial_setup.isOutOfBoundsResetAllowed), appelle seulement onOutOfBoundsWhileNotAllowed.
---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:214
---@param dtReal number Delta temps réel en secondes.
function gameplay_tutorial_bounds.update(dtReal) end

