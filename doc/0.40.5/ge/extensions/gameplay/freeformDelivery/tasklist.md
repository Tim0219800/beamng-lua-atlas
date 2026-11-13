# `gameplay_freeformDelivery_tasklist`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua` · VM : Game Engine (GE) · 429 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_tasklist` : `extensions.load("gameplay_freeformDelivery_tasklist")`, puis la globale `gameplay_freeformDelivery_tasklist`

Alimente l'app « tasks » (liste de tâches en haut à gauche) pendant une livraison libre. Il affiche un en-tête (nom de la livraison), une tâche par objectif actif (placement, playerInVehicle, engineRunning, coupled, unhitched), une tâche groupée « ne pas abîmer la cargaison » pour les objectifs damage, les objectifs de distance quand leur seuil d'alerte est dépassé, et un message d'invite à choisir une route. La liste n'est reconstruite que lorsqu'un hash d'état des objectifs change.

## Remarques

- Les tâches sont envoyées à l'UI par guihooks.trigger : ClearTasklist, SetTasklistHeader, SetTasklistTask {id, type, label, subtext, done, fail} et DiscardTasklistItem (id, délai facultatif).
- Ids de tâches : delivery_goal_<goalId>, delivery_damage, delivery_distance_<goalId>, delivery_route_prompt. Un objectif avec showInTasklist == false n'est jamais affiché.
- Un objectif terminé avec removeOnComplete est retiré après un délai et ne revient plus dans la liste (sauf s'il redevient non terminé).
- L'invite de route n'apparaît qu'une fois par livraison : dès qu'une route est active, elle est considérée comme déjà montrée.
- Dépend des globales gameplay_freeformDelivery_goals et _odometer et de ui_appContainers, sans les déclarer dans dependencies.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_routes`, `core_groundMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_tasklist.cleanup()` | Efface l'en-tête, les tâches et les messages de route de l'UI. *(interne)* | 409 |
| `gameplay_freeformDelivery_tasklist.setup(delivery)` | Affiche l'app « tasks », vide la liste, réinitialise les caches, envoie l'en-tête (nom de la livraison), construit la liste initiale et le message de route. *(interne)* | 314 |
| `gameplay_freeformDelivery_tasklist.update(profiler)` | Appelée chaque frame : met à jour le message d'odomètre, calcule un hash de l'état des objectifs (y compris la progression des objectifs multi-véhicules) et reconstruit la liste si quelque chose a changé. *(interne)* | 345 |
| `gameplay_freeformDelivery_tasklist.updateRouteMessage()` | Retire les anciens messages de route et, s'il existe des routes mais pas de guidage actif (core_groundMarkers.currentlyHasTarget) et que l'invite n'a pas encore été montrée, affiche le message invitant à choisir une route via la grande carte. Appelée par routes.lua. | 122 |

### Détail des paramètres

#### `gameplay_freeformDelivery_tasklist.setup(delivery)`

Affiche l'app « tasks », vide la liste, réinitialise les caches, envoie l'en-tête (nom de la livraison), construit la liste initiale et le message de route.

- `delivery` (*table*) : Données de livraison (name...).

#### `gameplay_freeformDelivery_tasklist.update(profiler)`

Appelée chaque frame : met à jour le message d'odomètre, calcule un hash de l'état des objectifs (y compris la progression des objectifs multi-véhicules) et reconstruit la liste si quelque chose a changé.

- `profiler` (*table|nil*) : Profileur optionnel (méthode add).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_freeformDelivery_utils, gameplay_freeformDelivery_routes et core_groundMarkers. |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `DiscardTasklistItem`, `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua`.*
