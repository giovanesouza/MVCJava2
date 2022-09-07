package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ContatoDAO;

@WebServlet("/excluir")
public class ExcluirContatoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idContato = Integer.parseInt(req.getParameter("id"));
//		Contato contatoExcluido = new Contato();
//		contatoExcluido.setId(idContato);

		ContatoDAO cdao = new ContatoDAO();

		cdao.removeById(idContato);

		resp.sendRedirect("home");
	}

}
