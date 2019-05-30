@mod @mod_data @app @javascript
Feature: Users can manage entries in database activities
  In order to populate databases
  As a user
  I need to add and manage entries to databases

  Background:
    Given the following "users" exist:
    | username | firstname | lastname | email |
    | student1 | Student | 1 | student1@example.com |
    | student2 | Student | 2 | student2@example.com |
    | teacher1 | Teacher | 1 | teacher1@example.com |
    And the following "courses" exist:
    | fullname | shortname | category |
    | Course 1 | C1 | 0 |
    And the following "course enrolments" exist:
    | user | course | role |
    | teacher1 | C1 | editingteacher |
    | student1 | C1 | student |
    | student2 | C1 | student |
    And the following "activities" exist:
    | activity | name      | intro        | course | idnumber |
    | data     | Web links | Useful links | C1     | data1    |

  Scenario: Students can add entries to a database in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I should see "No entries in database"
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    Then I should see "https://moodle.org/"
    And I should see "Moodle community site"

  Scenario: Students can navigate along single entries in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    And I enter the app
    And I log in as "student2"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodlecloud.com/" in the app
    And I set the field "Description" to "Moodle Cloud" in the app
    And I press "Save" near "Web links" in the app
    And I press "More" near "Moodle community site" in the app
    And I should see "Moodle community site"
    And I should not see "Next"
    And I should see "Previous"
    And I press "Previous" in the app
    And I should see "Moodle Cloud"
    And I should see "Next"
    And I should not see "Previous"
    And I press "Next" in the app
    And I should see "Moodle community site"
    And I should not see "Moodle Cloud"
    And I press "back" near "Web links" in the app
    And I should see "Moodle community site"
    And I should see "Moodle Cloud"

  Scenario: Students can not edit other user's entries from list view in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    And I enter the app
    And I log in as "student2"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And "Edit" "link" should not exist
    And "More" "link" should exist
    And "Delete" "link" should not exist

  Scenario: Students can not edit other user's entries from single in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    And I enter the app
    And I log in as "student2"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "More" in the app
    And "Edit" "link" should not exist
    And "Delete" "link" should not exist

  Scenario: Students can edit and delete their own entries from list view in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    And I press "Edit" in the app
#    And I click on "Edit" "link"
    And I set the field "URL" to "https://moodlecloud.com/" in the app
    And I set the field "Description" to "Moodle Cloud" in the app
    And I press "Save" near "Web links" in the app
    And I should not see "https://moodle.org/"
    And I should not see "Moodle community site"
    And I should see "https://moodlecloud.com/"
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "Cancel" in the app
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "OK" in the app
    And I should not see "Moodle Cloud"

  Scenario: Students can edit and delete their own entries from single view in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    And I press "More" in the app
    And I press "Edit" in the app
#    And I click on "Edit" "link"
    And I set the field "URL" to "https://moodlecloud.com/" in the app
    And I set the field "Description" to "Moodle Cloud" in the app
    And I press "Save" near "Web links" in the app
    And I should not see "https://moodle.org/"
    And I should not see "Moodle community site"
    And I should see "https://moodlecloud.com/"
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "Cancel" in the app
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "OK" in the app
    And I should not see "Moodle Cloud"
    And I should see "No entries in database"

  Scenario: Teachers can edit and delete students' entries from list view in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    And I enter the app
    And I log in as "teacher1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I should see "https://moodle.org/"
    And I should see "Moodle community site"
    And I press "Edit" in the app
#    And I click on "Edit" "link"
    And I set the field "URL" to "https://moodlecloud.com/" in the app
    And I set the field "Description" to "Moodle Cloud" in the app
    And I press "Save" near "Web links" in the app
    And I should not see "https://moodle.org/"
    And I should not see "Moodle community site"
    And I should see "https://moodlecloud.com/"
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "Cancel" in the app
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "OK" in the app
    And I should not see "Moodle Cloud"

  Scenario: Teachers can edit and delete students' entries from single view in the app
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | URL |
      | Field description | URL link |
    And I add a "Text input" field to "Web links" database and I fill the form with:
      | Field name | Description |
      | Field description | Link description |
    And I log out
#    Jump to the app mode
    When I enter the app
    And I log in as "student1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I press "Add entries" in the app
    And I set the field "URL" to "https://moodle.org/" in the app
    And I set the field "Description" to "Moodle community site" in the app
    And I press "Save" near "Web links" in the app
    And I enter the app
    And I log in as "teacher1"
    And I press "Course 1" near "Course overview" in the app
    And I press "Web links" near "General" in the app
    And I should see "https://moodle.org/"
    And I should see "Moodle community site"
    And I press "More" in the app
    And I should see "https://moodle.org/"
    And I should see "Moodle community site"
    And I press "Edit" in the app
#    And I click on "Edit" "link"
    And I set the field "URL" to "https://moodlecloud.com/" in the app
    And I set the field "Description" to "Moodle Cloud" in the app
    And I press "Save" near "Web links" in the app
    And I should not see "https://moodle.org/"
    And I should not see "Moodle community site"
    And I should see "https://moodlecloud.com/"
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "Cancel" in the app
    And I should see "Moodle Cloud"
    And I press "Delete" in the app
    And I should see "Are you sure you want to delete this entry?"
    And I press "OK" in the app
    And I should not see "Moodle Cloud"
