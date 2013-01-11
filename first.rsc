module duplication::CheckDuplication

import Type;
import Prelude;
import List;
import reader::Reader;



/* Method to remove the Comment and White Lines of a file
   @param file the file where the white lines should get removed
   @return file the file without comment and white lines
   @author Philipp
*/
public list[str] removeCommentsAndWhiteLinesFromFile(list[str] file){
  list[str] fileWithout = removeWhiteLinesFromFile(file);
	fileWithout = removeCommentsFromFile(fileWithout);
	return fileWithout;
}

/* Method to remove the White Lines of a file
   @param file the file where the white lines should get removed
   @return file the file without white lines
   @author Philipp
*/
public list[str] removeWhiteLinesFromFile(list[str] file){
  list[str] fileWithoutWhiteLines = [];
  for(int i <- [0..(size(file) - 1)]){
      if(/^[ \t\r\n]*$/ := file[i]){
          print("");
       } else {
       	  fileWithoutWhiteLines += file[i] ;       	 
       }       
      } 
      return fileWithoutWhiteLines;
}

/* Method to remove the Comment Lines of a file
   @param file the file where the comment lines should get removed
   @return file the file without comment lines
   @author Philipp
*/
public list[str] removeCommentsFromFile(list[str] file){
  list[str] fileWithoutWhiteLines = [];
  for(int i <- [0..(size(file) - 1)]){
      if(/((\s|\/*)(\/\*|\s\*)|[^\w,\;]\s\/*\/)/ := file[i]){
          print("");
       } else {
       	  fileWithoutWhiteLines += file[i] ;       	 
       }       
      } 
      return fileWithoutWhiteLines;
}

public void checkCodeDuplicationInOneFile(list[str] file)
{
	//int count =0;
	//bool check=true;
	list[str] duplicates = removeCommentsAndWhiteLinesFromFile(file);
	for(s <- duplicates){
	println("file:<s>");
		}	
}
	
	//if (count < size(file)){
	//check=true;}
	//else 
	//(check==false);
		
//	if(check==true){
//	println("still going");
//	count++;}
//	else println("the end!!");
//}

public void checkDuplicationProject(list[loc] project){
	for(s <- project){
		list[str] file = readProjectFileAsArray(s.top);
		checkCodeDuplicationInOneFile(file);
		}
}
