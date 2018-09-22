<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allgonggao_list.aspx.cs" Inherits="allgonggao_list" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title><LINK href="images/StyleSheet.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" href="qj.css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
 <tr><td class="title"><%=lbtxt %>管理</td></tr>
        </table><br />
        <table width="100%" align="center" border="0" id="table">
            <tbody>
                <tr class="tr2">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px;font-size:16px">
                       所有<%=lbtxt %>信息列表 </td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        &nbsp; 
                        标题：<asp:TextBox ID=title runat="server" class="text2"></asp:TextBox>
						&nbsp;
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查找" CssClass="sure" />
                        <div align="right">
                                        <div id="Button2"  ><a href="allgonggao_add.aspx?lb=<%= lbtxt%>" class="buttonprimary">新增</a></div>
                        <br />
                        <br />
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" 
                           
                            PageSize="8" Width="100%" OnPageIndexChanged="DataGrid1_PageIndexChanged" AllowPaging="True">
                            <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <PagerStyle Font-Bold="True" Font-Names="宋体" ForeColor="Blue" HorizontalAlign="Right"
                NextPageText="下一页" PrevPageText="上一页" />
                            <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="序号">
                                    <HeaderStyle Width="50px" />
                                    <ItemTemplate>
                                    <%#Container.ItemIndex+1 %>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField=title HeaderText='标题'>
                                    <ItemStyle  HorizontalAlign="Left" />
                                    <HeaderStyle  HorizontalAlign="Left" />
                                </asp:BoundColumn><asp:BoundColumn DataField=leibie HeaderText='类别'><HeaderStyle Width="80px" /></asp:BoundColumn>                   
                                <asp:BoundColumn DataField=dianjilv HeaderText='点击率'><HeaderStyle Width="50px" /></asp:BoundColumn>
                                
                                <asp:TemplateColumn HeaderText="修改">
                               		<ItemTemplate>
                                    	<a href='allgonggao_updt.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'   class="buttondanger">修改</a>
                                	</ItemTemplate>
								<HeaderStyle Width="50px" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="删除">
                                	<ItemTemplate>
                                    	<a href='delgg.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=allgonggao&npage=allgonggao_list.aspx&lb=<%=lbtxt %>' onclick="return confirm('确定要删除？')" class="buttonwarning">删除</a>
                               		</ItemTemplate>
								<HeaderStyle Width="50px" />
                                </asp:TemplateColumn>
								
                            </Columns>
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Center" />
                        </asp:DataGrid></td>
                </tr>
                <tr class="tr1">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                       <a href="#" onclick="javascript:window.print();">打印本页</a></td>
                </tr>
            </tbody>
        </table>
    
    </div>
    </form>
</body>
</html>