# `core_multiseat`

*Fichier : `lua/ge/extensions/core/multiseat.lua` · VM : Game Engine (GE) · 1527 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_multiseat` : `extensions.load("core_multiseat")`, puis la globale `core_multiseat`

Extension GE `core_multiseat` : gestion du multi-joueur local (plusieurs joueurs sur le même PC : clavier/souris et manettes). Elle décide quel joueur (indice 0, 1, 2...) contrôle chaque périphérique d'entrée, soit par attribution manuelle (par périphérique), soit par groupes de périphériques gérés par la plateforme (comptes utilisateur de console). Elle maintient la liste des joueurs 'rejoints' (joinedPlayers) avec leur persona (nom, icône, couleur via core_playerPersonas), place les joueurs dans des véhicules, affiche des étiquettes de joueurs (render_playerTags), colore les périphériques et émet onLocalParticipantsChanged. La majorité des fonctions est appelée par core_input_bindings et par l'interface multiseat.

## Exemple

```lua
if settings.getValue('multiseat') then
  for _, p in ipairs(core_multiseat.getParticipants()) do
    log('I','', p.persona.displayName .. ' -> joueur ' .. p.assignment.playerIndex)
  end
end
```

## Remarques

- Vocabulaire : 'player' = indice de joueur (base 0, au plus 64 : maxPlayers codé en dur 'à aligner avec la limite du fast path de steering côté C++') ; 'persona' = identité numérotée à partir de 1 (core_playerPersonas) ; 'participant' = { id, persona, assignment, inputIcon } où assignment = { playerIndex, devices, deviceIds, primaryDeviceId, deviceLabel, connectedDeviceLabel, connectedInputIcon, connected }.
- Appareils d'entrée : `devices` est la table fournie par core_input_bindings : nom de périphérique -> { guid, productName, pidvid, playerNumber, platformUserNumber } (indices 1 à 5). La clavier et la souris sont regroupés comme un seul 'périphérique' (id 'keyboard-mouse') dans les listes d'affectation.
- Deux modes d'affectation : manuel (manuallyAssignedPlayers, un indice par périphérique, -1 = non assigné ; cycleDevicePlayer fait défiler) ou géré par la plateforme (Input.getPlatformUserCount() non nil : platformDeviceGroupPlayers, un indice par groupe d'appareils, via assignDeviceGroup). Sans réglage 'multiseat' vrai, tous les périphériques appartiennent au joueur 0.
- normalizePlayerAssignments (interne) renumérote les joueurs pour qu'ils soient contigus à partir de 0, dans l'ordre des numéros de persona. getAssignedPlayers fait ce travail à chaque appel de core_input_bindings, mémorise l'assignation, met à jour activePlayers/joinedPlayers et peut replacer les joueurs à pied dans le véhicule le moins occupé (seatPlayers).
- Édition de configuration : beginConfigurationEdit/endConfigurationEdit figent les affectations réelles pendant que l'interface compose une configuration. applyConfiguration(config) la valide (resolveConfiguration), prend un instantané (exportConfiguration), l'applique via core_input_bindings.applyPlayerAssignments, et restaure l'instantané en cas d'échec. Avec config.deferParticipantNotification, la notification est reportée jusqu'à finalizeConfiguration().
- Hooks émis : onLocalParticipantsChanged(revision) ; évènement UI LocalParticipantsChanged(participants, revision). La 'révision' = compteur interne + révision de core_playerPersonas.
- Bug/incohérence : getPlayerMarkersEnabled lit settings 'multiseatTags' comme un booléen et, si la valeur n'en est pas un (par exemple la chaîne 'always'/'smart'/'never' écrite par core_multiseatPlayerMarkers), la remplace par true/false dans les réglages (écrase l'ancienne chaîne). Les deux modules ne partagent pas le même format.
- Incohérence : au chargement nextMockPlatformDeviceGroupId vaut 1 mais reset() le remet à 0 (affecte seulement le mode de débogage debugMockPlatformUsers).
- M.allowTrafficDebug est défini à false et n'est utilisé nulle part dans ce fichier.
- reset() (appelé à la fin du niveau) efface joueurs, personas, assignations et couleurs de périphériques, remet activePlayers = {0} et désactive le réglage 'multiseat' si cette session l'avait activé (personaOptInMode ou multiseatActive).
- onSerialize ne renvoie un instantané que si multiseatActive est vrai ; sinon rien n'est sauvegardé. onDeserialized tente de restaurer la configuration exportée.
- Les étiquettes de joueurs (render_playerTags) ne sont affichées que si le réglage multiseat est vrai, plus d'un joueur actif et le split-screen n'est pas chargé (render_splitScreen s'occupe alors des étiquettes).

**Dépendances (chargées avant) :** `core_playerPersonas`, `render_playerTags`, `ui_multiseat_assignmentCache`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_multiseat.applyConfiguration(config)` | Applique une configuration multiseat : active le réglage 'multiseat' et l'action map, installe les affectations, personas et joueurs, avec restauration automatique en cas d'erreur. | 1138 |
| `core_multiseat.assignDeviceGroup(groupId, player)` | Assigne un groupe de périphériques de la plateforme à un joueur (ou -1 pour le désassigner). Refuse si la plateforme ne gère pas les joueurs, si le groupe n'existe pas ou si le joueur est déjà pris par un autre groupe. | 585 |
| `core_multiseat.beginConfigurationEdit()` | Démarre une session d'édition : getAssignedPlayers renvoie alors des affectations figées au lieu de recalculer. | 1496 |
| `core_multiseat.cachePlayerAssignments(config)` | Construit le cache (propriétaires de périphériques/groupes par numéro de persona) à partir d'une configuration et le stocke dans ui_multiseat_assignmentCache. | 1022 |
| `core_multiseat.clearDeviceColors()` | Retire les couleurs de joueurs des périphériques, si elles avaient été appliquées. | 1362 |
| `core_multiseat.clearJoinedPlayers()` | Retire tous les joueurs rejoints et efface toutes les personas. | 886 |
| `core_multiseat.clearPlayerPersona(player)` | Remet la persona d'un joueur rejoint à ses valeurs par défaut et notifie. | 1291 |
| `core_multiseat.cycleDevicePlayer(deviceId)` | Fait passer un périphérique (ou le groupe clavier+souris) au joueur suivant dans le cycle (joueur 0, -1 non assigné, puis joueur précédent...), renumérote les joueurs et met à jour core_input_bindings. Refusé si la plateforme gère les joueurs. | 616 |
| `core_multiseat.endConfigurationEdit(devices, assignments)` | Termine l'édition, et mémorise éventuellement l'état des périphériques et des affectations fournis. | 1497 |
| `core_multiseat.exportConfiguration()` | Exporte l'état complet du multiseat (affectations, joueurs rejoints, personas, caches) sous forme de table copiable, utilisée comme instantané pour restauration ou rechargement Lua. | 971 |
| `core_multiseat.finalizeConfiguration()` | Termine une application différée : met à jour le cache d'affectations en attente et émet la notification des participants. | 1228 |
| `core_multiseat.getAssignedPlayers(devices, logEnabled, seatPlayers)` | Calcule quel joueur contrôle chaque périphérique, l'applique via assignPlayerToDevice et met à jour l'état interne (joueurs actifs, personas). Pendant une édition de configuration, renvoie des affectations 'sûres' sans les modifier. Appelée par core_input_bindings. *(interne)* | 201 |
| `core_multiseat.getAvailableParticipants()` | Participants disponibles pour l'interface : pour chaque joueur actif, { id = 'local-player:N', assignment, inputIcon, joined, persona (réelle si rejoint, sinon aperçu) }. | 1239 |
| `core_multiseat.getCachedPlayerAssignments()` | Renvoie le cache d'affectations mémorisé dans ui_multiseat_assignmentCache. | 1029 |
| `core_multiseat.getDeviceAssignments()` | Liste, pour l'interface, les 'périphériques' (clavier+souris regroupés, manettes) avec leur joueur assigné manuellement : { id, deviceIds, primaryDeviceId, deviceLabel, inputIcon, playerIndex, connected, deviceMetadata }. | 469 |
| `core_multiseat.getDeviceAssignmentsFor(devices, assignedPlayers, connectedDevices)` | Version paramétrée de getDeviceAssignments pour des périphériques et affectations fournis. | 409 |
| `core_multiseat.getDeviceGroupForPlayer(player)` | Renvoie le groupe de périphériques assigné à un joueur. | 609 |
| `core_multiseat.getDeviceGroups()` | Groupes de périphériques de la plateforme (un par compte utilisateur), avec le joueur assigné ; inclut les groupes assignés mais déconnectés (connected = false). | 566 |
| `core_multiseat.getDeviceGroupsFor(devices, groupAssignments)` | Version paramétrée de getDeviceGroups. | 496 |
| `core_multiseat.getJoinedParticipants()` | Participants des joueurs rejoints, triés par indice de joueur. | 961 |
| `core_multiseat.getJoinedPlayers()` | Indices triés des joueurs ayant rejoint (avec persona). | 713 |
| `core_multiseat.getParticipant(player)` | Renvoie le participant d'un joueur. | 1272 |
| `core_multiseat.getParticipantRevision()` | Renvoie la révision des participants (compteur interne + révision de core_playerPersonas), pour détecter les changements. | 62 |
| `core_multiseat.getParticipants(players)` | Renvoie les participants (persona + affectation). Sans argument et s'il y a des joueurs rejoints, ce sont les joueurs rejoints ; sinon les joueurs actifs (avec persona en aperçu si non rejoints). | 1258 |
| `core_multiseat.getPlayerMarkersEnabled()` | Indique si les étiquettes de joueurs sont activées (réglage 'multiseatTags' booléen, défaut true). Convertit en booléen une ancienne valeur chaîne ('never' = faux). Voir les notes sur l'incohérence avec core_multiseatPlayerMarkers. | 49 |
| `core_multiseat.getPlayers(result)` | Remplit et renvoie la liste ordonnée des indices de joueurs actuellement actifs. | 322 |
| `core_multiseat.isApplyingConfiguration()` | Indique si applyConfiguration est en cours. | 1495 |
| `core_multiseat.isConfigurationEditActive()` | Indique si une édition de configuration est en cours. | 1505 |
| `core_multiseat.isMultiseatActive()` | Indique si le multiseat est actif. | 1399 |
| `core_multiseat.isPlatformManagingPlayers()` | Indique si la plateforme (console, Steam...) gère elle-même les joueurs : Input.getPlatformUserCount() non nil (ou mode de débogage). | 120 |
| `core_multiseat.joinPlayer(player)` | Fait rejoindre un joueur actif : lui attribue le premier numéro de persona libre (persona par défaut), renumérote et notifie. Renvoie true s'il est déjà rejoint. | 838 |
| `core_multiseat.leavePlayer(player)` | Retire un joueur rejoint : efface sa persona et libère ses périphériques ou son groupe, puis notifie. | 852 |
| `core_multiseat.onClientEndMission()` | Fin de niveau : réinitialise tout l'état multiseat (voir notes, reset()). *(interne)* *(hook)* | 1403 |
| `core_multiseat.onDeserialized(data)` | Après un rechargement Lua : restaure la configuration à partir de l'instantané. *(interne)* *(hook)* | 1450 |
| `core_multiseat.onExtensionUnloaded()` | Au déchargement : détruit les étiquettes de joueurs et retire les couleurs de périphériques. *(interne)* *(hook)* | 1518 |
| `core_multiseat.onLanguageChanged()` | Hook de changement de langue : resynchronise les joueurs rejoints, invalide les personas (noms traduits) et notifie. *(interne)* *(hook)* | 1511 |
| `core_multiseat.onSerialize(reason)` | Avant un rechargement Lua : détruit étiquettes et couleurs, et renvoie un instantané si le multiseat est actif. *(interne)* *(hook)* | 1435 |
| `core_multiseat.onUpdate(dtReal, dtSim)` | Hook par frame (seulement quand un niveau est chargé) : synchronise les couleurs de périphériques et affiche/met à jour les étiquettes de joueurs (render_playerTags), sauf si le split-screen est chargé. *(interne)* *(hook)* | 1379 |
| `core_multiseat.previewDeviceColors(config)` | Affiche sur les périphériques les couleurs des joueurs d'une configuration encore en cours d'édition (core_devices.setPlayerColors). | 1348 |
| `core_multiseat.resolveConfiguration(config, devices)` | Valide et normalise une configuration proposée par l'interface : renumérote les joueurs à partir de 0 selon l'ordre des numéros de persona et traduit les affectations de périphériques/groupes. | 1033 |
| `core_multiseat.restoreConfiguration(snapshot)` | Restaure un instantané produit par exportConfiguration (protégé par pcall, refusé pendant un applyConfiguration) et notifie. | 1125 |
| `core_multiseat.setMultiseatActive(active)` | Marque le multiseat comme actif (session multiseat en cours). | 1395 |
| `core_multiseat.setPersonaOptInMode(enabled)` | Active ou désactive le mode où les joueurs doivent rejoindre explicitement (au lieu d'obtenir une persona automatiquement). L'activer efface les joueurs rejoints. | 898 |
| `core_multiseat.setPlayerMarkersEnabled(enabled)` | Enregistre le réglage booléen 'multiseatTags'. | 58 |
| `core_multiseat.setPlayerPersona(player, data)` | Définit la persona d'un joueur rejoint (nom, icône, couleur, véhicule) et notifie. | 1282 |

### Détail des paramètres

#### `core_multiseat.applyConfiguration(config)`

Applique une configuration multiseat : active le réglage 'multiseat' et l'action map, installe les affectations, personas et joueurs, avec restauration automatique en cas d'erreur.

- `config` (*table*) : Voir resolveConfiguration ; champs en plus : multiseatActive (défaut true), deferParticipantNotification.
- **renvoie** : boolean true si appliquée.
- **renvoie** : string|nil Raison de l'échec.

#### `core_multiseat.assignDeviceGroup(groupId, player)`

Assigne un groupe de périphériques de la plateforme à un joueur (ou -1 pour le désassigner). Refuse si la plateforme ne gère pas les joueurs, si le groupe n'existe pas ou si le joueur est déjà pris par un autre groupe.

- `groupId` (*integer*) : Identifiant du groupe.
- `player` (*integer*) : Indice de joueur >= 0, ou -1.
- **renvoie** : boolean true si l'affectation a été faite.

#### `core_multiseat.cachePlayerAssignments(config)`

Construit le cache (propriétaires de périphériques/groupes par numéro de persona) à partir d'une configuration et le stocke dans ui_multiseat_assignmentCache.

- `config` (*table*) : Configuration avec participants et affectations.
- **renvoie** : boolean false si config invalide.

#### `core_multiseat.clearJoinedPlayers()`

Retire tous les joueurs rejoints et efface toutes les personas.

- **renvoie** : boolean false s'il n'y en avait aucun.

#### `core_multiseat.clearPlayerPersona(player)`

Remet la persona d'un joueur rejoint à ses valeurs par défaut et notifie.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : boolean false si le joueur n'a pas rejoint.

#### `core_multiseat.cycleDevicePlayer(deviceId)`

Fait passer un périphérique (ou le groupe clavier+souris) au joueur suivant dans le cycle (joueur 0, -1 non assigné, puis joueur précédent...), renumérote les joueurs et met à jour core_input_bindings. Refusé si la plateforme gère les joueurs.

- `deviceId` (*string*) : Id d'un périphérique.
- **renvoie** : boolean true si l'affectation a changé.

#### `core_multiseat.endConfigurationEdit(devices, assignments)`

Termine l'édition, et mémorise éventuellement l'état des périphériques et des affectations fournis.

- `devices` (*table|nil*) : Périphériques à mémoriser.
- `assignments` (*table|nil*) : Affectations à mémoriser.

#### `core_multiseat.exportConfiguration()`

Exporte l'état complet du multiseat (affectations, joueurs rejoints, personas, caches) sous forme de table copiable, utilisée comme instantané pour restauration ou rechargement Lua.

- **renvoie** : table Instantané.

#### `core_multiseat.finalizeConfiguration()`

Termine une application différée : met à jour le cache d'affectations en attente et émet la notification des participants.

- **renvoie** : boolean false s'il n'y avait rien à finaliser.

#### `core_multiseat.getAssignedPlayers(devices, logEnabled, seatPlayers)`

Calcule quel joueur contrôle chaque périphérique, l'applique via assignPlayerToDevice et met à jour l'état interne (joueurs actifs, personas). Pendant une édition de configuration, renvoie des affectations 'sûres' sans les modifier. Appelée par core_input_bindings.

- `devices` (*table*) : nom de périphérique -> { guid, productName, pidvid, playerNumber, platformUserNumber }.
- `logEnabled` (*boolean|nil*) : Écrit dans le log le nombre de joueurs et les affectations.
- `seatPlayers` (*boolean|nil*) : Si vrai, fait monter les joueurs à pied dans le véhicule le moins occupé et fait descendre ceux devenus inactifs.
- **renvoie** : table<string, integer> Périphérique -> indice de joueur (-1 = aucun).

#### `core_multiseat.getAvailableParticipants()`

Participants disponibles pour l'interface : pour chaque joueur actif, { id = 'local-player:N', assignment, inputIcon, joined, persona (réelle si rejoint, sinon aperçu) }.

- **renvoie** : table[] Participants disponibles.

#### `core_multiseat.getCachedPlayerAssignments()`

Renvoie le cache d'affectations mémorisé dans ui_multiseat_assignmentCache.

- **renvoie** : table|nil Cache.

#### `core_multiseat.getDeviceAssignments()`

Liste, pour l'interface, les 'périphériques' (clavier+souris regroupés, manettes) avec leur joueur assigné manuellement : { id, deviceIds, primaryDeviceId, deviceLabel, inputIcon, playerIndex, connected, deviceMetadata }.

- **renvoie** : table[] Éléments décrits ci-dessus, clavier-souris en premier.

#### `core_multiseat.getDeviceAssignmentsFor(devices, assignedPlayers, connectedDevices)`

Version paramétrée de getDeviceAssignments pour des périphériques et affectations fournis.

- `devices` (*table|nil*) : Périphériques.
- `assignedPlayers` (*table<string, integer>|nil*) : Périphérique -> joueur.
- `connectedDevices` (*table|nil*) : Périphériques connectés (nil = tous).
- **renvoie** : table[] Même format que getDeviceAssignments.

#### `core_multiseat.getDeviceGroupForPlayer(player)`

Renvoie le groupe de périphériques assigné à un joueur.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : integer|nil groupId, ou nil.

#### `core_multiseat.getDeviceGroups()`

Groupes de périphériques de la plateforme (un par compte utilisateur), avec le joueur assigné ; inclut les groupes assignés mais déconnectés (connected = false).

- **renvoie** : table[] Éléments { id, groupId, playerIndex, label, devices, connected }.

#### `core_multiseat.getDeviceGroupsFor(devices, groupAssignments)`

Version paramétrée de getDeviceGroups.

- `devices` (*table|nil*) : Périphériques.
- `groupAssignments` (*table<integer, integer>|nil*) : groupId -> joueur.
- **renvoie** : table[] Groupes triés par groupId.

#### `core_multiseat.getJoinedParticipants()`

Participants des joueurs rejoints, triés par indice de joueur.

- **renvoie** : table[] Participants.

#### `core_multiseat.getJoinedPlayers()`

Indices triés des joueurs ayant rejoint (avec persona).

- **renvoie** : integer[] Indices de joueurs.

#### `core_multiseat.getParticipant(player)`

Renvoie le participant d'un joueur.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : table|nil Participant.

#### `core_multiseat.getParticipantRevision()`

Renvoie la révision des participants (compteur interne + révision de core_playerPersonas), pour détecter les changements.

- **renvoie** : integer Révision.

#### `core_multiseat.getParticipants(players)`

Renvoie les participants (persona + affectation). Sans argument et s'il y a des joueurs rejoints, ce sont les joueurs rejoints ; sinon les joueurs actifs (avec persona en aperçu si non rejoints).

- `players` (*integer[]|nil*) : Liste d'indices de joueurs.
- **renvoie** : table[] Participants.

#### `core_multiseat.getPlayerMarkersEnabled()`

Indique si les étiquettes de joueurs sont activées (réglage 'multiseatTags' booléen, défaut true). Convertit en booléen une ancienne valeur chaîne ('never' = faux). Voir les notes sur l'incohérence avec core_multiseatPlayerMarkers.

- **renvoie** : boolean true si activées.

#### `core_multiseat.getPlayers(result)`

Remplit et renvoie la liste ordonnée des indices de joueurs actuellement actifs.

- `result` (*integer[]|nil*) : Table à réutiliser (vidée puis remplie).
- **renvoie** : integer[] Indices de joueurs.

#### `core_multiseat.isApplyingConfiguration()`

Indique si applyConfiguration est en cours.

- **renvoie** : boolean true si en cours.

#### `core_multiseat.isConfigurationEditActive()`

Indique si une édition de configuration est en cours.

- **renvoie** : boolean true si en cours.

#### `core_multiseat.isMultiseatActive()`

Indique si le multiseat est actif.

- **renvoie** : boolean true si actif.

#### `core_multiseat.isPlatformManagingPlayers()`

Indique si la plateforme (console, Steam...) gère elle-même les joueurs : Input.getPlatformUserCount() non nil (ou mode de débogage).

- **renvoie** : boolean true si géré par la plateforme.

#### `core_multiseat.joinPlayer(player)`

Fait rejoindre un joueur actif : lui attribue le premier numéro de persona libre (persona par défaut), renumérote et notifie. Renvoie true s'il est déjà rejoint.

- `player` (*integer*) : Indice de joueur actif.
- **renvoie** : boolean false si le joueur n'est pas actif ou plus de place.

#### `core_multiseat.leavePlayer(player)`

Retire un joueur rejoint : efface sa persona et libère ses périphériques ou son groupe, puis notifie.

- `player` (*integer*) : Indice de joueur.
- **renvoie** : boolean false si le joueur n'avait pas rejoint.

#### `core_multiseat.onDeserialized(data)`

Après un rechargement Lua : restaure la configuration à partir de l'instantané.

- `data` (*table*) : Instantané renvoyé par onSerialize.

#### `core_multiseat.onSerialize(reason)`

Avant un rechargement Lua : détruit étiquettes et couleurs, et renvoie un instantané si le multiseat est actif.

- `reason` (*string|nil*) : Raison de la sérialisation (log).
- **renvoie** : table|nil Instantané, ou nil si le multiseat est inactif.

#### `core_multiseat.onUpdate(dtReal, dtSim)`

Hook par frame (seulement quand un niveau est chargé) : synchronise les couleurs de périphériques et affiche/met à jour les étiquettes de joueurs (render_playerTags), sauf si le split-screen est chargé.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation écoulé (s), non utilisé.

#### `core_multiseat.previewDeviceColors(config)`

Affiche sur les périphériques les couleurs des joueurs d'une configuration encore en cours d'édition (core_devices.setPlayerColors).

- `config` (*table|nil*) : Configuration à prévisualiser ; nil efface les couleurs.

#### `core_multiseat.resolveConfiguration(config, devices)`

Valide et normalise une configuration proposée par l'interface : renumérote les joueurs à partir de 0 selon l'ordre des numéros de persona et traduit les affectations de périphériques/groupes.

- `config` (*table*) : { participants = [{ playerIndex, personaNumber, persona }], manualAssignments, groupAssignments, platformManagesPlayers, personaOptInMode, manualDeviceMetadata, platformDeviceGroups }.
- `devices` (*table|nil*) : Périphériques connus.
- **renvoie** : table|nil Configuration résolue { platformManagesPlayers, personaOptInMode, manualAssignments, groupAssignments, assignments, participants, personas, ... }.
- **renvoie** : string|nil Raison d'échec : 'invalid_configuration', 'invalid_player_count' ou 'invalid_participant'.

#### `core_multiseat.restoreConfiguration(snapshot)`

Restaure un instantané produit par exportConfiguration (protégé par pcall, refusé pendant un applyConfiguration) et notifie.

- `snapshot` (*table*) : Instantané.
- **renvoie** : boolean true si restauré.

#### `core_multiseat.setMultiseatActive(active)`

Marque le multiseat comme actif (session multiseat en cours).

- `active` (*boolean*) : Nouvel état.

#### `core_multiseat.setPersonaOptInMode(enabled)`

Active ou désactive le mode où les joueurs doivent rejoindre explicitement (au lieu d'obtenir une persona automatiquement). L'activer efface les joueurs rejoints.

- `enabled` (*boolean*) : true pour activer.

#### `core_multiseat.setPlayerMarkersEnabled(enabled)`

Enregistre le réglage booléen 'multiseatTags'.

- `enabled` (*boolean*) : true pour activer.

#### `core_multiseat.setPlayerPersona(player, data)`

Définit la persona d'un joueur rejoint (nom, icône, couleur, véhicule) et notifie.

- `player` (*integer*) : Indice de joueur.
- `data` (*table*) : { id, displayName, icon, color, vehicle }
- **renvoie** : boolean false si le joueur n'a pas rejoint ou données invalides.

## Champs

| Champ | Type | Description |
|---|---|---|
| `allowTrafficDebug` | boolean | false. Non utilisé dans ce fichier. |
| `dependencies` | string[] | { 'core_playerPersonas', 'render_playerTags', 'ui_multiseat_assignmentCache' }. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onLocalParticipantsChanged` — écouté par 4 module(s)

**Évènements UI (guihooks.trigger) :** `LocalParticipantsChanged`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `exitVehicle`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/multiseat.lua`.*
