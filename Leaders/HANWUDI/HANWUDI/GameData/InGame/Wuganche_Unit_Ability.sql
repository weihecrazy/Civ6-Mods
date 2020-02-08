-- Wuganche_Unit_Ability
-- Author: 57371
-- DateCreated: 1/26/2020 9:29:56 PM
--------------------------------------------------------------


INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES 
("ABILITY_WUGANCHE", "WUGANCHE_NEIGHBOR_COMBAT_MODIFIER");

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
("WUGANCHE_NEIGHBOR_COMBAT_MODIFIER", "MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH", 0, 0, 0, NULL, "WUGANCHE_PLOT_IS_WUGANCHE_REQUIREMENTS");

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
("WUGANCHE_NEIGHBOR_COMBAT_MODIFIER", "Amount", 10);

-- Single Conditions

INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
("REQUIRE_UNIT_NEXT_TO_WUGANCHE", "REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TYPE_MATCHES");

INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
("REQUIRE_UNIT_NEXT_TO_WUGANCHE", "IncludeCenter", 0), 
("REQUIRE_UNIT_NEXT_TO_WUGANCHE", "MaxRange", 1), 
("REQUIRE_UNIT_NEXT_TO_WUGANCHE", "MinRange", 1), 
("REQUIRE_UNIT_NEXT_TO_WUGANCHE", "UnitType", "UNIT_HAN_WUGANCHE");

-- Conditions Group

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
("WUGANCHE_PLOT_IS_WUGANCHE_REQUIREMENTS", "REQUIREMENTSET_TEST_ALL");

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
("WUGANCHE_PLOT_IS_WUGANCHE_REQUIREMENTS", "REQUIRE_UNIT_NEXT_TO_WUGANCHE");
