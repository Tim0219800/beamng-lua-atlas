---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Relie les routes de l'interface de l'éditeur de livrées (liveries, liveries.edit, liveries.edit.decals…) au code Lua. Le routeur UI appelle ces hooks Enter, Mount et Leave quand l'utilisateur change d'écran ; ils démarrent et arrêtent les sessions (ui_liveries, ui_liveries_decal), gèlent la simulation, pilotent la caméra et le curseur de décalque, et remplissent data.liveries avec les données de l'écran d'arrivée.
--- Accès : extension `ui_liveries_routeLifecycleCallbacks` : `extensions.load("ui_liveries_routeLifecycleCallbacks")`, puis la globale `ui_liveries_routeLifecycleCallbacks`
---@class ui_liveries_routeLifecycleCallbacks
---@field dependencies string[] Extensions chargées avant celle-ci : ui_liveries_saves, ui_liveries, ui_liveries_fill, ui_liveries_decal, ui_liveries_textures, ui_liveries_camera.
ui_liveries_routeLifecycleCallbacks = {}

--- Appelé à l'entrée dans l'écran de choix de vue. Exécute onDecalsEnter et place dans data.liveries.cameraViews la liste ui_liveries_camera.getViews().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:137
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalCameraEnter(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans l'écran de matériau d'un décalque. Exécute onDecalsEnter, déplace la caméra libre sur le décalque (params.layerUid) et place sa peinture dans data.liveries.layerPaint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:144
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalMaterialEnter(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans l'écran de miroir d'un décalque. Exécute onDecalsEnter, avertit si params.layerUid manque, cadre la caméra orbite sur le décalque et place ses réglages de miroir dans data.liveries.decalMirror.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:155
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalMirrorEnter(context, toRoute, fromRoute, data) end

--- Appelé au montage du sélecteur de décalques. Charge les textures avec ui_liveries_textures.loadTextures.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:170
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalSelectorMount(context, toRoute, fromRoute, data) end

--- Appelé en quittant l'écran de transformation d'un nouveau décalque. Cache le curseur sauf si on va vers les réglages, puis exécute onDecalsLeave.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:196
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformLeave(context, toRoute, fromRoute, data) end

--- Appelé au montage de l'écran de transformation d'un nouveau décalque. Notifie l'interface, reprend la table d'actions si on revient des réglages, sinon affiche le curseur du décalque sélectionné, puis place dans data.liveries decalTransform et decalMouseMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:174
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformMount(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans les réglages de transformation d'un nouveau décalque. Exécute onDecalsEnter, suspend la table d'actions de transformation et place decalMirror et layerPaint dans data.liveries.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:203
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsEnter(context, toRoute, fromRoute, data) end

--- Appelé en quittant les réglages de transformation. Si on retourne à une route de transformation, reprend la table d'actions ; sinon exécute onDecalsLeave.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:212
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsLeave(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans la branche liveries.edit.decals. Démarre ui_liveries_decal.setup seulement si on vient de l'extérieur de cette branche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:124
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalsEnter(context, toRoute, fromRoute, data) end

--- Appelé en quittant la branche decals. Si la destination reste dans cette branche, ne fait rien ; sinon appelle ui_liveries_decal.teardown puis onLiveriesLeave.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:187
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalsLeave(context, toRoute, fromRoute, data) end

--- Appelé au montage de l'écran des décalques. Demande à ui_liveries_decal.notifyUi d'envoyer l'état à l'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:133
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onDecalsMount(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans l'écran de transformation d'un décalque existant. Exécute onDecalsEnter puis ui_liveries_decal.beginExistingTransform(params.layerUid) ; avertit si layerUid manque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:220
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformEnter(context, toRoute, fromRoute, data) end

--- Appelé en quittant la transformation d'un décalque existant. Termine la transformation (endExistingTransform) sauf si on va vers les réglages, puis exécute onDecalsLeave.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:245
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformLeave(context, toRoute, fromRoute, data) end

--- Appelé au montage de l'écran de transformation d'un décalque existant. Reprend la table d'actions si on revient des réglages, sinon affiche le curseur du décalque existant, puis place decalTransform et decalMouseMode dans data.liveries.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:233
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformMount(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans liveries.edit. Si on vient de l'extérieur de la branche edit, démarre la session avec ui_liveries.setup(params.saveName) (pas de saveName : nouvelle livrée) et journalise un avertissement en cas d'échec. Place data.liveries.currentSaveName pour que le formulaire de sauvegarde propose d'écraser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:81
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesEditEnter(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans la route liveries. Met en pause la simulation et place dans data.liveries.saveFiles la liste des livrées sauvegardées (ui_liveries_saves.getAll).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:70
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesEnter(context, toRoute, fromRoute, data) end

--- Appelé en quittant une route de livrées. Si la destination reste dans la branche edit, ne fait rien de plus ; sinon appelle ui_liveries.teardown puis applique la peau en attente (ui_liveries_saves.consumeStagedApplySkin) avec core_vehicle_partmgmt.setSkin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:110
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesLeave(context, toRoute, fromRoute, data) end

--- Appelé au montage de la route liveries. Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:78
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesMount(context, toRoute, fromRoute, data) end

--- Appelé à l'entrée dans l'écran de peinture. Place dans data.liveries.layerPaint la peinture de la couche de base (ui_liveries_fill.getPaint).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:100
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesPaintEnter(context, toRoute, fromRoute, data) end

--- Appelé en quittant l'écran d'accueil des livrées. Retire la demande de pause de la simulation (aucun autre hook Leave n'existe pour cet écran).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua:106
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_liveries_routeLifecycleCallbacks.onLiveriesRootLeave(context, toRoute, fromRoute, data) end

