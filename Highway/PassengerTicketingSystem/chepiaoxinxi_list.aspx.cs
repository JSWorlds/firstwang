using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class chepiaoxinxi_list : System.Web.UI.Page
{
	//tixxixngdixngyxi
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {	
			liecheleixing.Items.Add("所有");liecheleixing.Items.Add("豪华大巴"); liecheleixing.Items.Add("普通客车"); 			zuoweileixing.Items.Add("所有");zuoweileixing.Items.Add("标准票"); zuoweileixing.Items.Add("学生票"); zuoweileixing.Items.Add("儿童票"); 			zhuangtai.Items.Add("所有");zhuangtai.Items.Add("待购"); zhuangtai.Items.Add("已售"); 			//zdxlz
			checihao.Items.Add("所有");			//yxl2fz
			addxiala1("checixinxi","checihao");			//yxlfz 
			//addlixandxongxlz
            string sql;
            sql = "select * from chepiaoxinxi order by id desc";
            getdata(sql);
        }
    }
	
	//hsgadxdliaxndoxng
	
	private void addxiala(string ntable, string nzd)
    {
        string sql;
        sql = "select "+nzd+" from "+ntable+" order by id desc";
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
           {
                int i = 0;
                for (i = 0; i < result.Tables[0].Rows.Count; i++)
                {
                    //xsbwghtresxds.Items.Add(result.Tables[0].Rows[i][0].ToString().Trim());
					
                }
            }
        }
    }
    private void getdata(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {

            if (result.Tables[0].Rows.Count > 0)
            {
                DataGrid1.DataSource = result.Tables[0];
                DataGrid1.DataBind();
                Label1.Text = "以上数据中共" + result.Tables[0].Rows.Count+"条";
               
            }
            else
            {
                DataGrid1.DataSource = null;
                DataGrid1.DataBind();
                Label1.Text = "暂无任何数据";
            }
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "select * from chepiaoxinxi where 1=1";
        if (checihao.Text.ToString().Trim()!="所有" ){ sql=sql+" and checihao like '%" + checihao.Text.ToString().Trim() + "%'";}        if (chufashijian.Text.ToString().Trim()!="" ){ sql=sql+" and chufashijian like '%" + chufashijian.Text.ToString().Trim() + "%'";}        if (chufazhan.Text.ToString().Trim()!="" ){ sql=sql+" and chufazhan like '%" + chufazhan.Text.ToString().Trim() + "%'";}        if (daodashijian.Text.ToString().Trim()!="" ){ sql=sql+" and daodashijian like '%" + daodashijian.Text.ToString().Trim() + "%'";}        if (zhongdianzhan.Text.ToString().Trim()!="" ){ sql=sql+" and zhongdianzhan like '%" + zhongdianzhan.Text.ToString().Trim() + "%'";}                        if (liecheleixing.Text.ToString().Trim()!="所有" ){ sql=sql+" and liecheleixing like '%" + liecheleixing.Text.ToString().Trim() + "%'";}        if (zuoweileixing.Text.ToString().Trim()!="所有" ){ sql=sql+" and zuoweileixing like '%" + zuoweileixing.Text.ToString().Trim() + "%'";}                if (zhuangtai.Text.ToString().Trim()!="所有" ){ sql=sql+" and zhuangtai like '%" + zhuangtai.Text.ToString().Trim() + "%'";}                
        sql = sql + " order by id desc";

        getdata(sql);
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string sql;
        sql = "select * from chepiaoxinxi order by id desc";
        getdata(sql);
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataGrid1.DataBind();
    }
	public string riqigeshi(object str)
    {
        string strTmp = str.ToString();
        DateTime dt = Convert.ToDateTime(strTmp);
        string ss = dt.ToShortDateString();
        return ss;
        
    } 
     protected void Button2_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "select * from chepiaoxinxi order by id desc";

        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);

        new Class1().ToExcel(DataGrid1, "chepiaoxinxi");
    }
	
	private void addxiala1(string ntable, string nzd)
    {
        string sql;
        sql = "select "+nzd+" from "+ntable+" order by id desc";
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
           {
                int i = 0;
                for (i = 0; i < result.Tables[0].Rows.Count; i++)
                {
                    checihao.Items.Add(result.Tables[0].Rows[i][0].ToString().Trim());
                }
            }
        }
    }	//addxldt
	
	//wxxlchange
}

