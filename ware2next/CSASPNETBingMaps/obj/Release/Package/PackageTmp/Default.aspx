<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSASPNETBingMaps.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.3"></script>
    <script type="text/javascript">
        //
        // see http://www.codeproject.com/Articles/42730/Microsoft-VEMap-Using-Pure-Javascript
        //

        var map = null;
        var style = VEMapStyle.Road;

        function LoadMap() {
            map = new VEMap('pnlBingMap');

            var Ballarat = new VELatLong(-37.564450, 143.857219);
            map.LoadMap(Ballarat, 17, style, false, VEMapMode.Mode2D, true, 1);

            // https://www.bing.com/mapspreview?rtp=adr.Ballarat,VIC~adr.Bendigo,VIC&rtop=0~1~0

            AddPin(-37.4747909978, 143.675377582, "Harry Beattie<br /><span style=color:red>A.F.C - 1916-01-30Z</span>", "Killed in Action: No<br /><b>Planter: Miss L. Wallace</b>");
            AddPin(-37.4748644919, 143.675346734, "Robert H . Ferguson<br /><span style=color:red>48th Batt. - 1916-07-01Z</span>", "Killed in Action: Yes<br /><b>Planter: Miss D. Sainsbery</b>");
            AddPin(-37.4749548225, 143.675324317, "Robert R. Hamilton<br /><span style=color:red>51st Batt. - 1915-11-18Z</span>", "Killed in Action: No<br /><b>Planter: Miss H. Gunn</b>");
            AddPin(-37.474466317, 143.675257666, "Albert E. Bray<br /><span style=color:red>7th F.A.B. - 1916-01-02Z</span>", "Killed in Action: No<br /><b>Planter: Miss M. Young</b>");
            AddPin(-37.4743880837, 143.67526308, "R. Ford Bray<br /><span style=color:red>11th Batt. - 1916-01-02Z</span>", "Killed in Action: No<br /><b>Planter: Miss V. Feary</b>");
            AddPin(-37.4740624574, 143.675320082, "Archibald Black<br /><span style=color:red>43rd Batt. - 1916-04-17Z</span>", "Killed in Action: No<br /><b>Planter: Miss B. Davies</b>");
            AddPin(-37.4739664449, 143.675342762, "C. Roy Mitchell<br /><span style=color:red>2nd F.A.B. - 1915-07-01Z</span>", "Killed in Action: No<br /><b>Planter: Miss A. Dawe</b>");
            AddPin(-37.4737418117, 143.675375957, "Ernest Kenworthy<br /><span style=color:red>23rd Batt. - 1916-07-19Z</span>", "Killed in Action: No<br /><b>Planter: Miss F Kenworthy</b>");
            AddPin(-37.4736341303, 143.675408662, "Hector H. Tudor<br /><span style=color:red>Motor Trans. - 1916-06-18Z</span>", "Killed in Action: No<br /><b>Planter: Mr. Bolster</b>");
            AddPin(-37.4735010886, 143.67542741, "Frank Mitchell<br /><span style=color:red>21st Batt. - 1916-10-19Z</span>", "Killed in Action: No<br /><b>Planter: Miss M. Streeter</b>");
            AddPin(-37.4733924466, 143.675446842, "J. Sinclair McIver<br /><span style=color:red>1st M.G.S. - 1917-12-17Z</span>", "Killed in Action: No<br /><b>Planter: Miss A. Charles</b>");
            AddPin(-37.4731833979, 143.675499984, "George L. Smith<br /><span style=color:red>M.A.D. - 1916-07-01Z</span>", "Killed in Action: No<br /><b>Planter: Mrs. Bolster</b>");
            AddPin(-37.473067088, 143.67551588, "W. Cully Smith<br /><span style=color:red>12th L.H.R. - 1916-07-01Z</span>", "Killed in Action: No<br /><b>Planter: Miss C. Swan</b>");
            AddPin(-37.4729630455, 143.675535103, "Colin R. Hill<br /><span style=color:red>R.B.A.A. - 1917-05-17Z</span>", "Killed in Action: No<br /><b>Planter: Miss L. Mitchell</b>");
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
        function FindDestination() {
            var loc = document.getElementById("Destination").value;
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
        function show() {
            document.getElementById('view').scrollIntoView();
            
        }

    </script>

    <style type="text/css">
        .map {
            position: absolute;
            width: 700px;
            height: 500px;
            border: #555555 2px solid;
        }
    </style>

</head>
<body onload="LoadMap();" style="background-color: #F0F8FF">
    
    <script type="text/javascript">

        function AddPin(lat, long, title, description) {
            // Add a new pushpin to the center of the map.
            // pinPoint = map.GetCenter();
            // pinPixel = map.LatLongToPixel(pinPoint);

            pinPoint = new VELatLong(lat, long );

            var pin = map.AddPushpin(pinPoint);
            pin.SetTitle(title);
            pin.SetDescription(description);
            pin.SetCustomIcon("<img src='images/marker-icon.png' />");

            // pin.SetMoreInfoURL("http://dotnetricks.blogspot.com");
        }

    </script>

    <form id="form1" runat="server" >

        <div>
            <table>
                <tr id ="view">
                    <td style="width: 740px; vertical-align: text-top"; >
                        <b>WHERE TO NEXT</b>
                        <br />
                        <asp:Panel ID="pnlBingMap" CssClass="map" runat="server" style="width:100%;">
                        </asp:Panel>
                    
                  
                    <td>

                </tr>
                
            
                <tr>      
                       <asp:Panel ID="pnlDisplayOption" runat="server">
                            <b>Where are you now?
                        <br />
                                <asp:DropDownList ID="Source" runat="server">                                    
                                        <asp:ListItem>110 Lydiard St South, Ballarat</asp:ListItem>
                                        <asp:ListItem>Ballarat Railway Station</asp:ListItem>
                                        <asp:ListItem>10 Sturt Street, Ballarat</asp:ListItem>
                                        <asp:ListItem>36 Gillies Street, Wendouree</asp:ListItem>
                                        <asp:ListItem>2 University Drive, Mt Helen</asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</panel><asp:Button ID="Selectmap1" runat="server" Text="SHOW ON MAP" OnClientClick="FindLoc();show();return false;" />
                                <br />
                                <br />
                                <b>Where do you want to go?
                        <br />
                                    <asp:DropDownList ID="Destination" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Ballarat Railway Station</asp:ListItem>
                                        <asp:ListItem>Avenue of Honour, Ballarat</asp:ListItem>
                                        <asp:ListItem>1 Drummond St N, Ballarat Central</asp:ListItem>
                                        <asp:ListItem>Australian Ex-Prisoners of War Memorial, Ballarat</asp:ListItem>
                                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Selectmap" runat="server" Text="SHOW ON MAP" OnClientClick="FindDestination();show();return false;" />
                                    <br />
                                    <br />
                                     <b>Why are you going there?
                                <br />
                                            <asp:DropDownList ID="Reason" runat="server">

                                                <asp:ListItem> </asp:ListItem>
                                                <asp:ListItem>To vist a War Heritage Site</asp:ListItem>
                                                <asp:ListItem>To vist my doctor</asp:ListItem>
                                                <asp:ListItem>To visit an old friend</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                    <b>Who are you?
                        <br />
                                        <asp:DropDownList ID="profile" runat="server">
                                            <asp:ListItem> </asp:ListItem>
                                            <asp:ListItem>I am a tourst looking for War Heritage sites in Ballarat</asp:ListItem>
                                            <asp:ListItem>I am a 75 year old man using an electric scooter</asp:ListItem>
                                            <asp:ListItem>I am a 20 year old and I use crutches</asp:ListItem>
                                            <asp:ListItem>I am an 30 year old active with no walking disabilities</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                       
                                            <b>How am I getting there?
                            <br />
                                                <asp:DropDownList ID="DropDownList1" runat="server">
                                                    <asp:ListItem> </asp:ListItem>
                                                    <asp:ListItem>Walking</asp:ListItem>
                                                    <asp:ListItem>Public Transport</asp:ListItem>
                                                    <asp:ListItem>UBER</asp:ListItem>
                                                    <asp:ListItem>Taxi</asp:ListItem>
                                                    <asp:ListItem>Bus</asp:ListItem>
                                                    <asp:ListItem>Plane</asp:ListItem>
                                                    <asp:ListItem>Walking Aids</asp:ListItem>
                                                    <asp:ListItem>PushBike</asp:ListItem>
                                                    <asp:ListItem>Rented Car</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <br />


                                                View Style:
                        <asp:RadioButtonList ID="rdlViewStyle" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow">
                            <asp:ListItem Selected="True" onclick="SetStyle('r')">Road</asp:ListItem>
                            <asp:ListItem onclick="SetStyle('a')">Aerial</asp:ListItem>
                        </asp:RadioButtonList>
                                                <br />
                                                <br />

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
                                                <br />
                                                <br />
                                                <asp:Button ID="preview" runat="server" Text="PREVIEW" OnClientClick="FindLoc();show();return false;" />
                                                
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
