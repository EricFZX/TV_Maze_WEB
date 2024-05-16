/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MPQ;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author FZ
 */
@WebService(serviceName = "SERVER")
public class SERVER {

    @WebMethod(operationName = "getFacebook")
    public String getFacebook() {
        return "https://www.facebook.com/tvmaze";
    }

    @WebMethod(operationName = "getInstagram")
    public String getInstagram() {
        return "https://www.instagram.com/tvmazecom/";
    }

    @WebMethod(operationName = "getReddit")
    public String getReddit() {
        return "https://www.reddit.com/r/tvmaze/";
    }

    @WebMethod(operationName = "getTwitter")
    public String getTwitter() {
        return "https://twitter.com/tvmaze";
    }

    @WebMethod(operationName = "B1")
    public String getB1() {
        return "TV Maze permite a los usuarios crear perfiles personalizados y hacer un seguimiento de los programas que han visto, están viendo o planean ver en el futuro. Esto facilita el control de tus programas favoritos y te ayuda a mantenerte al día con las últimas actualizaciones.";
    }

    @WebMethod(operationName = "B2")
    public String getB2() {
        return "Basándose en tus preferencias y en los programas que has seguido, TV Maze puede ofrecer recomendaciones personalizadas para nuevos programas que podrían interesarte. Esto facilita el descubrimiento de contenidos televisivos que se alinean con tus gustos.";
    }

    @WebMethod(operationName = "B3")
    public String getB3() {
        return "TV Maze cuenta con una comunidad activa de usuarios que califican y comentan sobre los programas. Esto te proporciona una perspectiva adicional sobre la calidad de un programa antes de decidir verlo. Puedes confiar en las opiniones de la comunidad para encontrar joyas ocultas o evitar programas que no sean de tu interés.";
    }

    @WebMethod(operationName = "B4")
    public String getB4() {
        return "Con la función de horarios de emisión, TV Maze te ayuda a organizar tu agenda televisiva. Puedes ver fácilmente cuándo se emiten los nuevos episodios de tus programas favoritos, lo que facilita la planificación de tu tiempo de visualización y asegura que no te pierdas nada.";
    }
}
