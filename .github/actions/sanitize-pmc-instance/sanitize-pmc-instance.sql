DELETE FROM PolicyRevisionGroup
DELETE FROM Annotation
DELETE FROM [Group] WHERE [Name] NOT LIKE 'Default%';

DELETE FROM AgentHost
DELETE FROM PolicyRevision
DELETE FROM [Policy]

CREATE TABLE #DefaultUserIds (Id UNIQUEIDENTIFIER);
INSERT INTO #DefaultUserIds (Id)
SELECT Id
FROM [User]
WHERE AccountName LIKE 'automation%'
    OR AccountName LIKE 'schedule%'
    OR AccountName LIKE '%admin%';
DELETE FROM [TaskUser];
DELETE ur FROM [UserRole] ur JOIN [User] u on u.Id = ur.UserId WHERE ur.UserId NOT IN (SELECT Id FROM #DefaultUserIds);
DELETE FROM [UserPermissionGroup]
DELETE FROM [User] WHERE Id NOT IN (SELECT Id FROM #DefaultUserIds);
DROP TABLE #DefaultUserIds 

CREATE TABLE #DefaultRoleIds (Id UNIQUEIDENTIFIER);
INSERT INTO #DefaultRoleIds (Id)
SELECT Id
FROM [Role]
WHERE [PermissionSetName] = 'Interactive Login'
    OR [PermissionSetName] = 'System';
DELETE FROM [PermissionGroup] WHERE [IsBuiltIn] = 0
DELETE FROM [GroupRole] WHERE RoleId NOT IN (SELECT Id FROM #DefaultRoleIds)
DELETE FROM [Role] WHERE NOT [PermissionSetName] = 'Interactive Login' AND NOT [PermissionSetName] = 'System'
DROP TABLE #DefaultRoleIds

DELETE FROM AgentCredential
DELETE FROM AgentHost 
DELETE FROM AgentGroup
DELETE FROM AgentOauthCredential 
DELETE FROM Agent
DELETE FROM ActivityAudit