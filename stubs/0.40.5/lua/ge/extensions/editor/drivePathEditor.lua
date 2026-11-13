---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drive Path Editor de l'éditeur de monde : outil pour dessiner des trajets (splines) que des véhicules IA suivent, en mode libre (nœuds posés à la main, avec largeurs et profil de vitesse) ou en mode graphe de navigation (choix de nœuds du navgraph de la carte). Il permet aussi d'enregistrer un trajet en conduisant et de lancer la lecture (ai.driveUsingPath). Ce fichier est l'interface principale : fenêtre, entrées souris/clavier et rendu ; la logique des splines est dans drivePathEditor/splineMgr, la lecture dans playback et l'enregistrement dans record.
--- Accès : extension `editor_drivePathEditor` : `extensions.load("editor_drivePathEditor")`, puis la globale `editor_drivePathEditor`
---@class editor_drivePathEditor
editor_drivePathEditor = {}

--- Hook appelé à la sortie de la carte : supprime toutes les splines de chemin, même désactivées, pour éviter des pointeurs TSStatic invalides au chargement suivant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor.lua:1231
function editor_drivePathEditor.onClientEndMission() end

--- Hook de restauration : recrée les splines depuis les données, recalcule la table id vers index et relie de nouveau les véhicules. Ne fait rien si data est vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor.lua:99
---@param data table|nil tableau renvoyé par onSerialize
function editor_drivePathEditor.onDeserialized(data) end

--- Hook de l'éditeur appelé chaque frame : met à jour les splines, dessine la fenêtre, gère la lecture, l'enregistrement, les entrées et le rendu du mode libre ou du mode navgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor.lua:1087
function editor_drivePathEditor.onEditorGui() end

--- Hook : déclare le mode d'édition « Drive Path Spline » (icône cône de signalisation) et enregistre la fenêtre (300x700).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor.lua:1217
function editor_drivePathEditor.onEditorInitialized() end

--- Hook de sauvegarde avant rechargement des extensions : renvoie la liste des splines sérialisées et supprime les splines de la scène.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor.lua:86
---@return table  tableau de splines sérialisées
function editor_drivePathEditor.onSerialize() end

--- Définit le nœud sélectionné (pour la sélection partagée entre outils).
---Source : lua/ge/extensions/editor/drivePathEditor.lua:83
---@param idx integer index de nœud (base 1)
function editor_drivePathEditor.setSelectedNodeIdx(idx) end

--- Définit la spline sélectionnée (pour la sélection partagée entre outils).
---Source : lua/ge/extensions/editor/drivePathEditor.lua:80
---@param idx integer index de spline (base 1)
function editor_drivePathEditor.setSelectedSplineIdx(idx) end

