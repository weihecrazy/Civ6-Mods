-- Hanwudi_Leader_Ability
-- Author: 57371
-- DateCreated: 1/27/2020 3:16:46 PM
-- �汾��v1.2
-- 2020��2��8�� v1.1���£�Т��ʵ�������Ϊÿ�غ�+2�󽫾�����
--------------------------------------------------------------
--��������������Т��ʵ�
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
("TRAIT_LEADER_HANWUDI_XIAOWU_EMPEROR", "Xiaowu_Emperor_Trait");

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
("Xiaowu_Emperor_Trait", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS", 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
("Xiaowu_Emperor_Trait", "Amount", 2), 
("Xiaowu_Emperor_Trait", "GreatPersonClassType", "GREAT_PERSON_CLASS_GENERAL");

--������ʷ��̣�������
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
("TRAIT_AGENDA_DAHANTIANWEI", "Dahantianwei_Trait_AddCombat"),
("TRAIT_AGENDA_DAHANTIANWEI", "Dahantianwei_Trait_AddMovement");

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
("Dahantianwei_Trait_AddCombat", "MODIFIER_PLAYER_ADD_DIPLOMATIC_COMBAT_MODIFIER", 0, 0, 0, NULL, NULL),
("Dahantianwei_Trait_AddMovement", "MODIFIER_PLAYER_ADD_DIPLOMATIC_MOVEMENT_MODIFIER", 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
("Dahantianwei_Trait_AddCombat", "Amount", 5), 
("Dahantianwei_Trait_AddCombat", "DiplomaticYieldSource", "FORMAL_WAR_INITIATED"), 
("Dahantianwei_Trait_AddCombat", "ReligiousOnly", "false"), 
("Dahantianwei_Trait_AddCombat", "TurnsActive", 10);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
("Dahantianwei_Trait_AddMovement", "Amount", 2), 
("Dahantianwei_Trait_AddMovement", "DiplomaticYieldSource", "FORMAL_WAR_INITIATED"), 
("Dahantianwei_Trait_AddMovement", "TurnsActive", 10);
