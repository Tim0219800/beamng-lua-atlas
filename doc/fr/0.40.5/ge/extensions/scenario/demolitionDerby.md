# `scenario_demolitionDerby`

*Fichier : `lua/ge/extensions/scenario/demolitionDerby.lua` · VM : Game Engine (GE) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_demolitionDerby` : `extensions.load("scenario_demolitionDerby")`, puis la globale `scenario_demolitionDerby`

Extension de scénario de type démolition : elle déclare vainqueur le dernier véhicule encore en mouvement. Chaque seconde, elle compare la position de chaque véhicule du scénario à sa dernière position connue ; un véhicule qui bouge de 1 m ou moins pendant plus de 15 secondes est considéré à l'arrêt.

## Remarques

- Il faut qu'un seul véhicule soit en mouvement et que tous les autres aient dépassé 15 ticks d'arrêt pour que scenario_scenarios.finish soit appelé avec le message '<nom> WINS!!!' (texte codé en dur, non traduit).
- Le test de mouvement se fait environ une fois par seconde (accumulation de dt dans onPreRender), distance seuil 1 m.
- L'extension ne fait rien si le scénario n'est pas à l'état 'running'. La liste des véhicules est reconstruite à chaque onScenarioChange quand scenario.state == 'running'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_demolitionDerby.onPreRender(dt)` | Hook appelé avant le rendu de chaque image. Toutes les secondes, détecte les véhicules immobiles et termine le scénario s'il ne reste qu'un véhicule en mouvement. *(interne)* *(hook)* | 40 |
| `scenario_demolitionDerby.onScenarioChange(sc)` | Hook appelé par scenario_scenarios à chaque changement d'état du scénario. Quand le scénario passe en 'running', réinitialise le suivi et enregistre chaque véhicule de scenario.vehicles trouvé dans le scenetree. Sans scénario, remet tout à zéro. *(interne)* *(hook)* | 21 |

### Détail des paramètres

#### `scenario_demolitionDerby.onPreRender(dt)`

Hook appelé avant le rendu de chaque image. Toutes les secondes, détecte les véhicules immobiles et termine le scénario s'il ne reste qu'un véhicule en mouvement.

- `dt` (*number*) : Durée de l'image en secondes.

#### `scenario_demolitionDerby.onScenarioChange(sc)`

Hook appelé par scenario_scenarios à chaque changement d'état du scénario. Quand le scénario passe en 'running', réinitialise le suivi et enregistre chaque véhicule de scenario.vehicles trouvé dans le scenetree. Sans scénario, remet tout à zéro.

- `sc` (*any*) : Argument transmis par le hook, non utilisé (le scénario est relu via scenario_scenarios.getScenario()).

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/demolitionDerby.lua`.*
