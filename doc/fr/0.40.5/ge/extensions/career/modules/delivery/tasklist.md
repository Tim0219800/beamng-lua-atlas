# `career_modules_delivery_tasklist`

*Fichier : `lua/ge/extensions/career/modules/delivery/tasklist.lua` · VM : Game Engine (GE) · 305 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_tasklist` : `extensions.load("career_modules_delivery_tasklist")`, puis la globale `career_modules_delivery_tasklist`

Alimente la liste de tâches affichée à l'écran (tasklist) pendant la livraison en carrière. Il regroupe les cargaisons chargées par destination, les cargaisons à récupérer par lieu de ramassage, les tâches de remorque/véhicule, et un en-tête « livraisons actives ». Chaque élément est marqué à mettre à jour ou à effacer, puis envoyé à l'UI à chaque image via guihooks (SetTasklistTask, SetTasklistHeader, DiscardTasklistItem).

## Remarques

- Types d'éléments : parcels, pickup, header, et le type de l'offre de véhicule (trailer ou vehicle).
- Les groupes 'parcels' sont regroupés par libellé de destination ; sans modificateur la clé est 'noMods', sinon elle inclut groupId et l'heure de chargement.
- Pour les colis timed, le sous-texte affiche le temps restant avant retard, puis avant « très en retard », puis « late ».
- offerIdToTasklistElementId n'est jamais vidé (seul cargoIdToTasklistElementId est réinitialisé à chaque sendCargoToTasklist).
- À l'effacement, seuls les éléments parcels, pickup, header, trailer et vehicle envoient un message de suppression à l'UI.

**Dépendances (chargées avant) :** `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_tasklist.clearAll()` | Marque tous les éléments à effacer ; ils sont retirés à la prochaine mise à jour. | 150 |
| `career_modules_delivery_tasklist.clearTasklistForOfferId(offerId)` | Marque à effacer l'élément lié à une offre de véhicule/remorque. | 143 |
| `career_modules_delivery_tasklist.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les extensions de livraison. *(interne)* *(hook)* | 8 |
| `career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : appelle updateCargoTasklistElements. *(interne)* *(hook)* | 301 |
| `career_modules_delivery_tasklist.sendCargoToTasklist()` | Reconstruit les éléments de tasklist à partir des conteneurs de cargaison des véhicules proches (asynchrone) : marque tous les anciens éléments à effacer, recrée les groupes parcels et pickup, les tâches de véhicules (dVehicleTasks.getVehicleTasks) et l'en-tête avec le nombre de tâches ou d'objets chargés. | 22 |
| `career_modules_delivery_tasklist.updateCargoTasklistElements()` | Parcourt les éléments : envoie à l'UI les suppressions (DiscardTasklistItem / SetTasklistHeader nil) et les mises à jour (SetTasklistTask avec label, subtext, active, type='message'), puis supprime les éléments effacés. Les libellés dépendent de l'étape en cours des tâches de véhicule (coupleTrailer, enterVehicle, bringToDestination/confirmDropOff, putIntoParkingSpot). | 159 |
| `career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId)` | Marque à rafraîchir l'élément de tasklist qui contient cette cargaison (utile pour le compte à rebours des colis timed). | 129 |
| `career_modules_delivery_tasklist.updateTasklistForOfferId(offerId)` | Marque à rafraîchir l'élément lié à une offre de véhicule/remorque. | 136 |

### Détail des paramètres

#### `career_modules_delivery_tasklist.clearTasklistForOfferId(offerId)`

Marque à effacer l'élément lié à une offre de véhicule/remorque.

- `offerId` (*integer*) : Identifiant de l'offre.

#### `career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : appelle updateCargoTasklistElements.

- `dtReal` (*number*) : Delta temps réel (s), inutilisé.
- `dtSim` (*number*) : Delta temps simulation (s), inutilisé.
- `dtRaw` (*number*) : Delta temps brut (s), inutilisé.

#### `career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId)`

Marque à rafraîchir l'élément de tasklist qui contient cette cargaison (utile pour le compte à rebours des colis timed).

- `cargoId` (*integer*) : Identifiant de la cargaison.

#### `career_modules_delivery_tasklist.updateTasklistForOfferId(offerId)`

Marque à rafraîchir l'élément lié à une offre de véhicule/remorque.

- `offerId` (*integer*) : Identifiant de l'offre.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : core_vehicleBridge. |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/tasklist.lua`.*
