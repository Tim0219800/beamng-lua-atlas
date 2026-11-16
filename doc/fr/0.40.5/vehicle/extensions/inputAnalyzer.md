# `inputAnalyzer`

*Fichier : `lua/vehicle/extensions/inputAnalyzer.lua` · VM : Véhicule · 147 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `inputAnalyzer` : `extensions.load (VM véhicule)("inputAnalyzer")`, puis la globale `inputAnalyzer`

Détecteur de 'codes' à la manette/clavier : à 30 Hz il observe les entrées (accélérateur, frein, direction gauche/droite, embrayage, frein à main), construit une chaîne des 16 dernières pressions et appelle un callback quand la fin de la chaîne correspond à une séquence enregistrée (8 à 16 caractères). Sert à des easter eggs.

## Exemple

```lua
-- lettres : u accélérateur, d frein, l gauche, r droite, a embrayage, b frein à main
extensions.inputAnalyzer.registerInputString('uuddlrlrab', function(s) print('code !') end)
```

## Remarques

- Chaque nouvelle pression (passage de faux à vrai au-dessus de 0,01) ajoute sa lettre à la chaîne. La chaîne est tronquée d'un caractère quand elle dépasse 16.
- Les entrées lues sont electrics.values.throttle_input, brake_input, steering_input (l = partie négative, r = partie positive), clutch_input et parkingbrake_input.
- registerInputString ignore les chaînes de moins de 8 ou de plus de 16 caractères.
- Anomalie : le test de doublon dans registerInputString compare `v.string == string` (la bibliothèque string) au lieu de `str` : il n'est jamais vrai, un même code peut donc être enregistré plusieurs fois.
- Anomalie : le paramètre de unregisterInputString s'appelle `string` et masque la bibliothèque string (sans conséquence ici).
- Si une des clés electrics lues est nil, abs(nil) lève une erreur ; elles sont normalement initialisées par les entrées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `inputAnalyzer.onInit()` | Hook d'initialisation ; vide. *(interne)* *(hook)* | 136 |
| `inputAnalyzer.onReset()` | Hook de reset ; vide. *(interne)* *(hook)* | 133 |
| `inputAnalyzer.registerInputString(str, callback)` | Enregistre une séquence à détecter et le callback appelé avec la chaîne courante quand elle est saisie. | 91 |
| `inputAnalyzer.unregisterInputString(string, callback)` | Retire une séquence enregistrée (même chaîne et même callback) ; active/désactive updateGFX selon qu'il reste des séquences. | 115 |
| `inputAnalyzer.updateGFX(dt)` | Appelé chaque frame : exécute l'analyse des entrées à 30 Hz (nop quand aucun code n'est enregistré après un (un)register). *(interne)* | 83 |

### Détail des paramètres

#### `inputAnalyzer.registerInputString(str, callback)`

Enregistre une séquence à détecter et le callback appelé avec la chaîne courante quand elle est saisie.

- `str` (*string*) : Séquence de 8 à 16 lettres parmi u, d, l, r, a, b.
- `callback` (*function*) : function(inputString).

#### `inputAnalyzer.unregisterInputString(string, callback)`

Retire une séquence enregistrée (même chaîne et même callback) ; active/désactive updateGFX selon qu'il reste des séquences.

- `string` (*string*) : Séquence enregistrée.
- `callback` (*function*) : Callback enregistré.

#### `inputAnalyzer.updateGFX(dt)`

Appelé chaque frame : exécute l'analyse des entrées à 30 Hz (nop quand aucun code n'est enregistré après un (un)register).

- `dt` (*number*) : Pas de temps en secondes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/inputAnalyzer.lua`.*
