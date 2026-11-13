---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vues de rendu du Static Editor de l'éditeur de véhicule. Chaque fenêtre « Static Render View##N » possède deux RenderViews (la vue principale et un petit gizmo d'axes), en mode 3D ou orthographique (Left -X, Right +X, Back -Y, Front +Y, Bottom -Z, Top +Z). Le fichier gère la caméra (déplacement clavier, souris), la grille dessinée au debugDrawer, les flèches d'axes cliquables, le menu contextuel et la sauvegarde des vues dans settings/vehicleEditorStatic/staticRenderView.json. D'autres extensions (vePartTree) s'en servent pour obtenir le rayon de la souris dans la vue principale.
--- Accès : extension `editor_vehicleEditor_staticEditor_veStaticRenderView` : `extensions.load("editor_vehicleEditor_staticEditor_veStaticRenderView")`, puis la globale `editor_vehicleEditor_staticEditor_veStaticRenderView`
---@class editor_vehicleEditor_staticEditor_veStaticRenderView
editor_vehicleEditor_staticEditor_veStaticRenderView = {}

--- Crée une nouvelle vue de rendu (fenêtre + RenderViews) : réutilise la première entrée dont la fenêtre est masquée ou supprimée, sinon crée une nouvelle entrée, enregistre la fenêtre (400x600, outil vehicleEditor) si besoin, l'affiche et sauvegarde les réglages. Appelée par le menu View > Add View de veToolbar.
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:191
function editor_vehicleEditor_staticEditor_veStaticRenderView.createRenderViewUI() end

--- Détruit tous les objets RenderView (principal et gizmo) de toutes les vues, sans fermer les fenêtres ImGui. Appelée à la sortie de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:757
function editor_vehicleEditor_staticEditor_veStaticRenderView.destroyAllRenderViews() end

--- Renvoie le rayon de la souris dans la vue principale de la fenêtre survolée (rv:getUnprojectedRayPosDir sur les coordonnées de la souris converties dans le viewport), ou nil si aucune fenêtre n'est survolée ou si la souris n'est pas sur l'image.
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:748
---@return any  résultat de RenderView:getUnprojectedRayPosDir(x, y), utilisé par vePartTree comme (ok, position, direction) ; nil si hors vue
function editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay() end

--- Définit l'intensité du déplacement caméra vers l'arrière (camMove.backward). Pensé pour une action de clavier.
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:801
---@param val number valeur de l'entrée (0 relâché, positif appuyé)
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val) end

--- Définit l'intensité du déplacement caméra vers l'avant (camMove.forward).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:800
---@param val number valeur de l'entrée
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val) end

--- Définit l'intensité du déplacement caméra vers la gauche (camMove.left).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:798
---@param val number valeur de l'entrée
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val) end

--- Définit l'intensité du déplacement caméra vers la droite (camMove.right).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:799
---@param val number valeur de l'entrée
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val) end

--- Fonction vide exportée sous le nom onDeserialize (probable faute de frappe pour onDeserialized, donc jamais appelée par le moteur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:793
---@param data any non utilisé
function editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data) end

--- Hook de l'éditeur appelé à chaque frame : lit les entrées caméra, puis pour chaque vue ouvre la fenêtre, crée les RenderViews au besoin (getOrCreateView, enterFocusObjectsMode) et dessine le contenu ; détruit les RenderViews d'une fenêtre fermée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:686
---@param dt number delta de temps (s) utilisé pour le déplacement de la caméra
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt) end

--- Hook de l'éditeur appelé quand un outil headless est activé ou désactivé. Pour l'éditeur statique, à la sortie : sauvegarde les réglages et détruit les RenderViews.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:765
---@param enabled boolean true à l'entrée dans l'outil, false à la sortie
---@param toolName string nom de l'outil concerné
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName) end

--- Hook de l'éditeur appelé à l'initialisation : recharge les vues sauvegardées depuis settings/vehicleEditorStatic/staticRenderView.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:779
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorInitialized() end

--- Hook appelé chaque frame avant le rendu : dessine la grille (debugDrawer), le texte du mode de vue et les flèches d'axes de chaque vue ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:434
function editor_vehicleEditor_staticEditor_veStaticRenderView.onPreRender() end

--- Hook appelé avant un rechargement Lua : sauvegarde les réglages des vues dans le fichier de settings et renvoie nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:787
---@return nil  rien à restaurer
function editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize() end

--- Fixe le multiplicateur de vitesse de la caméra : camSpeedMult = s * (camFastSpeedMult - 1) + 1, avec camFastSpeedMult = 2.5.
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:802
---@param s number 0 pour la vitesse normale, 1 pour la vitesse rapide (2,5x)
function editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s) end

