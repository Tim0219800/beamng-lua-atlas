# `profiling_p`

*Fichier : `lua/vehicle/extensions/profiling/p.lua` · VM : Véhicule · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `profiling_p` : `extensions.load (VM véhicule)("profiling_p")`, puis la globale `profiling_p`

Bibliothèque tierce : profileur LuaJIT (jit.p) de Mike Pall, copyright 2005-2016, licence MIT. C'est une interface simple au profileur à faible surcharge intégré à LuaJIT (module jit.profile). Elle échantillonne la pile d'appels à intervalle régulier et affiche un résumé (fonctions, lignes de module, états de la VM, zones) dans un fichier ou sur la sortie standard. Un moddeur peut l'utiliser dans la VM véhicule pour trouver les fonctions Lua les plus coûteuses.

## Exemple

```lua
extensions.load('profiling_p')
profiling_p.start('vl', 'profil.txt') -- modes : voir notes
-- ... laisser tourner ...
profiling_p.stop(true)
```

## Remarques

- Chaîne de mode de start (combinable) : f = pile avec noms de fonctions (défaut) ; F = idem avec module ; l = module:ligne ; <nombre> = profondeur de pile ; -<nombre> = profondeur inversée ; s = séparer après le premier niveau ; p = chemins complets ; v = états de la VM ; z = zones ; r = comptes bruts ; a / A = annoter des extraits / les fichiers sources complets ; G = sortie brute pour outils graphiques (flame graphs) ; m<nombre> = pourcentage minimal affiché (défaut 3) ; i<nombre> = intervalle d'échantillonnage en ms (défaut 10).
- Si outfile est nil, la variable d'environnement LUAJIT_PROFILEFILE est utilisée ; sinon la sortie standard. La valeur '-' force la sortie standard.
- stop(false) arrête l'échantillonnage sans écrire de résultat. Un garbage collect de l'objet interne (prof_ud) appelle aussi prof_finish.
- Le mode z charge require('jit.zone') ; dans ce dossier la bibliothèque de zones est le fichier voisin zone.lua, pas forcément chargeable sous ce nom (déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `profiling_p.start(mode, outfile)` | Démarre le profilage avec le mode donné et choisit la destination de sortie (fichier ouvert en écriture, ou sortie standard). | 304 |
| `profiling_p.stop(doOutput)` | Arrête le profileur et, si doOutput est vrai, écrit le résultat (affichage des meilleures entrées ou annotation de source). Écrit « [No samples collected] » si aucun échantillon n'a été pris. | 231 |

### Détail des paramètres

#### `profiling_p.start(mode, outfile)`

Démarre le profilage avec le mode donné et choisit la destination de sortie (fichier ouvert en écriture, ou sortie standard).

- `mode` (*string|nil*) : chaîne de mode (voir notes), « f » par défaut
- `outfile` (*string|nil*) : fichier de sortie, '-' pour la sortie standard ; nil = LUAJIT_PROFILEFILE ou sortie standard

#### `profiling_p.stop(doOutput)`

Arrête le profileur et, si doOutput est vrai, écrit le résultat (affichage des meilleures entrées ou annotation de source). Écrit « [No samples collected] » si aucun échantillon n'a été pris.

- `doOutput` (*boolean|nil*) : vrai pour écrire le résultat

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/profiling/p.lua`.*
