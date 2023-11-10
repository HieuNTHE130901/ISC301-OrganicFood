package controller;


import dal.CategoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;


public class HomeController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        final int PAGE_SIZE = 15;

        List<Category> listCategories = new CategoryDBContext().getAllCategories();
        request.setAttribute("listCategories", listCategories);
        request.getSession().setAttribute("listCategories", listCategories);
        
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        ProductDBContext productDAO = new ProductDBContext();
        List<Product> listProducts = productDAO.getProductsWithPaging(page, PAGE_SIZE);
        String type = (String) request.getSession().getAttribute("curSort");
        if(type!=null){
            listProducts = productDAO.getProductsWithPagingAndSort(page, PAGE_SIZE, type);
        }
        int totalProducts = productDAO.getTotalProducts();
        int totalPage = totalProducts / PAGE_SIZE; //1
        if (totalProducts % PAGE_SIZE != 0) {
            totalPage += 1;
        }
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.getSession().setAttribute("listProducts", listProducts);        
        request.getSession().setAttribute("urlHistory", "home");
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
