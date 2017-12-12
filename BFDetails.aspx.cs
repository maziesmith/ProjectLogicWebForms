using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectLogic
{
    public partial class BFDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isPostBack = IsPostBack;
        }

        protected void GvBFMats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FooterInsert" when Page.IsValid:
                {
                    GridViewRow footerRow = GvBFMats.FooterRow;
                    GvBfMatsRowInsert(footerRow);
                    break;
                }
                case "EmptyInsert" when Page.IsValid:
                {
                    GridViewRow emptyRow = (GridViewRow)GvBFMats.Controls[0].Controls[0];
                    GvBfMatsRowInsert(emptyRow);
                    break;
                }
            }
        }

        private void GvBfMatsRowInsert(GridViewRow gvRow)
        {
            GridViewRow gvrow = gvRow;
            Label lblBfid = (Label)FvHeader.FindControl("LblBFID");
            DropDownList ddlMfr = (DropDownList)gvrow.FindControl("DdlMfr");
            DropDownList ddlThickness = (DropDownList)gvrow.FindControl("DdlThickness");
            DropDownList ddlCore = (DropDownList)gvrow.FindControl("DdlCore");
            DropDownList ddlSize = (DropDownList)gvrow.FindControl("DdlSize");
            TextBox txtColor = (TextBox)gvrow.FindControl("TxtColor");
            TextBox txtQty = (TextBox)gvrow.FindControl("TxtQty");
            DropDownList ddlFinish = (DropDownList)gvrow.FindControl("DdlFinish");
            

            GvBFMatsSQL.InsertParameters.Clear();
            GvBFMatsSQL.InsertParameters.Add("BookingFormID", lblBfid.Text);
            GvBFMatsSQL.InsertParameters.Add("MatManufacturerID", ddlMfr.SelectedValue);
            GvBFMatsSQL.InsertParameters.Add("MatThicknessID", ddlThickness.SelectedValue);
            GvBFMatsSQL.InsertParameters.Add("MatCoreID", ddlCore.SelectedValue);
            GvBFMatsSQL.InsertParameters.Add("MatSizeID", ddlSize.SelectedValue);
            GvBFMatsSQL.InsertParameters.Add("MatFinishColor", txtColor.Text);
            GvBFMatsSQL.InsertParameters.Add("MatQty", txtQty.Text);
            GvBFMatsSQL.InsertParameters.Add("MatFinishPrePostID", ddlFinish.SelectedValue);
            
            GvBFMatsSQL.Insert();
        }

        protected void GvBFProd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FooterInsert" when Page.IsValid:
                    GridViewRow footerRow = GvBFProd.FooterRow;
                    GvBfProdRowInsert(footerRow);
                    break;
                case "EmptyInsert" when Page.IsValid:
                    GridViewRow emptyRow = (GridViewRow)GvBFProd.Controls[0].Controls[0];
                    GvBfProdRowInsert(emptyRow);
                    break;
            }
        }

        private void GvBfProdRowInsert(GridViewRow gvRow)
        {
            GridViewRow gvrow = gvRow;
            Label lblBfid = (Label)FvHeader.FindControl("LblBFID");
            DropDownList ddlSeries = (DropDownList)gvrow.FindControl("DdlSeries");
            TextBox txtGluers = (TextBox)gvrow.FindControl("TxtGluers");
            TextBox txtRadiusGluers = (TextBox)gvrow.FindControl("TxtRadiusGluers");
            TextBox txtFlatPanels = (TextBox)gvrow.FindControl("TxtFlatPanels");
            TextBox txtRadiusPanels = (TextBox)gvrow.FindControl("TxtRadiusPanels");
            TextBox txtOtherDesc = (TextBox)gvrow.FindControl("TxtOtherDesc");
            TextBox txtNumOther = (TextBox)gvrow.FindControl("TxtNumOther");

            GvBFProdSQL.InsertParameters.Clear();
            GvBFProdSQL.InsertParameters.Add("BFID", lblBfid.Text);
            GvBFProdSQL.InsertParameters.Add("SeriesID", ddlSeries.SelectedValue);
            GvBFProdSQL.InsertParameters.Add("NumACMWelders", txtGluers.Text);
            GvBFProdSQL.InsertParameters.Add("NumAlumWelders", txtRadiusGluers.Text);
            GvBFProdSQL.InsertParameters.Add("NumFlatPanels", txtFlatPanels.Text);
            GvBFProdSQL.InsertParameters.Add("NumRadPanels", txtRadiusPanels.Text);
            GvBFProdSQL.InsertParameters.Add("OtherDesc", txtOtherDesc.Text);
            GvBFProdSQL.InsertParameters.Add("NumOther", txtNumOther.Text);
            GvBFProdSQL.Insert();
        }
        protected void FvBF_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            Label lblProjectId = (Label)FvHeader.FindControl("LblProjectID");
            Label lblBfid = (Label)FvHeader.FindControl("LblBFID");

            //ClientScript.RegisterStartupScript(GetType(), "error", "alert('Project # "+strProjectId+".');", true);
            switch (e.CommandName)
            {
                case "Email":
                    
                    //Label lblProjectName = (Label)FvBookingForm.FindControl("LblProjectName");
                    //Label lblReleaseName = (Label)FvBookingForm.FindControl("LblReleaseName");
                    //Label lblPmName = (Label)FvBookingForm.FindControl("LblPM");

                    //String strReleaseName = String.IsNullOrEmpty(lblReleaseName.Text) ? "[Description]" : lblReleaseName.Text;

                    ////MailMessage mail = new MailMessage();
                    ////String username = HttpContext.Current.User.Identity.Name.ToString().Split('\\')[1];
                    //String pmFirst = lblPmName.Text.Split()[0];
                    //String pmLast = lblPmName.Text.Split()[1];
                    //String strTo = pmFirst + "." + pmLast + "@crmdsi.com";
                    ////mail.From = new MailAddress(username + "@crmdsi.com");
                    ////mail.To.Add(new MailAddress(pmFirst + "." + pmLast + "@crmdsi.com"));

                    //String strSubject = "BF " + lblBfid.Text + " - " + lblProjectName.Text + " - Release " + strReleaseName;

                    //StringBuilder builder = new StringBuilder();
                    //builder.AppendLine(string.Format("A Booking Form for Project #{0} - {1}", lblProjectId.Text, lblProjectName.Text));
                    //builder.AppendLine(string.Format(" - Release {0} has been created or modified.", strReleaseName));
                    //builder.AppendLine("");
                    //builder.AppendLine("");
                    //builder.AppendLine(Request.Url.ToString());
                    //String strBody = builder.ToString();

                    ////String strBody = "A Booking Form for Project #"+ LblProjectID.Text + " - " + LblProjectName.Text + 
                    ////    " - Release " + strReleaseName + " has been created or modified. \r\n" + Request.Url.ToString();

                    ////Process.Start("mailto:" + pmFirst + "." + pmLast + "@crmdsi.com?subject=" +
                    ////    HttpUtility.HtmlAttributeEncode(strSubject) + "&body=" +
                    ////    HttpUtility.HtmlAttributeEncode(strBody));

                    //ClientScript.RegisterStartupScript(GetType(), "mailto", "parent.location='mailto:" + strTo + "?subject=" + strSubject + "&body=" + strBody + "'", true);
                    break;
                case "DeleteForm":
                    FvBookingFormSQL.DeleteParameters.Clear();
                    FvBookingFormSQL.DeleteParameters.Add("BFID", lblBfid.Text);
                    FvBookingFormSQL.Delete();
                    Response.Redirect("~/BFIndex.aspx");
                    break;
                case "NewForm":
                    FvBookingFormSQL.InsertParameters["ProjectID"].DefaultValue = lblProjectId.Text;
                    FvBookingFormSQL.Insert();
                    break;
            }
        }

        protected void FvBookingFormSQL_OnInserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            String strBfid = e.Command.Parameters["@NewBFID"].Value.ToString();
            Response.Redirect("~/BookingForm/" + strBfid);
        }
    }
}