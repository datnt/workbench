# BackEnd Challenge 002

For us, it's not all about an outstanding CV or a long list of qualifications. We are far more interested in your approach when faced with a concrete challenge. What is your way of thinking? How do you tackle the problem? Which tools do you choose?

In order to gauge these qualities, we have created a challenge for you to complete. This is a simplified case which illustrates the kinds of situations we have to deal with on a daily basis.
This challenge is an opportunity to demonstrate your capabilities and to show us your coding craftsmanship.

There are no time limitations, but our suggestion is that you spend no more than a few hours completing the challenge.
We are not after a bullet-proof solution. What is important is a clean, maintainable and intuitive result.

Create it in your own way and use the tools you are most comfortable with. Show us your skills!

## Challenge Description

### It's a Matter of Survival

The human population is quickly overwhelming the Earth's resources. We must find a solution to control the exponential growth of human beings.
The Governments of the world, along with the most intelligent people on the planet, have found a solution.

Every person, upon reaching their twentieth birthday, has to compete in a live or die fight against another fellow.
The competition has been designed using a systematic process to select the most skilled individuals of our society based on their intelligence, agility and strength.

The competition is called **Rock-paper-scissors-lizard-Spock** - here are the [rules](http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock).

### The Court

You are in charge of implementing the interface that every person has to use to fight for her survival.

#### Initialize The Game

The Player enters in a web site and she can choose between:

1. Generate a new Game (The system will offer a UUID for the new Game)
1. Compete in a Game that is _waiting for an adversary_ (the Player inserts the UUID of the Game)

Then the Player creates a list of **10 moves**. For each one the Player can choose one of the following options:

- rock
- paper
- scissors
- lizard
- spock

#### Waiting for an adversary (Only if the Player has generated a new Game)

The system will store the Game configuration and will keep it until an adversary chooses to fight against this Game.

#### Combat

Once the system detects a _match_ it executes the competition and stores the results.

#### Results

Both Players can see the results and prepare themselves for a long life or... impending death.

### Implementation Notes

We know this project would typically employ a websocket based implementation, but this is excessive for the purpose of this challenge.
In the _Waiting for an adversary_ page you can just expose a _refresh!_ button so the Player can click on it to ask the system if there are already results for this Game.. or you can implement a _X seconds_ authomatically refresh.. or an _Ajax_ solution.

- Please check the [wireframes](https://docs.google.com/drawings/d/1wM8Ex2zA7jUnGVicF8wqRLypkzr9QzdPCCZD1rhQhHQ/edit?usp=sharing)
- Please check the [workflow diagram](https://docs.google.com/drawings/d/12aS34CFiJHVNm0uGAIzMnD7_dqKdkvLxy0ytJkanysM/edit?usp=sharing)

This _wireframes_ and _workflow diagram_ are a very minimal explanation, please feel free to add/remove/modify anything on your own.

Please don't get caught up trying to implement the perfect solution, we are interested in the most simple and functional solution. We expect the final delivery to be stable, so focus on simplifying the functionalities to allow a working solution to be developed in a few hours.

### Programming Requirements

The backend must be Ruby. The frameworks, gems, and databases are all up to you.

For the frontend, we appreciate if it looks human friendly, but it is not necessary to be fancy. (There are a lot of OpenSource/Free templates and HTML/CSS frameworks that do a good job.)

### What We Assess

- Legible, understandable, clean and maintainable code
- Wisely choosen tools, techniques and/or frameworks

## Submission Instructions

1. Fork this project
1. Complete the task and push on your own fork. (Nice, atomic and iterative commits are welcome)
1. Include instructions of how we can make it to work
1. Submit a pull request
1. Send an email to hr@daliaresearch.com to review your solution

And, of course, don't hesitate to **contact us with any questions** you have. Send all your technical queries to: [it@daliaresearch.com](mailto:it@daliaresearch.com)
