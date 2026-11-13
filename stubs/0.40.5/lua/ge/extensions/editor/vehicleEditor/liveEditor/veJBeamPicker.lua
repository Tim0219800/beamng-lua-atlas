---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'JBeam Picker' du Vehicle Editor live : permet de choisir des nœuds et des poutres du véhicule (à la souris, ou par saisie d'ID/nom avec suggestions) et d'en suivre des données en direct. Onglet 'Nodes' / 'Beams' : arbre des éléments choisis, choix des données à afficher (nœud : vitesse, vitesse relative, force ; poutre : longueur, vitesse, force, stress, damping), filtre par type de poutre (NORMALTYPE, BEAM_ANISOTROPIC, BEAM_BOUNDED, BEAM_PRESSURED, BEAM_LBEAM, BEAM_BROKEN, BEAM_HYDRO, BEAM_SUPPORT) et graphes (1000 points). Le picking utilise les modes debug Nœud/Poutre du jeu (Ctrl+M / Ctrl+B).
--- Accès : extension `editor_vehicleEditor_liveEditor_veJBeamPicker` : `extensions.load("editor_vehicleEditor_liveEditor_veJBeamPicker")`, puis la globale `editor_vehicleEditor_liveEditor_veJBeamPicker`
---@class editor_vehicleEditor_liveEditor_veJBeamPicker
---@field beamDataFromVELua table<integer, table<string, any>> Données de poutres renvoyées par le VM véhicule, indexées par ID de poutre puis nom de donnée (speed, force, stress, damping).
---@field menuEntry string 'JBeam Picker'.
---@field nodeDataFromVELua table<integer, table<string, any>> Données de nœuds renvoyées par le VM véhicule, indexées par ID de nœud puis nom de donnée (ex. force).
editor_vehicleEditor_liveEditor_veJBeamPicker = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:790
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veJBeamPicker.onDeserialized(data) end

--- Appelé à l'initialisation de l'éditeur : crée les cases à cocher de types de poutres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:776
function editor_vehicleEditor_liveEditor_veJBeamPicker.onEditorInitialized() end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:784
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veJBeamPicker.onSerialize() end

--- Appelé chaque frame : dessine la fenêtre à onglets Nodes/Beams et avance l'offset des graphes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:733
---@param dt number Delta temps.
function editor_vehicleEditor_liveEditor_veJBeamPicker.onUpdate(dt) end

--- Hook de rendu émis par editor_veMain : dessine les éléments choisis et exécute le picking de nœuds ou de poutres selon l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:720
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_vehicleEditor_liveEditor_veJBeamPicker.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:772
function editor_vehicleEditor_liveEditor_veJBeamPicker.open() end

--- Callback de la demande de poutres dessinées : mémorise les poutres disponibles et leur échelle (rayon de sélection = 5 x échelle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:172
---@param beams table Poutres disponibles pour le picking.
---@param scale number Échelle de dessin des poutres.
function editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnBeamsCallback(beams, scale) end

--- Callback de la demande de nœuds dessinés : mémorise la liste des nœuds disponibles pour le picking et leur échelle d'affichage (rayon de sélection = 2 x échelle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:165
---@param nodes table Nœuds disponibles pour le picking.
---@param scale number Échelle de dessin des nœuds.
function editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnNodesCallback(nodes, scale) end

