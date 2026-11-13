# `util_booster`

*Fichier : `lua/ge/extensions/util/booster.lua` · VM : Game Engine (GE) · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_booster` : `extensions.load("util_booster")`, puis la globale `util_booster`

Extension minuscule de démonstration pour un déclencheur « booster » : trigger(data) affiche les données reçues, puis devrait propulser un véhicule vers le haut via core_booster côté véhicule. Dans l'état du code, la propulsion ne se déclenche jamais.

## Remarques

- Bug : trigger teste la variable globale `event` (nil) au lieu de `data.event`, donc la condition `event == 'enter'` est toujours fausse et le véhicule n'est jamais propulsé ; seuls print et dump sont exécutés.
- Si la condition était vraie, elle enverrait au véhicule data.subjectID la commande extensions.core_booster.boost(vec3(0,0,1), 0.01).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_booster.trigger(data)` | Affiche « Booster triggered » et le contenu de data. Prévu pour réagir à un évènement de trigger (data.subjectID est l'id du véhicule), mais ne fait rien d'autre à cause du bug signalé. | 7 |

### Détail des paramètres

#### `util_booster.trigger(data)`

Affiche « Booster triggered » et le contenu de data. Prévu pour réagir à un évènement de trigger (data.subjectID est l'id du véhicule), mais ne fait rien d'autre à cause du bug signalé.

- `data` (*table*) : Données de l'évènement de trigger (subjectID attendu).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/booster.lua`.*
