---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/camPathEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de chemins de caméra du World Editor (fenêtre « Path Camera Tool », mode d'édition « Edit Camera Paths »). Il édite les chemins gérés par core_paths : chaque chemin est une liste de marqueurs {pos, rot, time, fov, positionSmooth, trackPosition, trackOffset, bullettime, cut, movingStart, movingEnd…} triés par temps. On peut créer/charger/sauver/supprimer un chemin, ajouter des marqueurs (Shift + clic gauche en mode édition, ou « + Add Marker » à la position de la caméra), régler les temps (Even Speed, Set Duration, Reverse, Relax Timings, Auto-smooth), orienter la caméra façon FPV (bank/aim), prévisualiser, lier le chemin à un replay (core_replay) et le jouer (core_paths.playPath), éventuellement en fermant l'éditeur. Il dessine les chemins (splines, frustums de caméra, sphères de marqueurs) et des surcouches de cadrage (règle des tiers, 16:9, 9:16). Dépend de core_camera.
--- Accès : extension `editor_camPathEditor` : `extensions.load("editor_camPathEditor")`, puis la globale `editor_camPathEditor`
---@class editor_camPathEditor
---@field dependencies string[] {'core_camera'} : extensions chargées avant celle-ci.
---@field onExtensionLoaded nil Référence à une variable locale jamais définie : vaut nil (voir notes).
editor_camPathEditor = {}

--- Fournit à core/cameraModes/path le décalage de suivi du véhicule réglé dans l'éditeur.
---Source : lua/ge/extensions/editor/camPathEditor.lua:2476
---@return table|nil  {x = droite/gauche, y = avant/arrière, z = haut/bas} en mètres, ou nil si les trois valeurs sont à 0
function editor_camPathEditor.getTrackingOffset() end

--- Appelé au début d'un niveau/mission : désélectionne le chemin courant (selectPath(nil)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/camPathEditor.lua:2471
function editor_camPathEditor.onClientStartMission() end

--- Dessine la fenêtre « Path Camera Tool » (menu File : New, Load, Save, Delete, Render Options ; choix du chemin, replay, liste et propriétés des marqueurs, outils de timing, FOV, suivi, boutons Play, Play (Close Editor) et Stop) et les chemins de caméra dans le monde. Appelé à chaque frame par l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/camPathEditor.lua:2020
function editor_camPathEditor.onEditorGui() end

--- Enregistre le mode d'édition camPathEditMode (icône, actionMap « CamPathEditor », raccourci Shift + clic gauche = « Add new marker ») et les fenêtres « pathCameraTool » (200x400) et « cameraPathPreviewWindow » (600x400).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/camPathEditor.lua:2453
function editor_camPathEditor.onEditorInitialized() end

--- Appelé avant le rendu : si l'éditeur est actif en mode « Edit Camera Paths », mémorise le ratio d'aspect de la fenêtre et dessine la surcouche de cadrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/camPathEditor.lua:2433
function editor_camPathEditor.onPreRender() end

--- Hook par frame, actuellement vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/camPathEditor.lua:2429
---@param dtReal number Delta temps réel en secondes
---@param dtSim number Delta temps de simulation
---@param dtRaw number Delta temps brut
function editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw) end

--- Sélectionne un chemin de caméra : met à jour M.currentPath, désélectionne le marqueur, et charge le replay associé (path.replay) s'il existe et diffère du replay chargé ; sinon arrête le replay en cours.
---Source : lua/ge/extensions/editor/camPathEditor.lua:127
---@param path table|nil Chemin core_paths, ou nil pour désélectionner
function editor_camPathEditor.selectPath(path) end

