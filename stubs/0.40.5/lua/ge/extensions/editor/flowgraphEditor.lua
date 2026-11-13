---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraphEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de l'éditeur de jeu qui héberge l'éditeur Flowgraph (éditeur visuel de graphes de nœuds pour le gameplay, les scénarios et les missions). Elle crée la fenêtre principale (flowgraph/main) et toutes les fenêtres annexes (overview, stateView, events, examples, properties, variables, projectSettings, history, welcome, nodelibrary, execution, search, references, garbageDebug), gère le manager courant (core_flowgraphManager), l'ouverture/sauvegarde de fichiers .flow.json, l'autosave, les fichiers récents, les raccourcis d'édition et l'enregistrement des préférences flowgraph.general.* et flowgraph.debug.*.
--- Accès : extension `editor_flowgraphEditor` : `extensions.load("editor_flowgraphEditor")`, puis la globale `editor_flowgraphEditor`
---@class editor_flowgraphEditor
---@field allowTooltip boolean Vrai quand la souris est immobile depuis plus de 0,5 s et qu'aucun bouton n'est enfoncé : autorise l'affichage des tooltips.
---@field forceOpen table<string, boolean> Valeurs initiales {states = true, log = true} indiquant des vues à ouvrir de force.
---@field lastOpenedFolder string Dernier dossier utilisé pour ouvrir/enregistrer (défaut 'flowgraphEditor/').
---@field pushedNodeLibActionMap boolean Vrai si l'action map 'NodeLibrary' a été poussée par une fenêtre de recherche.
---@field requestedEditor boolean Si vrai, onClientStartMission active l'éditeur et ouvre Flowgraph.
---@field settings table Réglages d'interface : viewModes = {'default', 'simple', 'flowLevel', 'debug'}.
---@field showSmallFgWindow ImBoolPtr Affichage de la petite fenêtre « FG Monitor » (BoolPtr).
---@field switchToSmallWindow boolean Si vrai, le prochain drawEditor désactive l'éditeur et affiche la petite fenêtre.
editor_flowgraphEditor = {}

--- Programme un instantané d'historique (undo) du projet avec un titre ; le snapshot est pris plus tard (delayedHistorySnapshot). Affiche aussi le titre dans la console.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:392
---@param title string Texte de l'entrée d'historique.
---@param graph table|boolean|nil Graphe concerné ; nil = graphe courant ; un autre type (ex. false) = pas de graphe.
function editor_flowgraphEditor.addHistory(title, graph) end

--- Appelle une méthode sur la fenêtre contrôlable au clavier courante (recherche, bibliothèque de nœuds), s'il y en a une.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:848
---@param fun string Nom de la méthode (ex. 'navigateList', 'createNode').
---@param ... any Arguments passés à la méthode.
function editor_flowgraphEditor.arrowControllableWindowCall(fun, ...) end

--- Sauvegarde automatique : si le minuteur est écoulé, que le projet est modifiable et non transitoire, écrit une copie dans flowgraphEditor/autoSaves/ et réarme le minuteur.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:149
function editor_flowgraphEditor.autoSave() end

--- Ferme le projet courant (removeManager) et bascule sur le premier manager restant ou nil.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:100
function editor_flowgraphEditor.closeCurrent() end

--- Dessine le popup « CreateNodeContentMenu » (bibliothèque de nœuds à la position mgr.newNodePos).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:378
function editor_flowgraphEditor.drawContextMenus() end

--- Dessine l'éditeur complet pour la frame : manager, fenêtre principale, toutes les fenêtres annexes, gestion du double-clic de nœud, autosave. Appelée depuis onEditorGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:473
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw) end

--- Dessine la vue d'exécution seule (executionView:drawAlone).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:386
function editor_flowgraphEditor.drawExecution() end

--- Dessine le sous-menu « Restore... » listant les fichiers d'autosave regroupés par projet d'origine (date UTC).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:406
function editor_flowgraphEditor.drawRestoreMenu() end

--- Renvoie le manager flowgraph affiché dans l'éditeur.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:797
---@return table|nil  Manager courant.
function editor_flowgraphEditor.getManager() end

--- Renvoie la fenêtre Properties.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1059
---@return table  Instance de la fenêtre properties.
function editor_flowgraphEditor.getPropertiesWindow() end

--- Indique si l'action map « <map>ActionMap » est active et activée.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1048
---@param map string Nom sans le suffixe 'ActionMap'.
---@return boolean  true si activée.
function editor_flowgraphEditor.isActionMapEnabled(map) end

--- Hook appelé au démarrage d'une mission/niveau côté client : si requestedEditor est vrai, active l'éditeur et ouvre la fenêtre Flowgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:822
function editor_flowgraphEditor.onClientStartMission() end

--- Hook de restauration après rechargement Lua : mémorise les fenêtres ouvertes (data.windows) et le nom du manager courant (data.currentMgrName).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:792
---@param data table Données produites par onSerialize.
function editor_flowgraphEditor.onDeserialized(data) end

--- Hook appelé à l'activation de l'éditeur : masque la petite fenêtre FG Monitor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:629
function editor_flowgraphEditor.onEditorActivated() end

--- Hook appelé à la désactivation de l'éditeur : dépile les action maps FlowgraphMain et Flowgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:623
function editor_flowgraphEditor.onEditorDeactivated() end

--- Hook appelé à chaque frame par l'éditeur : gère action maps, tooltips, changement de manager, puis dessine l'éditeur (drawEditor) si la fenêtre principale est visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:260
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw) end

