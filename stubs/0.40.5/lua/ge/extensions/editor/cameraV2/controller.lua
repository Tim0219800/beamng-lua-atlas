---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur de Camera V2 : traite l'entrée souris routée vers Camera V2 et l'applique à la caméra libre existante (core_camera, caméra globale « free »). Il gère le panoramique à la souris (clic droit ou milieu selon la préférence swapPanOrbitButtons), délègue l'orbite à editor/cameraV2/orbit et le zoom à editor/cameraV2/zoom, anime la focalisation par double clic gauche (centrage sur le point visé avec un easing à dépassement), et règle la translation planaire WASD de la caméra libre. Il s'appuie sur core/cameraControllerRegistry (acquire/release/isOwner avec l'id « editor.cameraV2 ») pour qu'un geste ne soit traité que par un seul chemin d'entrée.
--- Accès : extension `editor_cameraV2_controller` : `extensions.load("editor_cameraV2_controller")`, puis la globale `editor_cameraV2_controller`
---@class editor_cameraV2_controller
editor_cameraV2_controller = {}

--- Active le contrôleur et annule tout mouvement en cours. Appelé par cameraV2 à l'enregistrement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:458
function editor_cameraV2_controller.activate() end

--- Annule pan, zoom, orbite et focalisation en cours, remet à zéro la molette en attente, ré-affiche le curseur si besoin et libère la propriété du registre de contrôleurs.
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:463
function editor_cameraV2_controller.cancel() end

--- Détecte (une seule fois par frame, résultat mis en cache) un double clic gauche valide et, si le raycast touche un point raisonnable devant la caméra, démarre la transition de focalisation. Appelé aussi depuis cameraV2.consumeFocusDoubleClick pour que l'éditeur ne traite pas ce clic comme une sélection.
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:291
---@return boolean  true si le double clic a été consommé et la focalisation lancée
function editor_cameraV2_controller.consumeFocusDoubleClick() end

--- Désactive le contrôleur, annule tout et réinitialise l'orbite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:477
function editor_cameraV2_controller.deactivate() end

--- Relaie zoom.lastZoomUsedTerrainOnly() (debug).
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:483
---@return boolean  voir zoom
function editor_cameraV2_controller.lastZoomUsedTerrainOnly() end

--- Hook de molette de l'éditeur : si Camera V2 est actif, que la caméra libre est active et que la vue est survolée, annule pan/orbite/focalisation, prend la main sur le registre et accumule la valeur dans pendingWheel pour update().
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:346
---@param value number Crans de molette
---@return boolean  true si l'événement est consommé ; false si le contrôleur est inactif ou non acquis
function editor_cameraV2_controller.onEditorMouseWheel(value) end

--- Hook d'entrée relative (mouvement souris) : si le bouton de pan est enfoncé, acquiert le registre ; si le bouton d'orbite est enfoncé, passe les axes à orbit.onMouseInput ; sinon bloque ou laisse passer l'entrée selon l'état. Ne traite que le joueur 0.
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:358
---@param axis string|integer Axe d'entrée relatif (transmis tel quel à orbit.onMouseInput)
---@param value number Valeur du mouvement
---@param player integer|nil Indice du joueur (nil = 0)
---@return boolean  true si Camera V2 consomme l'entrée
function editor_cameraV2_controller.onRelativeInput(axis, value, player) end

--- Relaie orbit.getDebugState() (pivot d'orbite, distance, source, mouvement en cours) pour la fenêtre de debug.
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:487
---@return table|nil  État de debug d'orbite
function editor_cameraV2_controller.orbitDebugState() end

--- État de debug du pan : point touché et distance au point, soit du geste en cours, soit du dernier calcul d'échelle planaire.
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:491
---@return table|nil  {point = vec3, distance = number|nil}, ou nil
function editor_cameraV2_controller.panDebugState() end

--- Active ou désactive la translation WASD dans le plan XY sur la caméra libre (mode WASD « pan »). Efface les mouvements et entrées planaires résiduels et remet à zéro les paramètres planarTranslation* de la caméra libre.
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:504
---@param planar boolean true pour le mode planaire (tout le reste vaut false)
function editor_cameraV2_controller.setPlanarTranslation(planar) end

--- Boucle principale appelée à chaque frame par cameraV2.onUpdate : met à jour l'échelle de translation planaire, traite le double clic de focalisation, la molette (zoom), l'acquisition du contrôleur, le zoom lissé, le pan, l'orbite et la focalisation, puis libère le registre quand plus rien ne bouge.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2/controller.lua:397
---@param deltaTime number|nil Secondes ; limité à [0 ; 0,05]
function editor_cameraV2_controller.update(deltaTime) end

