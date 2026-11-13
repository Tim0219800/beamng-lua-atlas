---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/audioForestEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode d'édition « Audio Forest Editor » de l'éditeur de niveaux : configure un son d'ambiance de forêt à partir des arbres de l'objet Forest. L'outil construit un graphe de noeuds (espacement minimum 20 m) à partir des instances de forêt incluses, les classe en S/M/L selon le volume de leur boîte englobante, envoie ce nuage au module runtime core/audioForest et lui indique l'événement principal (défaut 'event:>Ambient>Ambiences>Forest_Static') et un éventuel « roomtone » ('event:>Ambient>Ambiences>Roomtone'). La fenêtre permet d'exclure des types d'arbres, de choisir la classe de chaque type, de régler la visualisation des noeuds et de sélectionner un type en cliquant dans la vue. L'état est persisté avec le niveau via onSerialize / onDeserialized.
--- Accès : extension `editor_audioForestEditor` : `extensions.load("editor_audioForestEditor")`, puis la globale `editor_audioForestEditor`
---@class editor_audioForestEditor
editor_audioForestEditor = {}

--- Reçoit l'état persisté après chargement du niveau ; le garde en attente, marque la liste de forêt comme à rafraîchir et reconstruit le nuage de noeuds si le mode est actif. Ignore les données qui ne sont pas une table.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioForestEditor.lua:1005
---@param data table Table renvoyée précédemment par onSerialize.
function editor_audioForestEditor.onDeserialized(data) end

--- Appelé chaque frame de l'éditeur : si le mode est actif, rafraîchit la liste des types, dessine la fenêtre, gère le survol/sélection des arbres et dessine les noeuds du graphe (et le centroïde de l'émetteur principal).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioForestEditor.lua:918
function editor_audioForestEditor.onEditorGui() end

--- Enregistre le mode d'édition audioForestEditMode (icône create_forest) et la fenêtre « audioForestEditor » (520x820).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioForestEditor.lua:991
function editor_audioForestEditor.onEditorInitialized() end

--- Renvoie l'état de l'outil sous forme de table (version=1, rayons de visualisation, showNodes, mainEvent, roomtoneEnabled/Event/Z, selectedRow, includeByShape, classSelByShape, classOverrideByShape) pour la persistance du niveau et le runtime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioForestEditor.lua:113
---@return table  État sérialisable de l'éditeur.
function editor_audioForestEditor.onSerialize() end

