<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="JaredSchmidt_Agco.Calculator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<asp:HiddenField ID="hiddenFieldValue" runat="server" />
<asp:HiddenField ID="hiddenFieldSign" runat="server" />

<h1>Calculator</h1>

<div class="wrapper">
    <asp:textbox ID="txtTotal" runat="server" class="total">0</asp:textbox>
    <asp:button ID="btnClear" runat="server" Text="C" class="button" OnClick="btnClear_Click" />
    <asp:button ID="btnSign" runat="server" Text="+/-" class="button" OnClientClick="return ChangeSign();"/>
    <asp:button ID="btnDivide" runat="server" Text="/" class="button" Value="Divide" OnClick="btnCalculate_Click"/>
    <asp:button ID="btnMultiply" runat="server" Text="X" class="button" Value="Multiply" OnClick="btnCalculate_Click"/>
    <asp:button ID="btnSeven" runat="server" Text="7" class="button" OnClientClick="return display('7');" />
    <asp:button ID="btnEight" runat="server" Text="8" class="button" OnClientClick="return display('8');" />
    <asp:button ID="btnNine" runat="server" Text="9" class="button" OnClientClick="return display('9');" />
    <asp:button ID="btnMinus" runat="server" Text="-" class="button" Value="Minus" OnClick="btnCalculate_Click"/>
    <asp:button ID="btnFour" runat="server" Text="4" class="button" OnClientClick="return display('4');" />
    <asp:button ID="btnFive" runat="server" Text="5" class="button" OnClientClick="return display('5');" />
    <asp:button ID="btnSix" runat="server" Text="6" class="button" OnClientClick="return display('6');" />
    <asp:button ID="btnPlus" runat="server" Text="+" class="button" Value="Plus" OnClick="btnCalculate_Click" />
    <asp:button ID="btnOne" runat="server" Text="1" class="button" OnClientClick="return display('1');" />
    <asp:button ID="btnTwo" runat="server" Text="2" class="button" OnClientClick="return display('2');" />
    <asp:button ID="btnThree" runat="server" Text="3" class="button" OnClientClick="return display('3');" />
    <asp:button ID="btnPoint" runat="server" Text="." class="button" OnClientClick="return display('.');" />
    <asp:button ID="btnZero" runat="server" Text="0" class="zero button" OnClientClick="return display('0');" />
    <asp:button ID="btnEqual" runat="server" Text="=" class="equal button" Value="" OnClick="btnCalculate_Click" />
</div>

<script>
    var total = "";

    function display(value) {
        var label = document.getElementsByClassName('total')[0];
        total += value;
        label.value = total;
        return false;
    }

    function ChangeSign() {
        var label = document.getElementsByClassName('total')[0];
        newValue = parseFloat(label.value);
        newValue *= -1;
        label.value = newValue;
        return false;
    }
</script>

<style>
    .wrapper {
      display: grid;
      grid-template-columns: 60px 60px 60px 60px;
      grid-template-rows: 60px 60px 60px 60px 60px 60px;
      grid-auto-flow: row;
    }

    .button {
      font-size: 2rem;
      border: 1px solid #333;
      background-color: #ccc;
    }

    .total {
        grid-column: 1/5;
        grid-row: 1/2;
        background-color: #333;
        color: white;
        margin: 0;
        padding: 1rem;
        font-size: 4rem;
        text-align: right;
        border: 1px solid #333;
    }

    .equal {
        grid-column: 4/5;
        grid-row: 5/7;

    }

    .zero {
        grid-column: 1/3;
        grid-row: 6/7;
    }
</style>

</asp:Content>
