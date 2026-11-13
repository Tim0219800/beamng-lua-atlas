# `gameplay_freeformDelivery_hints`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/hints.lua` · VM : Game Engine (GE) · 191 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_hints` : `extensions.load("gameplay_freeformDelivery_hints")`, puis la globale `gameplay_freeformDelivery_hints`

Gère les indices (hints) du mode de livraison libre : chaque hint de la livraison (id, targetAreaIds, message, subtext) s'affiche comme message dans la liste de tâches (SetTasklistTask) tant que le joueur se trouve dans l'une de ses zones cibles (zone, location ou parkingSpot), puis disparaît (DiscardTasklistItem) quand il en sort. Appelé par gameplay_freeformDelivery_freeformDelivery, pas par le moteur.

## Remarques

- Un hint sans id ou sans targetAreaIds est ignoré (avertissement loggué). Le message par défaut est la clé missions.freeformDelivery.common.hint.fallback.
- Détection : joueur en véhicule = gameplay_freeformDelivery_utils.checkVehicleInArea ; joueur à pied = test manuel (containsPoint2D pour zone, distance <= rayon pour location, boîte orientée pour parkingSpot).
- Les tâches de la tasklist ont l'id « hint_<id> » et le type message.
- Le paramètre profiler de update est facultatif : il sert à y ajouter des sections de mesure (p:add).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_hints.cleanup()` | Retire tous les hints affichés de la tasklist et oublie la livraison active. | 179 |
| `gameplay_freeformDelivery_hints.setup(delivery)` | Initialise les hints à partir de delivery.hints et mémorise la livraison active. Logge le nombre de hints chargés. | 92 |
| `gameplay_freeformDelivery_hints.update(dtReal, dtSim, dtRaw, profiler)` | À appeler à chaque frame : affiche les hints dont une zone cible contient le joueur et masque les autres. Sans effet si aucune livraison n'est active ou si la position du joueur est inconnue. | 128 |

### Détail des paramètres

#### `gameplay_freeformDelivery_hints.setup(delivery)`

Initialise les hints à partir de delivery.hints et mémorise la livraison active. Logge le nombre de hints chargés.

- `delivery` (*table*) : Livraison chargée (hints, targetAreas, sites).

#### `gameplay_freeformDelivery_hints.update(dtReal, dtSim, dtRaw, profiler)`

À appeler à chaque frame : affiche les hints dont une zone cible contient le joueur et masque les autres. Sans effet si aucune livraison n'est active ou si la position du joueur est inconnue.

- `dtReal` (*number*) : Delta temps réel (inutilisé).
- `dtSim` (*number*) : Delta temps simulé (inutilisé).
- `dtRaw` (*number*) : Delta temps brut (inutilisé).
- `profiler` (*table|nil*) : LuaProfiler facultatif pour mesurer les sections.

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/hints.lua`.*
