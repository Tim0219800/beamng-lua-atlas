# `jbeam_tableSchema`

*Fichier : `lua/common/jbeam/tableSchema.lua` · VM : Commun (GE + véhicule) · 298 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/tableSchema")`

Interprète le format tabulaire du jbeam : une section est une liste dont la première ligne est l'en-tête des colonnes et les lignes suivantes sont les données (ex. ["id","posX","posY","posZ"], ["n1", 0, 0, 0]). Le module transforme chaque ligne en table {colonne = valeur}, en y fusionnant les options locales (dictionnaires insérés entre les lignes ou à la fin d'une ligne), les valeurs spéciales (FLT_MAX, |NORMAL|NM_ASPHALT…) et les lignes CSV incluses. process() applique cela à toutes les sections d'un véhicule.

## Exemple

```lua
local tableSchema = require('jbeam/tableSchema')
local rowsCount = tableSchema.processTableWithSchemaDestructive(section, newList, vehicle.options)
-- ou, pour un véhicule entier :
tableSchema.process(vehicle, true, true)
```

## Remarques

- Règles de ligne : (1) un dictionnaire seul sur une ligne fixe des options locales pour les lignes suivantes ; (2) un dictionnaire placé en dernière cellule d'une ligne s'ajoute aux options de CETTE ligne ; (3) une ligne plus longue que l'en-tête + 1 est rejetée (avertissement, retour -1) ; (4) options `disable = true` (ou variables.disable = true) sautent la ligne ; (5) si la colonne id existe, elle devient la clé de la ligne dans la liste résultat et le champ name (le champ id est supprimé), sinon la clé est l'indice de ligne (à partir de 1, après retrait de l'en-tête).
- Les options globales du véhicule (champs non-table à la racine) sont d'abord déplacées dans vehicle.options puis copiées dans les options locales de chaque section : elles deviennent les valeurs par défaut de chaque ligne.
- Valeurs spéciales (chaînes) : 'FLT_MAX' -> +infini, 'MINUS_FLT_MAX' -> -infini ; chaîne commençant par '|' : combinaison binaire (bit.bor) de noms comme NORMAL, HYDRO, ANISOTROPIC/TIRESIDE, BOUNDED, PRESSURED, SUPPORT, LBEAM, FIXED, NONCOLLIDABLE, SIGNAL_LEFT(1), SIGNAL_RIGHT(2), HEADLIGHT(4), BRAKELIGHT(8), RUNNINGLIGHT(16), REVERSELIGHT(32) ; un élément 'NM_<nom>' est remplacé par l'identifiant du matériau de particules <nom> (particles.getMaterialIDByName) et ÉCRASE la valeur accumulée avant lui (pas un OU) : placer NM_ en premier.
- Inclusion CSV : une ligne dictionnaire contenant include (chemin) et delimiter lit un fichier csvlib dont la première ligne doit être identique à l'en-tête de la section ; les lignes du fichier sont traitées comme des lignes normales. Les erreurs sont journalisées et la ligne est abandonnée.
- BUG mineur : le message d'erreur d'en-tête CSV incohérent utilise une variable `headerCsv` non définie (affiche nil).
- La fonction est DESTRUCTIVE : elle retire l'en-tête (table.remove) de jbeamTable et modifie les lignes (suppression de la cellule d'options). Les noms de sections doivent respecter ^[a-zA-Z_][a-zA-Z0-9_]*$ sinon process() journalise une erreur et renvoie false.
- Les sections 'slots' et 'slots2' ne sont pas traitées par process quand processSlotsTable est faux (déjà préparées par le module io) ; la table vehicle.validTables mémorise les sections déjà traitées pour ne pas les retraiter deux fois.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_tableSchema.process(vehicle, processSlotsTable, omitWarnings)` | Traite un véhicule (ou fichier) jbeam entier : initialise vehicle.maxIDs, vehicle.validTables, vehicle.beams et vehicle.options, déplace les valeurs non-table de la racine dans options, puis remplace chaque section tabulaire (liste non vide) par sa version clé/valeur avec processTableWithSchemaDestructive. *(interne)* | 225 |
| `jbeam_tableSchema.processTableWithSchemaDestructive(jbeamTable, newList, inputOptions, omitWarnings)` | Traite une section tabulaire jbeam : retire l'en-tête (première ligne), convertit chaque ligne en table clé/valeur et la range dans newList. Renvoie le nombre de lignes créées, ou -1 si l'en-tête est invalide (absent, ou dictionnaire au lieu d'une liste). | 184 |

### Détail des paramètres

#### `jbeam_tableSchema.process(vehicle, processSlotsTable, omitWarnings)`

Traite un véhicule (ou fichier) jbeam entier : initialise vehicle.maxIDs, vehicle.validTables, vehicle.beams et vehicle.options, déplace les valeurs non-table de la racine dans options, puis remplace chaque section tabulaire (liste non vide) par sa version clé/valeur avec processTableWithSchemaDestructive.

- `vehicle` (*table*) : données jbeam (modifiées en place)
- `processSlotsTable` (*boolean|nil*) : traiter aussi les sections slots/slots2 (faux = laissées au module io)
- `omitWarnings` (*boolean|nil*) : supprimer les avertissements
- **renvoie** : boolean false si un nom de section est invalide, sinon true

#### `jbeam_tableSchema.processTableWithSchemaDestructive(jbeamTable, newList, inputOptions, omitWarnings)`

Traite une section tabulaire jbeam : retire l'en-tête (première ligne), convertit chaque ligne en table clé/valeur et la range dans newList. Renvoie le nombre de lignes créées, ou -1 si l'en-tête est invalide (absent, ou dictionnaire au lieu d'une liste).

- `jbeamTable` (*table*) : section jbeam (liste) ; modifiée (en-tête retiré, cellules d'options retirées)
- `newList` (*table*) : table de sortie remplie (clé = id de ligne ou indice, valeur = table de la ligne ; newList.__astNodeIdx = jbeamTable.__astNodeIdx)
- `inputOptions` (*table|nil*) : options par défaut copiées dans chaque ligne (copie profonde, valeurs spéciales remplacées)
- `omitWarnings` (*boolean|nil*) : supprime les avertissements d'en-tête/lignes invalides
- **renvoie** : integer nombre de lignes créées, ou -1 si en-tête invalide

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/tableSchema.lua`.*
