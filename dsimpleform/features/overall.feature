Feature: Post a new Product
    Scenario: Open new product page
        Given I open new product site
        When I input new product
        Then I should see the product created confirmed