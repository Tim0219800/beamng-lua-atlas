---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de peinture des groundmodels (sec, mouillé, neige, glace…) du Hero Road Editor. L'artiste peint à la souris sur la chaussée ; la peinture est stockée comme tampons en coordonnées monde dans group.surfaceStamps ({x, y, r, m}), que mesh.lua rastérise sur les quads à la construction. Le module gère l'état du mode, l'entrée pinceau (un undo par trait) et la surcouche d'éditeur (cellules colorées, curseur, fil de fer). Le rendu en jeu ne change pas ; seule la physique change.
--- Accès : extension `editor_heroRoadEditor_groundmodel` : `extensions.load("editor_heroRoadEditor_groundmodel")`, puis la globale `editor_heroRoadEditor_groundmodel`
---@class editor_heroRoadEditor_groundmodel
editor_heroRoadEditor_groundmodel = {}

--- Supprime toute la peinture du groupe (vide surfaceStamps) et le met en attente de reconstruction. L'appelant gère le commit d'annulation.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:78
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_groundmodel.clearAll(group) end

--- Surcouche d'éditeur : teinte chaque cellule de la grille (chaussée + accotements) avec la couleur du matériau (alpha 60 pour la base, 135 pour le peint), plus un fil de fer optionnel. Lit les mêmes tampons et la même grille (group.meshGrid) que le maillage, donc cohérent avec la physique. Seulement pour la route sélectionnée.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:146
---@param group table Groupe Hero Road sélectionné (meshGrid requis).
function editor_heroRoadEditor_groundmodel.drawOverlay(group) end

--- Reconstruit le maillage physique de chaque route peinte depuis le dernier Apply (chemin léger surface seule : maillage + collision, sans décals/mobilier/peinture terrain), puis vide la file. Sans effet si Apply n'a pas été demandé. Appelé à chaque frame depuis onEditorGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:71
function editor_heroRoadEditor_groundmodel.flushPending() end

--- Rayon de pinceau par défaut (3.0).
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:55
---@return number  Mètres.
function editor_heroRoadEditor_groundmodel.getBrushDefault() end

--- Rayon actuel du pinceau.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:53
---@return number  Rayon en mètres.
function editor_heroRoadEditor_groundmodel.getBrushRadius() end

--- Indice de matériau de la palette actuellement peint.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:51
---@return integer  Indice (1 = Dry/gomme).
function editor_heroRoadEditor_groundmodel.getMatIndex() end

--- Indique si le fil de fer de la chaussée est affiché.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:56
---@return boolean  true si affiché.
function editor_heroRoadEditor_groundmodel.getShowWire() end

--- Indique si le mode peinture est actif.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:50
---@return boolean  true si actif.
function editor_heroRoadEditor_groundmodel.isActive() end

--- Demande la reconstruction de la physique des routes peintes (bouton Apply). Consommé par flushPending à la frame suivante.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:66
function editor_heroRoadEditor_groundmodel.requestApply() end

--- Active ou désactive le mode ; en désactivant, interrompt tout trait en cours.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:59
---@param b boolean Nouvel état.
function editor_heroRoadEditor_groundmodel.setActive(b) end

--- Fixe le rayon du pinceau.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:54
---@param r number Rayon en mètres.
function editor_heroRoadEditor_groundmodel.setBrushRadius(r) end

--- Choisit le matériau peint.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:52
---@param i integer Indice dans la palette de surfaceKit.
function editor_heroRoadEditor_groundmodel.setMatIndex(i) end

--- Affiche ou masque le fil de fer de la chaussée.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:57
---@param b boolean Nouvel état (converti en booléen).
function editor_heroRoadEditor_groundmodel.setShowWire(b) end

--- À chaque frame en mode actif : dessine le curseur pinceau (sphère + disque) au point visé et, en glissant le bouton gauche, dépose des tampons {x,y,r,m} espacés régulièrement. Un seul commit d'historique 'Paint Groundmodel' par trait.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:101
---@param group table Groupe Hero Road sélectionné.
---@return boolean  true si le mode possède la souris (actif et groupe valide), false sinon.
function editor_heroRoadEditor_groundmodel.updateAndPaint(group) end

