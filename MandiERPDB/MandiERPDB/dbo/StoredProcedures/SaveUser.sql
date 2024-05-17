CREATE PROCEDURE [dbo].[SaveUser] (
	@UserID INT
	,@FirstName NVARCHAR(250)
	,@UserName VARCHAR(250)
	,@Password VARCHAR(250)
	,@RoleName VARCHAR(50) = NULL
	,@CreateBy INT
	)
AS
BEGIN
	DECLARE @IsAdmin BIT

	SET @IsAdmin = CASE 
			WHEN @RoleName = 'Admin'
				THEN 1
			ELSE 0
			END;

	DECLARE @RoleID INT

	SET @RoleID = CASE 
			WHEN @RoleName = 'Admin'
				THEN 1
			ELSE 2
			END;

	IF EXISTS (
			SELECT 1
			FROM Users
			WHERE UserID = @UserID
			)
	BEGIN
		UPDATE Users
		SET [UserName] = @UserName
			,[IsAdmin] = @IsAdmin
			,[fkBranchID] = 1
			,[IsActive] = 1
			,[ModifyBy] = @CreateBy
			,[ModifyDate] = GETDATE()
		WHERE [UserID] = @UserID

		UPDATE UserAccounts
		SET Password = @Password
			,[ModifyBy] = @CreateBy
			,[ModifyDate] = GETDATE()
		WHERE fkUserID = @UserID

		UPDATE UserDetails
		SET FirstName = @FirstName
			,[ModifyBy] = @CreateBy
			,[ModifyDate] = GETDATE()
		WHERE fkUserID = @UserID;

		UPDATE UserInRoles
		SET fkRoleID = @RoleID
			,[ModifyBy] = @CreateBy
			,[ModifyDate] = GETDATE()
		WHERE fkUserID = @UserID;
	END
	ELSE
	BEGIN
		INSERT INTO Users (
			[UserName]
			,[IsAdmin]
			,[fkBranchID]
			,[IsActive]
			,[CreateBy]
			,[CreateDate]
			,[ModifyBy]
			,[ModifyDate]
			)
		VALUES (
			@UserName
			,@IsAdmin
			,1
			,1
			,@CreateBy
			,GETDATE()
			,@CreateBy
			,GETDATE()
			)

		SET @UserID = @@IDENTITY

		INSERT INTO UserAccounts (
			[fkUserID]
			,[Password]
			,[CreateBy]
			,[CreateDate]
			,[ModifyBy]
			,[ModifyDate]
			)
		VALUES (
			@UserID
			,@Password
			,@CreateBy
			,GETDATE()
			,@CreateBy
			,GETDATE()
			)

		INSERT INTO UserDetails (
			[fkUserID]
			,FirstName
			,[CreateBy]
			,[CreateDate]
			,[ModifyBy]
			,[ModifyDate]
			)
		VALUES (
			@UserID
			,@FirstName
			,@CreateBy
			,GETDATE()
			,@CreateBy
			,GETDATE()
			)

		INSERT INTO UserInRoles (
			[fkUserID]
			,fkRoleID
			,[CreateBy]
			,[CreateDate]
			,[ModifyBy]
			,[ModifyDate]
			)
		VALUES (
			@UserID
			,@RoleID
			,@CreateBy
			,GETDATE()
			,@CreateBy
			,GETDATE()
			)
	END
END
