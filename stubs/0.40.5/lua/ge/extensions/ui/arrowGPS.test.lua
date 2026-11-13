---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/arrowGPS.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de l'extension ui_arrowGPS (flèche GPS flottante à l'écran). Le fichier charge arrowGPS.lua dans un environnement simulé (faux createObject TSStatic, faux core_camera, GFXDevice, scenetree) via loadfile + setfenv, puis vérifie la création paresseuse de la flèche, sa réutilisation, sa couleur, sa rotation vers la cible de plus haute priorité et sa recréation après suppression de l'objet. Utile à un moddeur pour comprendre le contrat de ui_arrowGPS (setTarget, removeTarget, setScale, setDepth, setAppScreenPos, onPreRender).
--- Accès : extension `ui_arrowGPS.test` : `extensions.load("ui_arrowGPS.test")`, puis la globale `ui_arrowGPS.test`
---@class ui_arrowGPS.test
ui_arrowGPS.test = {}

--- Vérifie qu'aucun objet n'est créé tant qu'aucune cible valide (avec pos) n'est posée : onPreRender, setTarget sans pos, removeTarget et onExtensionUnloaded ne créent rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:54
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testIdleExtensionDoesNotCreateArrow(ctx) end

--- Vérifie que la cible de priorité la plus basse (1) dicte la couleur et la direction de la flèche, que removeTarget bascule sur la cible suivante, et que la flèche est masquée quand il n'y a plus de cible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:97
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testPriorityColorAndTargetRemoval(ctx) end

--- Vérifie la couleur et le shape par défaut, que la flèche est masquée quand le joueur disparaît puis réaffichée, sans recréation (un seul objet créé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:81
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testRenderedArrowIsReusedAndHidesWithoutPlayer(ctx) end

--- Vérifie que si l'objet de scène est supprimé, onPreRender recrée la flèche en conservant couleur et échelle (setScale), sans nouvel appel à setTarget.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:115
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testSceneDeletionRecreatesArrowWithoutTargetUpdate(ctx) end

--- Vérifie que setScale, setDepth et setAppScreenPos appelés avant la création de la flèche sont pris en compte dès le premier rendu (échelle 0.08, profondeur 0.3, position écran 0.75/0.25).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:145
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testSettingsBeforeCreationAffectFirstRender(ctx) end

--- Vérifie qu'un setTarget/setScale après suppression de l'objet n'accède pas à l'ancien objet (le faux objet lève une erreur sinon) et que la recréation a lieu au onPreRender suivant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:131
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testTargetUpdateAfterSceneDeletionDoesNotUseOldObject(ctx) end

--- Vérifie que la flèche attend un véhicule joueur et un onPreRender : sans joueur rien n'est créé, dès que le joueur existe la flèche est créée et visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:68
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testTargetWaitsForPlayerAndRender(ctx) end

--- Vérifie que onExtensionUnloaded supprime l'objet et vide l'état des cibles, et que l'extension reste utilisable ensuite avec de nouvelles cibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/arrowGPS.test.lua:162
---@param ctx table Contexte de test du TestManager.
function ui_arrowGPS.test.testUnloadClearsObjectAndTargetState(ctx) end

