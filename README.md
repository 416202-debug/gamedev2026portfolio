# Sarah Zhang's Game Dev Portfolio 

## Term 1 Projects

### SpaceCat

![SpaceCat](https://github.com/416202-debug/gamedev2026portfolio/blob/main/images/spacegame.png?raw=true)

[Link for Source Code](https://github.com/416202-debug/gamedev2026portfolio/tree/main/src/SpaceCat)

#### Game Overview
Object Oriented game using images and sounds with multiple levels and powerups...

#### How to Run
Built with Processing.
Processing version: 4.0.1
Main sketch and project folder: SpaceGame.pde
Required libraries: gifAnimations, Sound


#### Controls
Move mouse to control movement.
Click mouse to shoot laser.

#### Three Power-Up Types
1. Health — Add the amount of health shown. Max is 200
2. Laser Harm — The harm caused by the laser increases by 10
3. Wind — Rock max speed decreases by 1, minimum 5. Starts at 10


#### My Chosen Additional Systems
Choose at least two:
- Levels
- Boss
- Firing


#### Testing
Feature : PowerUps
Steps : Catch Each of the powerups to see results
Expected Result: powerups should function correctly, causing the correct outcomes depending on the type.
 Actual Result: powerups do function correctly, causing the correct outcomes depending on the type.
 Pass / Needs Work:
None

Feature: Enemy firing
 Steps: catch lasers from the enemy
Expected Result: health decrease
 Actual Result: the ship health does decrease
 Pass / Needs Work: none

Feature: Defeat boss
 Steps : defeat the boss
Expected Result: score increases
 Actual Result: does increase
 Pass / Needs Work: None

Feature: Move between levels
 Steps : break 10 rocks
Expected Result: boss comes out
 Actual Result: the boss does come out
 Pass / Needs Work: None

Feature: Statistics
 Steps : play the game while checking the stats displayed.
Expected Result: Stats are displayed correctly and change correctly
 Actual Result: stats are correctly displayed and updated.
 Pass / Needs Work: None


#### Project Files and Assets
Main Sketch: SpaceGame.pde

Image Files:
- Boss image: Boss.png
- Game over screen: eb.png
- Harm power up image: harm.png
- Health power up image: health.png
- Laser image: laser.png
- Player image: player.gif
- Game play background: rb.gif
- Rock images: Rock1.png, Rock2.png
- Start screen: sb.png

  
Audio Files:
- Sound for laser hitting object(both player and enemy lasers): enemyhit.mp3
- Sound for collision between rock and player: impact.mp3
- sounds for laser firing: laser1.mp3 (old version), laser2.mp3
- sound for breaking the rock: rockbreak.mp3


Asset credits:
 Graphics: All original
 Sounds: From Pixabay


#### Next Development Task
Develop data saving between program runs
