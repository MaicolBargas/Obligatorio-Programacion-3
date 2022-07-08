<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionRepuestos.aspx.cs" Inherits="Taller_Mecanico.GestionRepuestos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/forms.css" />

</head>
<body style="height: 417px">
    <form id="form1" runat="server">
        <div class="main">
           <div class="navbar">
                <asp:LinkButton ID="linkMenu" runat="server" CssClass="linkMenu" OnClick="linkMenu_Click">Menu</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Gestionar Repuestos"></asp:Label>
           </div>
            <hr />
            <div class="formulario">
                <div class="datos">
                    <asp:TextBox ID="txtId" cssClass="inputs" placeHolder="ID" runat="server"></asp:TextBox>
  
                    <asp:TextBox ID="txtDescripcion" cssClass="inputs" placeHolder="Descripcion"  runat="server"></asp:TextBox>
       
                    <asp:TextBox ID="txtCosto" cssClass="inputs" placeHolder="Costo"  runat="server"></asp:TextBox>

                    <asp:DropDownList ID="txtTipo" cssClass="inputs" runat="server" placeHolder="Seleccionar tipo de Repuesto" Height="40px" >
                        <asp:ListItem >Seleccionar tipo de Repuesto</asp:ListItem>
                        <asp:ListItem Value="M">Motor</asp:ListItem>
                        <asp:ListItem Value="C">Carrocería</asp:ListItem>
                        <asp:ListItem Value="L">Lubricación</asp:ListItem>
                        <asp:ListItem Value="V">Varios</asp:ListItem>
                     </asp:DropDownList>
                      
                     <asp:DropDownList ID="txtProveedor" cssClass="inputs" runat="server" Height="40px">
                     </asp:DropDownList>
                </div>
                <div class="buttons">
                    <asp:Button ID="btnAlta" runat="server" CssClass="btn" Text="Alta" OnClick="btnAlta_Click" />
                    <asp:Button ID="btnBaja" runat="server" CssClass="btn" Text="Baja" OnClick="btnBaja_Click" />
                    <asp:Button ID="btnModificar" runat="server" CssClass="btn" Text="Modificar" OnClick="btnModificar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server" CssClass="btn" Text="Limpiar" OnClick="btnLimpiar_Click" />
                </div>
            </div>
            <div class="grid">
               <asp:GridView ID="GridRepuestos" runat="server" AutoGenerateColumns ="False" Width="888px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
                   <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="IdRepuesto" HeaderText="Id" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                    <asp:BoundField DataField="Costo" HeaderText="Costo" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                    <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdRepuesto") %>' OnClick="link_OnClick" >Seleccionar</asp:LinkButton>
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
                    <asp:Label ID="lblAlertas" CssClass="alerts" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
