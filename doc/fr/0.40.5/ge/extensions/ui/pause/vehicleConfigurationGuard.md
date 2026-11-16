# `ui_pause_vehicleConfigurationGuard`

*Fichier : `lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_vehicleConfigurationGuard` : `extensions.load("ui_pause_vehicleConfigurationGuard")`, puis la globale `ui_pause_vehicleConfigurationGuard`

Garde de sortie de l'écran de configuration véhicule du menu pause. Quand l'UI signale des modifications non appliquées (setHasPendingChanges), toute navigation hors de l'écran est interceptée par confirmExit : un dialogue de confirmation (Annuler / Abandonner / Appliquer) est affiché et la navigation est mise en attente, puis reprise une fois la décision prise. Utile à un moddeur qui ajoute une sous-route de configuration ou veut comprendre pourquoi une navigation est bloquée.

## Exemple

```lua
ui_pause_vehicleConfigurationGuard.setHasPendingChanges(true)
-- le routeur appelle ensuite confirmExit(route, params, context) avant de quitter l'écran
```

## Remarques

- Les sous-routes pause.vehicle.configurationcombined.save, .configlistmanage et .mirrors ne déclenchent jamais le dialogue (table SUB_ROUTES).
- confirmExit renvoie false quand il bloque la navigation ; elle est alors rejouée via ui_router.navigate par resumePendingExit avec un drapeau de contournement (exitConfirmationBypass) pour ne pas redemander la confirmation.
- La cible en attente est toujours rafraîchie à chaque appel de confirmExit : un dialogue fermé sans callback ne bloque donc pas la navigation indéfiniment.
- Les modifications non appliquées n'existent que dans l'UI ; abandonner revient simplement à poursuivre la navigation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_vehicleConfigurationGuard.cancelExit()` | Callback du bouton Annuler : oublie la navigation en attente. *(interne)* | 83 |
| `ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context)` | Appelée avant de quitter l'écran. Renvoie true (navigation autorisée) si le contournement est actif, s'il n'y a pas de changement en attente, si le nom de route est invalide ou s'il s'agit d'une sous-route de la configuration. Sinon mémorise la navigation demandée, affiche le dialogue showConfirmationDialog (boutons Annuler, Abandonner, Appliquer) et renvoie false. *(interne)* | 39 |
| `ui_pause_vehicleConfigurationGuard.confirmExitApplying()` | Callback du bouton Appliquer : déclenche l'évènement UI VehicleConfigurationCombinedApplyAndExit. L'arbre de pièces et le tuning en attente vivent dans l'UI, qui les applique puis rappelle resumePendingExit(). *(interne)* | 94 |
| `ui_pause_vehicleConfigurationGuard.confirmExitDiscarding()` | Callback du bouton Abandonner : reprend la navigation en attente sans appliquer les changements. *(interne)* | 88 |
| `ui_pause_vehicleConfigurationGuard.navigateBack()` | Navigue vers la route de retour : core_vehicle_configTarget.getReturnRoute() si l'extension est chargée, sinon « pause.vehicle ». Utilise l'option restoreLastScope = true. | 21 |
| `ui_pause_vehicleConfigurationGuard.resumePendingExit()` | Rejoue la navigation mise en attente en contournant la confirmation. Renvoie false s'il n'y a aucune navigation en attente. | 98 |
| `ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value)` | Indique si l'écran de configuration contient des modifications non appliquées. Toute valeur différente de true est convertie en false. | 17 |

### Détail des paramètres

#### `ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context)`

Appelée avant de quitter l'écran. Renvoie true (navigation autorisée) si le contournement est actif, s'il n'y a pas de changement en attente, si le nom de route est invalide ou s'il s'agit d'une sous-route de la configuration. Sinon mémorise la navigation demandée, affiche le dialogue showConfirmationDialog (boutons Annuler, Abandonner, Appliquer) et renvoie false.

- `route` (*table|any*) : Route cible ; son champ name sert si context.routeName est absent
- `params` (*table|nil*) : Paramètres de navigation à rejouer plus tard
- `context` (*table|nil*) : Contexte du routeur : routeName et options (déduit du code)
- **renvoie** : boolean true si la navigation peut continuer, false si elle est suspendue en attendant le dialogue

#### `ui_pause_vehicleConfigurationGuard.confirmExitDiscarding()`

Callback du bouton Abandonner : reprend la navigation en attente sans appliquer les changements.

- **renvoie** : any Résultat de la navigation rejouée, ou false s'il n'y avait rien en attente

#### `ui_pause_vehicleConfigurationGuard.navigateBack()`

Navigue vers la route de retour : core_vehicle_configTarget.getReturnRoute() si l'extension est chargée, sinon « pause.vehicle ». Utilise l'option restoreLastScope = true.

- **renvoie** : any Résultat de ui_router.navigate

#### `ui_pause_vehicleConfigurationGuard.resumePendingExit()`

Rejoue la navigation mise en attente en contournant la confirmation. Renvoie false s'il n'y a aucune navigation en attente.

- **renvoie** : any Résultat de ui_router.navigate, ou false

#### `ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value)`

Indique si l'écran de configuration contient des modifications non appliquées. Toute valeur différente de true est convertie en false.

- `value` (*boolean*) : true s'il y a des changements en attente

**Évènements UI (guihooks.trigger) :** `VehicleConfigurationCombinedApplyAndExit`, `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua`.*
