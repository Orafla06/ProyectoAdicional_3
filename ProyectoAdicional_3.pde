import gab.opencv.*;
import processing.video.*;
import java.awt.*;
PImage blinky;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  blinky = loadImage("blinky.png");

  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);

  video.start();
}

void draw() {
  background(0);
  scale(2);
  opencv.loadImage(video);
  tint(mouseY,mouseX,mouseX,mouseY);
  image(video, 0, 0 );

  noStroke();
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(blinky,faces[i].x+faces[i].width*(-0.95), faces[i].y+faces[i].height*(-0.7), faces[i].width*2.9, faces[i].height*1.9);
  }
  fill(0,80);
  rect(0,216,width,20);
  fill(255);
  text ("Mueve el cursor sobre la ventana",70,230);
}

void captureEvent(Capture c) {
  c.read();
}