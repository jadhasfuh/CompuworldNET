<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MasVistos.aspx.vb" Inherits="APages_MasVendidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <div class="row justify-content-center h-100">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-body">
                    <asp:Label CssClass="my-4 h3" runat="server" Text="Los más vistos ≧◡≦"></asp:Label>
                </div>
            </div>
        </div>
    

    <div runat="server" class="row tableVistos">
        <asp:GridView GridLines="None" CssClass="table table-hover table-striped" ID="GridMasVistos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_PROD" DataSourceID="SqlMasVendidos" AllowSorting="True" AllowPaging="True" PageSize="5">
            <Columns>
                <asp:BoundField DataField="ID_PROD" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#343A40" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="ID_PROD"></asp:BoundField>
                <asp:BoundField DataField="NOMBRE_PROD" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#343A40" HeaderText="Nombre" SortExpression="NOMBRE_PROD"></asp:BoundField>
                <asp:ImageField DataImageUrlField="IMAGEN_PROD" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#343A40" NullDisplayText="Corrupto" />
                <asp:BoundField DataField="PRECIO_PROD" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#343A40" HeaderText="Precio" SortExpression="PRECIO_PROD"></asp:BoundField>
                <asp:BoundField DataField="EXISTENCIAS_PROD" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#343A40" HeaderText="Existencias" SortExpression="EXISTENCIAS_PROD"></asp:BoundField>
                <asp:BoundField DataField="CLICS" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#343A40" HeaderText="Vistas" SortExpression="CLICS"></asp:BoundField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>
    </div>

    <!--FOOTER SPACE-->
    <div style="height: 100px"></div>
    <!--FOOTER SPACE-->
        </div>
   
    <asp:SqlDataSource runat="server" ID="SqlMasVendidos" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [NOMBRE_PROD], [ID_PROD], [EXISTENCIAS_PROD], [IMAGEN_PROD], [PRECIO_PROD], [CLICS] FROM [PRODUCTOS]  ORDER BY [CLICS] DESC"></asp:SqlDataSource>

</asp:Content>

