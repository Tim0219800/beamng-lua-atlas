# `ui_multiseat_multiseatConfiguration`

*Fichier : `lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua` · VM : Game Engine (GE) · 913 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_multiseatConfiguration` : `extensions.load("ui_multiseat_multiseatConfiguration")`, puis la globale `ui_multiseat_multiseatConfiguration`

Modèle transactionnel de la configuration multi-sièges : quels périphériques d'entrée (ou groupes de périphériques gérés par la plateforme) appartiennent à quel joueur/persona. begin() ouvre une transaction (copie de l'état actuel ou du cache d'affectations), les fonctions d'édition la modifient, getPreview() fournit l'état à l'interface, puis commit() (ou commitCore + completeCommit) l'applique via core_multiseat.applyConfiguration ; discard() l'abandonne. Utilisé par l'écran de réglages multiseat.

## Exemple

```lua
local cfg = require('ge/extensions/ui/multiseat/multiseatConfiguration')
cfg.begin({source = 'settings'})
cfg.setDevicePlayer('keyboard-mouse', 1)
local ok, configOrReason = cfg.commit()
```

## Remarques

- Toutes les fonctions d'édition renvoient false quand aucune transaction n'est ouverte (sauf getPreview qui appelle begin() automatiquement).
- Les fonctions toggleDevicePlayer, setDevicePlayer, removeDevice, moveDevicePlayer et cycleDevicePlayer ne marchent qu'en mode manuel (platformManagesPlayers == false) ; joinDeviceGroup seulement en mode plateforme.
- Le nombre de personas est limité à MAX_PLAYERS = 64 et par la limite dure du gamemode en cours (core/multiseatPlayerLimits).
- Les numéros de persona commencent à 1 ; l'indice de joueur (player) commence à 0 et suit l'ordre croissant des numéros de persona.
- Une persona sans propriétaire (aucun périphérique/groupe) est supprimée automatiquement.
- En l'absence de session multiseat active, begin() reprend le véhicule du joueur 0 (sauf unicycle) pour la persona 1 et essaie de réutiliser le cache d'affectations (core_multiseat.getCachedPlayerAssignments) si le mode plateforme n'a pas changé.
- Chaque modification déclenche guihooks MultiseatConfigurationChanged avec un numéro de révision croissant et met à jour l'aperçu des couleurs de périphériques.
- commitCore refuse une configuration sans joueur (raison « no_players »).

**Dépendances (chargées avant) :** `core_playerPersonas`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_multiseatConfiguration.begin(options)` | Ouvre la transaction de configuration si elle n'existe pas (copie de la configuration active ou du cache), sinon réconcilie l'inventaire des périphériques. Appelle core_multiseat.beginConfigurationEdit. | 328 |
| `ui_multiseat_multiseatConfiguration.clearCachedAssignments()` | Vide le cache d'affectations de joueurs (core_multiseat.cachePlayerAssignments avec des listes vides). Sans effet si le multiseat est déjà actif. | 823 |
| `ui_multiseat_multiseatConfiguration.commit()` | commitCore puis completeCommit. | 895 |
| `ui_multiseat_multiseatConfiguration.commitCore()` | Applique la configuration via core_multiseat.applyConfiguration (notification des participants différée) et mémorise le journal des changements ; la transaction reste ouverte pour permettre rollbackCommit. | 860 |
| `ui_multiseat_multiseatConfiguration.completeCommit()` | Termine un commit réussi : appelle core_multiseat.finalizeConfiguration, ferme la transaction et journalise les changements. | 873 |
| `ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId)` | Mode manuel : sans joueur, assigne le périphérique à la première persona libre ; sinon le déplace vers la persona précédente (ou le désassigne s'il n'y en a pas). | 506 |
| `ui_multiseat_multiseatConfiguration.discard()` | Abandonne la transaction ; si elle avait déjà été appliquée (commitCore), restaure la configuration de départ. Termine l'édition côté core_multiseat. | 367 |
| `ui_multiseat_multiseatConfiguration.getCommitConfiguration()` | Construit la configuration à appliquer : platformManagesPlayers, personaOptInMode, manualAssignments (deviceId vers joueur, -1 si aucun), manualDeviceMetadata, groupAssignments, platformDeviceGroups, participants {playerIndex, personaNumber, persona} et adoptVehicleId. | 658 |
| `ui_multiseat_multiseatConfiguration.getPersona(personaNumber)` | Renvoie une copie de la persona de la transaction. | 575 |
| `ui_multiseat_multiseatConfiguration.getPlayers()` | Renvoie la liste des indices de joueurs (0 à n-1). | 651 |
| `ui_multiseat_multiseatConfiguration.getPreview()` | Renvoie l'état affichable de la configuration (ouvre la transaction si besoin) : availablePlayers (périphériques en mode manuel), availablePersonas et joinedPersonas, deviceGroups (mode plateforme), maxPlayers, platformManagesPlayers, playerLimit {limit, hard, atLimit, exceeded} et revision. | 581 |
| `ui_multiseat_multiseatConfiguration.hasChanges()` | Compare la configuration courante à la base de départ : true si multiseat n'était pas actif, si le nombre de joueurs ou les affectations diffèrent. | 834 |
| `ui_multiseat_multiseatConfiguration.hasUserChanges()` | Indique si l'utilisateur a modifié les affectations depuis l'ouverture (ou si elles viennent du cache). | 814 |
| `ui_multiseat_multiseatConfiguration.isActive()` | Indique si une transaction est ouverte. | 363 |
| `ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId)` | Mode plateforme : fait rejoindre un groupe de périphériques ; la persona porte le numéro du groupe s'il est libre et valide, sinon la première libre. | 531 |
| `ui_multiseat_multiseatConfiguration.leavePlayer(player)` | Retire un joueur : libère tous ses périphériques/groupes et supprime sa persona. | 547 |
| `ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction)` | Mode manuel : déplace le périphérique vers la persona précédente (direction -1, ou aucune si c'est la première) ou suivante (direction 1, ou une nouvelle persona si c'est la dernière et qu'elle a plusieurs périphériques). | 456 |
| `ui_multiseat_multiseatConfiguration.onClientEndMission()` | Hook appelé à la fin du niveau ; abandonne la transaction sans restaurer et efface l'aperçu des couleurs. *(interne)* *(hook)* | 902 |
| `ui_multiseat_multiseatConfiguration.onInputBindingsChanged()` | Hook appelé quand les périphériques ou liaisons changent ; réconcilie l'inventaire et notifie l'interface si la liste a changé. *(interne)* *(hook)* | 908 |
| `ui_multiseat_multiseatConfiguration.removeDevice(deviceId)` | Mode manuel : oublie un périphérique déconnecté (connected == false), le désassigne et le marque comme supprimé. | 437 |
| `ui_multiseat_multiseatConfiguration.rollbackCommit()` | Restaure la configuration de départ après un commitCore. | 886 |
| `ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber)` | Mode manuel : assigne le périphérique à la persona indiquée (1 à 64), ou le désassigne avec nil ou 0. Renvoie false si rien ne change ou si la limite de joueurs l'interdit. | 418 |
| `ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange)` | Copie les clés de data dans la persona (nom, icône, couleur, véhicule…). | 566 |
| `ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId)` | Mode manuel : retire le périphérique de son joueur s'il en a un, sinon l'assigne à la première persona libre. | 397 |

### Détail des paramètres

#### `ui_multiseat_multiseatConfiguration.begin(options)`

Ouvre la transaction de configuration si elle n'existe pas (copie de la configuration active ou du cache), sinon réconcilie l'inventaire des périphériques. Appelle core_multiseat.beginConfigurationEdit.

- `options` (*table|nil*) : Options ; source = origine de l'ouverture (par exemple « settings »).
- **renvoie** : table Aperçu, voir getPreview.

#### `ui_multiseat_multiseatConfiguration.clearCachedAssignments()`

Vide le cache d'affectations de joueurs (core_multiseat.cachePlayerAssignments avec des listes vides). Sans effet si le multiseat est déjà actif.

- **renvoie** : boolean Résultat du vidage, false si impossible.

#### `ui_multiseat_multiseatConfiguration.commit()`

commitCore puis completeCommit.

- **renvoie** : boolean Succès.
- **renvoie** : table|string Configuration appliquée, ou raison de l'échec.

#### `ui_multiseat_multiseatConfiguration.commitCore()`

Applique la configuration via core_multiseat.applyConfiguration (notification des participants différée) et mémorise le journal des changements ; la transaction reste ouverte pour permettre rollbackCommit.

- **renvoie** : boolean Succès.
- **renvoie** : table|string Configuration appliquée, ou raison de l'échec (par exemple « no_players »).

#### `ui_multiseat_multiseatConfiguration.completeCommit()`

Termine un commit réussi : appelle core_multiseat.finalizeConfiguration, ferme la transaction et journalise les changements.

- **renvoie** : boolean false si aucun commitCore réussi.

#### `ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId)`

Mode manuel : sans joueur, assigne le périphérique à la première persona libre ; sinon le déplace vers la persona précédente (ou le désassigne s'il n'y en a pas).

- `deviceId` (*string*) : Identifiant du périphérique ou du groupe.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatConfiguration.discard()`

Abandonne la transaction ; si elle avait déjà été appliquée (commitCore), restaure la configuration de départ. Termine l'édition côté core_multiseat.

- **renvoie** : boolean false s'il n'y avait pas de transaction.

#### `ui_multiseat_multiseatConfiguration.getCommitConfiguration()`

Construit la configuration à appliquer : platformManagesPlayers, personaOptInMode, manualAssignments (deviceId vers joueur, -1 si aucun), manualDeviceMetadata, groupAssignments, platformDeviceGroups, participants {playerIndex, personaNumber, persona} et adoptVehicleId.

- **renvoie** : table|nil Configuration, nil sans transaction.

#### `ui_multiseat_multiseatConfiguration.getPersona(personaNumber)`

Renvoie une copie de la persona de la transaction.

- `personaNumber` (*integer*) : Numéro de persona.
- **renvoie** : table|nil Persona ou nil.

#### `ui_multiseat_multiseatConfiguration.getPlayers()`

Renvoie la liste des indices de joueurs (0 à n-1).

- **renvoie** : integer[] Indices ; vide sans transaction.

#### `ui_multiseat_multiseatConfiguration.getPreview()`

Renvoie l'état affichable de la configuration (ouvre la transaction si besoin) : availablePlayers (périphériques en mode manuel), availablePersonas et joinedPersonas, deviceGroups (mode plateforme), maxPlayers, platformManagesPlayers, playerLimit {limit, hard, atLimit, exceeded} et revision.

- **renvoie** : table Table d'aperçu.

#### `ui_multiseat_multiseatConfiguration.hasChanges()`

Compare la configuration courante à la base de départ : true si multiseat n'était pas actif, si le nombre de joueurs ou les affectations diffèrent.

- **renvoie** : boolean true s'il y a des changements.

#### `ui_multiseat_multiseatConfiguration.hasUserChanges()`

Indique si l'utilisateur a modifié les affectations depuis l'ouverture (ou si elles viennent du cache).

- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatConfiguration.isActive()`

Indique si une transaction est ouverte.

- **renvoie** : boolean true si ouverte.

#### `ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId)`

Mode plateforme : fait rejoindre un groupe de périphériques ; la persona porte le numéro du groupe s'il est libre et valide, sinon la première libre.

- `groupId` (*integer*) : Identifiant de groupe (converti avec tonumber).
- **renvoie** : boolean false si déjà rejoint ou limite atteinte.

#### `ui_multiseat_multiseatConfiguration.leavePlayer(player)`

Retire un joueur : libère tous ses périphériques/groupes et supprime sa persona.

- `player` (*integer*) : Indice de joueur (à partir de 0).
- **renvoie** : boolean false si le joueur n'existe pas.

#### `ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction)`

Mode manuel : déplace le périphérique vers la persona précédente (direction -1, ou aucune si c'est la première) ou suivante (direction 1, ou une nouvelle persona si c'est la dernière et qu'elle a plusieurs périphériques).

- `deviceId` (*string*) : Identifiant du périphérique ou du groupe.
- `direction` (*integer*) : -1 ou 1.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatConfiguration.removeDevice(deviceId)`

Mode manuel : oublie un périphérique déconnecté (connected == false), le désassigne et le marque comme supprimé.

- `deviceId` (*string*) : Identifiant du périphérique ou du groupe.
- **renvoie** : boolean false si le périphérique est introuvable ou encore connecté.

#### `ui_multiseat_multiseatConfiguration.rollbackCommit()`

Restaure la configuration de départ après un commitCore.

- **renvoie** : boolean Résultat de core_multiseat.restoreConfiguration, ou false.

#### `ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber)`

Mode manuel : assigne le périphérique à la persona indiquée (1 à 64), ou le désassigne avec nil ou 0. Renvoie false si rien ne change ou si la limite de joueurs l'interdit.

- `deviceId` (*string*) : Identifiant du périphérique ou du groupe.
- `personaNumber` (*integer|nil*) : 1..64 pour assigner, nil ou 0 pour désassigner.
- **renvoie** : boolean true si modifié.

#### `ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange)`

Copie les clés de data dans la persona (nom, icône, couleur, véhicule…).

- `personaNumber` (*integer*) : Numéro de persona.
- `data` (*table*) : Champs à écraser.
- `emitChange` (*boolean|nil*) : Si false, ne notifie pas l'interface.
- **renvoie** : boolean false si pas de transaction, data invalide ou persona inconnue.

#### `ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId)`

Mode manuel : retire le périphérique de son joueur s'il en a un, sinon l'assigne à la première persona libre.

- `deviceId` (*string*) : Identifiant du périphérique ou du groupe.
- **renvoie** : boolean true si modifié.

## Champs

| Champ | Type | Description |
|---|---|---|
| `AUTOMATIC_COLOR_DEFAULT` | boolean | Valeur par défaut (true) du réglage multiseatAutomaticColor. |
| `dependencies` | table<integer, string> | Extensions chargées avant : core_playerPersonas. |

**Évènements UI (guihooks.trigger) :** `MultiseatConfigurationChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua`.*
