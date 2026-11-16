# `telemetry_userIdentity`

*Fichier : `lua/ge/extensions/telemetry/userIdentity.lua` · VM : Game Engine (GE) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_userIdentity` : `extensions.load("telemetry_userIdentity")`, puis la globale `telemetry_userIdentity`

Gère l'identifiant anonyme de l'utilisateur utilisé par la télémétrie. Un « sel » aléatoire est créé une fois et stocké dans `/telemetry/salt.txt` ; l'identifiant est le hash SHA-256 de ce fichier. Un ancien fichier `/gameTelemetries/.salt` est migré automatiquement pour conserver le même identifiant.

## Exemple

```lua
local id = telemetry_userIdentity.getAnonymousUserID()
```

## Remarques

- Le fichier de sel contient une bannière explicative (lien vers la politique de confidentialité) suivie de 6 lignes de 80 caractères hexadécimaux aléatoires (`SecureComm.getRandomBytesHexSlow(40)`).
- Le hash porte sur tout le contenu du fichier lu, bannière comprise ; lors d'une migration, l'ancien contenu est recopié tel quel, sans bannière, pour ne pas changer l'identifiant.
- Chaque appel de getAnonymousUserID relit le fichier et recalcule le hash (pas de cache).
- L'extension se met en déchargement manuel au chargement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_userIdentity.getAnonymousUserID()` | Renvoie l'identifiant anonyme : le hash SHA-256 (`hashStringSHA256`) du sel. Crée ou migre le fichier de sel si nécessaire (dossier `telemetry` créé au besoin). | 94 |
| `telemetry_userIdentity.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel pour éviter son déchargement automatique. *(interne)* *(hook)* | 101 |

### Détail des paramètres

#### `telemetry_userIdentity.getAnonymousUserID()`

Renvoie l'identifiant anonyme : le hash SHA-256 (`hashStringSHA256`) du sel. Crée ou migre le fichier de sel si nécessaire (dossier `telemetry` créé au besoin).

- **renvoie** : string Hash SHA-256 du contenu du fichier de sel.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/userIdentity.lua`.*
