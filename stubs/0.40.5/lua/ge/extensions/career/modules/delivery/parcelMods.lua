---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/parcelMods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Définit les modificateurs (« mods ») de colis du mode carrière : timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous. Chaque mod a un drapeau de déblocage (unlockFlag), une priorité de tri, une icône, des textes traduits et un gabarit (makeTemplate) qui produit la table attachée au colis. Sert à générer les mods d'un colis (generateModifiers), savoir s'ils sont débloqués et compter les statistiques de livraison par mod.
--- Accès : extension `career_modules_delivery_parcelMods` : `extensions.load("career_modules_delivery_parcelMods")`, puis la globale `career_modules_delivery_parcelMods`
---@class career_modules_delivery_parcelMods
career_modules_delivery_parcelMods = {}

--- Calcule un délai de livraison en secondes : distance/13 + 30 * (1 + random).
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:207
---@param distance number Distance du trajet en mètres.
---@return number  Temps en secondes.
function career_modules_delivery_parcelMods.calculateTimedModifierTime(distance) end

--- Tire les mods d'un colis selon les probabilités parcelTemplate.modChance (une pioche par clé, clés triées), ajoute le mod large pour les colis très gros ou très lourds (65 slots, poids 80), puis trie par priorité.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:218
---@param item table Colis en cours de génération ; utilise groupSeed (graine), slots et weight.
---@param parcelTemplate table Gabarit de colis avec la table modChance[modKey] = probabilité 0..1.
---@param distance number Distance du trajet, transmise à makeTemplate (utile pour timed).
---@return table  Liste de tables de mod triée par priorité croissante.
function career_modules_delivery_parcelMods.generateModifiers(item, parcelTemplate, distance) end

--- Renvoie le libellé traduit et la courte description traduite (chaîne vide si le mod n'en a pas).
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:201
---@param key string Clé du mod.
---@return string  Libellé traduit.
---@return string  Description courte traduite ou ''.
function career_modules_delivery_parcelMods.getLabelAndShortDescription(key) end

--- Renvoie une copie des données d'un mod avec unlockLabel, label et shortDescription déjà traduits via _tr.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:188
---@param key string Clé du mod (timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous).
---@return table|nil  Données du mod, ou nil si la clé est inconnue.
function career_modules_delivery_parcelMods.getModData(key) end

--- Renvoie le nom d'icône UI du mod.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:200
---@param key string Clé du mod.
---@return string  Identifiant d'icône.
function career_modules_delivery_parcelMods.getModifierIcon(key) end

--- Renvoie le texte traduit décrivant comment débloquer le mod.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:276
---@param key string Clé du mod.
---@return string  Libellé traduit.
function career_modules_delivery_parcelMods.getParcelModProgressLabel(key) end

--- Renvoie l'état de déblocage de chaque mod.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:268
---@return table<string, boolean>  modKey -> débloqué.
function career_modules_delivery_parcelMods.getParcelModUnlockStatusSimple() end

--- Renvoie la table de progression (compteurs par type de mod : delivered, onTimeDeliveries, delayedDeliveries, lateDeliveries, lost…), utilisée pour la sauvegarde.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:184
---@return table  Table de progression, par type de mod.
function career_modules_delivery_parcelMods.getProgress() end

--- Indique si le mod est marqué important (timed et precious).
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:205
---@param key string Clé du mod.
---@return boolean  true si important.
function career_modules_delivery_parcelMods.isImportant(key) end

--- Indique si le drapeau de déblocage du mod est actif dans career_modules_unlockFlags.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:242
---@param modKey string Clé du mod.
---@return boolean  false si le mod est inconnu ou sans drapeau.
function career_modules_delivery_parcelMods.isParcelModUnlocked(modKey) end

--- Pour un ensemble de mods, dit si au moins un est verrouillé et renvoie la définition du drapeau de plus haut niveau parmi ceux examinés.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:248
---@param modKeys table<string, any> Table dont les clés sont des clés de mod.
---@return boolean  true si au moins un mod est verrouillé.
---@return table|nil  Définition de drapeau (level le plus haut), ou nil.
function career_modules_delivery_parcelMods.lockedBecauseOfMods(modKeys) end

--- Hook appelé à l'activation de la carrière : mémorise les références vers les autres extensions de livraison (parcelManager, cargoScreen, general, generator, progress, tutorial).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:6
function career_modules_delivery_parcelMods.onCareerActivated() end

--- Remplace les statistiques de progression par mod (chargement de sauvegarde). Sans argument, revient à une copie du gabarit par défaut.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:180
---@param data table|nil Table de progression sauvegardée, ou nil pour réinitialiser.
function career_modules_delivery_parcelMods.setProgress(data) end

--- Met à jour les statistiques à la livraison d'un colis : incrémente progress[type].delivered pour chaque mod, et pour timed classe la livraison à l'heure, retardée ou en retard selon le temps écoulé depuis cargo.loadedAtTimeStamp.
---Source : lua/ge/extensions/career/modules/delivery/parcelMods.lua:279
---@param cargo table Colis livré, avec modifiers et loadedAtTimeStamp.
function career_modules_delivery_parcelMods.trackModifierStats(cargo) end

