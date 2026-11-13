# `gameplay_vehiclePresencePolicy.test`

*Fichier : `lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_vehiclePresencePolicy.test` : `extensions.load("gameplay_vehiclePresencePolicy.test")`, puis la globale `gameplay_vehiclePresencePolicy.test`

Tests unitaires de gameplay/vehiclePresencePolicy. Chaque fonction testXxx reçoit un contexte de test `ctx` (avec assert et assertEqual) fourni par le lanceur de tests du jeu ; ce n'est pas une extension de gameplay à charger.

## Remarques

- Les tests couvrent la validation/normalisation des modes, le mode non assis par défaut selon le contexte et les permissions de cartes d'actions.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_vehiclePresencePolicy.test.testActionMapPermissions(ctx)` | Vérifie allowsActionMap : driver seulement sur « driving », passenger jamais, unrestricted toujours. *(interne)* | 25 |
| `gameplay_vehiclePresencePolicy.test.testDefaultUnseatedMode(ctx)` | Vérifie defaultUnseatedMode : unrestricted seulement en freeroam sans multi-siège, passenger dans les autres cas (multiplayer, career, nil). *(interne)* | 17 |
| `gameplay_vehiclePresencePolicy.test.testModeValidationAndNormalization(ctx)` | Vérifie isValidMode (driver, passenger, unrestricted valides ; observer invalide) et normalizeMode (repli, valeur par défaut « passenger »). *(interne)* | 7 |

### Détail des paramètres

#### `gameplay_vehiclePresencePolicy.test.testActionMapPermissions(ctx)`

Vérifie allowsActionMap : driver seulement sur « driving », passenger jamais, unrestricted toujours.

- `ctx` (*table*) : Contexte de test.

#### `gameplay_vehiclePresencePolicy.test.testDefaultUnseatedMode(ctx)`

Vérifie defaultUnseatedMode : unrestricted seulement en freeroam sans multi-siège, passenger dans les autres cas (multiplayer, career, nil).

- `ctx` (*table*) : Contexte de test.

#### `gameplay_vehiclePresencePolicy.test.testModeValidationAndNormalization(ctx)`

Vérifie isValidMode (driver, passenger, unrestricted valides ; observer invalide) et normalizeMode (repli, valeur par défaut « passenger »).

- `ctx` (*table*) : Contexte de test avec assert et assertEqual.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua`.*