--- Hook appelé quand l'éditeur est prêt : crée les fenêtres, l'entrée de menu « Flowgraph Editor » (groupe Gameplay), le contexte d'éditeur de nœuds, restaure les fenêtres ouvertes et déclare le mode d'édition flowgraphTransform.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:641
function editor_flowgraphEditor.onEditorInitialized() end

--- Hook d'enregistrement des préférences : catégorie 'flowgraph' avec sous-catégories 'general' (pins, fichiers récents, autosave…) et 'debug' (editorDebug, displayIds…).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:745
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook de sauvegarde avant rechargement Lua : renvoie l'état des fenêtres et le nom du manager courant (table vide si les fenêtres n'existent pas).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:693
---@return table  Données sérialisées.
function editor_flowgraphEditor.onSerialize() end

--- Hook appelé à chaque frame : dessine la petite fenêtre « FG Monitor » (bouton pour agrandir l'éditeur) quand showSmallFgWindow est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:552
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw) end

--- Ouvre (affiche) la fenêtre principale de l'éditeur Flowgraph.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:618
function editor_flowgraphEditor.open() end

--- Ouvre un fichier .flow.json : soit comme nouveau manager (et le rend courant), soit en rechargeant les données dans le manager courant. Met à jour le dossier et les fichiers récents.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:80
---@param fCbData table Données du dialogue de fichier, avec le champ filepath.
---@param openAsNewManager boolean|nil true pour créer un nouveau manager.
---@param keepSavedDirs boolean|nil Transmis à loadManager (conserver les dossiers enregistrés).
function editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs) end

--- Enregistre le projet courant : saveFile s'il a déjà un nom/dossier, sinon ouvre le dialogue « Enregistrer sous ». Réarme l'autosave.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:139
function editor_flowgraphEditor.save() end

--- Définit le dossier et le nom de fichier du projet d'après le chemin choisi, puis sauvegarde.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:195
---@param fCbData table Données du dialogue, champ filepath.
function editor_flowgraphEditor.saveAsFile(fCbData) end

--- Sauvegarde le graphe courant : la macro (saveMacro) s'il s'agit d'une macro avec chemin, sinon le projet (save).
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:131
function editor_flowgraphEditor.saveCurrent() end

--- Écrit le projet dans savedDir/savedFilename (JSON indenté). Refuse si le projet n'a pas de nom ou n'est pas à l'arrêt (runningState ~= 'stopped'), marque les graphes propres, renomme « New Project » d'après le fichier et met à jour les fichiers récents.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:160
function editor_flowgraphEditor.saveFile() end

--- Sauvegarde une macro : ouvre le popup « Unsaved macros » si des macros enfants sont modifiées, sinon écrit au chemin existant (macroPath) ou ouvre le dialogue (.macro.flow.json).
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:114
---@param graph table Graphe de type macro.
function editor_flowgraphEditor.saveMacro(graph) end

--- Demande de changer le manager affiché (appliqué au prochain onEditorGui, ou immédiatement avec instant).
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:685
---@param newMgr table|nil Manager flowgraph.
---@param instant boolean|nil Appliquer tout de suite à la variable locale mgr.
function editor_flowgraphEditor.setManager(newMgr, instant) end

--- Ouvre la fenêtre References et lui demande de chercher un nœud. Bug : appelle winReferences:searchFor qui n'existe pas dans references.lua.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:835
---@param node table Nœud à rechercher.
function editor_flowgraphEditor.showNodeReferences(node) end

--- Raccourci : relie automatiquement les pins de sortie du nœud de gauche aux pins d'entrée libres du nœud de droite, d'après la ressemblance des pins (nodelib:ratePinSimilarity) et si le lien est possible. Fonctionne avec un lien sélectionné, un nœud ayant un seul voisin, ou deux nœuds sélectionnés.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:913
function editor_flowgraphEditor.uiAutoConnectShortcut() end

--- Raccourci : supprime les liens sélectionnés, ou les liens reliant les nœuds sélectionnés au reste du graphe (à défaut, ceux entre nœuds sélectionnés).
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1000
function editor_flowgraphEditor.uiDisconnectShortcut() end

--- Raccourci : ouvre la fenêtre Search et place le focus dans le champ de recherche.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1033
function editor_flowgraphEditor.uiFindShortcut() end

--- Raccourci : recentre la vue du graphe sur la sélection, ou sur tout le contenu s'il n'y a pas de sélection.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:854
function editor_flowgraphEditor.uiFocusNodesShortcut() end

--- Raccourci : bascule la visibilité des liens sélectionnés ; sans lien sélectionné, masque ou affiche les liens des nœuds sélectionnés. Ajoute un instantané d'historique.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:864
---@param hide boolean Valeur appliquée aux liens des nœuds sélectionnés quand aucun lien n'est sélectionné.
function editor_flowgraphEditor.uiHideShortcut(hide) end

--- Raccourci : ouvre l'explorateur de fichiers sur le fichier source du nœud sélectionné (node.sourcePath), s'il y en a exactement un.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:903
function editor_flowgraphEditor.uiShowSourceShortcut() end

--- Raccourci : bascule le mode dynamique (toggleDynamicMode) du nœud sélectionné, s'il y en a exactement un.
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1038
function editor_flowgraphEditor.uiToggleCategoryShortcut() end

--- Dessine le contenu du menu « Windows » : une entrée par fenêtre (cochée si visible) et « Open All » / « Close All ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:801
function editor_flowgraphEditor.windowsMenu() end

