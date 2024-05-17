CREATE PROCEDURE [dbo].[Usp_upsertitemsalesummary] (@TransactionDate DATETIME,
                                            @fkAccountID     BIGINT,
                                            @PreviousAccountID BIGINT =0)
AS
  BEGIN
      DECLARE @ItemSaleSummaryNo  BIGINT,
              @ItemSaleCode       VARCHAR(100),
              @ItemSaleCodeDetail VARCHAR(100),
              @Quantity           DECIMAL(10, 0),
              @GrossWeight        DECIMAL(18, 2),
              @NetWeight          DECIMAL(18, 2),
              @CommissionPercent  DECIMAL(18, 2),
              @CommissionAmount   DECIMAL(18, 2),
              @TotalAmount        DECIMAL(18, 2),
              @IsActive           VARCHAR(20),
              @CreateBy           INT,
              @CreateDate         DATETIME,
              @ModifyBy           INT,
              @ModifyDate         DATETIME,
              @Sysdate            DATETIME,
              @PaidAmount         DECIMAL(10, 2),
              @Discount           DECIMAL(10, 2),
              @RemainingAmount    DECIMAL(10, 2),
              @IsPanaPaid         BIT

      --@Transaction Date AccountId - TotalAmount, TotalCommistion, Qty , Weight
      SELECT @TotalAmount = isnull(Sum(totalamount),0),
             @Quantity = isnull(Sum(quantity),0),
             @GrossWeight = isnull(Sum(grossweight),0),
             @NetWeight = isnull(Sum(netweight),0),
             @CommissionAmount = isnull(Sum(commissionamount),0)
      FROM   itemsaledetails
      WHERE  isactive != '0'
             AND fkaccountid = @fkAccountID
             AND convert(varchar(10),createdate,112) = convert(varchar(10),@TransactionDate,112)
             --AND createdate = @TransactionDate

      IF NOT EXISTS (SELECT 1
                     FROM   itemsalesummary
                     WHERE  fkaccountid = @fkAccountID
                            AND convert(varchar(10),transactiondate,112) = convert(varchar(10),@TransactionDate,112))
        BEGIN
            INSERT INTO [itemsalesummary]
                        ([itemsalesummaryno],
                         [itemsalecode],
                         [itemsalecodedetail],
                         [transactiondate],
                         [fkaccountid],
                         [quantity],
                         [grossweight],
                         [netweight],
                         [commissionpercent],
                         [commissionamount],
                         [totalamount],
                         [isactive],
                         [createby],
                         [createdate],
                         [modifyby],
                         [modifydate],
                         [sysdate],
                         [paidamount],
                         [discount],
                         [remainingamount],
                         [ispanapaid])
            VALUES      ( @ItemSaleSummaryNo,
                          @ItemSaleCode,
                          @ItemSaleCodeDetail,
                          @TransactionDate,
                          @fkAccountID,
                          @Quantity,
                          @GrossWeight,
                          @NetWeight,
                          @CommissionPercent,
                          @CommissionAmount,
                          @TotalAmount,
                          @IsActive,
                          @CreateBy,
                          @CreateDate,
                          @ModifyBy,
                          @ModifyDate,
                          @Sysdate,
                          @PaidAmount,
                          @Discount,
                          @RemainingAmount,
                          @IsPanaPaid )
        END
      ELSE
        BEGIN
            UPDATE itemsalesummary
            SET    --[itemsalesummaryno] = @ItemSaleSummaryNo,
            --       [itemsalecode] = @ItemSaleCode,
            --       [itemsalecodedetail] = @ItemSaleCodeDetail,
                   --[transactiondate] = @TransactionDate,
                   --[fkaccountid] = @fkAccountID,
                   [quantity] = @Quantity,
                   [grossweight] = @GrossWeight,
                   [netweight] = @NetWeight,
                   [commissionpercent] = @CommissionPercent,
                   [commissionamount] = @CommissionAmount,
                   [totalamount] = @TotalAmount--,
                   --[isactive] = @IsActive,
                   --[createby] = @CreateBy,
                   --[createdate] = @CreateDate,
                   --[modifyby] = @ModifyBy,
                   --[modifydate] = @ModifyDate,
                   --[sysdate] = @Sysdate,
                   --[paidamount] = @PaidAmount,
                   --[discount] = @Discount,
                   --[remainingamount] = @RemainingAmount,
                   --[ispanapaid] = @IsPanaPaid
            WHERE  fkaccountid = @fkAccountID
             AND convert(varchar(10),transactiondate,112) = convert(varchar(10),@TransactionDate,112)
                  -- AND transactiondate = @TransactionDate
        END
  END 