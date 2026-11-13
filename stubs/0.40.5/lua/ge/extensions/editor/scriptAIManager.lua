---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/scriptAIManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Script AI Manager' (menu Gameplay) : enregistre, rejoue et sauvegarde la conduite des véhicules de la scène pour les concepteurs de niveaux. Pour chaque véhicule, elle pilote le module ai du véhicule par queueLuaCommand (ai.startRecording, ai.stopRecording, ai.startFollowing, ai.stopFollowing, ai.scriptStop) et reçoit les enregistrements et l'état du script par des hooks. Elle affiche l'état, la progression, un tracé 3D du chemin enregistré et gère les fichiers *.track.json.
--- Accès : extension `editor_scriptAIManager` : `extensions.load("editor_scriptAIManager")`, puis la globale `editor_scriptAIManager`
---@class editor_scriptAIManager
editor_scriptAIManager = {}

--- Renvoie la table des enregistrements en mémoire, indexée par id de véhicule (chaque enregistrement contient notamment le chemin path).
---Source : lua/ge/extensions/editor/scriptAIManager.lua:576
---@return table<integer, table>  Enregistrements par id de véhicule.
function editor_scriptAIManager.getCurrentRecordings() end

--- Hook de restauration après rechargement Lua : réinstalle recordings et vehState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:561
---@param data table Données renvoyées par onSerialize.
function editor_scriptAIManager.onDeserialized(data) end

--- Hook de dessin debug : trace en prismes carrés colorés le chemin enregistré de chaque véhicule (si Display Path est coché et la fenêtre visible), limité aux points proches de la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:464
---@param lastDebugFocusPos any Non utilisé : le code lit Lua.lastDebugFocusPos.
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulation.
---@param dtRaw number Delta temps brut.
function editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw) end

--- Hook de dessin appelé chaque frame : demande l'état de script de tous les véhicules et dessine le tableau (nom, état, progression, boutons enregistrer/lire/stop/sauvegarder/charger/More) et les options de débogage (Fast forward, Display IDs, Display Path).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:130
function editor_scriptAIManager.onEditorGui() end

--- Hook d'initialisation de l'éditeur : enregistre la fenêtre (640x200) et l'entrée de menu 'Script AI Manager' (groupe Gameplay).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:571
function editor_scriptAIManager.onEditorInitialized() end

--- Hook de sérialisation (rechargement Lua) : renvoie {recordings, vehState}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:557
---@return table  Données à restaurer.
function editor_scriptAIManager.onSerialize() end

--- Appelé par le véhicule (via extensions.hook) avec ai.scriptState() : calcule le pourcentage (time / endScriptTime), détecte l'état de sommeil (time < startDelay) et le passage à 'idle' quand le script est terminé (data nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:515
---@param vehId integer Id du véhicule.
---@param data table|nil État du script (status, time, scriptTime, endScriptTime, posError...) ou nil si plus de script.
function editor_scriptAIManager.onVehicleSubmitInfo(vehId, data) end

--- Appelé par le véhicule (via extensions.hook) quand un enregistrement est terminé : stocke les données dans recordings[vehId]. Ne pas appeler directement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:509
---@param vehId integer Id du véhicule.
---@param data table Enregistrement renvoyé par ai.stopRecording().
function editor_scriptAIManager.onVehicleSubmitRecording(vehId, data) end

--- Hook appelé au changement de véhicule joueur : met à jour le véhicule actif dans la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:567
---@param oldVehicle integer Ancien véhicule (déduit du code).
---@param newVehicle integer Nouveau véhicule, id utilisé pour trouver l'index.
---@param player integer Joueur concerné.
function editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Appelé par l'entrée de menu : retrouve le véhicule joueur actif et affiche la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/scriptAIManager.lua:552
function editor_scriptAIManager.onWindowMenuItem() end

