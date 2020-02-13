-- Unit_Ability
-- Author: 57371
-- DateCreated: 2/13/2020 11:46:27 AM
--------------------------------------------------------------

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES 
("ABILITY_TREASURE_SHIP", "Modifier_FlagShip");

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
("Modifier_FlagShip", "MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH", 0, 0, 0, NULL, "ReqSet");

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
("Modifier_FlagShip", "Amount", 10);

-- Single Conditions

INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
("Is_Naval_Melee_Next_to_TreasureShip", "REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES"), 
("Is_Naval_Ranged_Next_to_TreasureShip", "REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES"), 
("Is_Naval_Raider_Next_to_TreasureShip", "REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES");

INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
("Is_Naval_Melee_Next_to_TreasureShip", "MaxRange", 1), 
("Is_Naval_Melee_Next_to_TreasureShip", "MinRange", 1), 
("Is_Naval_Melee_Next_to_TreasureShip", "Tag", "CLASS_NAVAL_MELEE"), 
("Is_Naval_Ranged_Next_to_TreasureShip", "MaxRange", 1), 
("Is_Naval_Ranged_Next_to_TreasureShip", "MinRange", 1), 
("Is_Naval_Ranged_Next_to_TreasureShip", "Tag", "CLASS_NAVAL_RANGED"), 
("Is_Naval_Raider_Next_to_TreasureShip", "MaxRange", 1), 
("Is_Naval_Raider_Next_to_TreasureShip", "MinRange", 1), 
("Is_Naval_Raider_Next_to_TreasureShip", "Tag", "CLASS_NAVAL_RAIDER");

-- Conditions Group

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
("ReqSet", "REQUIREMENTSET_TEST_ANY");

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
("ReqSet", "Is_Naval_Melee_Next_to_TreasureShip"), 
("ReqSet", "Is_Naval_Ranged_Next_to_TreasureShip"), 
("ReqSet", "Is_Naval_Raider_Next_to_TreasureShip");
