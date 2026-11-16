# `ui_multiseat_generalSettings`

*Fichier : `lua/ge/extensions/ui/multiseat/generalSettings.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_generalSettings` : `extensions.load("ui_multiseat_generalSettings")`, puis la globale `ui_multiseat_generalSettings`

Fournisseur de réglages « general » de la fenêtre de réglages multiseat. Il déclare les champs : même véhicule pour tous, rassembler les véhicules, replacer tous les joueurs, couleur automatique, marqueurs de joueurs et disposition de l'écran partagé pour 2 à 9+ joueurs ; puis il gère leurs actions, changements, validation et application via les hooks onXxxMultiseatGameSetting(s).

## Remarques

- Réglages écrits dans settings : multiseatAutomaticColor et multiseatLayout2 à multiseatLayout9 (9 = « 9+ », seule la valeur « automatic » est acceptée). Le réglage multiseatTags (marqueurs) est écrit tout de suite (applyMode = immediate).
- Une disposition « shared » stockée est convertie en « automatic » à l'affichage et refusée à la validation.
- Raisons de refus de validation : missing_general_multiseat_settings, invalid_player_marker_mode, invalid_automatic_color_mode, invalid_multiseat_layout.
- Après application, les champs gatherVehicles et reseatAllPlayers sont remis à leur valeur neutre (« » et false) via result.valueOverrides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result)` | Enregistre couleur automatique et dispositions, rafraîchit render_splitScreen, rassemble les véhicules (gatherVehicles) et replace les joueurs (reseatAllPlayers) si demandé, puis remet ces deux champs à zéro via result.valueOverrides. *(interne)* *(hook)* | 201 |
| `ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers)` | Ajoute à providers le fournisseur « general » (placement afterVehicles, applyMode apply) avec tous ses champs. *(interne)* *(hook)* | 107 |
| `ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value)` | Gère l'action du champ sameVehicleForEveryone : « selector » ouvre le sélecteur de véhicule pour tous les joueurs, sinon le véhicule choisi est préparé pour tous. Le résultat est écrit dans result.success. Ignoré pour les autres fournisseurs. *(interne)* *(hook)* | 142 |
| `ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value)` | Réagit à un changement de champ : automaticColor est préparé pour tous les joueurs ; showPlayerMarkers est appliqué immédiatement (core_multiseat.setPlayerMarkersEnabled, sinon réglage multiseatTags). *(interne)* *(hook)* | 153 |
| `ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result)` | Valide les réglages préparés : présence du fournisseur, booléens showPlayerMarkers et automaticColor, dispositions valides pour chaque nombre de joueurs. Écrit result.success = false et result.reason en cas d'erreur. *(interne)* *(hook)* | 166 |

### Détail des paramètres

#### `ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result)`

Enregistre couleur automatique et dispositions, rafraîchit render_splitScreen, rassemble les véhicules (gatherVehicles) et replace les joueurs (reseatAllPlayers) si demandé, puis remet ces deux champs à zéro via result.valueOverrides.

- `stagedSettings` (*table*) : Réglages préparés par fournisseur.
- `_activeSettings` (*table*) : Réglages actifs (non utilisé).
- `result` (*table*) : Table de résultat (valueOverrides).

#### `ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers)`

Ajoute à providers le fournisseur « general » (placement afterVehicles, applyMode apply) avec tous ses champs.

- `providers` (*table[]*) : Liste de fournisseurs de réglages à compléter.

#### `ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value)`

Gère l'action du champ sameVehicleForEveryone : « selector » ouvre le sélecteur de véhicule pour tous les joueurs, sinon le véhicule choisi est préparé pour tous. Le résultat est écrit dans result.success. Ignoré pour les autres fournisseurs.

- `providerId` (*string*) : Identifiant du fournisseur (« general »).
- `fieldId` (*string*) : Identifiant du champ.
- `result` (*table*) : Table de résultat (success).
- `value` (*any*) : Valeur choisie.

#### `ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value)`

Réagit à un changement de champ : automaticColor est préparé pour tous les joueurs ; showPlayerMarkers est appliqué immédiatement (core_multiseat.setPlayerMarkersEnabled, sinon réglage multiseatTags).

- `providerId` (*string*) : Identifiant du fournisseur.
- `fieldId` (*string*) : Identifiant du champ.
- `value` (*any*) : Nouvelle valeur.

#### `ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result)`

Valide les réglages préparés : présence du fournisseur, booléens showPlayerMarkers et automaticColor, dispositions valides pour chaque nombre de joueurs. Écrit result.success = false et result.reason en cas d'erreur.

- `stagedSettings` (*table*) : Réglages préparés par fournisseur.
- `_activeSettings` (*table*) : Réglages actifs (non utilisé).
- `result` (*table*) : Table de résultat (success, reason).

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/generalSettings.lua`.*
