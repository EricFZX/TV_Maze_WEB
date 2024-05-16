<%-- 
    Document   : index
    Created on : 22 nov 2023, 18:50:37
    Author     : FZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--CSS -->
        <link rel="stylesheet" href="FORM_INDEX.css"/>
    </head>
    <body>
        <%
            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();
        
        %>
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="Login_US.jsp">INICIAR SESIÓN</a>
                <a href="Crear_Cuenta.jsp">CREAR CUENTA</a>
                <a href="#FAQ">FAQ</a>
            </nav>
        </header>
        <!-- SECCION INFORMATIVA -->
        <div class="flex">
            <div class="TEXT-CE">
                <div class="TEXT-CT">
                    <h2>Seguimiento personalizado de programas</h2>
                    <p>
                        <%=port.b1()%>
                    </p>
                    <h2>Recomendaciones y descubrimiento de nuevos programas:</h2>
                    <p>
                        <%=port.b2()%>
                    </p>
                </div>
            </div>
            <div class="CONTENT-CE">
                <div class="CONTENT-CT">
                    <img src="https://img.freepik.com/vector-gratis/ilustracion-concepto-palomitas-maiz_114360-6442.jpg?t=st=1699933846~exp=1699934446~hmac=acadea39ef97eb9ecabad9eec7076f097d769835448aa26a21e9f9b13a381e90"
                         alt="">
                </div>
            </div>
        </div>

        <!-- SVG -->
        <svg id="wave" style="transform:rotate(0deg); transition: 0.3s" viewBox="0 0 1440 220" version="1.1"
             xmlns="http://www.w3.org/2000/svg">
        <defs>
        <linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0">
        <stop stop-color="rgba(51, 51, 51, 1)" offset="0%"></stop>
        <stop stop-color="rgba(51, 51, 51, 1)" offset="100%"></stop>
        </linearGradient>
        </defs>
        <path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)"
              d="M0,198L120,165C240,132,480,66,720,58.7C960,51,1200,103,1440,106.3C1680,110,1920,66,2160,66C2400,66,2640,110,2880,106.3C3120,103,3360,51,3600,47.7C3840,44,4080,88,4320,99C4560,110,4800,88,5040,73.3C5280,59,5520,51,5760,44C6000,37,6240,29,6480,33C6720,37,6960,51,7200,69.7C7440,88,7680,110,7920,124.7C8160,139,8400,147,8640,146.7C8880,147,9120,139,9360,113.7C9600,88,9840,44,10080,44C10320,44,10560,88,10800,95.3C11040,103,11280,73,11520,73.3C11760,73,12000,103,12240,124.7C12480,147,12720,161,12960,165C13200,169,13440,161,13680,135.7C13920,110,14160,66,14400,51.3C14640,37,14880,51,15120,69.7C15360,88,15600,110,15840,128.3C16080,147,16320,161,16560,154C16800,147,17040,117,17160,102.7L17280,88L17280,220L17160,220C17040,220,16800,220,16560,220C16320,220,16080,220,15840,220C15600,220,15360,220,15120,220C14880,220,14640,220,14400,220C14160,220,13920,220,13680,220C13440,220,13200,220,12960,220C12720,220,12480,220,12240,220C12000,220,11760,220,11520,220C11280,220,11040,220,10800,220C10560,220,10320,220,10080,220C9840,220,9600,220,9360,220C9120,220,8880,220,8640,220C8400,220,8160,220,7920,220C7680,220,7440,220,7200,220C6960,220,6720,220,6480,220C6240,220,6000,220,5760,220C5520,220,5280,220,5040,220C4800,220,4560,220,4320,220C4080,220,3840,220,3600,220C3360,220,3120,220,2880,220C2640,220,2400,220,2160,220C1920,220,1680,220,1440,220C1200,220,960,220,720,220C480,220,240,220,120,220L0,220Z">
        </path>
        </svg>
        <svg id="wave" style="transform:rotate(180deg); transition: 0.3s" viewBox="0 0 1440 220" version="1.1"
             xmlns="http://www.w3.org/2000/svg">
        <defs>
        <linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0">
        <stop stop-color="rgba(51, 51, 51, 1)" offset="0%"></stop>
        <stop stop-color="rgba(51, 51, 51, 1)" offset="100%"></stop>
        </linearGradient>
        </defs>
        <path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)"
              d="M0,198L120,165C240,132,480,66,720,58.7C960,51,1200,103,1440,106.3C1680,110,1920,66,2160,66C2400,66,2640,110,2880,106.3C3120,103,3360,51,3600,47.7C3840,44,4080,88,4320,99C4560,110,4800,88,5040,73.3C5280,59,5520,51,5760,44C6000,37,6240,29,6480,33C6720,37,6960,51,7200,69.7C7440,88,7680,110,7920,124.7C8160,139,8400,147,8640,146.7C8880,147,9120,139,9360,113.7C9600,88,9840,44,10080,44C10320,44,10560,88,10800,95.3C11040,103,11280,73,11520,73.3C11760,73,12000,103,12240,124.7C12480,147,12720,161,12960,165C13200,169,13440,161,13680,135.7C13920,110,14160,66,14400,51.3C14640,37,14880,51,15120,69.7C15360,88,15600,110,15840,128.3C16080,147,16320,161,16560,154C16800,147,17040,117,17160,102.7L17280,88L17280,220L17160,220C17040,220,16800,220,16560,220C16320,220,16080,220,15840,220C15600,220,15360,220,15120,220C14880,220,14640,220,14400,220C14160,220,13920,220,13680,220C13440,220,13200,220,12960,220C12720,220,12480,220,12240,220C12000,220,11760,220,11520,220C11280,220,11040,220,10800,220C10560,220,10320,220,10080,220C9840,220,9600,220,9360,220C9120,220,8880,220,8640,220C8400,220,8160,220,7920,220C7680,220,7440,220,7200,220C6960,220,6720,220,6480,220C6240,220,6000,220,5760,220C5520,220,5280,220,5040,220C4800,220,4560,220,4320,220C4080,220,3840,220,3600,220C3360,220,3120,220,2880,220C2640,220,2400,220,2160,220C1920,220,1680,220,1440,220C1200,220,960,220,720,220C480,220,240,220,120,220L0,220Z">
        </path>
        </svg>
        <!-- SECCION INFORMATIVA 2 -->
        <div class="flex">
            <!-- VIDEO -->
            <div class="CONTENT-CE">
                <div class="CONTENT-CT">
                    <iframe width="560" height="315"
                            src="https://www.youtube-nocookie.com/embed/KOxbed0MUbM?si=UBQUhdt3CLmkinZ3&autoplay=1&mute=1"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>
                </div>
            </div>
            <div class="TEXT-CE">
                <div class="TEXT-CT">
                    <h2>Calificaciones y comentarios de la comunidad</h2>
                    <p>
                       <%=port.b3()%>
                    </p>
                    <h2>Gestión eficiente de la agenda televisiva</h2>
                    <p>
                        <%=port.b4()%>
                    </p>
                </div>
            </div>
        </div>
        <!-- SVG -->
        <svg id="wave" style="transform:rotate(0deg); transition: 0.3s" viewBox="0 0 1440 220" version="1.1"
             xmlns="http://www.w3.org/2000/svg">
        <defs>
        <linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0">
        <stop stop-color="rgba(51, 51, 51, 1)" offset="0%"></stop>
        <stop stop-color="rgba(51, 51, 51, 1)" offset="100%"></stop>
        </linearGradient>
        </defs>
        <path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)"
              d="M0,198L40,165C80,132,160,66,240,58.7C320,51,400,103,480,106.3C560,110,640,66,720,66C800,66,880,110,960,106.3C1040,103,1120,51,1200,47.7C1280,44,1360,88,1440,99C1520,110,1600,88,1680,73.3C1760,59,1840,51,1920,44C2000,37,2080,29,2160,33C2240,37,2320,51,2400,69.7C2480,88,2560,110,2640,124.7C2720,139,2800,147,2880,146.7C2960,147,3040,139,3120,113.7C3200,88,3280,44,3360,44C3440,44,3520,88,3600,95.3C3680,103,3760,73,3840,73.3C3920,73,4000,103,4080,124.7C4160,147,4240,161,4320,165C4400,169,4480,161,4560,135.7C4640,110,4720,66,4800,51.3C4880,37,4960,51,5040,69.7C5120,88,5200,110,5280,128.3C5360,147,5440,161,5520,154C5600,147,5680,117,5720,102.7L5760,88L5760,220L5720,220C5680,220,5600,220,5520,220C5440,220,5360,220,5280,220C5200,220,5120,220,5040,220C4960,220,4880,220,4800,220C4720,220,4640,220,4560,220C4480,220,4400,220,4320,220C4240,220,4160,220,4080,220C4000,220,3920,220,3840,220C3760,220,3680,220,3600,220C3520,220,3440,220,3360,220C3280,220,3200,220,3120,220C3040,220,2960,220,2880,220C2800,220,2720,220,2640,220C2560,220,2480,220,2400,220C2320,220,2240,220,2160,220C2080,220,2000,220,1920,220C1840,220,1760,220,1680,220C1600,220,1520,220,1440,220C1360,220,1280,220,1200,220C1120,220,1040,220,960,220C880,220,800,220,720,220C640,220,560,220,480,220C400,220,320,220,240,220C160,220,80,220,40,220L0,220Z">
        </path>
        </svg>
        <svg id="wave" style="transform:rotate(180deg); transition: 0.3s" viewBox="0 0 1440 220" version="1.1"
             xmlns="http://www.w3.org/2000/svg">
        <defs>
        <linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0">
        <stop stop-color="rgba(51, 51, 51, 1)" offset="0%"></stop>
        <stop stop-color="rgba(51, 51, 51, 1)" offset="100%"></stop>
        </linearGradient>
        </defs>
        <path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)"
              d="M0,198L40,165C80,132,160,66,240,58.7C320,51,400,103,480,106.3C560,110,640,66,720,66C800,66,880,110,960,106.3C1040,103,1120,51,1200,47.7C1280,44,1360,88,1440,99C1520,110,1600,88,1680,73.3C1760,59,1840,51,1920,44C2000,37,2080,29,2160,33C2240,37,2320,51,2400,69.7C2480,88,2560,110,2640,124.7C2720,139,2800,147,2880,146.7C2960,147,3040,139,3120,113.7C3200,88,3280,44,3360,44C3440,44,3520,88,3600,95.3C3680,103,3760,73,3840,73.3C3920,73,4000,103,4080,124.7C4160,147,4240,161,4320,165C4400,169,4480,161,4560,135.7C4640,110,4720,66,4800,51.3C4880,37,4960,51,5040,69.7C5120,88,5200,110,5280,128.3C5360,147,5440,161,5520,154C5600,147,5680,117,5720,102.7L5760,88L5760,220L5720,220C5680,220,5600,220,5520,220C5440,220,5360,220,5280,220C5200,220,5120,220,5040,220C4960,220,4880,220,4800,220C4720,220,4640,220,4560,220C4480,220,4400,220,4320,220C4240,220,4160,220,4080,220C4000,220,3920,220,3840,220C3760,220,3680,220,3600,220C3520,220,3440,220,3360,220C3280,220,3200,220,3120,220C3040,220,2960,220,2880,220C2800,220,2720,220,2640,220C2560,220,2480,220,2400,220C2320,220,2240,220,2160,220C2080,220,2000,220,1920,220C1840,220,1760,220,1680,220C1600,220,1520,220,1440,220C1360,220,1280,220,1200,220C1120,220,1040,220,960,220C880,220,800,220,720,220C640,220,560,220,480,220C400,220,320,220,240,220C160,220,80,220,40,220L0,220Z">
        </path>
        </svg>
        <!-- SECCION PELICULAS -->
        <section>
            <div class="PE-TI">
                <h2>!Algunas peliculas que puedes encontrar en nuestro sitio!</h2>
            </div>
            <div class="CONT-Carrusel">
                <div class="carrusel">
                    <div class="carrusel-items">
                        <div class="carrusel-item">
                            <img src="IMGS/1.png" alt="">
                        </div>
                        <div class="carrusel-item">
                            <img src="IMGS/2.png" alt="">
                        </div>
                        <div class="carrusel-item">
                            <img src="IMGS/3.png" alt="">
                        </div>
                        <div class="carrusel-item">
                            <img src="IMGS/4.png" alt="">
                        </div>
                        <div class="carrusel-item">
                            <img src="IMGS/5.png" alt="">
                        </div>
                        <div class="carrusel-item">
                            <img src="IMGS/6.png" alt="">
                        </div>
                        <div class="carrusel-item">
                            <img src="IMGS/7.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- PREGUNTAS FRECUENTES -->
        <div class="CONT-PRE" id="FAQ">
            <div>
                <div class="PE-TI">
                    <h2>PREGUNTAS FRECUENTES</h2>
                </div>
                <div class="TARJETA-PR">
                    <h2>¿Cómo puedo seguir mis programas favoritos en TV Maze?</h2>
                    <p>Para seguir tus programas favoritos en TV Maze, primero necesitas crear una cuenta. Una vez que hayas
                        iniciado sesión, puedes buscar los programas que te interesan y hacer clic en el botón "Seguir" en
                        la
                        página del programa. Esto te permitirá realizar un seguimiento de los episodios que has visto y
                        recibir
                        actualizaciones sobre nuevos episodios.</p>
                </div>
                <div class="TARJETA-PR">
                    <h2>¿Cómo puedo obtener recomendaciones personalizadas en TV Maze?</h2>
                    <p>TV Maze ofrece recomendaciones personalizadas basadas en tus preferencias de visualización. Asegúrate
                        de
                        tener una cuenta y de seguir los programas que te gustan. La plataforma utilizará esta información
                        para
                        sugerir nuevos programas que podrían interesarte. Además, explorar las listas de programas populares
                        y
                        tendencias también puede ayudarte a descubrir contenido nuevo.</p>
                </div>
                <div class="TARJETA-PR">
                    <h2>¿Puedo acceder a TV Maze desde dispositivos móviles?</h2>
                    <p>Sí, TV Maze es compatible con dispositivos móviles. Puedes acceder al sitio web a través del
                        navegador
                        de tu dispositivo móvil o descargar la aplicación si está disponible. Esto te permite llevar un
                        registro
                        de tus programas y recibir actualizaciones sobre la marcha.</p>

                </div>
                <div class="TARJETA-PR">
                    <h2>¿Cómo puedo encontrar información detallada sobre un episodio específico en TV Maze?</h2>
                    <p>Para obtener información detallada sobre un episodio específico, busca el programa en cuestión y
                        navega
                        hasta la temporada y episodio que te interesa. En la página del episodio, encontrarás detalles como
                        el
                        título, la sinopsis, el reparto y las calificaciones de la comunidad. También puedes dejar tus
                        propias
                        calificaciones y comentarios si tienes una cuenta en TV Maze.</p>
                </div>
            </div>
        </div>
        <!-- FOOTER -->
        <footer class="footer">
            <div>
                <label>SIGUENOS EN:</label>
                <br>
                <a href="<%=port.getFacebook()%>"> <img src="IMGS/FOOTER/icons8-facebook-48.png" alt=""></a>
                <a href="<%=port.getInstagram()%>"> <img src="IMGS/FOOTER/icons8-instagram-48.png" alt=""></a>
                <a href="<%=port.getReddit()%>"> <img src="IMGS/FOOTER/icons8-reddit-48.png" alt=""></a>
                <a href="<%=port.getTwitter()%>"> <img src="IMGS/FOOTER/icons8-twitter-48.png" alt=""></a>
                <br>
                <label>&copy; 2023 TVmaze.com</label>
                <br>
                <div class="copy">
                    <a href="https://www.tvmaze.com/site/copyright">Copyright Policy</a>
                    <a href="https://www.tvmaze.com/site/privacy">Privacy Policy</a>
                    <a href="https://www.tvmaze.com/site/tos">ToS</a>
                </div>
            </div>
        </footer>
        <!-- JAVASCRIPT -->
        <script>
            const carrusel = document.querySelector(".carrusel-items");
            //Varibles
            var max = carrusel.scrollWidth - carrusel.clientWidth;
            var intervalo = null;
            var step = 1;
            const start = () => {
                intervalo = setInterval(function () {
                    carrusel.scrollLeft = carrusel.scrollLeft + step;
                    if (carrusel.scrollLeft === max) {
                        step = step * -1;
                    } else if (carrusel.scrollLeft === 0) {
                        step = step * -1;
                    }
                }, 10);
            };
            const stop = () => {
                clearInterval(intervalo);
            };
            carrusel.addEventListener("mouseover", () => {
                stop();
            });
            carrusel.addEventListener("mouseout", () => {
                start();
            });
            start();
        </script>
    </body>
</html>
