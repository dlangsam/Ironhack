
window.onload = function() {

// the following code adds event listeners to the buttons
// you'll learn more about this later
// for this exercise, you are going to write the functions for
// what happens when the user clicks on the buttons.
  var saveButton = document.getElementById('save-button');
  saveButton.addEventListener('click', addToDoItem, false);

  var doneButton = document.getElementById('done-button');
  doneButton.addEventListener('click', markAsDone, false);


  function addToDoItem() {
    var toDo = document.getElementById("todo-input").value;
    var toDoListItem = document.createElement('li');
    toDoListItem.innerHTML = toDo;

    var list = document.getElementsByClassName("todo-list-items")[0];
    var items = list.childNodes;
    //var items = list.querySelectorAll('li');
    var lastItem = items[items.length - 1];
    lastItem.parentNode.insertBefore(toDoListItem, lastItem.nextSibling);
    document.getElementById("todo-input").value = "";
    
  }

  function markAsDone() {

     var firstItem = document.querySelector('li:nth-of-type(1)');
     var doneList = document.getElementsByClassName("done");
     doneList[0].parentNode.insertBefore(firstItem, doneList[0]);
     firstItem.classList.add("done");
    doneButton.classList.add('liked');
    doneButton.innerHTML = "Liked!";
    document.querySelector('h1').style.color = "red";
  }
  
}
