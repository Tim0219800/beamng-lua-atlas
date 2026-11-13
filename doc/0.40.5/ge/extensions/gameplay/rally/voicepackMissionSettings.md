# `gameplay_rally_voicepackMissionSettings`

*Fichier : `lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_voicepackMissionSettings` : `extensions.load("gameplay_rally_voicepackMissionSettings")`, puis la globale `gameplay_rally_voicepackMissionSettings`

Fine couche autour de gameplay/rally/voicepack pour les réglages utilisateur d'une mission de rallye : construit le réglage « pack de voix » d'une étape ou d'une boucle, et mémorise le choix de l'utilisateur dans la liste des packs récemment utilisés (MRU). Le choix est stocké dans les réglages utilisateur sous la clé `rallyVoicepackPick`. Toute la logique est déléguée à voicepack.lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_voicepackMissionSettings.buildLoopSetting(missionTypeData)` | Construit le réglage utilisateur « pack de voix » pour une mission de type boucle (délègue à voicepack.buildLoopMissionUserSetting). | 19 |
| `gameplay_rally_voicepackMissionSettings.buildStageSetting(missionDir, missionId)` | Construit le réglage utilisateur « pack de voix » pour une étape (délègue à voicepack.buildMissionUserSetting). | 15 |
| `gameplay_rally_voicepackMissionSettings.rememberLoopPick(missionTypeData, userSettings)` | Ajoute le choix de pack (userSettings.rallyVoicepackPick) au MRU des missions boucle via voicepack.addLoopMissionSettingToMRU. | 29 |
| `gameplay_rally_voicepackMissionSettings.rememberStagePick(userSettings, missionDir, missionId)` | Lit le choix de pack dans userSettings.rallyVoicepackPick et l'ajoute au MRU de la mission. Ne fait rien si aucun choix n'est valide ou si le choix est de type 'preferences'. | 23 |

### Détail des paramètres

#### `gameplay_rally_voicepackMissionSettings.buildLoopSetting(missionTypeData)`

Construit le réglage utilisateur « pack de voix » pour une mission de type boucle (délègue à voicepack.buildLoopMissionUserSetting).

- `missionTypeData` (*table*) : Données du type de mission boucle.
- **renvoie** : table Définition du réglage utilisateur.

#### `gameplay_rally_voicepackMissionSettings.buildStageSetting(missionDir, missionId)`

Construit le réglage utilisateur « pack de voix » pour une étape (délègue à voicepack.buildMissionUserSetting).

- `missionDir` (*string*) : Dossier de la mission.
- `missionId` (*string*) : Identifiant de la mission.
- **renvoie** : table Définition du réglage utilisateur (telle que renvoyée par voicepack).

#### `gameplay_rally_voicepackMissionSettings.rememberLoopPick(missionTypeData, userSettings)`

Ajoute le choix de pack (userSettings.rallyVoicepackPick) au MRU des missions boucle via voicepack.addLoopMissionSettingToMRU.

- `missionTypeData` (*table*) : Données du type de mission boucle.
- `userSettings` (*table|nil*) : Réglages utilisateur.

#### `gameplay_rally_voicepackMissionSettings.rememberStagePick(userSettings, missionDir, missionId)`

Lit le choix de pack dans userSettings.rallyVoicepackPick et l'ajoute au MRU de la mission. Ne fait rien si aucun choix n'est valide ou si le choix est de type 'preferences'.

- `userSettings` (*table|nil*) : Réglages utilisateur de la mission.
- `missionDir` (*string*) : Dossier de la mission.
- `missionId` (*string*) : Identifiant de la mission.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua`.*
