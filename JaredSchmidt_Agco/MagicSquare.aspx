<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MagicSquare.aspx.cs" Inherits="JaredSchmidt_Agco.MagicSquare" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h1>Magic Square</h1>

<h4>Order:</h4>
<asp:DropDownList ID="ddlSize" runat="server" Width="150px"></asp:DropDownList>

<div id="divGrid" runat="server"></div>

<asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-primary" Text="Generate" OnClick="btnGenerate_Click"/>


<style>
    .grid {
        display: grid;
        grid-auto-flow: row;
        margin-top: 15px;
    }

    .grid-three {
        grid-template-columns: 60px 60px 60px;
    }

    .grid-five {
        grid-template-columns: 60px 60px 60px 60px 60px;
    }

    .grid-nine {
        grid-template-columns: 60px 60px 60px 60px 60px 60px 60px 60px 60px;
    }

    .grid div {
        font-size: 2rem;
        background-color: #ccc;
        border: 1px solid #333;
        text-align: center;
        padding-top: 15px;
        height: 60px;
    }

    .btn {
        margin-top: 15px;
    }
</style>

</asp:Content>
