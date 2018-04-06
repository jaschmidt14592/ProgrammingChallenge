<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JaredSchmidt_Agco._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

    @model List<KeyValuePair<string,int>>
@{
    ViewBag.Title = "Index";
    Layout = "~/Views/Shared/_LayoutTest.cshtml";

    double successful = Model.FirstOrDefault(x => x.Key == "Successful:").Value;
    double unsuccessful = Model.FirstOrDefault(x => x.Key == "Unsuccessful:").Value;
    double unprocessed = Model.FirstOrDefault(x => x.Key == "Unprocessed:").Value;
    double total = successful + unsuccessful + unprocessed;
}

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<div class="container m-5">
    <div class="mb-3">
        <h1>Billing Progress Status</h1>
    </div>
    <div class="mb-3">
        <p>Status: In-Progress</p>
    </div>
    <div class="progress" style="height: 3rem;">
        <div class="progress-bar" role="progressbar" style="width: @(successful/total*100)%"></div>
        <div class="progress-bar" role="progressbar" style="width: @(unsuccessful/total*100)%; background-color: red;"></div>
        <div class="progress-bar" role="progressbar" style="width: @(unprocessed/total*100)%; background-color: gainsboro;"></div>
    </div>
    <div class="mt-3">
        <table>
            <tr>
                <td style="color: blue; font-weight: bold; width: 150px;">Successful:</td>
                <td>@successful</td>
            </tr>
            <tr>
                <td style="color: red; font-weight: bold;">Unsuccessful:</td>
                <td>@unsuccessful</td>
            </tr>
            <tr>
                <td style="color: gainsboro; font-weight: bold;">Unprocessed:</td>
                <td>@unprocessed</td>
            </tr>
            <tr>
                <td style="font-weight: bold;">Total:</td>
                <td>@total</td>
            </tr>
        </table>

    </div>
</div>
    
                //HttpContext.Response.Headers.Add("refresh", "10; url=" + Url.Action("Index"));

            var list = new List<KeyValuePair<string, int>>();
            list.Add(new KeyValuePair<string, int>("Successful:", 300));
            list.Add(new KeyValuePair<string, int>("Unsuccessful:", 50));
            list.Add(new KeyValuePair<string, int>("Unprocessed:", 150));
            list.Add(new KeyValuePair<string, int>("Total:", 500));


            return View(list);
</asp:Content>
