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

public partial class chepiaoxinxidetail : System.Web.UI.Page
{
	public string nchecihao,nchufashijian,nchufazhan,ndaodashijian,nzhongdianzhan,nzuoweihao,nliecheleixing,nzuoweileixing,npiaojia,nzhuangtai,nbeizhu,nid;
    protected void Page_Load(object sender, EventArgs e)
    {
   		//xxuyxaodxenglxu
		nid = Request.QueryString["id"].ToString().Trim();
        if (!IsPostBack)
        {
			
            string sql;
            sql = "select * from chepiaoxinxi where id=" + Request.QueryString["id"].ToString().Trim() ;
            getdata(sql);
			//daxipixnglxun
        }
    }

	//daxigdtpixnglxun



  

    private void getdata(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                nchecihao = result.Tables[0].Rows[0]["checihao"].ToString().Trim();
                
            }
        }
    }
    
}
