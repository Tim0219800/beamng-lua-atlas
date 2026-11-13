---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de l'éditeur qui active « Camera V2 », un jeu alternatif de contrôles souris pour la caméra libre du World Editor (panoramique, orbite, zoom, WASD en plan). Elle s'enregistre comme contrôleur de caméra (core/cameraControllerRegistry, id « editor.cameraV2 ») seulement quand la préférence camera.general.activeCamera vaut « cameraV2 » ou quand setTemporaryEnabled(true) a été appelé, et que l'éditeur est actif. Elle déclare les préférences camera.cameraV2.*, affiche une fenêtre de debug et peut récupérer une caméra aux coordonnées invalides. Le travail réel est délégué à editor/cameraV2/controller.
--- Accès : extension `editor_cameraV2` : `extensions.load("editor_cameraV2")`, puis la globale `editor_cameraV2`
---@class editor_cameraV2
editor_cameraV2 = {}

--- Si Camera V2 est enregistré, relaie controller.consumeFocusDoubleClick() (double clic de focalisation consommé ou non).
---Source : lua/ge/extensions/editor/cameraV2.lua:542
---@return boolean  false si Camera V2 n'est pas actif
function editor_cameraV2.consumeFocusDoubleClick() end

--- Appelé à l'activation de l'éditeur ; réévalue l'état d'activation de Camera V2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:504
function editor_cameraV2.onEditorActivated() end

--- Appelé à la désactivation de l'éditeur ; coupe la translation planaire et désenregistre le contrôleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:508
function editor_cameraV2.onEditorDeactivated() end

--- Dessine la fenêtre « Camera V2 Debug » (bouton Recover Camera, état du contrôleur, distances de rayon curseur/centre, hauteur au-dessus du terrain, réglages de zoom) si showDebugWindow n'est pas false et que le contrôleur est enregistré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:546
function editor_cameraV2.onEditorGui() end

--- Enregistre la fenêtre de debug « cameraV2Debug » (360x250 mis à l'échelle) puis évalue l'état d'activation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:496
function editor_cameraV2.onEditorInitialized() end

--- Réagit aux changements de préférences : activeCamera réévalue l'activation, wasdMode resynchronise le mode WASD, showDebugWindow montre/cache la fenêtre, toute autre préférence camera.cameraV2.* annule le geste en cours du contrôleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:513
---@param path string Chemin de la préférence
---@param value any Nouvelle valeur
function editor_cameraV2.onEditorPreferenceValueChanged(path, value) end

--- Hook d'enregistrement des préférences : crée la catégorie « camera », la sous-catégorie « general » (activeCamera : stock ou cameraV2) et « cameraV2 » (préférences ci-dessus), et réordonne les sous-catégories.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:420
---@param prefsRegistry table Registre de préférences de l'éditeur
function editor_cameraV2.onEditorRegisterPreferences(prefsRegistry) end

--- Au déchargement : coupe le mode planaire, désenregistre le contrôleur et la fenêtre de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:552
function editor_cameraV2.onExtensionUnloaded() end

--- Appelé à chaque frame. Si Camera V2 est actif : valide/récupère la pose, met à jour le contrôleur avec dt limité à 0,05 s, dessine la référence d'altitude et les repères de pivot (sphère rouge d'orbite, cylindre bleu de pan).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2.lua:529
---@param dtReal number|nil Delta de temps réel en secondes ; à défaut ui_imgui.GetIO().DeltaTime
function editor_cameraV2.onUpdate(dtReal) end

--- Force l'activation de Camera V2 indépendamment de la préférence (utile à un outil qui veut ces contrôles temporairement). Met à jour l'état d'enregistrement du contrôleur.
---Source : lua/ge/extensions/editor/cameraV2.lua:205
---@param enabled boolean true pour activer, tout le reste est traité comme false
function editor_cameraV2.setTemporaryEnabled(enabled) end

