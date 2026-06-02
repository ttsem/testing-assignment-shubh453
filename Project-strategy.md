### Test Project Structure

Calculator.sln
 ├─ Calculator.Core
 │   ├─ Interfaces
 │   ├─ Models
 │   └─ Services
 │
 ├─ Calculator.Infrastructure
 │   └─ XmlHistoryRepository.cs
 │
 ├─ Calculator.UnitTests
 │   ├─ CalculatorTests.cs
 │   ├─ CalculatorServiceTests.cs
 │   └─ TestDoubles
 │
 └─ Calculator.IntegrationTests
     ├─ Features
     │   ├─ CalculatorHistory.feature
     │   ├─ XmlHistoryRepository.feature
     │   └─ CalculatorService.feature
     │
     ├─ StepDefinitions
     │   ├─ CalculatorHistorySteps.cs
     │   ├─ XmlHistoryRepositorySteps.cs
     │   └─ CalculatorServiceSteps.cs
     │
     ├─ Hooks
     │   └─ TestFileHooks.cs
     │
     ├─ Helpers
     │   ├─ TempFileFixture.cs
     │   └─ XmlAssertionHelper.cs
     │
     └─ TestData
         ├─ SampleHistory.xml
         └─ InvalidHistory.xml

### Project Dependencies

Calculator.UnitTests
    - References
        - Calculator.Core
    - Packages
        - NUnit
        - Moq
        - FluentAssertions

Calculator.IntegrationTests (BDD integration tests)
    - References
        - Calculator.Core
        - Calculator.Infrastructure
    - Packages
        - SpecFlow
        - SpecFlow NUnit
        - FluentAssertions

### Test Inventory

