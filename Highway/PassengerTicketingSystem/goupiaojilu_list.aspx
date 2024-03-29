<%@ Page Language="C#" AutoEventWireup="true" CodeFile="goupiaojilu_list.aspx.cs" Inherits="goupiaojilu_list" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>购票记录</title>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
    <script>
        var how = new Array();
        how[0] = "show";
        
        function show()
        {
            var a = document.getElementById(how[0]).style.display;
            
            if (a == 'none') {
                document.getElementById(how[0]).style.display = "block";
            }
            else {
                document.getElementById(how[0]).style.display = "none";
            }
           
        }
    </script>
	<link rel="stylesheet" href="qj.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
 <tr><td class="title">购票记录</td></tr>
        </table><br />
        <table width="100%" align="center" id="table">
            <tbody>
                <tr class="tr2">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">所有购票记录列表</td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        
                  &nbsp; 车次号：<asp:TextBox ID=checihao runat="server" class="text"></asp:TextBox> 
                         
                       &nbsp; 出发站：<asp:TextBox ID=chufazhan runat="server" class="text"></asp:TextBox> 
                            
                        <br />
 <br />
                        &nbsp; 购票人：<asp:TextBox ID=goupiaoren runat="server" class="text"></asp:TextBox> 
                        &nbsp;终点站：<asp:TextBox ID=zhongdianzhan runat="server" class="text"></asp:TextBox>
                       
                      
                        &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查找" CssClass="check" /> 
                        &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="导出EXCEL" CssClass="check" />
                        &nbsp;<div onclick="show(0)" style="float:right;width:40px;cursor:pointer;">更多</div>
                        <br />
 <br />
                        <div id="show">
                       
                      
                         
                        &nbsp;座位号：<asp:TextBox ID=zuoweihao runat="server" class="text"></asp:TextBox>
                        &nbsp;出发时间：<asp:TextBox ID=chufashijian runat="server" class="text"></asp:TextBox>
                        &nbsp;到达时间：<asp:TextBox ID=daodashijian runat="server" class="text"></asp:TextBox> 
                        
                             <br />
                             <br />
                        &nbsp;车辆类型：<asp:TextBox ID=liecheleixing runat="server" class="text"></asp:TextBox> 
                        &nbsp;车票类型：<asp:TextBox ID=zuoweileixing runat="server" class="text"></asp:TextBox>
                         
                             <br />
                             <br />
                        &nbsp;身份证：<asp:TextBox ID=shenfenzheng runat="server" class="text"></asp:TextBox>
                        &nbsp;状态：<asp:TextBox ID=zhuangtai runat="server" class="text"></asp:TextBox>
                        &nbsp;姓名：<asp:TextBox ID=xingming runat="server" class="text"></asp:TextBox> </div>
                        
						<br />
                             
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" PageSize="8" Width="100%" OnPageIndexChanged="DataGrid1_PageIndexChanged" AllowPaging="True">
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
                                <asp:BoundColumn DataField='checihao' HeaderText='车次号'></asp:BoundColumn>                                <asp:BoundColumn DataField='chufashijian' HeaderText='出发时间'></asp:BoundColumn>                                <asp:BoundColumn DataField="addtime" HeaderText="购买时间"></asp:BoundColumn>                                                                <asp:BoundColumn DataField='piaojia' HeaderText='票价'></asp:BoundColumn>                                <asp:BoundColumn DataField='goupiaoren' HeaderText='购票人'></asp:BoundColumn>                                <asp:BoundColumn DataField='xingming' HeaderText='姓名'></asp:BoundColumn>                                                               
                                <asp:TemplateColumn HeaderText="是否审核"><ItemTemplate><a href='sh.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>&yuan=<%#DataBinder.Eval(Container.DataItem, "issh")%>&tablename=goupiaojilu' onclick="return confirm('确定要审核？')"><%#DataBinder.Eval(Container.DataItem, "issh") %></a></ItemTemplate><HeaderStyle Width="80px" /></asp:TemplateColumn>
								<asp:BoundColumn DataField='iszf' HeaderText='是否支付'><HeaderStyle Width="80px" /></asp:BoundColumn>
								
                                <asp:TemplateColumn HeaderText="修改">
                               		<ItemTemplate>
                                    	<a href='goupiaojilu_updt.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'  class="buttondanger">修改</a>
                                	</ItemTemplate>
								<HeaderStyle Width="50px" />
					
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="删除">
                                	<ItemTemplate>
                                    	<a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=goupiaojilu&npage=goupiaojilu_list.aspx' onclick="return confirm('确定要删除？')" class="buttonwarning">删除</a>
                               		</ItemTemplate>
								<HeaderStyle Width="50px" />
					
                                </asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="详细"><ItemTemplate><a href='goupiaojilu_detail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>' class="buttonxx">详细</a></ItemTemplate><HeaderStyle Width="50px" /></asp:TemplateColumn>
                            </Columns>
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Center" />
                        </asp:DataGrid></td>
                </tr>
                <tr class="tr1">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                       <a href="#" onclick="javascript:window.print();">打印本页</a>&nbsp;&nbsp;&nbsp;
                        
                       
                    </td>
                </tr>
            </tbody>
        </table>
		<%
    //yoxutixinxg if(kucddduntx>0)
    //yoxutixinxg{
    //yoxutixinxg tsgehxdhdm
    //yoxutixinxg}
	%>
    </div>
    </form>
</body>
</html>
