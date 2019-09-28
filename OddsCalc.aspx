<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OddsCalc.aspx.vb" Inherits="HoldemOddsCalculator.OddsCalc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
    <div id="divBody"> 
        <table style="z-index: 102; left: 529px; position: absolute; top: 60px" Width="456px">
         <%--<tr><td style="width: 107px; height: 21px">--%>
             <strong>Player</strong></td><td style="height: 21px">
             <strong>Hand Value</strong></td><td style="height: 21px">
             <strong>Opponent</strong></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr1" runat="server"></asp:Label></td><td>
                 <strong>High Card</strong></td><td><asp:Label ID="o1" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr2" runat="server"></asp:Label></td><td>
                 <strong>Pair</strong></td><td><asp:Label ID="o2" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr3" runat="server"></asp:Label></td><td>
                 <strong>Two Pair</strong></td><td><asp:Label ID="o3" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr4" runat="server"></asp:Label></td><td>
                 <strong>3 of a Kind</strong></td><td><asp:Label ID="o4" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr5" runat="server"></asp:Label></td><td>
                 <strong>Straight</strong></td><td><asp:Label ID="o5" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr6" runat="server"></asp:Label></td><td>
                 <strong>Flush</strong></td><td><asp:Label ID="o6" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr7" runat="server"></asp:Label></td><td>
                 <strong>Full House</strong></td><td><asp:Label ID="o7" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr8" runat="server"></asp:Label></td><td>
                 <strong>4 of a Kind</strong></td><td><asp:Label ID="o8" runat="server"></asp:Label></td></tr>
             <tr><td style="width: 107px"><asp:Label ID="pr9" runat="server"></asp:Label></td><td>
                 <strong>Straight Flush</strong></td><td><asp:Label ID="o9" runat="server"></asp:Label></td></tr>
              <tr><td style="width: 107px; background-color: gainsboro"><asp:Label ID="pwin" runat="server"></asp:Label></td><td style="background-color: gainsboro">
                  <strong>Win/Split</strong></td><td style="background-color: gainsboro"><asp:Label ID="owin" runat="server"></asp:Label></td></tr>
         </table>
        <asp:Label ID="txtHeader" runat="server" Font-Bold="True" Style="z-index: 100; left: 520px;
            position: absolute; top: 40px" Width="448px"></asp:Label>
        
        <br />
        Player 1 Hole Cards: &nbsp; &nbsp; &nbsp; &nbsp;<input id="txtPlayer1" type="text" value="AdAh" title="Hole Cards for Player 1" name="txtPlayer1" runat="server"/><br />
        <br />
        Player 2 Hole Cards: &nbsp; &nbsp; &nbsp; &nbsp;<input id="txtPlayer2" type="text" value="As3d" title="Hole Cards for Player 2" name="txtPlayer2" runat="server"/>&nbsp;<br />
        <br />
        Player 3 Hole Cards: &nbsp; &nbsp; &nbsp; &nbsp;<input id="txtPlayer3" type="text" title="Hole Cards for Player 3" name="txtPlayer3" runat="server"/><br />
        <br />
        Player 4 Hole Cards: &nbsp; &nbsp; &nbsp; &nbsp;<input id="txtPLayer4" type="text" title="Hole Cards for Player 4" name="txtPLayer4" runat="server"/>
        
        <br />
        <br />
        <br />
        Board Cards: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <input id="txtBoardCards" type="text" name="txtBoardCards" runat="server" />
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
        <input id="btnSubmit" type="submit" value="See Win %'s" onserverclick="btnSubmit_ServerClick" runat="server" /><br />
        <br />
        <img src="images/blankcard.gif" style="display:none;z-index: 165; left: 544px; position: absolute;
            top: 248px" /><br />
        <br />
        
        <br />
       
        <br />
        
        <img src="images/pgpokertable.JPG" style="display:none;z-index: 155; left: 581px; position: absolute;
            top: 413px" />
        <br />
        &nbsp;
       
    </div> 
    <div id=cards style="z-index: 100;position: absolute; display:none; left: 22px; width: 496px; top: 653px; height: 232px;">
        <img src="images/2d.gif" style="z-index: 104; left: 72px; position: absolute; top: 80px" />
        <img src="images/2h.gif" style="z-index: 105; left: 72px; position: absolute; top: 128px" />
        <img src="images/2s.gif" style="z-index: 106; left: 72px; position: absolute; top: 176px" />
       <img src="images/2c.gif" style="z-index: 103; left: 72px; position: absolute; top: 32px" />
        <img src="images/3d.gif" style="z-index: 108; left: 104px; position: absolute; top: 80px" />
        <img src="images/3h.gif" style="z-index: 109; left: 104px; position: absolute; top: 128px" />
         <img src="images/3c.gif" style="z-index: 107; left: 104px; position: absolute; top: 32px" />
        <img src="images/4c.gif" style="z-index: 110; left: 136px; position: absolute; top: 32px" />
        <img src="images/4d.gif" style="z-index: 112; left: 136px; position: absolute; top: 80px" />
        <img src="images/4h.gif" style="z-index: 113; left: 136px; position: absolute; top: 128px" />
        <img src="images/4s.gif" style="z-index: 114; left: 136px; position: absolute; top: 176px" />
        <img src="images/3s.gif" style="z-index: 111; left: 104px; position: absolute; top: 176px" />
        <img src="images/5c.gif" style="z-index: 115; left: 168px; position: absolute; top: 32px" />
        <img src="images/5d.gif" style="z-index: 116; left: 168px; position: absolute; top: 80px" />
        <img src="images/5h.gif" style="z-index: 117; left: 168px; position: absolute; top: 128px" />
        <img src="images/5s.gif" style="z-index: 118; left: 168px; position: absolute; top: 176px" />
        <img src="images/6c.gif" style="z-index: 119; left: 200px; position: absolute; top: 32px" />
        <img src="images/6d.gif" style="z-index: 120; left: 200px; position: absolute; top: 80px" />
        <img src="images/6h.gif" style="z-index: 121; left: 200px; position: absolute; top: 128px" />
        <img src="images/6s.gif" style="z-index: 122; left: 200px; position: absolute; top: 176px" />
        <img src="images/7c.gif" style="z-index: 123; left: 232px; position: absolute; top: 32px" />
        <img src="images/7d.gif" style="z-index: 124; left: 232px; position: absolute; top: 80px" />
        <img src="images/7h.gif" style="z-index: 125; left: 232px; position: absolute; top: 128px" />
        <img src="images/7s.gif" style="z-index: 126; left: 232px; position: absolute; top: 176px" />
        <img src="images/8c.gif" style="z-index: 127; left: 264px; position: absolute; top: 32px" />
        <img src="images/8d.gif" style="z-index: 128; left: 264px; position: absolute; top: 80px" />
        <img src="images/8h.gif" style="z-index: 129; left: 264px; position: absolute; top: 128px" />
        <img src="images/8s.gif" style="z-index: 130; left: 264px; position: absolute; top: 176px" />
        <img src="images/9c.gif" style="z-index: 131; left: 296px; position: absolute; top: 32px" />
        <img src="images/9d.gif" style="z-index: 132; left: 296px; position: absolute; top: 80px" />
        <img src="images/9h.gif" style="z-index: 133; left: 296px; position: absolute; top: 128px" />
        <img src="images/9s.gif" style="z-index: 134; left: 296px; position: absolute; top: 176px" />
        <img src="images/Tc.gif" style="z-index: 135; left: 328px; position: absolute; top: 32px" />
        <img src="images/Td.gif" style="z-index: 136; left: 328px; position: absolute; top: 80px" />
        <img src="images/Th.gif" style="z-index: 137; left: 328px; position: absolute; top: 128px" />
        <img src="images/Ts.gif" style="z-index: 138; left: 328px; position: absolute; top: 176px" />
        <img src="images/Jc.gif" style="z-index: 139; left: 360px; position: absolute; top: 32px" />
        <img src="images/Jd.gif" style="z-index: 140; left: 360px; position: absolute; top: 80px" />
        <img src="images/Jh.gif" style="z-index: 141; left: 360px; position: absolute; top: 128px" />
        <img src="images/Js.gif" style="z-index: 142; left: 360px; position: absolute; top: 176px" />
        <img src="images/Qc.gif" style="z-index: 143; left: 392px; position: absolute; top: 32px" />
        <img src="images/Qd.gif" style="z-index: 144; left: 392px; position: absolute; top: 80px" />
        <img src="images/Qh.gif" style="z-index: 145; left: 392px; position: absolute; top: 128px" />
        <img src="images/Qs.gif" style="z-index: 146; left: 392px; position: absolute; top: 176px" />
        <img src="images/Kc.gif" style="z-index: 147; left: 424px; position: absolute; top: 32px" />
        <img src="images/Kd.gif" style="z-index: 148; left: 424px; position: absolute; top: 80px" />
        <img src="images/Kh.gif" style="z-index: 149; left: 424px; position: absolute; top: 128px" />
        <img src="images/Ks.gif" style="z-index: 150; left: 424px; position: absolute; top: 176px" />
        <img src="images/Ac.gif" style="z-index: 151; left: 456px; position: absolute; top: 32px" />
        <img src="images/Ad.gif" style="z-index: 152; left: 456px; position: absolute; top: 80px" />
        <img src="images/Ah.gif" style="z-index: 153; left: 456px; position: absolute; top: 128px" />
        <img src="images/As.gif" style="z-index: 154; left: 456px; position: absolute; top: 176px" />
    </div>
    </form>
       
</body>
</html>
