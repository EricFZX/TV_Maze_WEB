
package MPQ;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the MPQ package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _B1_QNAME = new QName("http://MPQ/", "B1");
    private final static QName _B1Response_QNAME = new QName("http://MPQ/", "B1Response");
    private final static QName _B2_QNAME = new QName("http://MPQ/", "B2");
    private final static QName _B2Response_QNAME = new QName("http://MPQ/", "B2Response");
    private final static QName _B3_QNAME = new QName("http://MPQ/", "B3");
    private final static QName _B3Response_QNAME = new QName("http://MPQ/", "B3Response");
    private final static QName _B4_QNAME = new QName("http://MPQ/", "B4");
    private final static QName _B4Response_QNAME = new QName("http://MPQ/", "B4Response");
    private final static QName _GetFacebook_QNAME = new QName("http://MPQ/", "getFacebook");
    private final static QName _GetFacebookResponse_QNAME = new QName("http://MPQ/", "getFacebookResponse");
    private final static QName _GetInstagram_QNAME = new QName("http://MPQ/", "getInstagram");
    private final static QName _GetInstagramResponse_QNAME = new QName("http://MPQ/", "getInstagramResponse");
    private final static QName _GetReddit_QNAME = new QName("http://MPQ/", "getReddit");
    private final static QName _GetRedditResponse_QNAME = new QName("http://MPQ/", "getRedditResponse");
    private final static QName _GetTwitter_QNAME = new QName("http://MPQ/", "getTwitter");
    private final static QName _GetTwitterResponse_QNAME = new QName("http://MPQ/", "getTwitterResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: MPQ
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link B1 }
     * 
     */
    public B1 createB1() {
        return new B1();
    }

    /**
     * Create an instance of {@link B1Response }
     * 
     */
    public B1Response createB1Response() {
        return new B1Response();
    }

    /**
     * Create an instance of {@link B2 }
     * 
     */
    public B2 createB2() {
        return new B2();
    }

    /**
     * Create an instance of {@link B2Response }
     * 
     */
    public B2Response createB2Response() {
        return new B2Response();
    }

    /**
     * Create an instance of {@link B3 }
     * 
     */
    public B3 createB3() {
        return new B3();
    }

    /**
     * Create an instance of {@link B3Response }
     * 
     */
    public B3Response createB3Response() {
        return new B3Response();
    }

    /**
     * Create an instance of {@link B4 }
     * 
     */
    public B4 createB4() {
        return new B4();
    }

    /**
     * Create an instance of {@link B4Response }
     * 
     */
    public B4Response createB4Response() {
        return new B4Response();
    }

    /**
     * Create an instance of {@link GetFacebook }
     * 
     */
    public GetFacebook createGetFacebook() {
        return new GetFacebook();
    }

    /**
     * Create an instance of {@link GetFacebookResponse }
     * 
     */
    public GetFacebookResponse createGetFacebookResponse() {
        return new GetFacebookResponse();
    }

    /**
     * Create an instance of {@link GetInstagram }
     * 
     */
    public GetInstagram createGetInstagram() {
        return new GetInstagram();
    }

    /**
     * Create an instance of {@link GetInstagramResponse }
     * 
     */
    public GetInstagramResponse createGetInstagramResponse() {
        return new GetInstagramResponse();
    }

    /**
     * Create an instance of {@link GetReddit }
     * 
     */
    public GetReddit createGetReddit() {
        return new GetReddit();
    }

    /**
     * Create an instance of {@link GetRedditResponse }
     * 
     */
    public GetRedditResponse createGetRedditResponse() {
        return new GetRedditResponse();
    }

    /**
     * Create an instance of {@link GetTwitter }
     * 
     */
    public GetTwitter createGetTwitter() {
        return new GetTwitter();
    }

    /**
     * Create an instance of {@link GetTwitterResponse }
     * 
     */
    public GetTwitterResponse createGetTwitterResponse() {
        return new GetTwitterResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B1 }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B1")
    public JAXBElement<B1> createB1(B1 value) {
        return new JAXBElement<B1>(_B1_QNAME, B1 .class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B1Response }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B1Response")
    public JAXBElement<B1Response> createB1Response(B1Response value) {
        return new JAXBElement<B1Response>(_B1Response_QNAME, B1Response.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B2 }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B2")
    public JAXBElement<B2> createB2(B2 value) {
        return new JAXBElement<B2>(_B2_QNAME, B2 .class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B2Response }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B2Response")
    public JAXBElement<B2Response> createB2Response(B2Response value) {
        return new JAXBElement<B2Response>(_B2Response_QNAME, B2Response.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B3 }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B3")
    public JAXBElement<B3> createB3(B3 value) {
        return new JAXBElement<B3>(_B3_QNAME, B3 .class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B3Response }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B3Response")
    public JAXBElement<B3Response> createB3Response(B3Response value) {
        return new JAXBElement<B3Response>(_B3Response_QNAME, B3Response.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B4 }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B4")
    public JAXBElement<B4> createB4(B4 value) {
        return new JAXBElement<B4>(_B4_QNAME, B4 .class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link B4Response }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "B4Response")
    public JAXBElement<B4Response> createB4Response(B4Response value) {
        return new JAXBElement<B4Response>(_B4Response_QNAME, B4Response.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetFacebook }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getFacebook")
    public JAXBElement<GetFacebook> createGetFacebook(GetFacebook value) {
        return new JAXBElement<GetFacebook>(_GetFacebook_QNAME, GetFacebook.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetFacebookResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getFacebookResponse")
    public JAXBElement<GetFacebookResponse> createGetFacebookResponse(GetFacebookResponse value) {
        return new JAXBElement<GetFacebookResponse>(_GetFacebookResponse_QNAME, GetFacebookResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetInstagram }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getInstagram")
    public JAXBElement<GetInstagram> createGetInstagram(GetInstagram value) {
        return new JAXBElement<GetInstagram>(_GetInstagram_QNAME, GetInstagram.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetInstagramResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getInstagramResponse")
    public JAXBElement<GetInstagramResponse> createGetInstagramResponse(GetInstagramResponse value) {
        return new JAXBElement<GetInstagramResponse>(_GetInstagramResponse_QNAME, GetInstagramResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetReddit }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getReddit")
    public JAXBElement<GetReddit> createGetReddit(GetReddit value) {
        return new JAXBElement<GetReddit>(_GetReddit_QNAME, GetReddit.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetRedditResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getRedditResponse")
    public JAXBElement<GetRedditResponse> createGetRedditResponse(GetRedditResponse value) {
        return new JAXBElement<GetRedditResponse>(_GetRedditResponse_QNAME, GetRedditResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetTwitter }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getTwitter")
    public JAXBElement<GetTwitter> createGetTwitter(GetTwitter value) {
        return new JAXBElement<GetTwitter>(_GetTwitter_QNAME, GetTwitter.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetTwitterResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://MPQ/", name = "getTwitterResponse")
    public JAXBElement<GetTwitterResponse> createGetTwitterResponse(GetTwitterResponse value) {
        return new JAXBElement<GetTwitterResponse>(_GetTwitterResponse_QNAME, GetTwitterResponse.class, null, value);
    }

}
