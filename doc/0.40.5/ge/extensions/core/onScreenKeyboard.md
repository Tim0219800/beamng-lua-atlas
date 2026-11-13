# `core_onScreenKeyboard`

*Fichier : `lua/ge/extensions/core/onScreenKeyboard.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_onScreenKeyboard` : `extensions.load("core_onScreenKeyboard")`, puis la globale `core_onScreenKeyboard`

Extension GE `core_onScreenKeyboard` : façade vers les claviers virtuels de la plateforme (Steam Deck, console...). Elle ouvre le clavier avec un titre, un texte initial, une longueur maximale et un type d'entrée, et relaie à l'interface le résultat via guihooks 'onScreenKeyboardClosed'.

## Exemple

```lua
if core_onScreenKeyboard.isOnScreenKeyboardAvailable() then
  core_onScreenKeyboard.openOnScreenKeyboard('Nom', 'Votre nom', '', 32)
end
```

## Remarques

- Deux types de claviers selon la plateforme (commentaire du code) : (1) 'fire and forget' qui envoie les touches directement au jeu (Steam Deck) ; (2) qui ne les envoie pas mais renvoie le texte complet une fois via onScreenKeyboardClosed quand l'utilisateur valide (PS5).
- openOnScreenKeyboard et isOnScreenKeyboardAvailable sont des fonctions globales fournies par le moteur ; sans elles, l'ouverture est ignorée et isOnScreenKeyboardAvailable (la version Lua) lèvera une erreur car elle l'appelle sans vérifier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_onScreenKeyboard.isOnScreenKeyboardAvailable()` | Indique si la plateforme propose un clavier virtuel (appelle la fonction globale du moteur de même nom). | 24 |
| `core_onScreenKeyboard.onScreenKeyboardClosed(applied, text)` | Hook appelé par le moteur quand le clavier virtuel se ferme : transmet à l'interface (guihooks 'onScreenKeyboardClosed', applied, text). *(interne)* *(hook)* | 20 |
| `core_onScreenKeyboard.openOnScreenKeyboard(title, placeholder, initialText, maxLength, inputType, textBoxLeft, textBoxTop, textBoxWidth, textBoxHeight)` | Ouvre le clavier virtuel de la plateforme (si la fonction globale du moteur existe). Une maxLength non numérique ou <= 0 devient 1000 ; placeholder et initialText valent '' par défaut, inputType 'string'. | 11 |

### Détail des paramètres

#### `core_onScreenKeyboard.isOnScreenKeyboardAvailable()`

Indique si la plateforme propose un clavier virtuel (appelle la fonction globale du moteur de même nom).

- **renvoie** : boolean true si disponible.

#### `core_onScreenKeyboard.onScreenKeyboardClosed(applied, text)`

Hook appelé par le moteur quand le clavier virtuel se ferme : transmet à l'interface (guihooks 'onScreenKeyboardClosed', applied, text).

- `applied` (*boolean*) : true si l'utilisateur a validé.
- `text` (*string*) : Texte saisi.

#### `core_onScreenKeyboard.openOnScreenKeyboard(title, placeholder, initialText, maxLength, inputType, textBoxLeft, textBoxTop, textBoxWidth, textBoxHeight)`

Ouvre le clavier virtuel de la plateforme (si la fonction globale du moteur existe). Une maxLength non numérique ou <= 0 devient 1000 ; placeholder et initialText valent '' par défaut, inputType 'string'.

- `title` (*string*) : Titre du clavier.
- `placeholder` (*string|nil*) : Texte d'indication.
- `initialText` (*string|nil*) : Texte initial.
- `maxLength` (*integer|nil*) : Longueur maximale (1000 par défaut).
- `inputType` (*string|nil*) : Type d'entrée ('string' par défaut).
- `textBoxLeft` (*number|nil*) : Position gauche de la zone de texte à l'écran, pour que le clavier ne la masque pas (déduit du code).
- `textBoxTop` (*number|nil*) : Position haute de la zone de texte.
- `textBoxWidth` (*number|nil*) : Largeur de la zone de texte.
- `textBoxHeight` (*number|nil*) : Hauteur de la zone de texte.

**Évènements UI (guihooks.trigger) :** `onScreenKeyboardClosed`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/onScreenKeyboard.lua`.*
