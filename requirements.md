# Object Oriented Ruby CLI Scraping Project checklist

CLI:
- [X] Provides an interface with the application (What is your domain?)
    My domain is Plant Cli, Plant Scraper, Plant Info Scraper. These provide information about what plants are toxic to cats.

- [X] Pulls data from an external source (What are you grabbing/scraping on your first pass? What web page are you using? )
    ASPCA page on plants and animals: "https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants"
    I am grabbing the information page that corresponds with the letter of the alphabet chosen by the user.

- [X] Provides the user with a list to make a selection (What are you listing?)
    After the user chooses a letter of the alphabet, I list the names of plants that start with that letter, numbered in alphabetical order.

- [X] Protects against invalid user input then outputs additional instructions (What happens when user input a number instead of a letter or vice versa?)
  If upon the initial pass, the user puts in something other than a letter, the program outputs that the user should choose a letter from A-Z and try again. Since there are no plants starting with Q, X, or Z, the user also gets an error message if they choose those letters.
  In the second pass, if the user enters in something other than a number or a number that does not correspond to a plant, the user also receives an error message and is prompted to try again.

- [X] Pulls more data a 2nd time (What are you grabbing/scraping on your second pass? Are you going back to the same page or looking at a new one?)
    On the second pass, the program provides information to the user after the user enters in a number corresponding to the plant they are looking for.
    I am going to a different page using the same base url.

- [X] Provides more data after the user makes a selection (What more specifically are you showing the user after your second pass?)
    I am showing the additional common names, scientific name, and the clinical signs that the cat has been poisoned by a particular plant.

- [X] Provides a README.md with a short description, installation and execution instructions


Confirm:
- [X] Application uses Ruby Objects to communicate (and not global methods)
- [X] The application is generally DRY
- [ ] Conforms to Nitro Ruby linting rules (Run `rubocop` on your project root directory and confirm it returns with 'no offenses detected'.)
- [X] You have committed frequently
- [X] The message you write in each commit specifically relates to its code changes

