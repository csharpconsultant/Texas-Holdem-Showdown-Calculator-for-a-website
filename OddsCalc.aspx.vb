Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports HoldemHand

Partial Public Class OddsCalc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As MenuEventArgs)
    End Sub

    Protected Sub btnSubmit_ServerClick(ByVal sender As Object, ByVal e As EventArgs)
        If True Then
            Dim count As Integer = 0, index As Integer = 0
            Dim playerIndex As Integer() = {-1, -1, -1, -1}
            Dim pocketIndex As Integer() = {-1, -1, -1, -1}

            For Each pocket As String In PlayerText

                If pocket <> "" Then
                    playerIndex(count) = count
                    pocketIndex(Math.Min(System.Threading.Interlocked.Increment(count), count - 1)) = index
                End If

                index += 1
            Next

            Dim pocketCards As String() = New String(count - 1) {}

            For i As Integer = 0 To count - 1
                pocketCards(i) = PlayerText(pocketIndex(i))
            Next

            Dim wins As Long() = New Long(count - 1) {}
            Dim losses As Long() = New Long(count - 1) {}
            Dim ties As Long() = New Long(count - 1) {}
            Dim totalhands As Long = 0
            Dim dblPlayer As Double() = New Double(8) {}
            Dim dblOpponent As Double() = New Double(8) {}
            Dim playerwins As Double = 0.0
            Dim opponentwins As Double = 0.0

            Try
                Hand.HandOdds(pocketCards, Me.txtBoardCards.Value.ToString(), "", wins, ties, losses, totalhands)
                Dim winpercentage As Double = 0.0
                Dim tiepercentage As Double = 0.0
                Dim winformatted As String = ""
                Dim tieformatted As String = ""
                Dim timeinfo As String = ""
                Response.Write("<b>Win Results:<br></b>")

                If totalhands <> 0 Then

                    For i As Integer = 0 To count - 1
                        winpercentage = (CDbl(wins(i)) / CDbl(totalhands))
                        winformatted = String.Format("{0:#0.0}%", winpercentage * 100.0)
                        tiepercentage = (CDbl(ties(i)) / CDbl(totalhands))
                        tieformatted = String.Format("{0:#0.0}%", tiepercentage * 100.0)
                        Response.Write("Player " & (pocketIndex(i) + 1).ToString() & " - Win: " & winformatted & " Tie: " & tieformatted & "<BR>")
                    Next
                End If

                timeinfo = String.Format("{0:###,###,###,###} hands evaluated.", totalhands)
                Response.Write(timeinfo)
            Catch ae As ArgumentException
                Response.Write("Unable to process: " & ae.Message & ".")
            Catch
                Response.Write("Unable to process: Please check pocket, board, and dead card definitions for errors.")
            End Try

            Hand.HandPlayerOpponentOdds(Me.txtPlayer1.Value.ToString(), Me.txtBoardCards.Value.ToString(), dblPlayer, dblOpponent)
            txtHeader.Text = "Final win % for " & txtPlayer1.Value.ToString() & " vs. 1 opponent with random cards."

            For i As Integer = 0 To 9 - 1

                Select Case CType(i, Hand.HandTypes)
                    Case Hand.HandTypes.HighCard
                        pr1.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o1.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.Pair
                        pr2.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o2.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.TwoPair
                        pr3.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o3.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.Trips
                        pr4.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o4.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.Straight
                        pr5.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o5.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.Flush
                        pr6.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o6.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.FullHouse
                        pr7.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o7.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.FourOfAKind
                        pr8.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o8.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                    Case Hand.HandTypes.StraightFlush
                        pr9.Text = String.Format("{0:#0.00}%", dblPlayer(i) * 100.0)
                        o9.Text = String.Format("{0:#0.00}%", dblOpponent(i) * 100.0)
                End Select

                playerwins += dblPlayer(i) * 100.0
                opponentwins += dblOpponent(i) * 100.0
            Next

            pwin.Text = String.Format("{0:##0.00}%", playerwins)
            owin.Text = String.Format("{0:##0.00}%", opponentwins)
        End If
    End Sub

    Private ReadOnly Property PlayerText As String()
        Get
            Dim player As String() = New String(3) {}
            player(0) = txtPlayer1.Value.ToString()
            player(1) = txtPlayer2.Value.ToString()
            player(2) = txtPlayer3.Value.ToString()
            player(3) = txtPLayer4.Value.ToString()
            Return player
        End Get
    End Property
End Class
