<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StringSorter.aspx.cs" Inherits="JaredSchmidt_Agco.StringSorter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="wrapper">
    <h1>String Sorter</h1><br />

    <h4>Paragraph to Sort:</h4>
    <asp:TextBox ID="txtParagraph" runat="server" TextMode="MultiLine" CssClass="input" Height="150px"></asp:TextBox>
    <asp:Button ID="btnSort" runat="server" Text="Sort Strings" CssClass="btn btn-primary button" OnClick="btnSort_Click" />

    <h4>Strings:</h4>
    <asp:ListBox ID="listBoxStrings" runat="server" CssClass="input" Height="150px"></asp:ListBox>

    <h4>Email list to:</h4>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="input email" />
    <span id="lblWarnEmail" class="warn">Please enter a valid email.</span><br />

    <h4>Password:</h4>
    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="input" style="width: 25%;" />

    <asp:Button ID="btnEmailList" runat="server" Text="Email List" CssClass="btn btn-primary button" OnClientClick="return ValidateEmail();" OnClick="btnEmailList_Click"/>
    <asp:Label ID="lblMessage" runat="server" CssClass="input" style="padding-top: 10px;"></asp:Label>
</div>

<script>
    function ValidateEmail() {
        var email = document.getElementsByClassName('email')[0].value;
        var warn = document.getElementById('lblWarnEmail');
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (re.test(email)) {
            warn.style.visibility = "hidden";
            return true;
        }
        else {
            warn.style.visibility = "visible";
            return false;
        }
    }
</script>
    
<style>
    .wrapper {
        display: grid;
        grid-template-columns: 30% 150px;
    }
    .warn {
        visibility: hidden;
        color: red;
    }
    .input {
        grid-column: 1/3;
        max-width: 100%;
    }
    .button {
        grid-column: 2/3;
        margin-top: 15px;
    }
</style>
    
</asp:Content>
