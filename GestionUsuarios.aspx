<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="Taller_Mecanico.GestionUsuarios" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/forms.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="navbar">
                <asp:LinkButton ID="linkMenu" runat="server" cssClass="linkMenu" OnClick="linkMenu_Click">Menu</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Gestionar Usuarios"></asp:Label>            
            </div>
            <hr />
            <div class="formulario">
                <div class="datos">
                    <asp:TextBox ID="txtNombre"  CssClass="inputs" placeHolder="Nombre" runat="server"></asp:TextBox>
            
                    <asp:TextBox ID="txtCI"  CssClass="inputs" placeHolder="CI" runat="server"></asp:TextBox>
            
                    <asp:TextBox ID="txtTelefono"  CssClass="inputs"  placeHolder="Telefono" runat="server"></asp:TextBox>
          
                    <asp:TextBox ID="txtMail"  CssClass="inputs" placeHolder="Mail" runat="server"></asp:TextBox>

                    <asp:TextBox ID="txtPassword"  CssClass="inputs" placeHolder="Password" runat="server"></asp:TextBox>
                </div>
                <div class="buttons">
                    <asp:Button ID="btnAlta" runat="server" Text="Alta" CssClass="btn" EnableTheming="True" OnClick="btnAlta_Click" />
                    <asp:Button ID="btnBaja" runat="server" Text="Baja" CssClass="btn" OnClick="btnBaja_Click" />            
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn" OnClick="btnModificar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn" OnClick="btnLimpiar_Click" />
                </div>
            </div>


            <div class="grid">
                <asp:GridView ID="GridUsuarios" runat="server" AutoGenerateColumns ="False" Width="888px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="IdUsuario" HeaderText="Id Usuario" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Ci" HeaderText="C.I." />
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                        <asp:BoundField DataField="Mail" HeaderText="Mail" />
                        <asp:BoundField DataField="Password" HeaderText="Contraseña" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdUsuario") %>' OnClick="link_OnClick" >Seleccionar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>           
             <div class="ContainerAlerts">
                <asp:Label ID="lblAlertas"  CssClass="alerts" runat="server"></asp:Label>
            </div>
            </div>

        </div>
    </form>
</body>
</html>
