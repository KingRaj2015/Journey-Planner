<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSASPNETBingMaps.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.3"></script>
    <script type="text/javascript">
        var map = null;
        var style = VEMapStyle.Road;

        function LoadMap() {
            map = new VEMap('pnlBingMap');

            var Ballarat = new VELatLong(-37.5621, 143.8561);
            map.LoadMap(Ballarat, 12, style, false, VEMapMode.Mode2D, true, 1);
        }

        function SetMap() {
            var ddlzoom = document.getElementById("ddlZoomLevel");
            var zoom = ddlzoom.options[ddlzoom.selectedIndex].value;

            map.SetCenter(new VELatLong(lat, lng));
            map.SetMapStyle(style);
            map.SetZoomLevel(zoom);
        }

        function FindLoc() {
            var loc = document.getElementById("Source").value;
            try {
                map.Find(null, loc);
            } catch (e) {
                alert(e.message);
            }
        }

        function SetStyle(s) {
            if (s == "r") {
                style = VEMapStyle.Road;
            }
            else {
                style = VEMapStyle.Aerial;
            }
        }

    </script>
    <style type="text/css">
        .map
        {
            position: absolute;
            width: 700px;
            height: 500px;
            border: #555555 2px solid;
        }
    </style>
</head>
<body onload="LoadMap();">
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td style="width: 740px; vertical-align: text-top">
                    <b>Bing Maps</b>
                    <br />
                    <asp:Panel ID="pnlBingMap" CssClass="map" runat="server">
                    </asp:Panel>
                </td>
                <td>
                       <asp:Panel ID="pnlDisplayOption" runat="server">
                        <b>Where Are You Now?
                        <br />
                        <asp:DropDownList ID="Source" runat="server">
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem>Ballarat</asp:ListItem>
                            <asp:ListItem>Wendouree</asp:ListItem>
                            <asp:ListItem>Sebastopol</asp:ListItem>                           
                        </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</panel><asp:Button ID="Selectmap1" runat="server" Text="SELECT ON MAP" OnClientClick="" />
                        <br /><br />
                         <b>Where do you want to go?
                        <br />
                        <asp:DropDownList ID="Destination" runat="server">
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem>Ballarat</asp:ListItem>
                            <asp:ListItem>Wendouree</asp:ListItem>
                            <asp:ListItem>Sebastopol</asp:ListItem>                           
                        </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Selectmap" runat="server" Text="SELECT ON MAP" OnClientClick="" />
                        <br /><br />
                        <b>Who are you?
                        <br />
                        <asp:DropDownList ID="profile" runat="server">
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem>I am a 75 year old man using an electric scooter</asp:ListItem>
                            <asp:ListItem>I am a 20 year old and I use crutches</asp:ListItem>
                            <asp:ListItem>I am an 30 year old active with no walking disabilities</asp:ListItem>                           
                        </asp:DropDownList>
                        <br /><br />
                        <b>Why are you going?
                                <br />
                        <asp:DropDownList ID="Reason" runat="server">
                            
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem>To vist a War Heritage Site</asp:ListItem>
                            <asp:ListItem>To vist my doctor</asp:ListItem>
                            <asp:ListItem>To visit my old friend</asp:ListItem>                           
                        </asp:DropDownList>
                        <br /><br />
                        <b>How am I getting there?
                            <br /> 
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem>Walking</asp:ListItem>
                            <asp:ListItem>Public Transport</asp:ListItem>
                            <asp:ListItem>UBER</asp:ListItem>
                            <asp:ListItem>Rented Car</asp:ListItem>                          
                        </asp:DropDownList>
                            <br /><br />


                        View Style:
                        <asp:RadioButtonList ID="rdlViewStyle" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow">
                            <asp:ListItem Selected="True" onclick="SetStyle('r')">Road</asp:ListItem>
                            <asp:ListItem onclick="SetStyle('a')">Aerial</asp:ListItem>
                        </asp:RadioButtonList>
                        <br /><br />

                        Zoom Level:
                        <asp:DropDownList ID="ddlZoomLevel" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem Selected="True">12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                        </asp:DropDownList>
                        <br /> <br />                      
                            <asp:Button ID="preview" runat="server" Text="PREVIEW" OnClientClick="FindLoc();return false;" />
                            <asp:Button ID="Start" runat="server" Text="START" OnClientClick="" />
                        </asp:Panel>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
