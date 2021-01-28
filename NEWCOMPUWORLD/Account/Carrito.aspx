<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Carrito.aspx.vb" Inherits="Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container h-100" runat="server" id="carritoVacio">
        <div class="row justify-content-center h-100">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-body">
                    <asp:Label ID="LabelProductos" CssClass="my-4 h3" runat="server" Text="El carrito esta vacío (‘～`；)"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <img src="../Img/Iconos/carito.png" width="300px" />
                </div>
            </div>
        </div>
    </div>

    <div class="container" runat="server" id="carritoLleno">
        <div class="row">
            <!--Section: Block Content-->
            <section>
                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-lg-8">

                        <div class="card wish-list mb-3">
                            <div class="card-body">
                                <h5 class="mb-4">Carrito</h5>

                                <asp:Label ID="lblusID" runat="server" Text=""></asp:Label>
                                
                                <asp:SqlDataSource runat="server" ID="SqlCARRITO" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT PRODUCTOS.IMAGEN_PROD, PRODUCTOS.NOMBRE_PROD, PRODUCTOS.DESCRIPCION_PROD, PRODUCTOS.PRECIO_PROD, PRODUCTOS.PDESC_PROD, CARRITO.CANTIDAD_CARR FROM PRODUCTOS INNER JOIN CARRITO INNER JOIN AspNetUsers ON CARRITO.Id = AspNetUsers.Id ON PRODUCTOS.ID_PROD = CARRITO.ID_PROD WHERE (CARRITO.Id = @usrID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblusID" PropertyName="Text" Name="usrID"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:Repeater ID="articulosCarrito" runat="server" DataSourceID="SqlCARRITO">
                                    <ItemTemplate>
                                        <div class="row mb-4">
                                            <div class="col-md-5 col-lg-3 col-xl-3">
                                                <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                                                    <asp:Image ID="imagen" runat="server" CssClass="img-fluid w-100" ImageUrl='<%#Eval("IMAGEN_PROD")%>' />
                                                </div>
                                            </div>
                                            <div class="col-md-7 col-lg-9 col-xl-9">
                                                <div>
                                                    <div class="d-flex justify-content-between">
                                                        <div>
                                                            <h5>
                                                                <asp:Label ID="lblNomArt" runat="server" Text='<%#Eval("NOMBRE_PROD")%>'></asp:Label>
                                                                (<asp:Label ID="lblCantidad" runat="server" Text='<%#Eval("CANTIDAD_CARR")%>'></asp:Label> Piezas)
                                                            </h5>
                                                                <p class="mb-3 text-muted text-uppercase small">
                                                                <asp:Label ID="lblDescArt" runat="server" Text='<%#Eval("DESCRIPCION_PROD")%>'></asp:Label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div>
                                                            <a href="#!" type="button" class="card-link-secondary small text-uppercase mr-3"><i
                                                                class="fas fa-trash-alt mr-1"></i>
                                                                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" />
                                                            </a>
                                                        </div>
                                                        <p class="mb-0">
                                                            <span>
                                                                <strong>
                                                                    <asp:Label ID="lblPrecio" runat="server" Text='<%#Eval("PRECIO_PROD", "{0:C}")%>'></asp:Label>
                                                                </strong>
                                                            </span>
                                                            <span>
                                                                <strong>-
                                                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("PDESC_PROD")%>'></asp:Label>%
                                                                </strong>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <!-- Card -->

                        <!-- Card ENTREGA ESTIMADA -->
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="mb-4">Fecha de entrega estimada</h5>
                                <p class="mb-0">Lun 8/Feb - Mie 10/Feb</p>
                            </div>
                        </div>
                        <!-- Card -->

                        <!-- Card TIPOS DE TARJETAS-->
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="mb-4">Aceptamos</h5>
                                <img class="mr-2" width="45px"
                                    src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                                    alt="Visa">
                                <img class="mr-2" width="45px"
                                    src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                                    alt="American Express">
                                <img class="mr-2" width="45px"
                                    src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                                    alt="Mastercard">
                            </div>
                        </div>
                        <!-- Card -->
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-4">

                        <!-- Card RESUMEN-->
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="mb-3">Resumen del pedido</h5>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">Subtotal
                                <span>
                                    <asp:Label ID="lblSubtotal" runat="server" Text="$25.98"></asp:Label></span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">Envío
                                <span>
                                    <asp:Label ID="lblCEnvio" runat="server" Text="Gratis"></asp:Label></span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Total a pagar</strong>
                                            <strong>
                                                <p class="mb-0">(IVA incluido)</p>
                                            </strong>
                                        </div>
                                        <span><strong>
                                            <asp:Label ID="lblTotal" runat="server" Text="$25.98"></asp:Label></strong></span>
                                    </li>
                                </ul>
                                <asp:Button ID="btnComprar" runat="server" Text="Comprar" CssClass="btn btn-primary btn-block waves-effect waves-light btncom" data-toggle="modal" data-target="#anadirC"/>
                            </div>
                        </div>
                        <!-- Card -->
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </section>
            <!--Section: Block Content-->
        </div>
    </div>

    <!--FOOTER SPACE-->
    <div style="height: 100px"></div>
    <!--FOOTER SPACE-->

    <%--MODAL--%>
    <div class="modal fade" id="anadirC" tabindex="-1" role="dialog" aria-labelledby="anadirC" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <div>
                        <span class="anchor" id="formPayment"></span>

                        <!-- form card cc payment -->
                        <div class="">
                            <div class="card-body">
                                <h3 class="text-center">Formulario de envío</h3>
                                <hr>
                                <form class="form" role="form" autocomplete="off">
                                    <div class="form-group row">
                                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                            <p class="text-danger">
                                                <asp:Literal runat="server" ID="FailureText" />
                                            </p>
                                        </asp:PlaceHolder>
                                        <asp:Label runat="server" ID="lblDirección" CssClass="col-md-2 control-label">Dirección:</asp:Label><br />
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDireccion" CssClass="text-muted" ErrorMessage="Campo requerido." />
                                        </div><br />
                                        <asp:Label runat="server" ID="lblCiudad" CssClass="col-md-2 control-label">Ciudad:</asp:Label><br />
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCiudad" CssClass="text-muted" ErrorMessage="Campo requerido." />
                                        </div><br />
                                        <asp:Label runat="server" ID="lblTelefono" CssClass="col-md-2 control-label">Teléfono:</asp:Label><br />
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefono" CssClass="text-muted" ErrorMessage="Campo requerido." />
                                        </div><br />
                                        <hr><br />
                                        <asp:Label runat="server" ID="lblNomTar" CssClass="col-md-2 control-label">Nombre:</asp:Label><br />
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="txtNomTar" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNomTar" CssClass="text-muted" ErrorMessage="Campo requerido." />
                                        </div><br />
                                        <asp:Label runat="server" ID="lblNumTar" CssClass="col-md-2 control-label">Tarjeta:</asp:Label><br />
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="txtNumTar" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumTar" CssClass="text-muted" ErrorMessage="Campo requerido." />
                                        </div><br />
                                        <div class="modal-footer">
                                            <div class="form-group">
                                                <div class="col-md-offset-2 col-md-12">
                                                    <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn btn-primary" UseSubmitBehavior="false" data-dismiss="modal" />
                                                    <asp:Button runat="server" ID="btnComprarM" Text="Comprar" CssClass="btn btn-secondary" UseSubmitBehavior="false" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            </form>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

