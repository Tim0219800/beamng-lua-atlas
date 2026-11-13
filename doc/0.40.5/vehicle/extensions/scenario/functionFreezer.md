# `scenario_functionFreezer`

*Fichier : `lua/vehicle/extensions/scenario/functionFreezer.lua` · VM : Véhicule · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_functionFreezer` : `extensions.load (VM véhicule)("scenario_functionFreezer")`, puis la globale `scenario_functionFreezer`

Permet à un créateur de scénario d'empêcher l'exécution de certaines fonctions Lua du véhicule tant que le scénario n'a pas démarré (écran d'intro, caméra d'intro), par exemple pour qu'un canon ne tire pas pendant la lecture. À son chargement l'extension enveloppe controller.setFreeze : quand le jeu appelle setFreeze(1) les fonctions listées sont remplacées par `nop`, et setFreeze(autre valeur) les restaure. La liste vient du hook onVehicleScenarioData (tableau de chaînes comme "hydro_input.liftUp").

## Exemple

```lua
-- dans le .json du scénario, extension functionFreezer :
-- ["hydro_input.liftUp", "controller.shiftDown"]
```

## Remarques

- Les noms sont évalués avec loadstring ("return nom"), donc ce sont des chemins globaux Lua. Une entrée inexistante ou qui n'est pas une fonction est refusée avec un log d'erreur.
- La sauvegarde de la fonction originale est stockée dans une globale nommée `<nom>_freeze_backup`. Geler deux fois est ignoré (log D), dégeler une fonction jamais gelée donne un log E.
- Seule la valeur 1 gèle ; toute autre valeur (0 ou autre) dégèle.
- Le remplacement ne touche que la globale/table nommée : les références locales déjà capturées par d'autres modules (local f = module.func) ne sont pas affectées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_functionFreezer.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Sauvegarde controller.setFreeze et le remplace par une fonction qui appelle l'original (s'il existe) puis applique le gel/dégel des fonctions listées. *(interne)* *(hook)* | 38 |
| `scenario_functionFreezer.onExtensionUnloaded()` | Hook appelé au déchargement. Dégèle toutes les fonctions (setFreeze(0) interne) puis restaure controller.setFreeze d'origine. *(interne)* *(hook)* | 51 |
| `scenario_functionFreezer.onVehicleScenarioData(data)` | Hook appelé avec la configuration du scénario. Dégèle d'abord tout, vide la liste, puis valide chaque nom de fonction du tableau et l'ajoute à la liste à geler (ne gèle pas immédiatement : le gel se fait au prochain controller.setFreeze(1)). *(interne)* *(hook)* | 57 |

### Détail des paramètres

#### `scenario_functionFreezer.onVehicleScenarioData(data)`

Hook appelé avec la configuration du scénario. Dégèle d'abord tout, vide la liste, puis valide chaque nom de fonction du tableau et l'ajoute à la liste à geler (ne gèle pas immédiatement : le gel se fait au prochain controller.setFreeze(1)).

- `data` (*string[]*) : Tableau de chemins de fonctions globales sous forme de chaînes (ex. "controller.shiftDown").

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/scenario/functionFreezer.lua`.*
