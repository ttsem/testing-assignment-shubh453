Feature: Calculator service with XML persistence
  As a calculator user
  I want calculations to be saved automatically
  So that my history is available later

  Scenario: Calculate addition and persist it to XML
    Given the calculator service uses a real XML history repository
    And the calculation history file is empty
    When I calculate "Add" with operands 10 and 5
    Then the calculation result should be 15
    And the XML history file should contain an entry for "Add"

  Scenario: Retrieve persisted history
    Given the XML history file contains:
      | Operation | Operand1 | Operand2 | Result |
      | Multiply  | 4        | 5        | 20     |
    When I request calculation history
    Then the returned history should contain 1 entry
    And the returned history should include operation "Multiply"

  Scenario: Clear persisted history
    Given the XML history file contains:
      | Operation | Operand1 | Operand2 | Result |
      | Add       | 10       | 5        | 15     |
    When I clear calculation history
    Then the returned history should be empty
    And the XML history file should contain no entries