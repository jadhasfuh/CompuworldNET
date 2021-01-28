<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Previa.aspx.vb" Inherits="Previa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <div class="row">

            <div class="container">
               
                <div class="card shadow-sm p-3 mb-5 bg-white rounded">
                    <div class="row">
                        <aside class="col-sm-5 border-right">
                            <article class="gallery-wrap">
                                <div class="img-big-wrap">
                                    <div>
                                        <a href="#">
                                            <asp:Image ID="imgProd1" runat="server"/>
                                        </a>
                                    </div>
                                </div>
                                <!-- slider-product.// -->
                                <div class="img-small-wrap">
                                    <div class="item-gallery">
                                        <asp:Image ID="imgProd2" runat="server" />
                                    </div>
                                </div>
                                <!-- slider-nav.// -->
                            </article>
                            <!-- gallery-wrap .end// -->
                        </aside>
                        <aside class="col-sm-7">
                            <article class="card-body p-5">
                                <h3 class="title mb-3">
                                    <asp:Label ID="lblNombreProd" runat="server" Text="NOMBRE"></asp:Label>
                                </h3>
                                <p class="price-detail-wrap">
                                    <span class="price h3 text-warning">
                                        <span class="num">
                                            <asp:Label ID="lblPrecio" runat="server" Text="12"></asp:Label>
                                        </span>
                                    </span>
                                </p>
                                <!-- price-detail-wrap .// -->
                                <dl class="item-property">
                                    <dt>
                                        <asp:Label ID="lblTD" runat="server" Text="Descipción"></asp:Label>
                                    </dt>
                                    <dd>
                                        <p>
                                            <asp:Label ID="lblDescripcion" runat="server" Text="Lorem ipsum adipicising"></asp:Label>
                                        </p>
                                    </dd>
                                     <dt>
                                        <asp:Label ID="ste" runat="server" Text="Existencias:"></asp:Label>
                                    </dt>
                                    <dd>
                                        <p>
                                            <asp:Label ID="lblExistencias" runat="server" Text=""></asp:Label>
                                        </p>
                                    </dd>
                                </dl>
                               
                                <!-- item-property-hor .// -->
                                <hr>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <dl class="param param-inline">
                                            <dt>Cantidad: </dt>
                                            <dd>
                                                <asp:TextBox ID="txtCan" runat="server" CssClass="form-control form-control-sm" Width="100%"></asp:TextBox>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl class="param param-inline">
                                            <dt>Descuento: </dt>
                                            <dd>
                                                <asp:Label ID="lblDesc" runat="server" Text="34%"></asp:Label>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                                    <!-- row.// -->
                                    <hr>
                                    <asp:Button ID="btnCarrito" runat="server" Text="Añadir al carrito" CssClass="btn btn-lg btn-outline-primary text-uppercase" />
                                <br/>
                                <asp:Label ID="lblSinEx" runat="server" Text="No hay existencias ┐(‘～`；)┌" CssClass="text-warning"></asp:Label>
                                <asp:Label ID="lblSinCa" runat="server" Text="0? ┐(‘～`；)┌" CssClass="text-warning"></asp:Label>
                            </article>
                            <!-- card-body.// -->
                        </aside>
                        <!-- col.// -->
                    </div>
                    <!-- row.// -->
                </div>
                <!-- card.// -->


            </div>
            <!--container.//-->
        </div>
    </div>

    
    <!--FOOTER SPACE-->
    <div style="height: 100px"></div>
    <!--FOOTER SPACE-->


</asp:Content>

