<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionAdmins.aspx.cs" Inherits="Taller_Mecanico.GestionAdmins" %>

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
                <asp:Label ID="Label1" runat="server" Text="Gestionar Administradores"></asp:Label>
            </div>
            <hr />
            <div class="formulario">
                <div class="datos">                    
                    <asp:TextBox ID="txtId" cssClass="inputs" runat="server" placeHolder="Id" Enabled="False"></asp:TextBox>

                    <asp:TextBox ID="txtNombre" cssClass="inputs" placeHolder="Nombre" runat="server"></asp:TextBox>

                    <asp:TextBox ID="txtCi" CssClass="inputs" placeHolder="CI" runat="server"></asp:TextBox>
            
                    <asp:TextBox ID="txtMail" cssClass="inputs" placeHolder="Mail" runat="server"></asp:TextBox>

                    <asp:TextBox ID="txtPassword" cssClass="inputs" placeHolder="Contraseña" runat="server"></asp:TextBox>
          
                    <asp:TextBox ID="txtClave" cssClass="inputs" placeHolder="Clave de Admin" runat="server"></asp:TextBox>
                </div>
                
                <div class="buttons">                    
                    <asp:Button ID="btnAlta" runat="server" CssClass="btn" Text="Alta" OnClick="btnAlta_Click" />
                    <asp:Button ID="btnBaja" runat="server" Text="Baja" CssClass="btn" OnClick="btnBaja_Click" />
                    <asp:Button ID="btnModificar" runat="server" CssClass="btn" Text="Modificar" OnClick="btnModificar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server" CssClass="btn" Text="Limpiar" OnClick="btnLimpiar_Click" />
                </div>
             </div>
           

            <div class="grid">
                <asp:GridView ID="GridAdmins" runat="server" AutoGenerateColumns ="False" Width="888px" CellPadding="3" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" >
                    <Columns>
                        <asp:BoundField DataField="IdAdmin" HeaderText="Id Usuario" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Ci" HeaderText="C.I." />                    
                        <asp:BoundField DataField="Mail" HeaderText="Mail" />
                        <asp:BoundField DataField="Password" HeaderText="Contraseña" />
                        <asp:BoundField DataField="ClaveAdmin" HeaderText="Clave" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkView" runat="server" CommandArgument='<%# Eval("IdAdmin") %>' OnClick="link_OnClick" >Seleccionar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
                <div class="ContainerAlerts">
                    <asp:Label ID="lblAlertas" CssClass="alerts" runat="server"></asp:Label>
                </div>    
            </div>
        </div>
    </form>
</body>
</html>
