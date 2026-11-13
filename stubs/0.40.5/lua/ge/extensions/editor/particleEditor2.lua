---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/particleEditor2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Seconde version, expérimentale, de l'éditeur de particules : une fenêtre d'outil « Particle Editor 2 » (menu Fenêtre > Experimental) avec, à gauche, un aperçu 3D rendu dans une RenderView dédiée (caméra orbitale, grille tracée au debugDrawer) et, à droite, les contrôles. Elle utilise deux genericInspector (ParticleEmitterData et ParticleData) pour modifier les champs, et gère création, sauvegarde (fichier d'origine, niveau, « sous... ») et suppression des émetteurs et particules (4 particules max par émetteur).
--- Accès : extension `editor_particleEditor2` : `extensions.load("editor_particleEditor2")`, puis la globale `editor_particleEditor2`
---@class editor_particleEditor2
editor_particleEditor2 = {}

--- Appelé à chaque frame par l'éditeur. Ouvre la fenêtre « Particle Editor 2 » (avec barre de menu) et dessine l'aperçu puis les contrôles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor2.lua:463
function editor_particleEditor2.onEditorGui() end

--- Enregistre la fenêtre (900x600), l'entrée de menu Experimental et crée les deux inspecteurs génériques (ParticleEmitterData / ParticleData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor2.lua:517
function editor_particleEditor2.onEditorInitialized() end

--- Si la fenêtre masquée est particleEditor2, désactive l'aperçu et détruit le nœud d'aperçu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor2.lua:507
---@param windowName string Nom de la fenêtre d'outil masquée.
function editor_particleEditor2.onEditorToolWindowHide(windowName) end

--- Si la fenêtre affichée est particleEditor2, active l'aperçu, relit la liste des datablocks, crée le nœud d'aperçu et sélectionne le premier émetteur si aucun n'est choisi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor2.lua:497
---@param windowName string Nom de la fenêtre d'outil affichée.
function editor_particleEditor2.onEditorToolWindowShow(windowName) end

--- Détruit l'aperçu au déchargement de l'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor2.lua:528
function editor_particleEditor2.onExtensionUnloaded() end

--- Appelé avant le rendu ; dessine la grille d'aperçu (lignes debugDrawer limitées au masque de vue de l'aperçu) quand l'aperçu est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor2.lua:488
function editor_particleEditor2.onPreRender() end

--- Appelé à chaque frame ; si l'éditeur est actif et l'aperçu ouvert, met à jour la RenderView (taille, fov 60, matrice caméra).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/particleEditor2.lua:492
function editor_particleEditor2.onUpdate() end

