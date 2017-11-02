using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectLogic
{
    public partial class ShipmentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void mnuShipment_MenuItemClick(object sender, MenuEventArgs e)
        {
            MultiView1.ActiveViewIndex = int.Parse(mnuShipment.SelectedValue);
            for (int i = 0; i <= (mnuShipment.Items.Count - 1); i++)
            {
                if (i == Convert.ToInt32(e.Item.Value))
                {
                    mnuShipment.Items[i].Text = mnuShipment.Items[i].Text;
                }
                else
                {
                    mnuShipment.Items[i].Text = mnuShipment.Items[i].Text;
                }
            }
        }

        protected void fvGeneral_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }

        protected void gvShipment_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}