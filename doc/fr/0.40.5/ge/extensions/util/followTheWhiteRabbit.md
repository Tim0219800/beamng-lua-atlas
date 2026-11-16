# `util_followTheWhiteRabbit`

*Fichier : `lua/ge/extensions/util/followTheWhiteRabbit.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_followTheWhiteRabbit` : `extensions.load("util_followTheWhiteRabbit")`, puis la globale `util_followTheWhiteRabbit`

Petit easter egg (référence à Matrix) : une fois chargée, l'extension crée un contexte de console « neo », l'active et affiche un mini jeu d'aventure textuel. Dans ce contexte, la commande « throttle » répond « You crash. Game over. » ; les autres commandes sont ignorées.

## Exemple

```lua
extensions.load('util_followTheWhiteRabbit')
```

## Remarques

- Le contexte de console reste sur 'neo' après le chargement ; il n'y a pas de code de sortie dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_followTheWhiteRabbit.onConsoleExecuteCommand(context, cmd)` | Hook appelé quand une commande est exécutée dans la console. Ignore tout contexte autre que 'neo' ; pour la commande 'throttle', affiche « You crash. Game over. ». *(interne)* *(hook)* | 18 |
| `util_followTheWhiteRabbit.onExtensionLoaded()` | Appelé au chargement de l'extension : désactive l'horodatage des logs de la console, ajoute et active le contexte 'neo' puis affiche le texte d'introduction. *(interne)* *(hook)* | 9 |

### Détail des paramètres

#### `util_followTheWhiteRabbit.onConsoleExecuteCommand(context, cmd)`

Hook appelé quand une commande est exécutée dans la console. Ignore tout contexte autre que 'neo' ; pour la commande 'throttle', affiche « You crash. Game over. ».

- `context` (*string*) : Contexte de console actif
- `cmd` (*string*) : Commande saisie

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/followTheWhiteRabbit.lua`.*
