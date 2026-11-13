---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/minimap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimap affichée en ImGui (API marquée expérimentale par BeamNG). Elle dessine dans une texture les routes, le joueur, les autres véhicules, la boussole, les marqueurs de playmode, etc., en forme de cercle ou de rectangle (réglage `minimapMode`). Un autre module l'active avec setDrawTransform (position et taille relatives à l'écran, entre 0 et 1) et la masque avec hide. Chaque frame, elle émet le hook `onDrawOnMinimap(td)` pour que d'autres extensions dessinent par-dessus. Contient aussi une fenêtre de réglages de debug (profilage, mesure du garbage, options d'affichage).
--- Accès : extension `ui_apps_minimap_minimap` : `extensions.load("ui_apps_minimap_minimap")`, puis la globale `ui_apps_minimap_minimap`
---@class ui_apps_minimap_minimap
---@field dependencies table<integer, string> Extensions chargées avant : topomap, additionalInfo, route, utils, roads, vehicles de la minimap, et gameplay_playmodeMarkers.
---@field onUpdate function|nil nil au départ ; défini par setDrawTransform (fonction de dessin), remis à nil par hide.
ui_apps_minimap_minimap = {}

--- Dessine des repères de debug (coins, marges) et affiche les tailles dans ImGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:720
function ui_apps_minimap_minimap.drawDebugOverlay() end

--- Dessine les masques d'occlusion et le découpage circulaire ou rectangulaire de la minimap dans la texture. Appelé par la boucle de dessin de la minimap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:668
---@param offsetX number Décalage horizontal de dessin.
---@param offsetY number Décalage vertical de dessin.
function ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY) end

--- Renvoie les listes de choix de la fenêtre de debug (`lookaheadValue`, `profileEveryNthFrame`).
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:832
---@return table  Tables `{name, value}` par réglage.
function ui_apps_minimap_minimap.getDebugSettingsData() end

--- Renvoie la forme de la minimap.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:747
---@return string  "circle" ou "rect".
function ui_apps_minimap_minimap.getMode() end

--- Renvoie l'échelle courante de la minimap.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:41
---@return number  Échelle en pixels par mètre.
function ui_apps_minimap_minimap.getScale() end

--- Masque la minimap : remet la transformation à 0 et détache onUpdate.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:812
function ui_apps_minimap_minimap.hide() end

--- Hook appelé à la fin d'une mission/niveau. Masque la minimap et réinitialise les routes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:836
function ui_apps_minimap_minimap.onClientEndMission() end

--- Hook appelé au début d'une mission/niveau. Masque la minimap et réinitialise les routes (`ui_apps_minimap_roads.reset`).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:844
function ui_apps_minimap_minimap.onClientStartMission() end

--- Appelé à l'initialisation de l'extension. Passe en déchargement manuel et lit les réglages de minimap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:11
function ui_apps_minimap_minimap.onInit() end

--- Hook appelé quand les réglages de la minimap changent. Relit le mode, l'orientation, la grille et l'anticipation (lookahead) et l'état des viewports ImGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:758
---@param m any Argument non utilisé (déduit du code).
function ui_apps_minimap_minimap.onMinimapSettingsChanged(m) end

--- Supprime la zone d'occlusion portant cet id ; si l'id n'est pas une chaîne non vide, supprime toutes les zones.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:803
---@param id string|nil Identifiant de la zone, ou nil pour tout effacer.
function ui_apps_minimap_minimap.resetOcclusionTransform(id) end

--- Fixe des marges personnalisées autour de la minimap (gauche, droite, haut, bas). Une valeur nil devient 10.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:771
---@param left number|nil Marge gauche.
---@param right number|nil Marge droite.
---@param top number|nil Marge haut.
---@param bottom number|nil Marge bas.
function ui_apps_minimap_minimap.setBuffers(left, right, top, bottom) end

--- Positionne la minimap et l'active (branche onUpdate). Les 4 valeurs doivent être entre 0 et 1, sinon avertissement et appel de hide.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:778
---@param x number Position horizontale relative (0 à 1).
---@param y number Position verticale relative (0 à 1).
---@param width number Largeur relative (0 à 1).
---@param height number Hauteur relative (0 à 1).
function ui_apps_minimap_minimap.setDrawTransform(x, y, width, height) end

--- Déclare une zone qui masque une partie de la minimap (par exemple un élément d'interface posé dessus). Ignorée avec un avertissement si une valeur sort de 0..1.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:795
---@param id string Identifiant de la zone.
---@param x number Position horizontale relative (0 à 1).
---@param y number Position verticale relative (0 à 1).
---@param width number Largeur relative (0 à 1).
---@param height number Hauteur relative (0 à 1).
function ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height) end

--- Ouvre ou ferme la fenêtre de réglages de debug.
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:820
function ui_apps_minimap_minimap.toggledebugSettings() end

