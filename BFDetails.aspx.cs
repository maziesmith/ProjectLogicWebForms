using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;
using System.Net.Mail;
using System.Diagnostics;
using System.Text;

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

        protected void fvBF_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Email")
            {
                Label lblBFID = (Label)fvBookingForm.FindControl("lblBFID");
                Label lblProjectID = (Label)fvBookingForm.FindControl("lblProjectNum");
                Label lblProjectName = (Label)fvBookingForm.FindControl("lblProjectName");
                Label lblReleaseName = (Label)fvBookingForm.FindControl("lblReleaseName");
                Label lblPMName = (Label)fvBookingForm.FindControl("lblPM");

                String strReleaseName = String.IsNullOrEmpty(lblReleaseName.Text) ? "[Description]" : lblReleaseName.Text;

                //MailMessage mail = new MailMessage();
                //String username = HttpContext.Current.User.Identity.Name.ToString().Split('\\')[1];
                String pmFirst = lblPMName.Text.ToString().Split()[0];
                String pmLast = lblPMName.Text.ToString().Split()[1];
                String strTo = pmFirst + "." + pmLast + "@crmdsi.com";
                //mail.From = new MailAddress(username + "@crmdsi.com");
                //mail.To.Add(new MailAddress(pmFirst + "." + pmLast + "@crmdsi.com"));

                String strSubject = "BF " + lblBFID.Text + " - " + lblProjectName.Text + " - Release " + strReleaseName;

                StringBuilder builder = new StringBuilder();
                builder.AppendLine(string.Format("A Booking Form for Project #{0} - {1}", lblProjectID.Text, lblProjectName.Text));
                builder.AppendLine(string.Format(" - Release {0} has been created or modified.", strReleaseName));
                builder.AppendLine("");
                builder.AppendLine("");
                builder.AppendLine(Request.Url.ToString());
                String strBody = builder.ToString();

                //String strBody = "A Booking Form for Project #"+ lblProjectID.Text + " - " + lblProjectName.Text + 
                //    " - Release " + strReleaseName + " has been created or modified. \r\n" + Request.Url.ToString();

                //Process.Start("mailto:" + pmFirst + "." + pmLast + "@crmdsi.com?subject=" +
                //    HttpUtility.HtmlAttributeEncode(strSubject) + "&body=" +
                //    HttpUtility.HtmlAttributeEncode(strBody));

                ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + strTo + "?subject=" + strSubject + "&body=" + strBody + "'", true);
            }
        }
    }
}