# `gameplay_pursuit_proceduralMode`

*Fichier : `lua/ge/extensions/gameplay/pursuit/proceduralMode.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_pursuit_proceduralMode` : `extensions.load("gameplay_pursuit_proceduralMode")`, puis la globale `gameplay_pursuit_proceduralMode`

Squelette vide prévu pour les scénarios de poursuite générés procéduralement et les évènements aléatoires. Le commentaire du code indique qu'il faudra y déplacer la logique de suspect aléatoire du trafic. Aucune logique n'est implémentée.

## Remarques

- Les trois hooks sont des fonctions vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_pursuit_proceduralMode.onDeserialized()` | Hook après rechargement Lua ; ne fait rien. *(interne)* *(hook)* | 20 |
| `gameplay_pursuit_proceduralMode.onSerialize()` | Hook de sérialisation avant rechargement Lua ; ne fait rien. *(interne)* *(hook)* | 17 |
| `gameplay_pursuit_proceduralMode.onUpdate(dt, dtSim)` | Hook appelé à chaque image ; ne fait rien. *(interne)* *(hook)* | 14 |

### Détail des paramètres

#### `gameplay_pursuit_proceduralMode.onUpdate(dt, dtSim)`

Hook appelé à chaque image ; ne fait rien.

- `dt` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/pursuit/proceduralMode.lua`.*
