<%
    // Obtenemos la sesi�n del usuario
    HttpSession Mi_session = request.getSession();

    // Invalidamos la sesi�n
    if (Mi_session!=null) {
        Mi_session.invalidate();
    }
    request.getRequestDispatcher("Login_US.jsp").forward(request, response);
%>