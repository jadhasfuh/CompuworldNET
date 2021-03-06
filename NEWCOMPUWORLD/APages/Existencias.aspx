﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Existencias.aspx.vb" Inherits="APages_Existencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <div class="row justify-content-center h-100">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-body">
                    <asp:Label CssClass="my-4 h3" runat="server" Text="Control de Inventario"></asp:Label>
                </div>
            </div>
        </div>
        <br />
        <br />

        <div class="row">
            <div class="col-lg-4">
                <div class="form-horizontal">
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblNomProd" CssClass="col-md-2 control-label">Nombre producto:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtNomProd" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNomProd" CssClass="text-danger" ErrorMessage="Nombre de producto requerido." />
                        </div>
                        <asp:Label runat="server" ID="lblPrecio" CssClass="col-md-2 control-label">Precio:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                        </div>
                        <br />
                        <asp:Label runat="server" ID="lblVistas" CssClass="col-md-2 control-label">Vistas:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtVistas" CssClass="form-control" />
                        </div>
                        <br />
                        <asp:Label runat="server" ID="lblPreVen" CssClass="col-md-2 control-label">Existencias:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtExis" CssClass="form-control" type="number" MinimumValue="0" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                ControlToValidate="txtExis" runat="server"
                                ErrorMessage="Inválido"
                                ValidationExpression="\d+">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary" UseSubmitBehavior="false" />
                            <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CssClass="btn btn-secondary" UseSubmitBehavior="false" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4" runat="server" id="img" >
                <asp:Image ID="imagen" runat="server" Width="250px"/>
            </div>
            <div class="col-lg-4" runat="server" id="fondo">
                <img src="../Img/Iconos/comprar.png" width="300px" />
            </div>
            <div class="col-lg-4" runat="server" id="correcto">
                <img src="../Img/Iconos/cheque.png" width="300px" />
            </div>
            <div class="col-lg-4" runat="server" id="incorrecto">
                <img src="../Img/Iconos/fail.png" width="300px" />
            </div>
        </div>
    </div>


    <!--FOOTER SPACE-->
    <div style="height: 100px"></div>
    <!--FOOTER SPACE-->

</asp:Content>