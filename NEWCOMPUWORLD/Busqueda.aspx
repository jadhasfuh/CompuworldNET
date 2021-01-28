<%@ Page Title="Tienda" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Busqueda.aspx.vb" Inherits="Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <!-- Page Content -->
    <div class="container"> 

        <div class="row">
            <%-- COLUMNAS LATERALES O DE CATEGORIA--%>
            <div class="col-lg-3">
                <br>
                <center><asp:Label ID="CatName" CssClass="my-4 h3" runat="server" Text="Categoria"></asp:Label></center>
                <br>
                <div class="list-group" id="HardItems" runat="server">
                    <asp:LinkButton ID="btnAlma" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Almacenamiento" />
                    <asp:LinkButton ID="btnCabc" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Cables y Conectores" />
                    <asp:LinkButton ID="btnComp" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Computadoras" />
                    <asp:LinkButton ID="btnEnfri" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Enfriamiento" />
                    <asp:LinkButton ID="btnGabi" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Gabinetes" />
                    <asp:LinkButton ID="btnGame" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Gamepads" />
                    <asp:LinkButton ID="btnImpr" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Impresoras" />
                    <asp:LinkButton ID="btnMer" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Memorias RAM" />
                </div>
                <div class="list-group" id="ElectroItems" runat="server">
                    <asp:LinkButton ID="btnAudio" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Audio" />
                    <asp:LinkButton ID="btnHerra" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Herramientas" />
                    <asp:LinkButton ID="btnIlumi" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Iluminación" />
                    <asp:LinkButton ID="btnLimpi" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Limpieza" />
                    <asp:LinkButton ID="btnMoni" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Monitores" />
                </div>
                <div class="list-group" id="PapeItems" runat="server">
                    <asp:LinkButton ID="btnEscof" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Escolar y Oficina" />
                    <asp:LinkButton ID="btnMochi" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Mochilas" />
                    <asp:LinkButton ID="btnPapcar" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Papeles y Cartulinas" />
                </div>
                <div class="list-group" id="GadItems" runat="server">
                    <asp:LinkButton ID="btnAcce" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Accesorios" />
                    <asp:LinkButton ID="btnCelu" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Celulares" />
                    <asp:LinkButton ID="btnFunda" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Fundas" />
                    <asp:LinkButton ID="btnTable" CssClass="list-group-item font-weight-bold text-secondary" runat="server" Text="Tabletas" />
                </div>
            </div>
            <!-- /COLUMNAS LATERALES O DE CATEGORIA-->

            <asp:SqlDataSource runat="server" ID="SqlProductos2" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>'></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlProductos3" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT TOP 1 [NOMBRE_PROD], [PRECIO_PROD], [DESCRIPCION_PROD], [IMAGEN_PROD] FROM [PRODUCTOS] ORDER BY [CLICS] DESC"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlProductos" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>'></asp:SqlDataSource>

            <!--CARROUSELL-->
            <div class="col-lg-9">
                <br />
                <center><asp:Label ID="LabelC" CssClass="my-4 h3" runat="server" Text="Lo más visto"></asp:Label></center>
                <br />
                <div id="carouselExampleControls" class="carousel slide conteV " data-ride="carousel">
                    <div class="carousel-inner">
                        <!--REPETIDOR SQL-->
                        <asp:Repeater ID="RepVendi" runat="server" DataSourceID="SqlProductos3" >
                            <ItemTemplate>
                                    <div class="carousel-item active">
                                        <a runat="server">
                                            <div class="col-lg-12">
                                                <div class="card h-100 clicable" data-target="#anadirC" data-toggle="modal">
                                                    <a>
                                                        <img class="card-img-top tiendaPic" src="<%#Eval("IMAGEN_PROD")%>" />
                                                    </a>
                                                    <div class="card-body">
                                                        <h4 class="card-title">
                                                            <a>
                                                                <asp:Label runat="server" Text='<%#Eval("NOMBRE_PROD")%>' />
                                                                <asp:Label runat="server" ID="lblIDPD" Text='<%#Eval("ID_PROD")%>' Visible="false" />
                                                            </a>
                                                        </h4>
                                                        <h5><%#Eval("PRECIO_PROD", "{0:C}")%></h5>
                                                    </div>
                                                    <div class="card-footer" runat="server">
                                                        <asp:Button ID="btnProd" CommandName="ComprarP" runat="server" CssClass="btn btn-warning" Text="Ver"></asp:Button>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!--REPETIDOR SQL-->
                        <asp:Repeater ID="RepVendi2" runat="server" DataSourceID="SqlProductos2">
                            <ItemTemplate>
                                    <div class="carousel-item">
                                        <a runat="server">
                                            <div class="col-lg-12">
                                                <div class="card h-100 clicable">
                                                    <a>
                                                        <img class="card-img-top tiendaPic" src="<%#Eval("IMAGEN_PROD")%>" />
                                                    </a>
                                                    <div class="card-body">
                                                        <h4 class="card-title">
                                                            <a>
                                                                <asp:Label runat="server" Text='<%#Eval("NOMBRE_PROD")%>' />
                                                                <asp:Label runat="server" ID="lblIDPD" Text='<%#Eval("ID_PROD")%>' Visible="false" />
                                                            </a>
                                                        </h4>
                                                        <h5><%#Eval("PRECIO_PROD", "{0:C}")%></h5>
                                                    </div>
                                                    <div class="card-footer" runat="server">
                                                        <asp:Button ID="btnProd" CommandName="ComprarP" runat="server" CssClass="btn btn-warning" Text="Ver"></asp:Button>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!--CARROUSELL-->
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!--/CARROUSELL-->

            <div class="container h-100">
                <div class="row justify-content-center h-100">
                    <div class="col-sm-12 align-self-center text-center">
                        <div class="card-body">
                            <asp:Label ID="LabelProductos" CssClass="my-4 h3" runat="server" Text="Todos los productos"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <%--SECCION DE PRODUCTOS--%>
            <%--CATEGORIA--%>
            <div runat="server" class="row" style="width: 100%">
                <asp:Repeater ID="RepProds" runat="server" DataSourceID="SqlProductos">
                    <ItemTemplate>
                        <%-- SUBCATEGORIA--%>
                            <a runat="server">
                                <div class="col-lg-4 col-md-4 mb-4" id="tarjetaP" runat="server">
                                    <div class="card h-100 clicable">
                                        <a>
                                            <img class="card-img-top tiendaPic" src="<%#Eval("IMAGEN_PROD")%>" /> 
                                        </a>
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <a>
                                                    <asp:Label runat="server" Text='<%#Eval("NOMBRE_PROD")%>' />
                                                    <asp:Label runat="server" ID="lblIDPD" Text='<%#Eval("ID_PROD")%>' Visible="false" />
                                                </a>
                                            </h4>
                                            <h5><%#Eval("PRECIO_PROD", "{0:C}")%></h5>
                                            <p class="card-text"><%#Eval("DESCRIPCION_PROD")%></p>
                                        </div>
                                        <div class="card-footer" runat="server">
                                            <asp:Button ID="btnProd" CommandName="ComprarP" runat="server" CssClass="btn btn-warning" Text="Ver"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                                <%-- /SUBCATEGORIA--%>
                            </a>
                        <%-- /CATEGORIA--%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <%--/SECCION DE PRODUCTOS--%>
            <!-- /.col-lg-9 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->

    <!--FOOTER SPACE-->
    <div style="height: 100px"></div>
    <!--FOOTER SPACE-->

</asp:Content>