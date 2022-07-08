<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionMecanicos.aspx.cs" Inherits="Taller_Mecanico.GestionMecanicos" %>

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
                <asp:LinkButton ID="linkMenu" runat="server" CssClass="linkMenu" OnClick="linkMenu_Click">Menu</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Gestionar Mecanicos"></asp:Label>
            </div>
            <hr />
            <div class="formulario">   
                <div class="datos"> 
                    <asp:TextBox ID="txtNombre" cssClass="inputs"  placeHolder="Nombre" runat="server"></asp:TextBox>

                    <asp:TextBox ID="txtCi" cssClass="inputs" placeHolder="CI" runat="server"></asp:TextBox>
            
                    <asp:TextBox ID="txtTelefono" cssClass="inputs" placeHolder="Telefono" runat="server"></asp:TextBox>
   
                    <asp:TextBox ID="txtValorHora" cssClass="inputs" placeHolder="ValorHora" runat="server"></asp:TextBox>
                </div>
            
                <div class="buttons"> 
                    <asp:Button ID="btnAlta" runat="server" CssClass="btn" Text="Alta" OnClick="btnAlta_Click" />
                    <asp:Button ID="btnBaja" runat="server" CssClass="btn" Text="Baja" OnClick="btnBaja_Click" />
                    <asp:Button ID="btnModificar" runat="server" CssClass="btn" Text="Modificar" OnClick="btnModificar_Click" />
                    <asp:Button ID="Limpiar" runat="server" CssClass="btn" Text="Limpiar" OnClick="Limpiar_Click" />
                </div>
            </div>

        
            <div class="grid">
                <asp:GridView ID="GridMecanicos" runat="server" AutoGenerateColumns ="False" Width="888px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="IdMecanico" HeaderText="Id Mecanico" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Ci" HeaderText="C.I." />
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                        <asp:BoundField DataField="ValorHora" HeaderText="Valor Hora" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdMecanico") %>' OnClick="link_OnClick" >Seleccionar</asp:LinkButton>
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
