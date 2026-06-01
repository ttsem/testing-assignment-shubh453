### Calculator Unit Tests

TestId	        Function	                    TestName	                            Input	        Expected Behavior
UNIT-CALC-001	Add	        Add_TwoPositiveNumbers_ReturnsSum	                        10, 5	        Returns 15
UNIT-CALC-002	Add	        Add_PositiveAndNegativeNumber_ReturnsCorrectSum	            10, -5	        Returns 5
UNIT-CALC-003	Add	        Add_TwoNegativeNumbers_ReturnsNegativeSum	                -10, -5	        Returns -15
UNIT-CALC-004	Add	        Add_WithZero_ReturnsSameNumber	                            10, 0	        Returns 10
UNIT-CALC-005	Add	        Add_DecimalNumbers_ReturnsPreciseResult	                    2.5, 3.25	    Returns 5.75
UNIT-CALC-006	Add	        Add_LargeNumbers_ReturnsExpectedResult	                double.MaxValue, 1	Returns Infinity or agreed overflow behavior
UNIT-CALC-007	Subtract	Subtract_TwoPositiveNumbers_ReturnsDifference	        10, 5	            Returns 5
UNIT-CALC-008	Subtract	Subtract_ResultIsNegative_ReturnsNegativeValue	        5, 10	            Returns -5
UNIT-CALC-009	Subtract	Subtract_WithZero_ReturnsSameNumber	                    10, 0	            Returns 10
UNIT-CALC-010	Subtract	Subtract_FromZero_ReturnsNegativeNumber	                0, 10	            Returns -10
UNIT-CALC-011	Subtract	Subtract_DecimalNumbers_ReturnsExpectedResult	        5.5, 2.25	        Returns 3.25
UNIT-CALC-012	Multiply	Multiply_TwoPositiveNumbers_ReturnsProduct	            10, 5	            Returns 50
UNIT-CALC-013	Multiply	Multiply_ByZero_ReturnsZero	                            10, 0	            Returns 0
UNIT-CALC-014	Multiply	Multiply_NegativeAndPositive_ReturnsNegative	        -10, 5	            Returns -50
UNIT-CALC-015	Multiply	Multiply_TwoNegativeNumbers_ReturnsPositive	            -10, -5	            Returns 50
UNIT-CALC-016	Multiply	Multiply_DecimalNumbers_ReturnsExpectedResult	        2.5, 4	            Returns 10
UNIT-CALC-017	Multiply	Multiply_LargeNumbers_ReturnsOverflowBehavior	    double.MaxValue, 2	    Returns Infinity or agreed overflow behavior
UNIT-CALC-018	Divide	    Divide_TwoPositiveNumbers_ReturnsQuotient	                10, 5	        Returns 2
UNIT-CALC-019	Divide	    Divide_ResultIsDecimal_ReturnsDecimal	                    10, 4	        Returns 2.5
UNIT-CALC-020	Divide	    Divide_NegativeByPositive_ReturnsNegative	                -10, 5	        Returns -2
UNIT-CALC-021	Divide	    Divide_TwoNegativeNumbers_ReturnsPositive	                -10, -5	        Returns 2
UNIT-CALC-022	Divide	    Divide_ZeroByNumber_ReturnsZero	                            0, 5	        Returns 0
UNIT-CALC-023	Divide	    Divide_ByZero_ThrowsException	                            10, 0	        Throws divide-by-zero/domain exception
UNIT-CALC-024	Divide	    Divide_ZeroByZero_ThrowsException	                        0, 0	        Throws divide-by-zero/domain exception


### CalculatorService Unit Tests

