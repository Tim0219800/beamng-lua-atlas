# `telemetry_trackers_memory`

*Fichier : `lua/ge/extensions/telemetry/trackers/memory.lua` · VM : Game Engine (GE) · 155 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_memory` : `extensions.load("telemetry_trackers_memory")`, puis la globale `telemetry_trackers_memory`

Suiveur de télémétrie mémoire : rapporte la mémoire de la machine, celle que tient le jeu, et si l'OS a commencé à paginer sur disque. Il interroge Engine.Platform.getMemoryInfo toutes les 5 s. L'évènement « memoryPressure » n'est envoyé qu'une fois par session, la première fois que peu de mémoire libre et une pagination soutenue sont vues ensemble. « memorySample » n'existe que si le serveur règle sampleIntervalSeconds (enquête ponctuelle).

## Remarques

- Seuils de pression : mémoire disponible <= min(2 Gio, 10 % de la mémoire physique totale) ET lecture+écriture de pagination >= 1 Mio/s.
- Les compteurs de pagination sont ceux de la machine entière et incluent les lectures de fichiers de tout processus : la pagination seule ne prouve rien, d'où la combinaison avec la mémoire libre.
- sampleIntervalSeconds (config du module « memory ») est borné entre 5 et 3600 s ; sans lui, l'interrogation s'arrête dès que plus rien ne peut être rapporté (pression déjà envoyée, ou pagination non supportée), le suiveur retire alors son hook onUpdate (M.onUpdate = nil puis extensions.hookUpdate).
- Si le système ne fournit pas de compteurs de pagination, la pression mémoire ne peut pas être détectée (message de log niveau D).
- Les évènements contiennent notamment physicalTotalBytes, physicalAvailableBytes, gamePhysicalUsedBytes, une estimation de la mémoire utilisée hors jeu, la mémoire virtuelle, les débits de pagination, le niveau et le drapeau paused (simulation en pause).

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_memory.onExtensionLoaded()` | Hook appelé au chargement : réinitialise l'état, lit sampleIntervalSeconds de la config, enregistre le hook onUpdate et passe en déchargement manuel. *(interne)* *(hook)* | 129 |
| `telemetry_trackers_memory.onUpdate(dtReal, dtSim)` | Hook appelé à chaque image : cumule le temps réel et déclenche une lecture toutes les 5 s. Retiré dynamiquement quand le suiveur a terminé. *(interne)* *(hook)* | 118 |

### Détail des paramètres

#### `telemetry_trackers_memory.onUpdate(dtReal, dtSim)`

Hook appelé à chaque image : cumule le temps réel et déclenche une lecture toutes les 5 s. Retiré dynamiquement quand le suiveur a terminé.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s) ; <= 0 indique la pause.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/memory.lua`.*
