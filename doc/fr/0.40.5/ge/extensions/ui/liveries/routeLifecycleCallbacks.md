# `ui_liveries_routeLifecycleCallbacks`

*Fichier : `lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua` · VM : Game Engine (GE) · 273 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_routeLifecycleCallbacks` : `extensions.load("ui_liveries_routeLifecycleCallbacks")`, puis la globale `ui_liveries_routeLifecycleCallbacks`

Relie les routes de l'interface de l'éditeur de livrées (liveries, liveries.edit, liveries.edit.decals…) au code Lua. Le routeur UI appelle ces hooks Enter, Mount et Leave quand l'utilisateur change d'écran ; ils démarrent et arrêtent les sessions (ui_liveries, ui_liveries_decal), gèlent la simulation, pilotent la caméra et le curseur de décalque, et remplissent data.liveries avec les données de l'écran d'arrivée.

## Remarques

- Tous les hooks ont la même signature (context, toRoute, fromRoute, data). toRoute et fromRoute sont des tables avec name et params ; data est la table de données renvoyée à l'interface (clé data.liveries).
- La simulation reste en pause dans toutes les routes dont le nom est « liveries » ou commence par « liveries. » : une demande de pause « ui_liveries » est poussée à l'entrée et retirée à la sortie via simTimeAuthority, pour que les déclencheurs du véhicule (portes, capot, coffre) ne s'activent pas.
- Les hooks Leave s'enchaînent (onDecalTransformLeave appelle onDecalsLeave, qui appelle onLiveriesLeave) ; l'état pauseRequestActive garde l'équilibre des push et pop de pause.
- Les sessions ne sont démarrées ou arrêtées que lorsqu'on entre dans une branche ou qu'on la quitte : naviguer à l'intérieur de liveries.edit ou de liveries.edit.decals garde la session.
- Routes utilisées : liveries.edit.decals.camera.selector.transform (nouveau décalque) et liveries.edit.decals.transform (décalque existant), chacune avec une sous-route .settings.
- onLiveriesMount est vide : il ne fait rien.

**Dépendances (chargées avant) :** `ui_liveries_saves`, `ui_liveries`, `ui_liveries_fill`, `ui_liveries_decal`, `ui_liveries_textures`, `ui_liveries_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_routeLifecycleCallbacks.onDecalCameraEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans l'écran de choix de vue. Exécute onDecalsEnter et place dans data.liveries.cameraViews la liste ui_liveries_camera.getViews(). *(interne)* *(hook)* | 137 |
| `ui_liveries_routeLifecycleCallbacks.onDecalMaterialEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans l'écran de matériau d'un décalque. Exécute onDecalsEnter, déplace la caméra libre sur le décalque (params.layerUid) et place sa peinture dans data.liveries.layerPaint. *(interne)* *(hook)* | 144 |
| `ui_liveries_routeLifecycleCallbacks.onDecalMirrorEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans l'écran de miroir d'un décalque. Exécute onDecalsEnter, avertit si params.layerUid manque, cadre la caméra orbite sur le décalque et place ses réglages de miroir dans data.liveries.decalMirror. *(interne)* *(hook)* | 155 |
| `ui_liveries_routeLifecycleCallbacks.onDecalSelectorMount(context, toRoute, fromRoute, data)` | Appelé au montage du sélecteur de décalques. Charge les textures avec ui_liveries_textures.loadTextures. *(interne)* *(hook)* | 170 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformLeave(context, toRoute, fromRoute, data)` | Appelé en quittant l'écran de transformation d'un nouveau décalque. Cache le curseur sauf si on va vers les réglages, puis exécute onDecalsLeave. *(interne)* *(hook)* | 196 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformMount(context, toRoute, fromRoute, data)` | Appelé au montage de l'écran de transformation d'un nouveau décalque. Notifie l'interface, reprend la table d'actions si on revient des réglages, sinon affiche le curseur du décalque sélectionné, puis place dans data.liveries decalTransform et decalMouseMode. *(interne)* *(hook)* | 174 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans les réglages de transformation d'un nouveau décalque. Exécute onDecalsEnter, suspend la table d'actions de transformation et place decalMirror et layerPaint dans data.liveries. *(interne)* *(hook)* | 203 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsLeave(context, toRoute, fromRoute, data)` | Appelé en quittant les réglages de transformation. Si on retourne à une route de transformation, reprend la table d'actions ; sinon exécute onDecalsLeave. *(interne)* *(hook)* | 212 |
| `ui_liveries_routeLifecycleCallbacks.onDecalsEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans la branche liveries.edit.decals. Démarre ui_liveries_decal.setup seulement si on vient de l'extérieur de cette branche. *(interne)* *(hook)* | 124 |
| `ui_liveries_routeLifecycleCallbacks.onDecalsLeave(context, toRoute, fromRoute, data)` | Appelé en quittant la branche decals. Si la destination reste dans cette branche, ne fait rien ; sinon appelle ui_liveries_decal.teardown puis onLiveriesLeave. *(interne)* *(hook)* | 187 |
| `ui_liveries_routeLifecycleCallbacks.onDecalsMount(context, toRoute, fromRoute, data)` | Appelé au montage de l'écran des décalques. Demande à ui_liveries_decal.notifyUi d'envoyer l'état à l'interface. *(interne)* *(hook)* | 133 |
| `ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans l'écran de transformation d'un décalque existant. Exécute onDecalsEnter puis ui_liveries_decal.beginExistingTransform(params.layerUid) ; avertit si layerUid manque. *(interne)* *(hook)* | 220 |
| `ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformLeave(context, toRoute, fromRoute, data)` | Appelé en quittant la transformation d'un décalque existant. Termine la transformation (endExistingTransform) sauf si on va vers les réglages, puis exécute onDecalsLeave. *(interne)* *(hook)* | 245 |
| `ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformMount(context, toRoute, fromRoute, data)` | Appelé au montage de l'écran de transformation d'un décalque existant. Reprend la table d'actions si on revient des réglages, sinon affiche le curseur du décalque existant, puis place decalTransform et decalMouseMode dans data.liveries. *(interne)* *(hook)* | 233 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesEditEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans liveries.edit. Si on vient de l'extérieur de la branche edit, démarre la session avec ui_liveries.setup(params.saveName) (pas de saveName : nouvelle livrée) et journalise un avertissement en cas d'échec. Place data.liveries.currentSaveName pour que le formulaire de sauvegarde propose d'écraser. *(interne)* *(hook)* | 81 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans la route liveries. Met en pause la simulation et place dans data.liveries.saveFiles la liste des livrées sauvegardées (ui_liveries_saves.getAll). *(interne)* *(hook)* | 70 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesLeave(context, toRoute, fromRoute, data)` | Appelé en quittant une route de livrées. Si la destination reste dans la branche edit, ne fait rien de plus ; sinon appelle ui_liveries.teardown puis applique la peau en attente (ui_liveries_saves.consumeStagedApplySkin) avec core_vehicle_partmgmt.setSkin. *(interne)* *(hook)* | 110 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesMount(context, toRoute, fromRoute, data)` | Appelé au montage de la route liveries. Ne fait rien. *(interne)* *(hook)* | 78 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesPaintEnter(context, toRoute, fromRoute, data)` | Appelé à l'entrée dans l'écran de peinture. Place dans data.liveries.layerPaint la peinture de la couche de base (ui_liveries_fill.getPaint). *(interne)* *(hook)* | 100 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesRootLeave(context, toRoute, fromRoute, data)` | Appelé en quittant l'écran d'accueil des livrées. Retire la demande de pause de la simulation (aucun autre hook Leave n'existe pour cet écran). *(interne)* *(hook)* | 106 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : ui_liveries_saves, ui_liveries, ui_liveries_fill, ui_liveries_decal, ui_liveries_textures, ui_liveries_camera. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua`.*
