---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/audioRibbonEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode d'édition « Audio Ribbon Editor » de l'éditeur de niveaux : crée et modifie des « rubans » sonores (rivières, etc.) stockés dans le module runtime core/audioRibbon. Un ruban est une polyligne de noeuds avec profondeur et vitesse ; il porte soit un émetteur unique (« Single Emitter Only »), soit quatre émetteurs (avant, arrière, gauche, droite) sur la surface du dessus, du dessous ou tout le volume. Les événements par défaut sont 'event:>Ambient>Water>River'. L'outil gère l'ajout de rubans, le déplacement de noeuds au gizmo, l'ajustement à la surface sous-jacente (terrain, rivière, plan d'eau), l'annulation/rétablissement via editor.history et une caméra panoramique.
--- Accès : extension `editor_audioRibbonEditor` : `extensions.load("editor_audioRibbonEditor")`, puis la globale `editor_audioRibbonEditor`
---@class editor_audioRibbonEditor
editor_audioRibbonEditor = {}

--- Appelé chaque frame de l'éditeur : si le mode est actif, dessine la fenêtre d'outil, affiche les rubans, traite l'édition (sélection, glissement de noeuds, gizmo) et pilote la caméra panoramique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioRibbonEditor.lua:900
function editor_audioRibbonEditor.onEditorGui() end

--- Enregistre le mode d'édition audioRibbonEditMode (icône simobject_sfxspace) et la fenêtre « audioRibbonEditor » (500x500).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioRibbonEditor.lua:948
function editor_audioRibbonEditor.onEditorInitialized() end

--- Initialisation : si core/audioRibbon n'a pas encore de liste de rubans, la crée vide et vide les noms de rubans et les listes proches/lointaines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/audioRibbonEditor.lua:325
function editor_audioRibbonEditor.onInit() end

