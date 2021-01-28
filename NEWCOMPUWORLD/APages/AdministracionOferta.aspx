<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AdministracionOferta.aspx.vb" Inherits="APages_AdministracionOferta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container">

        <div class="row justify-content-center">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-body">
                    <asp:Label CssClass="my-4 h2" runat="server" Text="Administración del sitio"></asp:Label>
                </div>
            </div>
        </div>

        <br/>

        <div class="row panelAdmin">
            <div class="col">
                <asp:ImageButton runat="server" ID="btnOfertas" ImageUrl="/Img/Iconos/ofertar.png" ToolTip="Ofertas" />
            </div>
            <div class="col">
                <asp:ImageButton runat="server" ID="btnMasVistos" ImageUrl="/Img/Iconos/masvistos.png" ToolTip="Más Vistos" />
            </div>
            <div class="col">
                <asp:ImageButton runat="server" ID="btnInventario" ImageUrl="/Img/Iconos/comprar.png" ToolTip="Inventario"/>
            </div>
        </div>

    </div>

    <!--FOOTER SPACE-->
    <div style="height: 100px"></div>
    <!--FOOTER SPACE-->

</asp:Content>

