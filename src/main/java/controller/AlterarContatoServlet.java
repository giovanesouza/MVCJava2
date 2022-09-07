package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Contato;
import model.ContatoDAO;

@WebServlet("/editar")
public class AlterarContatoServlet extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idContato = Integer.parseInt(req.getParameter("id"));
		
		ContatoDAO cdao = new ContatoDAO();
		Contato contatoSelecionado = cdao.getContatoById(idContato);

		req.setAttribute("contato", contatoSelecionado);
	
		RequestDispatcher rd = req.getRequestDispatcher("/alterarContato.jsp");

        rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Contato contatoAlterado = new Contato();		
		contatoAlterado.setNome(req.getParameter("nome"));
		contatoAlterado.setIdade(Integer.parseInt(req.getParameter("idade")));
		contatoAlterado.setDataCadastro(new Date());
		contatoAlterado.setId(Integer.parseInt(req.getParameter("id")));
		
		ContatoDAO cd = new ContatoDAO();
		cd.update(contatoAlterado);	
		resp.sendRedirect("home");
	}

}
