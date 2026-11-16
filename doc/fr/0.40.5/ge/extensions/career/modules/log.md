# `career_modules_log`

*Fichier : `lua/ge/extensions/career/modules/log.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_log` : `extensions.load("career_modules_log")`, puis la globale `career_modules_log`

Petit journal texte de la carrière. Les modules appellent addLog pour accumuler des lignes en mémoire ; à chaque sauvegarde du profil, les lignes sont ajoutées (mode append) au fichier career.log du slot de sauvegarde, puis la liste est vidée.

## Remarques

- Format d'une ligne : timestamp os.time()|sévérité|origine|message. Sévérité par défaut "I", origine par défaut chaîne vide.
- La liste en mémoire est vidée à l'activation de la carrière (onCareerActive) : les lignes non sauvegardées avant sont perdues.

**Dépendances (chargées avant) :** `career_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_log.addLog(message, origin, severity)` | Ajoute une ligne au journal en mémoire (écrite dans career.log à la prochaine sauvegarde). | 11 |
| `career_modules_log.onCareerActive(active)` | Hook appelé quand la carrière devient active : vide la liste et ajoute « Loaded game <chemin> ». *(interne)* *(hook)* | 30 |
| `career_modules_log.onSaveCurrentProfile(currentSavePath)` | Hook appelé lors de la sauvegarde du profil : ajoute une ligne « Save game to ... » puis écrit (append) toutes les lignes dans <saveRoot>/<slot>/career.log et vide la liste. *(interne)* *(hook)* | 15 |

### Détail des paramètres

#### `career_modules_log.addLog(message, origin, severity)`

Ajoute une ligne au journal en mémoire (écrite dans career.log à la prochaine sauvegarde).

- `message` (*string*) : Texte du message.
- `origin` (*string|nil*) : Nom du module émetteur ("" par défaut).
- `severity` (*string|nil*) : Sévérité, "I" par défaut (la valeur n'est pas validée).

#### `career_modules_log.onCareerActive(active)`

Hook appelé quand la carrière devient active : vide la liste et ajoute « Loaded game <chemin> ».

- `active` (*boolean*) : true à l'activation ; rien n'est fait si false.

#### `career_modules_log.onSaveCurrentProfile(currentSavePath)`

Hook appelé lors de la sauvegarde du profil : ajoute une ligne « Save game to ... » puis écrit (append) toutes les lignes dans <saveRoot>/<slot>/career.log et vide la liste.

- `currentSavePath` (*string*) : Chemin de la sauvegarde en cours.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_saveSystem. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/log.lua`.*
