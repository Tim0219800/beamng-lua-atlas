---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/surfaceMaskWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fait laisser aux roues du véhicule du joueur une trace dans le « surface mask » (SurfaceMaskClipmap, objet C++ qui garde un masque dynamique de la surface du terrain, par exemple l'herbe aplatie). Toutes les 0,05 s, pour chaque roue, il convertit la position (nœud d'axe de roue) en monde et appelle maskCircleWorld (premier contact) ou maskLineWorld (segment depuis la dernière position) avec une largeur de 1,8 m (3,2 m en mode tondeuse). Il possède aussi le cycle de vie du clipmap : stockage des tuiles sous /temp/levels/<niveau>/dynamicTiles, recentrage sur le véhicule, effacement. Il offre un mode tondeuse (particules d'herbe coupée) et des outils de débogage (ligne de console, fenêtre ImGui « SurfaceMask Pages », contours 3D des pages de 16 m). D'autres extensions (par exemple util_lawnMower) s'en servent comme service via isReady, setCenter, maskCircleWorld et maskLineWorld.
--- Accès : extension `util_surfaceMaskWheels` : `extensions.load("util_surfaceMaskWheels")`, puis la globale `util_surfaceMaskWheels`
---@class util_surfaceMaskWheels
---@field dependencies string[] Extension chargée avant : ui_imgui.
---@field enabled boolean true quand le marquage par les roues est actif (modifié par setEnabled/toggle).
util_surfaceMaskWheels = {}

--- Efface tout le surface mask (SurfaceMaskClipmap:clear()).
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:448
function util_surfaceMaskWheels.clear() end

--- Passe au mode de débogage suivant (0, 1, 2, puis retour à 0).
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:538
function util_surfaceMaskWheels.cycleDebug() end

--- Renvoie une copie des statistiques de performance côté Lua.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:512
---@return table  {maskTicks, lastLuaFrameMs, avgLuaFrameMs, lastLuaMaskMs, avgLuaMaskMs, lastWheelCount, lastMovedWheels, lastSkippedWheels, lastMaskCalls, lastParticleCalls}.
function util_surfaceMaskWheels.getPerformanceStats() end

--- Indique si l'objet SurfaceMaskClipmap existe. Permet aux modules consommateurs de sauter leur travail.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:455
---@return boolean  true si SurfaceMaskClipmap est disponible.
function util_surfaceMaskWheels.isReady() end

--- Estampille un disque dans le masque.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:463
---@param x number X monde du centre (m).
---@param y number Y monde du centre (m).
---@param radius number Rayon (m).
---@param flatten number Force d'aplatissement de l'herbe (0 à 1 d'après les valeurs utilisées).
---@param mark number Force de marquage (0 à 1 d'après les valeurs utilisées).
function util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark) end

--- Estampille un segment épais dans le masque.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:467
---@param x1 number X monde du début (m).
---@param y1 number Y monde du début (m).
---@param x2 number X monde de la fin (m).
---@param y2 number Y monde de la fin (m).
---@param width number Largeur du trait (m).
---@param flatten number Force d'aplatissement.
---@param mark number Force de marquage.
function util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark) end

--- Hook appelé au démarrage d'un niveau : repointe le stockage des tuiles du clipmap vers le niveau courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:427
function util_surfaceMaskWheels.onClientStartMission() end

--- Hook appelé après rechargement avec l'état sérialisé ; restaure les paramètres (taille de tuile de débogage limitée à 36).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:492
---@param data table|nil État sérialisé.
function util_surfaceMaskWheels.onDeserialized(data) end

--- Hook appelé au chargement de l'extension : active le module, coupe le débogage et initialise le stockage des tuiles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:421
function util_surfaceMaskWheels.onExtensionLoaded() end

--- Hook appelé à chaque frame avant le rendu : accumule le temps simulé, exécute le marquage des roues du véhicule du joueur à chaque maskInterval, puis le débogage éventuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:391
---@param dtReal number Durée réelle de la frame (s).
---@param dtSim number Durée simulée (s), prioritaire sur dtReal.
function util_surfaceMaskWheels.onPreRender(dtReal, dtSim) end

--- Hook de sérialisation avant rechargement des extensions : renvoie l'état et les paramètres (enabled, largeurs, forces, seuils, mode de débogage, tondeuse, particules).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:471
---@return table  État à restaurer.
function util_surfaceMaskWheels.onSerialize() end

--- Hook appelé quand un véhicule est détruit : supprime ses données de roues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:431
---@param vehId integer Identifiant du véhicule.
function util_surfaceMaskWheels.onVehicleDestroyed(vehId) end

--- Hook appelé après un reset de véhicule : supprime ses données de roues pour les reconstruire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:435
---@param vehId integer Identifiant du véhicule.
function util_surfaceMaskWheels.onVehicleResetted(vehId) end

--- Recentre le clipmap : le C++ sauvegarde les tuiles modifiées qui sortent et charge celles qui entrent.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:459
---@param x number Coordonnée X monde (m).
---@param y number Coordonnée Y monde (m).
function util_surfaceMaskWheels.setCenter(x, y) end

--- Compatibilité : true active le mode 2, false le mode 0.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:534
---@param enabled boolean Activer le débogage complet.
function util_surfaceMaskWheels.setDebug(enabled) end

--- Choisit le mode de débogage (0 aucun, 1 console, 2 fenêtre + 3D) ; la valeur est bornée à 0..2 et la première ligne de console est émise tout de suite.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:527
---@param mode integer|nil Mode de débogage.
function util_surfaceMaskWheels.setDebugMode(mode) end

--- Fixe le rayon (en pages) de la grille de débogage affichée autour du véhicule (0 = page courante seulement).
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:554
---@param radius integer|nil Rayon en pages, minimum 0.
function util_surfaceMaskWheels.setDebugPageRadius(radius) end

--- Active ou désactive le marquage par les roues et remet à zéro le minuteur.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:439
---@param enabled boolean true pour activer.
function util_surfaceMaskWheels.setEnabled(enabled) end

--- Fixe la largeur de coupe de la tondeuse.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:550
---@param width number|nil Largeur en mètres ; nil conserve la valeur actuelle.
function util_surfaceMaskWheels.setMowerWidth(width) end

--- Active ou désactive le mode tondeuse (largeur 3,2 m, marquage 1, particules d'herbe).
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:542
---@param enabled boolean true pour activer.
function util_surfaceMaskWheels.setMowingEnabled(enabled) end

--- Inverse l'état d'activation.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:444
function util_surfaceMaskWheels.toggle() end

--- Inverse le mode tondeuse.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:546
function util_surfaceMaskWheels.toggleMowing() end

