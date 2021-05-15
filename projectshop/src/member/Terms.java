package member;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class Terms {
   
   private Scanner sc;
   private String terms;
   
   public String getTerms(HttpServletRequest request) throws FileNotFoundException {
      
      ServletContext application = request.getServletContext();
      String path = application.getRealPath("member/terms.txt");
      terms = "";
      
      File f = new File(path); 
      sc = new Scanner(f);
      while(sc.hasNextLine()) {
         terms += sc.nextLine();
      }
      return terms;
   }

}