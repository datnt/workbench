Feature: View page with images
    Scenario: Open show product page
        Given I open show product site
        When I Click on load image button
        Then I should see all the images load successfully