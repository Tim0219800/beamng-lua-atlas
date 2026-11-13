---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/copyToSelected.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil d'éditeur « Copy To Selected » : choisit un objet de base et une liste d'objets cibles (sélection courante, même classe ou même mesh TSStatic), puis crée une copie de l'objet de base à la position de chaque cible (via editor.saveSimObjectMemento / restoreSimObjectMemento). Options : appliquer la rotation ou l'échelle de la cible, composer les rotations (cible * base), décalage local en mètres dans le repère de la cible, copies rangées dans un nouveau SimGroup « CopiedObjects », sélection des copies créées. L'action passe par editor.history (annulable/rétablissable avec ids forcés).
--- Accès : extension `editor_copyToSelected` : `extensions.load("editor_copyToSelected")`, puis la globale `editor_copyToSelected`
---@class editor_copyToSelected
editor_copyToSelected = {}

--- Dessine la fenêtre « Copy To Selected » (objet de base, cibles, options, décalages locaux, bouton « Create Copies », messages d'erreur) et l'aperçu des positions cibles. Appelé à chaque frame par l'éditeur. Après création, émet extensions.hook('onEditorObjectSelectionChanged') si « Select Created » est coché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/copyToSelected.lua:376
function editor_copyToSelected.onEditorGui() end

--- Ajoute l'entrée de menu « Copy To Selected » et enregistre la fenêtre (560x520). Appelé une fois à l'initialisation de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/copyToSelected.lua:491
function editor_copyToSelected.onEditorInitialized() end

