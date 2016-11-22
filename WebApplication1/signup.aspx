<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="WebApplication1.signup" %>

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
         <label runat="server" id="soal1"></label>
          
        </p>
<p>
<select id="testSelect2" name="testSelect2" runat="server">
  <option value="volvo">Walking</option>
  <option value="saab">Car</option>
 
</select>
</p>

<p>
    <label runat="server" id="soal2"></label></p>
            
        
<p>
<select id="testSelect" name="testSelect" runat="server">
  <option value="volvo">Restaurant</option>
  <option value="saab">Hospital</option>
 
</select>
</p>
        <p>
            <input type="text" id="user" placeholder="username" runat="server" />
            <asp:RegularExpressionValidator  runat="server"  ErrorMessage="Username is not suitable" Display="Dynamic"
                 ValidationExpression="^([a-zA-Z0-9]{0,8})$" ID="req1"
                ForeColor="Red" ControlToValidate="user" />
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Username required" ID="req2"
                ForeColor="Red" ControlToValidate="user"/>
    
        </p>
        <p>
            <input type="password" id="pass" placeholder="password" runat="server"/>
           
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Password required" ID="req3"
                ForeColor="Red" ControlToValidate="pass"/>
        </p>
         <p>
            <input type="password" id="repassword" placeholder="Repeat password" runat="server"/>
              <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Password confirmation required" ID="req4"
                ForeColor="Red" ControlToValidate="repassword" />
             <asp:CompareValidator id="comparePasswords" 
      runat="server"
      ControlToCompare="pass"
      ControlToValidate="repassword"
      ErrorMessage="Your passwords do not match up!"
      Display="Dynamic" ForeColor="Red"/>
        </p>
        <p>
            <button id="submitbtn" type="submit" OnServerClick="submitbtn_OnClick" runat="server">Sign up</button>
        </p>
    </form>
</body>
</html>
