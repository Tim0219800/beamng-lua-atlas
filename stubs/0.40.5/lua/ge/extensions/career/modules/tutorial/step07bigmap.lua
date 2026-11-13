---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step07bigmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 7 du tutoriel de carrière (« bigmap ») : apprendre la grande carte. Le joueur l'ouvre, lit une popup (v2/bigmapTutorial), sélectionne le point d'intérêt du garage (tutorial_apm_parking), définit un itinéraire vers lui (à 10 m de la place garageExteriorPark), puis ferme la carte ; l'étape suivante s'active 1 s après. Un message d'aide sur le bulletin de temps (timeslip) s'affiche dans la zone timeslipHint quand la carte est fermée.
--- Accès : extension `career_modules_tutorial_step07bigmap` : `extensions.load("career_modules_tutorial_step07bigmap")`, puis la globale `career_modules_tutorial_step07bigmap`
---@class career_modules_tutorial_step07bigmap
career_modules_tutorial_step07bigmap = {}

--- Retire le reset de zone, le message timeslip et la liste de tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:226
function career_modules_tutorial_step07bigmap.cleanup() end

--- Hook émis à l'ouverture de la grande carte : masque l'aide timeslip et, à la première ouverture, ouvre la popup v2/bigmapTutorial après 0,5 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:151
function career_modules_tutorial_step07bigmap.onActivateBigMapCallback() end

--- Hook de sortie de zone : lance le reset de sortie de zone de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:146
function career_modules_tutorial_step07bigmap.onCareerTutorialLeftBounds() end

--- Hook émis à la fermeture de la grande carte : si l'itinéraire est posé, valide l'objectif de fermeture et avance d'étape après 1 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:200
function career_modules_tutorial_step07bigmap.onDeactivateBigMapCallback() end

--- Affiche l'état de l'étape et un bouton « Skip Step 7 ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:234
---@param im table Table ui_imgui.
function career_modules_tutorial_step07bigmap.onDebugMenu(im) end

--- Hook de fermeture de popup : à la fermeture de v2/bigmapTutorial, affiche l'objectif de sélection d'un POI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:167
---@param id string Id de la popup.
function career_modules_tutorial_step07bigmap.onIntroPopupCareerClosed(id) end

--- Hook émis quand un POI est sélectionné : valide l'objectif si c'est le POI du garage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:175
---@param poiId string Id du POI sélectionné.
function career_modules_tutorial_step07bigmap.onPoiSelectedFromBigmap(poiId) end

--- Hook émis quand un itinéraire est défini sur la carte : valide l'objectif si la destination est à moins de 10 m du garage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:187
---@param pos table Position de destination (champs x, y, z).
function career_modules_tutorial_step07bigmap.onSetBigmapNavFocus(pos) end

--- Appelé chaque frame : affiche ou masque le message d'aide timeslip selon que le joueur est dans la zone timeslipHint, dans les limites et que la carte est fermée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:213
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step07bigmap.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation : remet les objectifs à zéro, débloque la grande carte, active les zones drivingToDragBounds et dragStripBounds, affiche le message « ouvrir la grande carte » et vide les POI bruts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:118
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step07bigmap.setup(stepData) end

