// Last Minute Valentine's Day Surprise
// 8 Bits and a Byte
// February 2020

// Image Sources
// Heart https://commons.wikimedia.org/wiki/File:Heart_coraz%C3%B3n.svg

// Music Sources
// Beneath The Moonlight - Aaron Kenny
// YouTube Audio Library - https://www.youtube.com/channel/UCVAggfwI4hnkA2WO6-xC06Q

// Bonbon - Google Fonts
// https://fonts.google.com/specimen/Bonbon


// Import libraries and stuff
import ddf.minim.*;

// Declare global variables

Minim minim;
AudioPlayer player;

// Images
PImage face;
PImage nicole;
PImage ted;
PImage heart;

// Positions
int faceX;
int faceY;
float faceScaleX = 5;
float faceScaleY = 5;
int faceImgX;
int faceImgY;
int angle = 0;
int degrees = 0;
boolean scaleUp = true;

// Font
PFont myFont;

// Counters
int mode = 0;
int columnCounter = 0;
int rowCounter = 0;

int wallFaceX;
int wallFaceY;
int wallFaceCounter;

String line1;
String line2;
String line3;


// Edit the things here to customize the animations
void customSetup() {

  // Add the name of a custom face image file here
  face = loadImage("TedFace.png");

  // Add the name of a custom music file here
  player = minim.loadFile("Beneath_the_Moonlight.mp3");

  // Add a custom font here
  myFont = createFont("Bonbon-Regular.ttf", 200);

  // Edit the secret message that will be displayed
  line1 = "Hi Dane";
  line2 = "Vote for me!";
  line3 = "#Toaster2020";
}

void setup() {

  //size(1920, 1080);
  
  fullScreen();

  minim = new Minim(this);

  customSetup();

  heart = loadImage("heart.png");

  background(245, 125, 183);

  faceImgX = face.width;
  faceImgY = face.height;


  imageMode(CENTER);
  faceX = width/2;
  faceY = height/2;
  wallFaceX = 0;
  wallFaceY = 0;
}


void draw() {
  // Play the music file
  player.play();

  // Display one of the 4 animations
  // Depending on the selected mode
  switch(mode) {
  case 0:
    wheelOfLove();
    break;

  case 1:
    headsOfLove();
    break;

  case 2:
    loveMessage();
    break;

  case 3:
    wallOfLove();
    break;
  }
}

// When the mouse is clicked in the Processing window
void mouseClicked() {

  // Set the background colour to a nice shade of pink
  background(245, 125, 183);

  // Move on to the next display mode
  mode++;

  // If the mode is higher than 3
  // Go back to mode 0 
  if (mode > 3) {
    mode = 0;
  }
}

// Wheel Of Love Animations
void wheelOfLove() {

  // Set the background colour to a nice shade of pink
  background(245, 125, 183);
  
  // Create 6 circles of hearts
  for (int j = 0; j < 6; j++) {
    
    // Calculate the number of hearts per circle
    int numberOfHearts = 6 + (j * 6);
    
    // Calculate the angle difference between the hearts in one circle
    int angleDiff = 360 / numberOfHearts;

    // If the circle number is an even number
    // The hearts move counterclockwise
    if (j%2 == 0) {
      degrees = - degrees;
    } 
    // Otherwise the hearts will move clockwise
    else {
      degrees = abs(degrees);
    }

    // Draw the hearts in the circle
    for (int i = 0; i < numberOfHearts; i++) {
      // Calculate the position of the heart
      // Based on the angle
      float degreesInRadians = radians(degrees + i * angleDiff);
      int x = round(width /2 + cos(degreesInRadians) * (150 + j * 100) );
      int y = round(height /2 + sin(degreesInRadians) * (150 + j * 100 ));
      // Draw the heart image
      image(heart, x, y, 50, 50);
    }
  }
  
  // If the hearts have rotated 360 degrees
  // Reset the number of degrees back to 0
  if (degrees == 360) {
    degrees = 0;
  } else {
    // Otherwise add a degree
    degrees++;
  }

  
  // If the scaling factor of the face is smaller than 1
  // Scale the image back up
  if (faceScaleX < 1.0) {
    scaleUp = true;
  } 

  // If the scaling factor is bigger than 5
  // Scale the image down
  if (faceScaleX > 5) {
    scaleUp = false;
  }



  // If the face image doesn't need to be scaled up
  // Scale it down
  if (scaleUp == false) {
    faceScaleX = faceScaleX - 0.05;
    faceScaleY = faceScaleY - 0.05;
  }

  // If the face image needs to be scaled up
  // Scale it up
  if (scaleUp == true) {
    faceScaleX = faceScaleX + 0.05;
    faceScaleY = faceScaleY + 0.05;
  }

  // Draw the face image in the middle of the window
  // At the correct scale
  image(face, faceX, faceY, faceImgX /faceScaleX, faceImgY/faceScaleY);
}

// Heads Of Love Animations
void headsOfLove() {
  // Calculate a random x  position
  // Between 0 and the width of the screen
  float randomX = random(width);
  
  // Calculate a random y position
  // Between 0 and the height of the screen
  float randomY = random(height);
  
  // Draw the face image at this randomly selection x,y position
  image(face, randomX, randomY, face.width/2, face.height/2);
}


// Secret Love Message Animations
void loveMessage() {
  
  // Calculate a random x  position
  // Between 0 and the width of the screen
  float randomX = random(width);
  
  // Calculate a random y position
  // Between 0 and the height of the screen
  float randomY = random(height);
  
  // Calculate a random blue colour value
  // Between 0 and 255
  float blue = random(255);
  
  // Remove the stroke
  noStroke();
  
  // Set the fill to a shade of red
  fill(255, 0, blue);
  
  // Draw a red/purple coloured circle at the randomly selected position
  ellipse(randomX, randomY, 50, 50);
  
  // Set the text font to the font chosen above
  textFont(myFont);
  
  // Set the text colour to the same colour as the background
  // So the message is not visable
  fill(245, 125, 183);
  
  // Set the text align to the center
  textAlign(CENTER, CENTER);
  
  // Write the texts chosen above
  // In the middle of the screen
  text(line1, width/2, height/2 - 300);
  text(line2, width/2, height/2);
  text(line3, width/2, height/2 + 300);
}

// Wall Of Love Animations
void wallOfLove() {
  
  // Draw the face image 
  image(face, wallFaceX, wallFaceY, face.width/4, face.height/4);

  // If the x position of the face is larger than the width of the window
  if (wallFaceX > width) {
    // Adjust the y position down to start a new row
    wallFaceY += face.height /6;
    // Set the x position back to 0
    wallFaceX = 0;
  } 
  // If the y position of the last face is larger than the height of the window
  else if (wallFaceY > height) {
    // Set new random x and y starting positions between 0 and 10
    wallFaceY = round(0 + random(10));
    wallFaceX = round(0 + random(10));
  } else {
    // Otherwise increase the x position with 1/6 of the width of the face image
    wallFaceX += face.width/6;
  }
  
  // Increase the number of times a face has been drawn
  wallFaceCounter++;
  
  
  // Calculate a random x  position
  // Between 0 and the width of the screen
  float randomX = random(width);
  
  // Calculate a random y position
  // Between 0 and the height of the screen
  float randomY = random(height);
  
  // Draw the heart image at the random position
  image(heart, randomX, randomY, heart.width/15, heart.height/15);
}
