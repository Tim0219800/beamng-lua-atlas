# `gameplay_drift_freeroam_cruising`

*Fichier : `lua/ge/extensions/gameplay/drift/freeroam/cruising.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_freeroam_cruising` : `extensions.load("gameplay_drift_freeroam_cruising")`, puis la globale `gameplay_drift_freeroam_cruising`

Détecte en roaming libre le passage en mode « cruising » de drift : quand le joueur enchaîne assez de drifts (ou fait un très long drift), le contexte drift passe de "inFreeroam" à "inFreeroamCruising" (ce qui fait afficher l'interface de drift) puis revient à "inFreeroam" après quelques secondes sans drifter. Lit gameplay_drift_drift et pilote gameplay_drift_general.setContext.

## Remarques

- Seuils codés en dur : drift >= 1.5 s avec au moins 3 drifts chaînés, ou drift >= 3.2 s ; le drift ne doit pas s'être terminé à moins de 25 m de son point de départ (sinon c'est un donut, pas du cruising) ; l'interface est désactivée après 3 s sans drift.
- Le décompte de fin utilise dtSim (temps simulé), donc il est ralenti/figé avec le ralenti ou la pause.
- Le hook onDriftFreeroamCruisingStarted est émis sans argument au passage en cruising.
- La fonction locale getGC (garbage du profileur) n'est pas exportée : code mort.

**Dépendances (chargées avant) :** `gameplay_drift_general`, `gameplay_drift_drift`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_freeroam_cruising.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : teste le début du cruising (detectStart) puis sa fin (detectEnd). Si le debug général est actif, mesure le coût avec un LuaProfiler. *(interne)* *(hook)* | 46 |

### Détail des paramètres

#### `gameplay_drift_freeroam_cruising.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame : teste le début du cruising (detectStart) puis sa fin (detectEnd). Si le debug général est actif, mesure le coût avec un LuaProfiler.

- `dtReal` (*number*) : Delta temps réel en secondes (inutilisé).
- `dtSim` (*number*) : Delta temps simulé en secondes, utilisé pour le décompte de fin.
- `dtRaw` (*number*) : Delta temps brut en secondes (inutilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general et gameplay_drift_drift, chargés avant. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftFreeroamCruisingStarted` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/freeroam/cruising.lua`.*
