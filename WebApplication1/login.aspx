<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
        <title>Search Near by location</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 <style type="text/css">
        
 body, html {
    
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        display:table;
    }
    body {
        display:table-cell;
        vertical-align:middle;
    }
    form {
        display:table;/* shrinks to fit conntent */
        margin:auto;
    }

       </style>
</head>
<body>
    <form id="form_login" runat="server">
    <p>
            <input type="text" id="username" placeholder="username" runat="server"/>
        </p>
        <p>
            <input type="password" id="password" placeholder="password" runat="server"/>
        </p>
        
        <p>
            <button id="submitbutton" type="button" onServerClick="submitbutton_OnClick" runat="server">Log in</button>
            
        </p>
        <p>
            <button id="signup" type="button" OnServerClick="signup_OnClick" runat="server">click to sign up</button>
        </p>
    </form>
</body>
</html>
