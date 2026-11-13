---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/scriptAIEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de scénarios ScriptAI : mode d'édition 'Edit ScriptAI Scenario' (icône BNGMicrochip de la barre d'outils) pour créer, éditer et exécuter des trajectoires de véhicules scriptées et un chemin de caméra. Il ouvre plusieurs fenêtres : Script AI Editor (barre de temps lecture/pause/boucle), Scene Vehicles (véhicules et enregistrement), Scene Trajectories (liste), jusqu'à trois fenêtres de trajectoire individuelle, Camera Trajectory et Draw Trajectory. Les trajectoires sont soit basées sur le temps (nodes x, y, z, t), soit sur la vitesse (nodes x, y, z, v). À l'exécution, chaque trajectoire est envoyée au véhicule par ai.startFollowing(...) et le chemin de caméra est joué par core_paths.playPath.
--- Accès : extension `editor_scriptAIEditor` : `extensions.load("editor_scriptAIEditor")`, puis la globale `editor_scriptAIEditor`
---@class editor_scriptAIEditor
editor_scriptAIEditor = {}

--- Hook de restauration après rechargement Lua : décode data.d et restaure trajectoires, caméra, temps, identifiants uniques et état des fenêtres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3203
---@param dataIn table Table renvoyée par onSerialize ({d = ...}).
function editor_scriptAIEditor.onDeserialized(dataIn) end

--- Hook de dessin appelé chaque frame de l'UI de l'éditeur : gère souris et gizmos (sélection, glisser, dessin libre), dessine les trajectoires et toutes les fenêtres de l'outil (principale, véhicules, liste, trajectoires, caméra, dessin).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:1989
function editor_scriptAIEditor.onEditorGui() end

--- Hook appelé à l'initialisation du monde-éditeur : crée le mode d'édition scriptAIEditMode (onActivate/onDeactivate, icône, hideObjectIcons) et enregistre les huit fenêtres ; ré-affiche celles qui étaient visibles avant un rechargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3128
function editor_scriptAIEditor.onEditorInitialized() end

--- Hook de sérialisation (rechargement Lua) : renvoie {d = lpack.encode{...}} avec trajectoires, caméra, temps, sélections et alphas de boutons ; les fenêtres sont notées non visibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3186
---@return table  Table {d = chaîne encodée}.
function editor_scriptAIEditor.onSerialize() end

--- Hook appelé quand un véhicule est remplacé : met à jour le texte et le jBeam des trajectoires liées à cet id.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3169
---@param vid integer Id du véhicule remplacé.
function editor_scriptAIEditor.onVehicleReplaced(vid) end

--- Hook appelé quand l'enregistrement d'un véhicule s'arrête (ai.stopRecording renvoyé à la GE) : détache l'ancienne trajectoire du véhicule et crée une nouvelle trajectoire 'recorded_N' à partir de data.path.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIEditor.lua:3153
---@param vid integer Id du véhicule enregistré.
---@param data table Enregistrement contenant path (noeuds avec t ou v).
function editor_scriptAIEditor.onVehicleSubmitRecording(vid, data) end

