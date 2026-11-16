# `career_modules_unlockFlags`

*Fichier : `lua/ge/extensions/career/modules/unlockFlags.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_unlockFlags` : `extensions.load("career_modules_unlockFlags")`, puis la globale `career_modules_unlockFlags`

Drapeaux de déblocage de la carrière. Les définitions viennent des autres extensions via le hook onGetUnlockFlagDefinitions (chacune ajoute {unlockedFunction, icon, level, label} dans la table reçue) ; la valeur d'un drapeau est calculée à la demande avec unlockedFunction puis mise en cache, ou forcée avec setFlag.

## Remarques

- Les définitions sont rechargées et le cache vidé à chaque onCareerActivated.
- getFlag ne met pas en cache la valeur false (la condition `not flagCache[flagName]` est vraie) : unlockedFunction est donc ré-évaluée à chaque appel tant que le drapeau est faux. Une définition manquante donne false.
- setFlag émet le hook onUnlockFlagChanged(flagName, value).
- onSaveCurrentProfile est vide (rien n'est sauvegardé par ce module).
- getFlagLockedReason existe dans le code mais n'est pas exporté.

**Dépendances (chargées avant) :** `career_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_unlockFlags.getFlag(flagName)` | Retourne la valeur d'un drapeau (en l'évaluant via sa définition si besoin). false si le drapeau n'a pas de définition. | 29 |
| `career_modules_unlockFlags.getFlagDefinition(flagName)` | Retourne la définition enregistrée d'un drapeau. | 38 |
| `career_modules_unlockFlags.onCareerActivated()` | Hook appelé à l'activation de la carrière : vide le cache et recharge les définitions via le hook onGetUnlockFlagDefinitions. *(interne)* *(hook)* | 59 |
| `career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde du profil ; ne fait rien dans cette version. *(interne)* *(hook)* | 23 |
| `career_modules_unlockFlags.resetFlags()` | Vide le cache des valeurs de drapeaux (les définitions restent). | 55 |
| `career_modules_unlockFlags.setFlag(flagName, value)` | Force la valeur d'un drapeau dans le cache et émet onUnlockFlagChanged. | 49 |

### Détail des paramètres

#### `career_modules_unlockFlags.getFlag(flagName)`

Retourne la valeur d'un drapeau (en l'évaluant via sa définition si besoin). false si le drapeau n'a pas de définition.

- `flagName` (*string*) : Nom du drapeau.
- **renvoie** : boolean Valeur du drapeau.

#### `career_modules_unlockFlags.getFlagDefinition(flagName)`

Retourne la définition enregistrée d'un drapeau.

- `flagName` (*string*) : Nom du drapeau.
- **renvoie** : table|nil Définition {unlockedFunction, icon, level, label} ou nil.

#### `career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde du profil ; ne fait rien dans cette version.

- `currentSavePath` (*string*) : Dossier de sauvegarde du profil.

#### `career_modules_unlockFlags.setFlag(flagName, value)`

Force la valeur d'un drapeau dans le cache et émet onUnlockFlagChanged.

- `flagName` (*string*) : Nom du drapeau.
- `value` (*boolean*) : Nouvelle valeur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_saveSystem"}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetUnlockFlagDefinitions` — écouté par 1 module(s)
- `onUnlockFlagChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/unlockFlags.lua`.*
