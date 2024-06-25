<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Luvuyo2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /*Contact Style*/
        .contact-bg{
    height: 40vh;
    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url(images/img-4.jpg);
    background-position: 50% 100%;
    background-repeat: no-repeat;
    background-attachment: fixed;
    text-align: center;
    color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.contact-bg h3{
    font-size: 1.3rem;
    font-weight: 400;
}
.contact-bg h2{
    font-size: 3rem;
    text-transform: uppercase;
    padding: 0.4rem 0;
    letter-spacing: 4px;
}
.line div{
    margin: 0 0.2rem;
}
.line div:nth-child(1),
.line div:nth-child(3){
    height: 3px;
    width: 70px;
    background: #f1c232;
    border-radius: 5px;
}
.line{
    display: flex;
    align-items: center;
}
.line div:nth-child(2){
    width: 10px;
    height: 10px;
    background: #f1c232;
    border-radius: 50%;
}
.text{
    font-weight: 300;
    opacity: 0.9;
}
.contact-bg .text{
    margin: 1.6rem 0;
}
.contact-body{
    max-width: 1320px;
    margin: 0 auto;
    padding: 0 1rem;
}
.contact-info{
    margin: 2rem 0;
    text-align: center;
    padding: 2rem 0;
}
.contact-info span{
    display: block;
}
.contact-info div{
    margin: 0.8rem 0;
    padding: 1rem;
}
.contact-info span .fas{
    font-size: 2rem;
    padding-bottom: 0.9rem;
    color: #006666;
}
.contact-info div span:nth-child(2){
    font-weight: 500;
    font-size: 1.1rem;
}
.contact-info .text{
    padding-top: 0.4rem;
}
.contact-form{
    padding: 2rem 0;
    border-top: 1px solid #006666;
}
.contact-form form{
    padding-bottom: 1rem;
}
.form-control{
    width: 100%;
    border: 1.5px solid #f1c232;
    border-radius: 5px;
    padding: 0.7rem;
    margin: 0.6rem 0;
    font-family: Poppins-Regular;
    font-size: 1.4rem;
    outline: 0;
}
.form-control:focus{
    box-shadow: 0 0 6px -3px rgba(48, 48, 48, 1);
}
.contact-form form div{
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    column-gap: 0.6rem;
}
.send-btn{
    font-family: Poppins-Regular;
    font-size: 1.3rem;
    text-transform: uppercase;
    color: #fff;
    background: #006666;
    border: none;
    border-radius: 5px;
    padding: 0.7rem 1.5rem;
    cursor: pointer;
    transition: all 0.4s ease;
}
.send-btn:hover{
    opacity: 0.8;
}
.contact-form > div img{
    width: 85%;
}
.contact-form > div{
    margin: 0 auto;
    text-align: center;
}
@media screen and (min-width: 768px){
    .contact-bg .text{
        width: 70%;
        margin-left: auto;
        margin-right: auto;
    }
    .contact-info{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
}

@media screen and (min-width: 992px){
    .contact-bg .text{
        width: 50%;
    }
    .contact-form{
        
    }
}

@media screen and (min-width: 1200px){
    .contact-info{
        grid-template-columns: repeat(4, 1fr);
    }
}
    </style>

    <%-- Contact Us --%>

    <section class="contact-section">
        <div class="contact-bg">
            <h3>Get in Touch</h3>
            <h2>Contact Us</h2>
             <div class = "line">
          <div></div>
          <div></div>
          <div></div>
        </div>
        <p class = "text">Want to know more? Get in touch with us below</p>
      </div>
        <div class = "contact-body">
        <div class = "contact-info">
          <div>
            <span><i class = "fas fa-mobile-alt"></i></span>
            <span>Phone No.</span>
            <span class = "text">+27 63 096 9907 / +27 71 711 0198</span>
          </div>
          <div>
            <span><i class = "fas fa-envelope-open"></i></span>
            <span>E-mail</span>
            <span class = "text">info@luyolosguesthouse.com</span>
          </div>
          <div>
            <span><i class = "fas fa-map-marker-alt"></i></span>
            <span>Address</span>
            <span class = "text">51 Carbis Rd, Scottsville, Pietermaritzburg, 3201</span>
          </div>
          <div>
            <span><i class = "fas fa-clock"></i></span>
            <span>Opening Hours</span>
            <span class = "text">Monday - Friday (8:00 AM to 5:00 PM)</span>
          </div>
        </div>

        <div class = "contact-form">
          <form>
            <div>
              <input type = "text" class = "form-control" placeholder="First Name">
              <input type = "text" class = "form-control" placeholder="Last Name">
            </div>
            <div>
              <input type = "email" class = "form-control" placeholder="E-mail">
              <input type = "text" class = "form-control" placeholder="Phone">
            </div>
            <textarea rows = "5" placeholder="Message" class = "form-control"></textarea>
            <input type = "submit" class = "send-btn" value = "send message">
          </form>
        </div>
      </div>

      <div class = "map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13872.95090369478!2d30.399138!3d-29.625838!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1ef6bd7a39095ae7%3A0xa9ce79026a393c90!2sLUVUYOS%20GUEST%20HOUSE!5e0!3m2!1sen!2sza!4v1647856299177!5m2!1sen!2sza" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
      </div>
    </section>

    <%-- Contact Us End --%>
</asp:Content>


