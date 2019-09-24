package com.soccer.web.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.soccer.web.domain.PlayerBean;
import com.soccer.web.serviceimpl.PlayerServiceImpl;
@WebServlet("/player.do")
public class PlayerController extends HttpServlet {
     private static final long serialVersionUID = 1L;
     
     protected void doGet(HttpServletRequest request,  HttpServletResponse response)throws ServletException,  IOException {
           PlayerBean player = null;
           String action = request.getParameter("action");
           System.out.println("컨트롤러 액션"+action);
     
           switch(action) {
           case "move" :
           break;
           case "find2":
        	   request.setAttribute("positions", PlayerServiceImpl.getInstance().findPositions());
        	   System.out.println("컨트롤러2번"+player);
               break;
           case "findinfo" :
                player = new PlayerBean();
                player.setTeamId(request.getParameter("teamId"));
                player.setPosition(request.getParameter("position"));
                player.setPlayername(request.getParameter("playername"));
                request.setAttribute("player",PlayerServiceImpl.getInstance().findByTeamIdPosition(player));
                System.out.println("컨트롤러4번"+player);
           break;
           case "findinfo2" :
                player = new PlayerBean();
                player.setTeamId(request.getParameter("teamId"));
                player.setHeight(request.getParameter("height"));
                player.setPlayername(request.getParameter("playername"));
                request.setAttribute("players", PlayerServiceImpl.getInstance().findByTeamIdHeightName(player));
                break;
           }
           
           String page = request.getParameter("page");
           System.out.println("컨트롤러 페이지"+page);
           RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/view/"+page+".jsp");      
           rd.forward(request, response);
     }
     
}