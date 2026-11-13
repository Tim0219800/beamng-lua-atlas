# `core_activity`

*Fichier : `lua/ge/extensions/core/activity.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_activity` : `extensions.load("core_activity")`, puis la globale `core_activity`

Extension GE (core_activity) minuscule : démarre une 'activité' nommée. Aujourd'hui la seule activité connue est 'ContinueFreeroam', qui lance extensions.freeroam_continueFreeroam.start() puis signale l'écran de chargement (core_gamestate.loadingScreenActive()). Un moddeur peut l'appeler depuis l'UI ou un script.

## Exemple

```lua
core_activity.startActivity('ContinueFreeroam')
```

## Remarques

- Un nom d'activité inconnu est seulement loggué (niveau I) : aucune erreur n'est levée.
- Le commentaire du code indique que l'appel à core_gamestate.loadingScreenActive() est à retirer quand l'UI sera ajoutée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_activity.startActivity(name)` | Lance l'activité portant ce nom si elle existe dans la table interne, sinon loggue 'Unknown activity'. | 16 |

### Détail des paramètres

#### `core_activity.startActivity(name)`

Lance l'activité portant ce nom si elle existe dans la table interne, sinon loggue 'Unknown activity'.

- `name` (*string*) : Nom d'activité, actuellement 'ContinueFreeroam'

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/activity.lua`.*