TestId	        Function	TestName	                                            Input	                                Expected Behavior
UNIT-SVC-001	Calculate	Calculate_Add_ReturnsResultAndSavesHistory	            "Add", 10, 5	                Returns 15; saves one Add record
UNIT-SVC-002	Calculate	Calculate_Subtract_ReturnsResultAndSavesHistory	        "Subtract", 10, 5	            Returns 5; saves one Subtract record
UNIT-SVC-003	Calculate	Calculate_Multiply_ReturnsResultAndSavesHistory	        "Multiply", 10, 5	            Returns 50; saves one Multiply record
UNIT-SVC-004	Calculate	Calculate_Divide_ReturnsResultAndSavesHistory	        "Divide", 10, 5	                Returns 2; saves one Divide record
UNIT-SVC-005	Calculate	Calculate_InvalidOperation_ThrowsException	            "Power", 2, 3	                Throws unsupported operation exception
UNIT-SVC-006	Calculate	Calculate_NullOperation_ThrowsException	                null, 2, 3	                    Throws validation exception
UNIT-SVC-007	Calculate	Calculate_EmptyOperation_ThrowsException	            "" , 2, 3	                    Throws validation exception
UNIT-SVC-008	Calculate	Calculate_WhitespaceOperation_ThrowsException	        " ", 2, 3	                    Throws validation exception
UNIT-SVC-009	Calculate	Calculate_OperationCaseSensitivity_AsDesigned	        "add", 10, 5	                Either succeeds or throws, based on agreed design
UNIT-SVC-010	Calculate	Calculate_DivideByZero_DoesNotSaveHistory	            "Divide", 10, 0	                Throws exception; history is not saved
UNIT-SVC-011	Calculate	Calculate_LoadsExistingHistoryBeforeAppend	            Existing 2 records, Add 1, 2	Saves 3 records total
UNIT-SVC-012	Calculate	Calculate_AppendsNewRecordAsLatest	                    Existing records, Add 1, 2	    New record appears last/latest
UNIT-SVC-013	Calculate	Calculate_RecordContainsCorrectOperandsResultOperation	"Add", 10, 5	                Saved record has operation, operands, result correctly populated
UNIT-SVC-014	Calculate	Calculate_RecordContainsTimestamp	                    "Add", 10, 5	                Saved record timestamp is set near execution time
UNIT-SVC-015	Calculate	Calculate_WhenRepositoryLoadFails_ThrowsAndDoesNotSave	                                Repository load failure	Exception propagated;   save not called
UNIT-SVC-016	Calculate	Calculate_WhenRepositorySaveFails_ThrowsAfterCalculation	                            Repository save failure	Save exception propagated
UNIT-SVC-017	GetHistory	GetHistory_ReturnsLoadedRecords	                        Repository has records	        Returns same records from repository
UNIT-SVC-018	GetHistory	GetHistory_WhenRepositoryEmpty_ReturnsEmptyList       No records	                    Returns empty list
UNIT-SVC-019	GetHistory	GetHistory_WhenRepositoryLoadFails_Throws	                                            Repository load failure	Exception propagated or handled per design
UNIT-SVC-020	ClearHistory	ClearHistory_SavesEmptyList	Existing records	                                    Calls save with empty list
UNIT-SVC-021	ClearHistory	ClearHistory_WhenAlreadyEmpty_RemainsEmpty	        No records	                    Saves empty list without error
UNIT-SVC-022	ClearHistory	ClearHistory_WhenRepositorySaveFails_Throws	        Save failure	                Exception propagated
                
                
### BDD Integration Tests				
			
                
TestId	        Feature	                    Scenario	                                Input	                      Expected Behavior
BDD-INT-001	    CalculatorHistory	        PersistSuccessfulAdditionCalculation	    Add 10, 5	                  Result is 15; XML contains one Add entry
BDD-INT-002	    CalculatorHistory	        PersistSuccessfulSubtractionCalculation	    Subtract 10, 5	              Result is 5; XML contains one Subtract entry
BDD-INT-003	    CalculatorHistory	        PersistSuccessfulMultiplicationCalculation	Multiply 10, 5	              Result is 50; XML contains one Multiply entry
BDD-INT-004	    CalculatorHistory	        PersistSuccessfulDivisionCalculation	    Divide 10, 5	              Result is 2; XML contains one Divide entry
BDD-INT-005	    CalculatorHistory	        DoNotPersistFailedDivisionByZero	        Divide 10, 0	              Calculation fails; XML remains empty
BDD-INT-006	    CalculatorHistory	        AppendCalculationToExistingHistory	        Existing 1 entry, Add 2, 3    XML contains 2 entries; new entry is latest
BDD-INT-008	    CalculatorHistory	        PreserveCalculationOrder	                Multiple calculations	      XML order is oldest to newest
BDD-INT-009	    CalculatorHistory	        PersistDecimalCalculation	                Add 2.5, 3.25	              XML stores result 5.75
BDD-INT-010	    CalculatorHistory	        PersistNegativeNumberCalculation	        Multiply -10, 5	              XML stores result -50
