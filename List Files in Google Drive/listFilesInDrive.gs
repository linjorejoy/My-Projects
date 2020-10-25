/** @OnlyCurrentDoc 
* Created by LINJO REJOY on 08/05/2020  
*
* This Script will fo through your drive and make a tree of all the files present in your drive
* 
* 
* Can also be used to retrieve tree of all files from selected folder
* For this copy the id of the folder and paste in place of "id_of_the_required_folder"
*
*
* Also if there are no files inside a folder it wont show up in the tree
*
* Enjoy...
*/


function onOpen() {
  SpreadsheetApp.getUi().createMenu('Make New Tree')
  .addItem('From Root Folder', 'fromRootFolder')
  .addItem('Select Folder By Id', 'fromSelectedFolderById')
  .addItem('Select Folder By Name', 'fromSelectedFolderByName')
  .addToUi();
}

function fromRootFolder(){
  myFunction(DriveApp.getRootFolder());
}

function fromSelectedFolderById(){
  var ui = SpreadsheetApp.getUi();
  let result = ui.prompt(
      'Tree will be Generated from a folder',
      'What is the folder id',
      ui.ButtonSet.OK_CANCEL);
  var folder = DriveApp.getFolderById(result.getResponseText());
  myFunction(folder);
}

function fromSelectedFolderByName(){
  var ui = SpreadsheetApp.getUi();
  var result = ui.prompt(
      'Tree will be Generated from a folder',
      'What is the folder Name(Case-Sensitive)',
      ui.ButtonSet.OK_CANCEL);
  var folders = DriveApp.getFoldersByName(result.getResponseText());
  var folder = folders.next();
  myFunction(folder);
}

function myFunction(folder) {
  var rootFolder = folder;
  var spreadSheet = SpreadsheetApp.getActive();
  var userName = spreadSheet.getOwner().getEmail().split("@")[0];
  var ss = spreadSheet.getActiveSheet();
  
  var currDateTime = new Date();
  var currentTime = currDateTime.toLocaleTimeString();
  var currentDate = currDateTime.toLocaleDateString();
  var ss = SpreadsheetApp.getActive().insertSheet(userName + " " + currentDate + " " + currentTime);
  var startRow = 1;
  var startColumn = 2;
  var totalRows = searchInFolders(rootFolder,ss,startRow,startColumn);
  ss.getRange(startRow,startColumn-1).setValue(rootFolder.getName());
  Logger.log(totalRows);
}



function searchInFolders(currFolder,activeSheet,indexRow,indexColumn){
  var folders = currFolder.getFolders();
  var files = currFolder.getFiles();
  var currRow = indexRow;
  var countOfFolders = 0;
  while(folders.hasNext()){
    var folder = folders.next();
    activeSheet.getRange(indexRow,indexColumn++).setValue(folder.getName());
    indexColumn--;
    indexRow = searchInFolders(folder, activeSheet, indexRow, indexColumn+1);
  }
  
  var fileArray = [];
  while(files.hasNext()){
    var file = files.next();
    var fileDetails = [file.getName(), file.getSize()];
    fileArray.push(fileDetails);
  }
  if(fileArray.length > 1){
    activeSheet.getRange(indexRow,indexColumn,fileArray.length,fileArray[0].length).setValues(fileArray);
    indexRow+=fileArray.length;
  }
  
  if(indexRow-currRow>1){
    activeSheet.getRange(currRow,indexColumn-1,indexRow-currRow,1).merge();
  }
  return indexRow;
}

