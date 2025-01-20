package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Cart;
import model.OrderDAO;
import model.UserBean;

@WebServlet("/Ordine")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static OrderDAO OrderDao = new OrderDAO();

	public OrdineControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		OrderDAO order = new OrderDAO();

		String action = request.getParameter("action");
		
		

		if (action != null) {
			if (action.equalsIgnoreCase("CompletaOrdine")) {
				HttpSession session = request.getSession(true);

				order.doSave((UserBean) session.getAttribute("currentSessionUser"), request.getParameter("indirizzo"),
						request.getParameter("pagamento"), cart);
				session.setAttribute("cart", new Cart());
				response.sendRedirect("./Homepage.jsp");

			}

			if (action.equalsIgnoreCase("mostradettagli")) {
				String id = String.valueOf(request.getParameter("codice"));
				request.removeAttribute("ordine");
				request.setAttribute("ordine", order.getOrderById(id));
				request.getRequestDispatcher("orderDetails.jsp").forward(request, response);
			}

		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}