---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/windDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visualise le champ de vent partagé : échantillonne `be:getWindAt()` sur une grille de 21 x 21 points espacés de 5 m centrée sur la caméra, et dessine une flèche par point (direction = vent, longueur et couleur = vitesse, du bleu au rouge à 20 m/s). Un texte au centre affiche la vitesse du vent en m/s et km/h. Les rafales s'animent car le champ varie dans le temps.
--- Accès : extension `util_windDebug` : `extensions.load("util_windDebug")`, puis la globale `util_windDebug`
---@class util_windDebug
---@field enabled boolean Vrai quand la visualisation du vent est active.
util_windDebug = {}

--- Hook de pré-rendu : si enabled, dessine la grille de flèches de vent autour de la caméra et le texte de vitesse au centre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/windDebug.lua:43
---@param dtReal number temps réel écoulé, en secondes
---@param dtSim number temps simulé écoulé, en secondes
function util_windDebug.onPreRender(dtReal, dtSim) end

--- Active ou désactive l'affichage.
---Source : lua/ge/extensions/util/windDebug.lua:66
---@param v any toute valeur ; convertie en booléen (vrai si truthy)
function util_windDebug.setEnabled(v) end

--- Inverse l'état d'affichage.
---Source : lua/ge/extensions/util/windDebug.lua:67
function util_windDebug.toggle() end

