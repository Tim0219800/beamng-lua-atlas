# `career_modules_playbookWriter`

*Fichier : `lua/ge/extensions/career/modules/playbookWriter.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_playbookWriter` : `extensions.load("career_modules_playbookWriter")`, puis la globale `career_modules_playbookWriter`

Enregistre l'historique des missions jouées (missionId et étoiles) dans playbook.json du dossier career de la sauvegarde. Chargé seulement quand la carrière est active.

## Remarques

- Le fichier est ignoré (liste vide) si info.json de la sauvegarde a une version < moduleVersion (42).
- La liste n'est jamais lue par ce module : il ne fait qu'ajouter et sauvegarder.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_playbookWriter.addMissionPlayedEntry(missionId, stars)` | Ajoute {missionId, stars} à la fin du playbook en mémoire. | 14 |
| `career_modules_playbookWriter.onCareerActive(active)` | Hook : recharge le playbook quand la carrière devient active. *(interne)* *(hook)* | 37 |
| `career_modules_playbookWriter.onExtensionLoaded()` | Hook au chargement de l'extension : charge le playbook si la carrière est active (renvoie false sinon). *(interne)* *(hook)* | 32 |
| `career_modules_playbookWriter.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit le playbook dans <save>/career/playbook.json. *(interne)* *(hook)* | 43 |

### Détail des paramètres

#### `career_modules_playbookWriter.addMissionPlayedEntry(missionId, stars)`

Ajoute {missionId, stars} à la fin du playbook en mémoire.

- `missionId` (*string*) : Identifiant de la mission.
- `stars` (*any*) : Résultat en étoiles (déduit du code).

#### `career_modules_playbookWriter.onCareerActive(active)`

Hook : recharge le playbook quand la carrière devient active.

- `active` (*boolean*) : Rien si false.

#### `career_modules_playbookWriter.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit le playbook dans <save>/career/playbook.json.

- `currentSavePath` (*string*) : Dossier de sauvegarde.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/playbookWriter.lua`.*
