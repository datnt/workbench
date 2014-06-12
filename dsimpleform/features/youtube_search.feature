#Feature: Search for Videos on YouTube
#       Scenario: Search for Videos of Large Rodents
#           Given I am on the YouTube home page
#           When I search for "capybara"
#           Then videos of large rodents are returned
Feature: Post a new Product
    @javascript
    Scenario: Open new product page
        Given I open new product site
        When I input new product
        Then I should see the product created confirmed