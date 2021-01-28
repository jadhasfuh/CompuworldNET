<%@ Page Title="Contacto" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br>
    <div class="container">
        <div class="row">
            <div class="col-xl">
                <div class="logForm">
                    <h2><%: Title %>.</h2>
                    <address>
                        Compumundo Hiper Mega Red<br />
                        Sahuayo, Michoacán 59050<br />
                        Teléfono:
                        353 117 7548
                    </address>
                    <address>
                        <strong>Servicio al cliente:</strong>   <a href="mailto:adriancar75@hotmail.com">compuworld@gmaill.com</a><br />
                    </address>
                </div>
            </div>
            <div class="col-xl">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d936.8846028485415!2d-102.71901717080002!3d20.069767899157863!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x842ee3575a296d19%3A0x4d5178e77be40848!2sCompumundoHipermegared!5e0!3m2!1ses-419!2smx!4v1610932872110!5m2!1ses-419!2smx" width="600" height="450" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
        </div>
    </div>

</asp:Content>
