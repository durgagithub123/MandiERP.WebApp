--Test case : Exec  InsertAndUpdateLaderExport 1221,'01/01/1900 12:00:00 AM','3','159150','07/26/2015 9:22:34 PM'
CREATE proc [dbo].[InsertAndUpdateLaderExport]
(
     @fkAccountID BIGINT
	,@TransactionDate DATETIME
	,@fkExportMasterID INT
	,@DebitAmount Decimal(18,2)
	,@InsertDate DATETIME
	)
	AS
	BEGIN 
	Declare @Remark varchar(100)
	set @Remark=(SELECT CONVERT(varchar(50), BiltiNo ) + ' # '+ CONVERT(varchar(50),GadiNo)  FROM  ExportMasters WHERE ExportMasterID = @fkExportMasterID)
	set @Remark+=(SELECT ' # ' +CONVERT(varchar(50),SUM(TotalQuantity)) +' # '+CONVERT(varchar(50),SUM(NetWeight))  FROM  ExportItemDetails WHERE fkExportMasterID  = @fkExportMasterID)
	set @TransactionDate=(SELECT BiltiDate FROM  ExportMasters WHERE ExportMasterID = @fkExportMasterID)
			IF NOT EXISTS (SELECT 1 FROM AccountTransactions WHERE fkExportMasterID = @fkExportMasterID and fkAccountID =@fkAccountID)
			BEGIN
				print 'insert'
				INSERT INTO [AccountTransactions] (
				 [fkAccountID]
                ,[fkExportMasterID]
				,[TransactionDate]
				,[TransactionDetail]
				,[DebitAmount]
				,[IsDebitOrCredit]
				,[Remark]
				,[Comment]
				,[InsertDate]
				,[ModifyDate])
				
			VALUES (
				 @fkAccountID
				,@fkExportMasterID
				,@TransactionDate
				,'StoreProcedure'
				,@DebitAmount
				,'D'
				,@Remark
				,'Direct Export Recieve #'
				,@InsertDate
				,getdate()
				)
			END
			ELSE
			BEGIN
				print 'update'
				UPDATE [AccountTransactions]
			SET [DebitAmount] = @DebitAmount
				,CreditAmount=0
				,[ModifyDate] = @InsertDate
				,IsDebitOrCredit ='D'
				,[TransactionDate]=@TransactionDate
				,Remark =@Remark
				,Comment = 'Direct Export Recieve #'
				,fkAccountID=@fkAccountID
			WHERE [fkExportMasterID]=@fkExportMasterID  
			and fkAccountID=@fkAccountID
			--and  IsDebitOrCredit ='D'
				--AND [Comment] = 'Direct Export Recieve #'
			END
			
	
	END
