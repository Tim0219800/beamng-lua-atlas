---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/metrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_metrics` : fenêtre d'affichage des performances (FPS, temps CPU/GPU, mémoire, statistiques de rendu). Elle s'affiche en haut à gauche avec ImGui, ou en texte de débogage 3D si ImGui est masqué. La fonction toggle() fait défiler les modes d'affichage. Un moddeur l'utilise surtout pour mesurer l'effet de son mod sur le framerate.
--- Accès : extension `core_metrics` : `extensions.load("core_metrics")`, puis la globale `core_metrics`
---@class core_metrics
---@field currentMode integer Mode d'affichage courant : 0 désactivé, 1 petit, 2 simple, 3 complet. Sauvegardé dans onSerialize.
---@field dependencies string[] { 'ui_imgui', 'ui_visibility' }.
core_metrics = {}

--- Après un rechargement Lua : restaure currentMode (d.currentMode, sans valeur par défaut) et l'overlay GPU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/metrics.lua:307
---@param d table Table renvoyée par onSerialize.
function core_metrics.onDeserialized(d) end

--- Hook d'initialisation : déchargement manuel et état de l'overlay GPU selon currentMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/metrics.lua:298
function core_metrics.onInit() end

--- Avant un rechargement Lua : mémorise le mode courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/metrics.lua:303
---@return table  { currentMode }
function core_metrics.onSerialize() end

--- Hook par frame : dessine la fenêtre de métriques (ImGui) ou, si ImGui est masqué, du texte de débogage dans la vue 3D. Ne fait rien en mode 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/metrics.lua:44
---@param dtReal number Temps réel écoulé (s), non utilisé.
---@param dtSim number Temps de simulation écoulé (s), non utilisé.
---@param dtRaw number Temps brut écoulé (s), non utilisé.
function core_metrics.onUpdate(dtReal, dtSim, dtRaw) end

--- Passe au mode d'affichage suivant (0 -> 1 -> 2 -> 3 -> 0). Au retour à 0, l'extension se décharge.
---Source : lua/ge/extensions/core/metrics.lua:15
function core_metrics.toggle() end

