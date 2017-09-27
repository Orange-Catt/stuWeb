package listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ServletContext application=se.getSession().getServletContext();
		//if (application.getAttribute("set") == null) {
			//Set<String> set = new HashSet<String>();
			//application.setAttribute("set", set);
		//}
		int num = 0;
		if (application.getAttribute("num") != null) {
			num = (Integer) application.getAttribute("num");
		}
		//String ip = request.getRemoteAddr();
		//System.out.println("ip:" + request.getRemoteAddr());
		//Set<String> set = (Set<String>) application.getAttribute("set");
		//boolean flag = set.add(ip);
		//if (session.isNew()) {
		if (se.getSession().isNew()) {
			num++;
		}
		application.setAttribute("num", num);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
