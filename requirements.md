# Object Oriented Ruby CLI Scraping Project checklist

CLI:
- [X] Provides an interface with the application (What is your domain?)
    Our domain is Plant Cli, Plant Scraper, Plant Info Scraper. These provide information about what plants are toxic to cats.
- [X] Pulls data from an external source (What web page are you using?)
    ASPCA page on plants and animals: "https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants"
- [X] Provides the user with a list to make a selection (What are you listing?)
    Allows user to choose from list of plants by putting in the first letter of the plant, then selecting the number associated with the plant (plants are listed in alphabetical order).
- [X] Pulls more data a 2nd time (What are you grabbing on your second pass? Are you going back to the same page or looking at a new one?)
    On the first pass, the program grabs the plants that start with the letter that was entered by the user. On the second pass, the program grabs additional plant information to show to the user.
    The first page lists the plants; the second page lists specific information about each plant.
- [X] Provides more data after the user makes a selection (What are you showing the user after your second pass?)
    On the second pass, the program provides information to the user after the user enters in a number corresponding to the plant they would like to get more information on.

Confirm:
- [X] Application uses Ruby Objects to communicate (and not global methods)
- [ ] The application is generally DRY
- [ ] Conforms to Nitro Ruby linting rules (Run `rubocop` on your project root directory and confirm it returns with 'no offenses detected'.)
- [ ] You have committed frequently
- [ ] The message you write in each commit specifically relates to its code changes

README.md contains:
- [ ] A short description
- [ ] Installation & execution instructions
