# `benchphysics`

*Fichier : `lua/console/benchphysics.lua` · VM : Console · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("benchphysics")`

Très ancien petit benchmark de mise à l'échelle de la physique : pour 0 à 8 véhicules, mesure le temps moyen par mise à jour sur 1000 images et écrit le résultat dans `phys-scale.csv` (colonnes « vehicle count;delay »). Définit les globales `testStep` et `benchPhysics`.

## Remarques

- Code obsolète : il appelle `spawnObjects(i)` et `updateLoop(frames)`, qui ne sont définies nulle part dans ce fichier ni dans la VM console ; il ne fonctionne pas tel quel.
- Utilise des globales sans `local` (frames, hp, file, d) et la classe moteur HighPerfTimer.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `benchPhysics()` | Boucle de 0 à 8 véhicules, appelle testStep et écrit phys-scale.csv ; affiche « Benchmark running: ... done! ». | 15 |
| `testStep(i)` | Fait apparaître i véhicules, joue 1000 images et renvoie le temps moyen par image en ms (t / frames). | 5 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/benchphysics.lua`.*
