---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_ui_updatedUI_endScreenBegin_C
local flowgraph_nodes_ui_updatedUI_endScreenBegin_C = {}

--- Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:46
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_executionStarted() end

--- Appelé à l'arrêt du projet ; ferme le dialogue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:54
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_executionStopped() end

--- Recharge les boutons personnalisés puis recrée les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:156
---@param nodeData any
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_onDeserialized(nodeData) end

--- Sauvegarde la liste des boutons personnalisés (options).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:152
---@param res any
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_onSerialize(res) end

--- Appelé quand un bouton est cliqué : met à true le pin de sortie du même nom que l'action, puis ferme le dialogue (navigation vers « play »).
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:161
---@param action string Nom du pin de sortie (contStart, contHere, ou nom d'un bouton personnalisé).
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:buttonPushed(action) end

--- Si l'écran a été construit, navigue vers l'écran « play » pour fermer l'écran de fin.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:325
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:closeDialogue() end

--- Dessine dans l'éditeur flowgraph la liste des boutons personnalisés (champ texte par bouton, boutons « add » et « rem »). Renvoie la raison de la modification (chaîne) ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:62
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:drawCustomProperties() end

--- Initialise open=false, la liste des boutons personnalisés, data.includeRetryButton=true et le minuteur d'auto-skip.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:33
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:init() end

--- Hook appelé à la fin de la mission côté client ; ferme le dialogue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:58
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:onClientEndMission() end

--- Remet les pins de sortie à false et réinitialise open/built.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:331
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:onNodeReset() end

--- Hook appelé lors d'un reset du gameplay ; si l'écran est ouvert et que le bouton Retry est inclus, navigue vers « play » et active le pin retry.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:171
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:onResetGameplay() end

--- Émet le hook onEndScreenUIOpened et construit la liste de boutons : Retry (avec frais d'entrée en carrière, désactivé si le joueur ne peut pas payer), Continuer au début (ou retour aux scénarios si lancé comme scénario), Continuer ici (hors carrière, ou carrière avec véhicule du joueur), restriction en tutoriel, boutons personnalisés, puis boutons « Start Next Mission ». L'ordre est inversé et le premier bouton reçoit le focus.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:179
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:openDialogue() end

--- Appelé juste après init, une fois les pins créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:41
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:postInit() end

--- Recrée les pins du nœud pour chaque nom de bouton de self.options : pin d'entrée string (libellé), pin d'entrée bool « <nom>_active » (caché, true par défaut) et pin de sortie flow. Reconnecte les liens existants quand le nom n'a pas changé.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:97
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:updateButtons() end

--- Si reset est actif, réinitialise le nœud. Quand flow est actif et que l'écran n'est pas encore construit, démarre la construction UI et ouvre le dialogue. Gère l'auto-skip : si startingOptions.autoSkipEndScreen est défini, arrête la mission après 2 s de temps réel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:342
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:work() end

--- Variante exécutée une seule fois par le moteur flowgraph (corps vide ici).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:339
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:workOnce() end

