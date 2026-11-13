---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires du registre de routes d'exécution (analyse des routes Vue brutes, validation transactionnelle, précédence des sources, diffs ajouté/retiré/modifié, isolation des instances). Lancement : extensions.testFramework_TestManager:runTestFiles("runtimeRouteRegistry"). Utile comme exemples du format de routes accepté par registerModRoutes.
--- Accès : extension `ui_router_runtimeRouteRegistry.test` : `extensions.load("ui_router_runtimeRouteRegistry.test")`, puis la globale `ui_router_runtimeRouteRegistry.test`
---@class ui_router_runtimeRouteRegistry.test
ui_router_runtimeRouteRegistry.test = {}

--- meta.luaRoute applique uniquement les clés autorisées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:123
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testAppliesAllowlistedLuaRouteOverrides(ctx) end

--- Un `name` en tableau crée plusieurs routes partageant la même définition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:79
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testArrayRouteNamesShareDefinition(ctx) end

--- getEffectiveRoutes renvoie des copies profondes : les modifier n'affecte pas le registre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:335
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testEffectiveRoutesAreDeepCopied(ctx) end

--- Une ré-inscription invalide laisse l'instantané précédent intact (transactionnel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:202
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testFailedReRegistrationKeepsPreviousSnapshot(ctx) end

--- Un sourceId vide ou non-chaîne est rejeté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:359
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testInvalidSourceIdRejected(ctx) end

--- Les champs meta (uiTypes, infoBar, topBar, uiApps, triggerPause, uiNav…) sont reportés dans `ui`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:94
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testMapsUiFieldsFromMeta(ctx) end

--- La source la plus récente gagne pour un même nom, sans fusion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:217
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testNewestSourceWinsWithoutComposition(ctx) end

--- Les enfants imbriqués sur plusieurs niveaux sont tous analysés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:56
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testParsesDeeplyNestedChildren(ctx) end

--- Une route nommée reçoit les valeurs par défaut Vue (runtime, ui.uiTypes = vue, filtre only).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:20
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testParsesSingleNamedRouteWithVueDefaults(ctx) end

--- Ré-enregistrer une source retire les noms qui ne figurent plus dans la nouvelle liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:285
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testReRegistrationRemovesStaleNames(ctx) end

--- Ré-enregistrer une source conserve son rang de priorité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:230
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testReRegistrationRetainsOriginalPrecedence(ctx) end

--- register renvoie les listes added et changed correctes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:297
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRegisterReportsAddedAndChangedDiffs(ctx) end

--- backTarget et fallbackTarget simultanés sont rejetés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:177
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsBackTargetAndFallbackTargetTogether(ctx) end

--- Un nom de route en double dans une source est rejeté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:185
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsDuplicateRouteNameWithinSource(ctx) end

--- Un hook donné comme fonction (et non chaîne) est rejeté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:169
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsFunctionLifecycleHook(ctx) end

--- Un hook de cycle de vie qui n'est pas « module.func » est rejeté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:160
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsInvalidLifecycleHook(ctx) end

--- Un `name` de type invalide (ni chaîne ni tableau de chaînes) est rejeté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:194
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsInvalidNameShape(ctx) end

--- Deux instances de registre sont indépendantes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:349
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testSeparateRegistriesDoNotShareState(ctx) end

--- getSourceOrder suit l'ordre de première inscription.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:270
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testSourceOrderTracksFirstRegistration(ctx) end

--- Un nœud sans nom ne produit pas de route mais ses enfants oui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:38
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnnamedGroupEmitsChildrenButNotItself(ctx) end

--- Retirer une source inconnue réussit sans effet (existed = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:324
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterMissingSourceIsNoop(ctx) end

--- unregister renvoie la liste removed correcte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:313
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterReportsRemovedDiff(ctx) end

--- Retirer la source gagnante restaure la définition de la source précédente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:257
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterRestoresPreviousWinner(ctx) end

--- Retirer puis ré-enregistrer une source lui donne le rang le plus récent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:243
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterThenRegisterCreatesNewPrecedence(ctx) end

