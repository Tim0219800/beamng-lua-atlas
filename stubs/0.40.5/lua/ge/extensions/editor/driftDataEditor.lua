---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/driftDataEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drift Data Editor (menu Gameplay > Drift Data Editor) : fenêtre à deux onglets pour les données du mode drift. « Drift stunt zones editor » crée, déplace et réordonne des zones de figures (donut, driftThrough, hitPole, nearPole) avec leur score, et les enregistre en JSON (par défaut dans /gameplay/temp/). « Drift spots editor » édite les spots de drift du niveau courant (lignes avec position, rotation, échelle, direction d'entrée, point de téléportation de la grande carte, infos d'objectifs) chargés via gameplay_drift_saveLoad. Exige un niveau chargé.
--- Accès : extension `editor_driftDataEditor` : `extensions.load("editor_driftDataEditor")`, puis la globale `editor_driftDataEditor`
---@class editor_driftDataEditor
editor_driftDataEditor = {}

--- Réinitialise l'onglet des zones de figures : fichier courant remis à /gameplay/temp/ sans nom, données vides ({stuntZones = {}}). Appelée aussi quand l'onglet Drift spots est affiché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/driftDataEditor.lua:171
function editor_driftDataEditor.clearStuntZonesEditor() end

--- Dessine en debug une boîte pleine (triangles recto/verso et arêtes noires) à partir d'un coin et de trois vecteurs d'arête.
---Source : lua/ge/extensions/editor/driftDataEditor.lua:795
---@param corner vec3 coin
---@param x vec3 arête X
---@param y vec3 arête Y
---@param z vec3 arête Z
---@param clr ColorF couleur
function editor_driftDataEditor.drawAxisBox(corner, x, y, z, clr) end

--- Dessine l'édition de la zone sélectionnée : met à jour pos/rot/scl depuis le gizmo (transformUtil), le délai cooldown si présent, et le score par une liste de paliers selon le type.
---Source : lua/ge/extensions/editor/driftDataEditor.lua:58
---@param elem table|nil zone de figure (type, pos, rot, scl, score, cooldown)
function editor_driftDataEditor.drawElementDetail(elem) end

--- Hook après rechargement : restaure le fichier, les données et l'index à resélectionner.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/driftDataEditor.lua:749
---@param data table table produite par onSerialize
function editor_driftDataEditor.onDeserialized(data) end

--- Hook chaque frame : dessine les onglets si un niveau est chargé, sinon un message demandant de charger un niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/driftDataEditor.lua:699
function editor_driftDataEditor.onEditorGui() end

--- Hook : enregistre la fenêtre (1500x700), l'entrée de menu Gameplay et crée des données vides si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/driftDataEditor.lua:731
function editor_driftDataEditor.onEditorInitialized() end

--- Hook avant rechargement : renvoie selectedStuntZoneIndex, currentFileDir, currentFileName et driftData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/driftDataEditor.lua:739
---@return table  état à conserver
function editor_driftDataEditor.onSerialize() end

--- Sélectionne une zone de figure et crée le gizmo adapté à son type (donut : position et échelle uniforme ; driftThrough : position, rotation, échelle ; hitPole : position).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/driftDataEditor.lua:113
---@param index integer index (base 1) dans driftData.stuntZones
function editor_driftDataEditor.selectStuntZone(index) end

--- Vide la sélection d'objets et affiche la fenêtre driftDataEditor.
---Source : lua/ge/extensions/editor/driftDataEditor.lua:726
function editor_driftDataEditor.show() end

--- Met à jour la table souris locale (rayon caméra, raycast, clic/maintien/relâchement et positions associées) utilisée par les gizmos.
---Source : lua/ge/extensions/editor/driftDataEditor.lua:759
function editor_driftDataEditor.updateMouseInfo() end

