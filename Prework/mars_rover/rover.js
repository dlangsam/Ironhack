var myRover = {
  position: [0,0], //this is where the rover initially lands
  direction: 'N',
  name: "Rover1"
};

var myRover2 = {
  position: [8,9], 
  direction: 'N',
  name: "Rover2"
};
var myName = "devorah";
var myArray = [];
for(var i = 0; i < 10; i++){
  var myArray2 = [];
  for(var j = 0; j < 10; j++){
    myArray2.push(0);
  }
  myArray.push(myArray2);
}

myArray[1][8] = "lake";
myArray[3][2] = "volcano";
myArray[4][4] = "valley";
myArray[5][4] = "valley";
myArray[7][3] = "crater";
function keepInBounds(rover){
 for(var i in rover.position){
  if(rover.position[i] === -1){
    rover.position[i] = 9;
  }else if(rover.position[i] === 10){
    rover.position[i] = 1;
  }
 }
}
function goForward(rover) {
  var x = rover.position[0];
  var y = rover.position[1];
  switch(rover.direction) {
    case 'N':
      rover.position[0]++;
      break;
    case 'E':
      rover.position[1]++;
      break;
    case 'S':
      rover.position[0]--;
      break;
    case 'W':
      rover.position[1]--;
      break;
  };

  keepInBounds(rover);
  var location = myArray[rover.position[0]][rover.position[1]];
    myArray[x][y] = 0;
  if(location !== 0){
    goBack(rover);
    return location;
  }else{
  
    myArray[rover.position[0]][rover.position[1]] = rover.name;
    return "success";
  }
}

function goBack(rover) {
  var x = rover.position[0];
  var y = rover.position[1];
    switch(rover.direction) {
      case 'N':
        rover.position[0]--;
        break;
      case 'E':
        rover.position[1]--;
        break;
      case 'S':
        rover.position[0]++;
        break;
      case 'W':
        rover.position[1]++;
        break;
  };
keepInBounds(rover);
var location = myArray[rover.position[0]][rover.position[1]];
  myArray[x][y] = 0;
  if(location !== 0){
    goForward(rover);
    return location;
  }else{
    
    myArray[rover.position[0]][rover.position[1]] = rover.name;
    return "success";
  }
}

  function turnLeft(rover){
    switch(rover.direction) {
    case 'N':
      rover.direction = 'W';
      break;
    case 'E':
      rover.direction = 'N';
      break;
    case 'S':
      rover.direction = 'E';
      break;
    case 'W':
      rover.direction = 'S';
      break;
  };

  
  }

   function turnRight(rover){
    switch(rover.direction) {
    case 'N':
      rover.direction = 'E';
      break;
    case 'E':
      rover.direction = 'S';
      break;
    case 'S':
      rover.direction = 'W';
      break;
    case 'W':
      rover.direction = 'N';
      break;
  };
  }

  function executeDirections(rover, directions){
    for (var i in directions){
      var instruction = directions.charAt(i);
      var location = 'success';
      switch(instruction){
        case 'f':
          location = goForward(rover);
          break;
        case 'b':
          location = goBack(rover);
          break;
        case 'r':
          turnRight(rover);
          break;
        case 'l':
          turnLeft(rover);
          break;
        default:
          break;
      }
      if(location !== 'success'){
        console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]. Stopped by " + location + ".");
        return;
      }
    
    }
    console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]. Mission completed successfully.");

  }

executeDirections(myRover, 'frfffffffffffff');
executeDirections(myRover, 'rffflbbllb');
executeDirections(myRover2, 'lfff');
executeDirections(myRover, 'frfrfflbbb');

  