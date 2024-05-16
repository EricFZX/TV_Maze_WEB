<%
    // Obtenemos la sesión del usuario
    HttpSession Mi_session = request.getSession();

    // Invalidamos la sesión
    if (Mi_session!=null) {
        Mi_session.invalidate();
    }
    request.getRequestDispatcher("Login_US.jsp").forward(request, response);
%>