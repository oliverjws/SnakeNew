//an array holds multiple variables, identifies the variable type will be an integer array, this array has 2000 elements incase the snake gets super long. 

int [] bodx = new int [2000];
int [] body = new int [2000];
//food can be anywhere location on the grid. Can only be int
//as snake couldn't eat if float - could be placed anywhere inc decimal point.
int foodx = int(random(width/20))*20; 
int foody = int(random(height/20))*20;
//size of snake at start of game
int bodySize = 6;

void setup()
{
  bodx[0] = 200; //starting location
  body[0] = 200;
  size (400, 400);
  background (255);
  frameRate (20); //increase to make harder.


}

void draw()
{
  background (255); 
  
   if (bodx[0] == foodx && body[0] == foody)//if the snake is eating food
  {
     bodySize += 2; //then body increases by 2 squares if snake eats.
     foodx = int (random (20)) *20; //moves food
     foody = int (random (20)) *20;
  } 
  
   for(int i=bodySize; i>0; i--) //gets snake top in location 
   {
   bodx[i] = bodx[i-1] ; //this makes sure all the snake parts are together. Bottom follows top.
   body[i] = body[i-1] ;
   }
   for(int i=0; i<bodySize; i++) //inserts rest of snake squares.  
  {
   rect (bodx[i], body[i], 10, 10); //snake 
   fill(0,random (255) ,0); //food colour
  }
 
  if (key == CODED)
  {
  
    if (keyCode == RIGHT) //snake goes right when arrow is pressed
    {
      bodx[0] = bodx[0]+10;
      if (bodx[0] > 400) //if snake goes passed 600
        {
          bodx[0] = 0; //it emerges at 0
        }
    }
    if (keyCode == LEFT) 
    {
      bodx[0]= bodx[0]-10;
      if (bodx[0] <0)
      {
        bodx[0]= 400;
      }
      
    }
    if (keyCode == UP) //snake goes up when arrow is pressed
    {
     body[0] = body[0]-10;
     if (body[0] <0) //if snake goes passed 0
     {
       body[0] = 400; //then it emerges at 600
     }
    }
    if (keyCode == DOWN) 
    {
      body[0] = body[0]+10; 
      if (body[0]> 400) 
      {
        body[0] = 0; 
      }
    }
  }
  food ();
  }
 void food ()
  {
   stroke(0); //outline
   fill(random (255), 0 ,0); //food colour
   rect (foodx, foody, 10, 10); // where food is
  }  



