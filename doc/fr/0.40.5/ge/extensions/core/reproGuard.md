# `core_reproGuard`

*Fichier : `lua/ge/extensions/core/reproGuard.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_reproGuard` : `extensions.load("core_reproGuard")`, puis la globale `core_reproGuard`

Garde de sécurité pour la commande de schéma v1/runRepro : décide si une ligne de commande décodée peut être transmise à run_repro.bat, d'après une liste blanche de motifs glob. La logique pure (isAllowed) est séparée de la lecture du fichier de liste blanche (loadPatterns).

## Exemple

```lua
local ok, reason = core_reproGuard.isCommandAllowed(cmd)
```

## Remarques

- La liste blanche est lue dans /DevTools/tests/micropy/resources/repro_allowlist.json, champ permissions.allow (tableau de motifs). Si le fichier est absent ou invalide, la liste est vide donc tout est refusé (fail closed).
- Les caractères < > ^ ` " et les caractères de contrôle (dont CR/LF) sont interdits partout dans la commande.
- La commande est découpée sur && || ; | & ; chaque segment doit correspondre à au moins un motif. Dans un motif, '*' remplace n'importe quelle suite de caractères ; les autres caractères sont littéraux.
- Seuls les espaces de début de segment sont retirés ; l'espace final reste dans le segment.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_reproGuard.isAllowed(command, patterns)` | Fonction pure : teste si command satisfait la liste de motifs. Refuse une commande vide, avec caractère interdit, une liste vide, ou dont un segment ne correspond à aucun motif. | 64 |
| `core_reproGuard.isCommandAllowed(command)` | Raccourci : charge les motifs depuis le disque puis appelle isAllowed. | 106 |
| `core_reproGuard.loadPatterns()` | Lit les motifs autorisés depuis le fichier JSON de liste blanche. Journalise une erreur et renvoie {} si le fichier est absent ou mal formé. | 95 |

### Détail des paramètres

#### `core_reproGuard.isAllowed(command, patterns)`

Fonction pure : teste si command satisfait la liste de motifs. Refuse une commande vide, avec caractère interdit, une liste vide, ou dont un segment ne correspond à aucun motif.

- `command` (*string*) : Ligne de commande décodée.
- `patterns` (*string[]*) : Motifs glob autorisés.
- **renvoie** : boolean true si autorisée.
- **renvoie** : string 'ok' ou la raison du refus (empty command, forbidden shell metacharacter, empty allowlist, no command segments, segment not allowed: ...).

#### `core_reproGuard.isCommandAllowed(command)`

Raccourci : charge les motifs depuis le disque puis appelle isAllowed.

- `command` (*string*) : Ligne de commande.
- **renvoie** : boolean true si autorisée.
- **renvoie** : string Raison.

#### `core_reproGuard.loadPatterns()`

Lit les motifs autorisés depuis le fichier JSON de liste blanche. Journalise une erreur et renvoie {} si le fichier est absent ou mal formé.

- **renvoie** : string[] Motifs permissions.allow, ou {}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/reproGuard.lua`.*
