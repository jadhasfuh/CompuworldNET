<%@ Page Title="Inicio" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Inicio.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource runat="server" ID="SqlCarrousel" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [ID_PROD], [IMAGEN_PROD], [CLICS], [PDESC_PROD] FROM [PRODUCTOS] WHERE OFERTA_PROD = 1 ORDER BY [CLICS] DESC OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlCarrouseT" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT TOP 1 [ID_PROD], [IMAGEN_PROD], [CLICS], [PDESC_PROD] FROM [PRODUCTOS] WHERE OFERTA_PROD = 1 ORDER BY [CLICS] " ></asp:SqlDataSource>

    <!--CARROUSELL-->
    <div id="carouselExampleControls" class="carousel slide cini" data-ride="carousel">
        <div class="carousel-inner">
            <img src="Img/Productos/fondo.png" class="promo" />
            <img src="Img/Productos/fondo2.png" class="promo2" />
            <!--REPETIDOR SQL-->
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlCarrouseT">
                <ItemTemplate>
                    <div class="carousel-item active">
                        <asp:ImageButton ID="imgProd" CssClass="d-block cinimg" AlternateText="corrupt" runat="server" CommandName="ComprarP" ImageUrl=<%#Eval("IMAGEN_PROD")%>/>
                        <asp:Label runat="server" ID="lblIDPD" Text='<%#Eval("ID_PROD")%>' Visible="false" />
                        <asp:Label runat="server" ID="lblDesc" CssClass="superDe" Text='<%#Eval("PDESC_PROD")%>' />
                        <img src="Img/Iconos/ofertar.png" class="superpos" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!--CARROUSELL-->
            <!--REPETIDOR SQL-->
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlCarrousel">
                <ItemTemplate>
                    <div class="carousel-item ">
                        <asp:ImageButton ID="imgProd" CssClass="d-block cinimg" AlternateText="corrupt" runat="server" CommandName="ComprarP" ImageUrl=<%#Eval("IMAGEN_PROD")%>/>
                        <asp:Label runat="server" ID="lblIDPD" Text='<%#Eval("ID_PROD")%>' Visible="false" />
                        <asp:Label runat="server" ID="lblDesc" CssClass="superDe" Text='<%#Eval("PDESC_PROD")%>' />
                         <img src="Img/Iconos/ofertar.png" class="superpos" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!--CARROUSELL-->
            </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <!--/CARROUSELL-->

    </br>

    <%--PROMOCION--%>
    <div class="row promoIni">
        <div class="col-sm-4">
            <img src="Img/Inicio/regalo.png" class="promoImg" />
        </div>
        <div class="col-sm-8" style="margin-top: 10%;">
            <h1 class="text-primary">¡Promociones semanales!</h1>
            <h3>Llevate los productos de la semana con un  descuento especial del 
                <asp:Label ID="lblDescSem" runat="server" Text="30" CssClass="h3"></asp:Label>% (▰˘◡˘▰).</h3>
            <br />
        </div>
    </div>


    <div class="jumbotron completo">
        <div class="row">
            <div class="col-md-8">
                <%--JUMBOTRON--%>
                <div class="jumbotron text-center" id="inicioLap">
                    <div class="intro">
                        <h1>Accesorios para tu equipo de computo.</h1>
                        <asp:Button ID="btnEquiposComputo" runat="server" CssClass="btn btn-outline-light" Text="Ver Categoría" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <%--JUMBOTRON--%>
                <div class="jumbotron text-center" id="inicioHard">
                    <div class="intro">
                        <h1>Hardware</h1>
                        <asp:Button ID="btnHarware" runat="server" CssClass="btn btn-outline-light" Text="Ver Categoría" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    </br>

    <%--JUMBOTRON--%>
    <div class="jumbotron completo" >
        <div class="row">
            <div class="col-md-12">
                <%--JUMBOTRON--%>
                <div class="jumbotron text-center"  id="inicioBan">
                    <div class="intro">
                        <br />
                        <h1>Los mejores artículos con los mejores precios.</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </br>

    <div class="jumbotron completo">
        <div class="row">
            <div class="col-md-4">
                <%--JUMBOTRON--%>
                <div class="jumbotron text-center" id="inicioPap">
                    <div class="intro">
                        <h1>Papelería.</h1>
                        <asp:Button ID="btnPapeleria" runat="server" CssClass="btn btn-outline-light" Text="Ver Categoría" />
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <%--JUMBOTRON--%>
                <div class="jumbotron text-center" id="inicioEle">
                    <div class="intro">
                        <h1>Electrónica</h1>
                        <asp:Button ID="btnElectronica" runat="server" CssClass="btn btn-outline-light" Text="Ver Categoría" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>

</asp:Content>
