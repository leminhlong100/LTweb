package controller.client.products;

import com.google.gson.JsonArray;
import dao.client.AuthDAO;
import dao.client.ProductDAO;
import entity.Account;
import entity.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
@WebServlet("/Showmorecontrol")
public class ShowmoreControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String number = request.getParameter("num");
           HttpSession session = request.getSession();
            String pid = request.getParameter("pid");
            List<Comment> show=  ProductDAO.showmore(Integer.parseInt(pid),Integer.parseInt(number));



            Gson gson = new Gson();


            JsonObject jsonobj = new JsonObject();
            jsonobj.addProperty("showmore",gson.toJson(show));


            response.getWriter().println(gson.toJson(jsonobj));

        }catch (Exception e ){
            e.printStackTrace();

        }

    }
}
