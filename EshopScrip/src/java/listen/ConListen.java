/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package listen;

/**
 *
 * @author marina
 */
import javax.servlet.*;

public class ConListen implements ServletContextListener{
   
    @Override
    public void contextInitialized(ServletContextEvent event) {
    
        ServletContext sc = event.getServletContext();

        String CafePr = sc.getInitParameter("CafePr");
        String SugarPr = sc.getInitParameter("SugarPr");
        String WaterPr = sc.getInitParameter("WaterPr");
        Handler Cafe = new Handler(CafePr);
        Handler Sugar = new Handler(SugarPr);
        Handler Water = new Handler(WaterPr);
        sc.setAttribute("cafe", Cafe);
        sc.setAttribute("sugar", Sugar);
        sc.setAttribute("water", Water);
        
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent event) {
		//nothing here
    }
}

