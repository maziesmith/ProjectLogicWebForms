using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;

namespace ProjectLogic
{
    public partial class BFDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isPostBack = IsPostBack;
        }

        protected void gvBFMats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView view = this.fvBookingForm.Row.FindControl("gvBFMats") as GridView;
            TextBox txtBFID = this.fvBookingForm.Row.FindControl("txtBFID") as TextBox;
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow gvrow = view.FooterRow;
                DropDownList ddlMfr = (DropDownList)gvrow.FindControl("ddlMfr");
                DropDownList ddlThickness = (DropDownList)gvrow.FindControl("ddlThickness");
                DropDownList ddlCore = (DropDownList)gvrow.FindControl("ddlCore");
                DropDownList ddlSize = (DropDownList)gvrow.FindControl("ddlSize");
                TextBox txtColor = (TextBox)gvrow.FindControl("txtColor");
                TextBox txtQty = (TextBox)gvrow.FindControl("txtQty");
                DropDownList ddlFinish = (DropDownList)gvrow.FindControl("ddlFinish");
                TextBox txtExtra = (TextBox)gvrow.FindControl("txtExtra");
                gvBFMatsSQL.InsertParameters.Clear();
                gvBFMatsSQL.InsertParameters.Add("BookingFormID", txtBFID.Text);
                gvBFMatsSQL.InsertParameters.Add("MatManufacturerID", ddlMfr.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatThicknessID", ddlThickness.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatCoreID", ddlCore.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatSizeID", ddlSize.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatFinishColor", txtColor.Text);
                gvBFMatsSQL.InsertParameters.Add("MatQty", txtQty.Text);
                gvBFMatsSQL.InsertParameters.Add("MatFinishPrePostID", ddlFinish.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatNumExtraSheets", txtExtra.Text);
                gvBFMatsSQL.Insert();
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow gvrow = (GridViewRow)view.Controls[0].Controls[0];
                DropDownList ddlMfr = (DropDownList)gvrow.FindControl("ddlMfr");
                DropDownList ddlThickness = (DropDownList)gvrow.FindControl("ddlThickness");
                DropDownList ddlCore = (DropDownList)gvrow.FindControl("ddlCore");
                DropDownList ddlSize = (DropDownList)gvrow.FindControl("ddlSize");
                TextBox txtColor = (TextBox)gvrow.FindControl("txtColor");
                TextBox txtQty = (TextBox)gvrow.FindControl("txtQty");
                DropDownList ddlFinish = (DropDownList)gvrow.FindControl("ddlFinish");
                TextBox txtExtra = (TextBox)gvrow.FindControl("txtExtra");
                gvBFMatsSQL.InsertParameters.Clear();
                gvBFMatsSQL.InsertParameters.Add("BookingFormID", txtBFID.Text);
                gvBFMatsSQL.InsertParameters.Add("MatManufacturerID", ddlMfr.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatThicknessID", ddlThickness.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatCoreID", ddlCore.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatSizeID", ddlSize.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatFinishColor", txtColor.Text);
                gvBFMatsSQL.InsertParameters.Add("MatQty", txtQty.Text);
                gvBFMatsSQL.InsertParameters.Add("MatFinishPrePostID", ddlFinish.SelectedValue);
                gvBFMatsSQL.InsertParameters.Add("MatNumExtraSheets", txtExtra.Text);
                gvBFMatsSQL.Insert();
            }
        }

        protected void gvBFProd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView view = (GridView)this.fvBookingForm.Row.FindControl("gvBFProd");
            TextBox txtBFID = (TextBox)this.fvBookingForm.Row.FindControl("txtBFID");
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow gvrow = (GridViewRow)view.FooterRow;
                DropDownList ddlSeries = (DropDownList)gvrow.FindControl("ddlSeries");
                TextBox txtGluers = (TextBox)gvrow.FindControl("txtGluers");
                TextBox txtRadiusGluers = (TextBox)gvrow.FindControl("txtRadiusGluers");
                TextBox txtFlatPanels = (TextBox)gvrow.FindControl("txtFlatPanels");
                TextBox txtRadiusPanels = (TextBox)gvrow.FindControl("txtRadiusPanels");
                TextBox txtOtherDesc = (TextBox)gvrow.FindControl("txtOtherDesc");
                TextBox txtNumOther = (TextBox)gvrow.FindControl("txtNumOther");
                gvBFProdSQL.InsertParameters.Clear();
                gvBFProdSQL.InsertParameters.Add("BFID", txtBFID.Text);
                gvBFProdSQL.InsertParameters.Add("SeriesID", ddlSeries.SelectedValue);
                gvBFProdSQL.InsertParameters.Add("NumACMWelders", txtGluers.Text);
                gvBFProdSQL.InsertParameters.Add("NumAlumWelders", txtRadiusGluers.Text);
                gvBFProdSQL.InsertParameters.Add("NumFlatPanels", txtFlatPanels.Text);
                gvBFProdSQL.InsertParameters.Add("NumRadPanels", txtRadiusPanels.Text);
                gvBFProdSQL.InsertParameters.Add("OtherDesc", txtOtherDesc.Text);
                gvBFProdSQL.InsertParameters.Add("NumOther", txtNumOther.Text);
                gvBFProdSQL.Insert();
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow gvrow = (GridViewRow)view.Controls[0].Controls[0];
                DropDownList ddlSeries = (DropDownList)gvrow.FindControl("ddlSeries");
                TextBox txtGluers = (TextBox)gvrow.FindControl("txtGluers");
                TextBox txtRadiusGluers = (TextBox)gvrow.FindControl("txtRadiusGluers");
                TextBox txtFlatPanels = (TextBox)gvrow.FindControl("txtFlatPanels");
                TextBox txtRadiusPanels = (TextBox)gvrow.FindControl("txtRadiusPanels");
                TextBox txtOtherDesc = (TextBox)gvrow.FindControl("txtOtherDesc");
                TextBox txtNumOther = (TextBox)gvrow.FindControl("txtNumOther");
                gvBFProdSQL.InsertParameters.Clear();
                gvBFProdSQL.InsertParameters.Add("BFID", txtBFID.Text);
                gvBFProdSQL.InsertParameters.Add("SeriesID", ddlSeries.SelectedValue);
                gvBFProdSQL.InsertParameters.Add("NumACMWelders", txtGluers.Text);
                gvBFProdSQL.InsertParameters.Add("NumAlumWelders", txtRadiusGluers.Text);
                gvBFProdSQL.InsertParameters.Add("NumFlatPanels", txtFlatPanels.Text);
                gvBFProdSQL.InsertParameters.Add("NumRadPanels", txtRadiusPanels.Text);
                gvBFProdSQL.InsertParameters.Add("OtherDesc", txtOtherDesc.Text);
                gvBFProdSQL.InsertParameters.Add("NumOther", txtNumOther.Text);
                gvBFProdSQL.Insert();
            }
        }


    }
}