# `ui_pause_providers_trafficControls`

*Fichier : `lua/ge/extensions/ui/pause/providers/trafficControls.lua` · VM : Game Engine (GE) · 341 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_trafficControls` : `extensions.load("ui_pause_providers_trafficControls")`, puis la globale `ui_pause_providers_trafficControls`

Fournisseur de données du panneau « contrôles du trafic » du menu pause. Il compte les véhicules de trafic (en circulation, garés, police, actifs/inactifs) via gameplay_traffic, gameplay_parking et gameplay_police, calcule les quantités à faire apparaître d'après les réglages (trafficAmount, trafficExtraAmount, trafficParkingAmount, trafficParkedVehicles) et construit les boutons (démarrer, arrêter, supprimer, faire apparaître du trafic normal, de police ou des véhicules garés, activer/désactiver). Les boutons sont exécutés par executeTrafficControlAction.

## Remarques

- Les boutons sont créés une seule fois (buttonModule) puis clonés à chaque appel de getData, avec disabled et, pour les boutons d'apparition, spawnAmount {total, traffic, activeTraffic, extraTraffic, normalTraffic, police, parked}.
- La quantité de police prévue vaut 25 % (arrondi supérieur) du trafic actif ; le trafic « actif » vaut trafficAmount, ou getMaxVehicleAmount(10) si le réglage vaut 0 (puis ajusté par gameplay_traffic.getIdealSpawnAmount).
- Si les véhicules de police ne sont pas listés par gameplay_police, les véhicules de trafic dont le Config Type est « police » (ou dont le .pc contient « police ») sont comptés à la place.
- Le trafic est considéré activé si au moins un véhicule existe et si l'état du trafic est « on » ou le parking actif.
- Pendant la leçon « traffic » de la première conduite, l'état renvoyé est forcé à « off » tant qu'aucun véhicule de trafic ni garé n'existe.
- Les libellés sont traduits avec _tr (ui.radialmenu2.traffic.*), sauf le bouton « toggleTraffic » dont le libellé « Traffic » est en dur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_trafficControls.executeTrafficControlAction(buttonId, payload)` | Exécute l'action d'un bouton par son identifiant : démarrage, arrêt ou suppression du trafic, apparition de trafic normal, de police ou garé, ou bascule. | 335 |
| `ui_pause_providers_trafficControls.getData(payload)` | Construit l'état du panneau de trafic : état du trafic, parking actif, enabled, canActivateExisting (plus d'un objet dans la scène), compteurs driving/parked/police/total ({total, active, inactive}) et boutons d'action (toggle, controls, spawn). | 305 |

### Détail des paramètres

#### `ui_pause_providers_trafficControls.executeTrafficControlAction(buttonId, payload)`

Exécute l'action d'un bouton par son identifiant : démarrage, arrêt ou suppression du trafic, apparition de trafic normal, de police ou garé, ou bascule.

- `buttonId` (*any*) : Identifiant du bouton, fourni par getData.
- `payload` (*any*) : Données transmises au callback du bouton.
- **renvoie** : boolean false si buttonId est nil, sinon résultat du callback.

#### `ui_pause_providers_trafficControls.getData(payload)`

Construit l'état du panneau de trafic : état du trafic, parking actif, enabled, canActivateExisting (plus d'un objet dans la scène), compteurs driving/parked/police/total ({total, active, inactive}) et boutons d'action (toggle, controls, spawn).

- `payload` (*table|nil*) : requestId est renvoyé tel quel ; editable == false désactive tous les boutons.
- **renvoie** : table {requestId, state, parkingActive, enabled, canActivateExisting, driving, parked, police, total, actions}.

## Appels vers le moteur (C++)

- `be:` `getObjectActive`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/trafficControls.lua`.*
