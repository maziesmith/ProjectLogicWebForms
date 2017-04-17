using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ProjectLogic
{
    public partial class MatOrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
        protected void gvSheet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow gvrow = gvSheetGoods.FooterRow;
                if (gvrow == null) { return; }
                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtMatName = (TextBox)gvrow.FindControl("txtNewSheetName");
                DropDownList ddlVendor = (DropDownList)gvrow.FindControl("ddlNewVendor");
                TextBox txtSheetSize = (TextBox)gvrow.FindControl("txtNewSheetSize");
                DropDownList ddlThickness = (DropDownList)gvrow.FindControl("ddlNewThickness");
                DropDownList ddlCore = (DropDownList)gvrow.FindControl("ddlNewCore");
                TextBox txtColor = (TextBox)gvrow.FindControl("txtNewSheetColor");
                TextBox txtCustColorCode = (TextBox)gvrow.FindControl("txtNewCustColorCode");
                TextBox txtQuotedCost = (TextBox)gvrow.FindControl("txtNewSheetCost");

                if (string.IsNullOrWhiteSpace(txtMatName.Text))
                {
                    // Error Handling Message
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                    //e.Cancel = true;
                }
                else
                {
                    gvSheetGoodsSQL.InsertParameters.Clear();
                    gvSheetGoodsSQL.InsertParameters.Add("OrderID", lblOrderID.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("SheetName", txtMatName.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("VendorID", ddlVendor.SelectedValue);
                    gvSheetGoodsSQL.InsertParameters.Add("SheetSize", txtSheetSize.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("ThicknessID", ddlThickness.SelectedValue);
                    gvSheetGoodsSQL.InsertParameters.Add("CoreID", ddlCore.SelectedValue);
                    gvSheetGoodsSQL.InsertParameters.Add("Color", txtColor.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("CustColorCode", txtCustColorCode.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                    gvSheetGoodsSQL.Insert();

                    Response.Redirect(Request.RawUrl);
                }
            }

            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow gvrow = (GridViewRow)gvSheetGoods.Controls[0].Controls[0];
                if (gvrow == null) { return; }

                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtMatName = (TextBox)gvrow.FindControl("txtNewSheetName");
                DropDownList ddlVendor = (DropDownList)gvrow.FindControl("ddlNewVendor");
                TextBox txtSheetSize = (TextBox)gvrow.FindControl("txtNewSheetSize");
                DropDownList ddlThickness = (DropDownList)gvrow.FindControl("ddlNewThickness");
                DropDownList ddlCore = (DropDownList)gvrow.FindControl("ddlNewCore");
                TextBox txtColor = (TextBox)gvrow.FindControl("txtNewSheetColor");
                TextBox txtCustColorCode = (TextBox)gvrow.FindControl("txtNewCustColorCode");
                TextBox txtQuotedCost = (TextBox)gvrow.FindControl("txtNewSheetCost");

                if (string.IsNullOrWhiteSpace(txtMatName.Text))
                {
                    // Error Handling Message
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                    //e.Cancel = true;
                }
                else
                {
                    gvSheetGoodsSQL.InsertParameters.Clear();
                    gvSheetGoodsSQL.InsertParameters.Add("OrderID", lblOrderID.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("SheetName", txtMatName.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("VendorID", ddlVendor.SelectedValue);
                    gvSheetGoodsSQL.InsertParameters.Add("SheetSize", txtSheetSize.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("ThicknessID", ddlThickness.SelectedValue);
                    gvSheetGoodsSQL.InsertParameters.Add("CoreID", ddlCore.SelectedValue);
                    gvSheetGoodsSQL.InsertParameters.Add("Color", txtColor.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("CustColorCode", txtCustColorCode.Text);
                    gvSheetGoodsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                    gvSheetGoodsSQL.Insert();

                    Response.Redirect(Request.RawUrl);
                }
            }
        }
        protected void gvSheet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = gvSheetGoods.Rows[e.RowIndex];
            TextBox txtMatName = (TextBox)gvrow.FindControl("txtSheetName");
            
            if(string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                e.Cancel = true;
            }
            else
            {
                Label lblSheetID = (Label)gvrow.FindControl("lblEditSheetID");
                DropDownList ddlVendor = (DropDownList)gvrow.FindControl("ddlVendor");
                TextBox txtSheetSize = (TextBox)gvrow.FindControl("txtSheetSize");
                DropDownList ddlThickness = (DropDownList)gvrow.FindControl("ddlThickness");
                DropDownList ddlCore = (DropDownList)gvrow.FindControl("ddlCore");
                TextBox txtColor = (TextBox)gvrow.FindControl("txtSheetColor");
                TextBox txtCustColorCode = (TextBox)gvrow.FindControl("txtCustColorCode");
                TextBox txtQuotedCost = (TextBox)gvrow.FindControl("txtSheetCost");

                gvSheetGoodsSQL.UpdateParameters.Clear();
                gvSheetGoodsSQL.UpdateParameters.Add("SheetID", lblSheetID.Text);
                gvSheetGoodsSQL.UpdateParameters.Add("SheetName", txtMatName.Text);
                gvSheetGoodsSQL.UpdateParameters.Add("VendorID", ddlVendor.SelectedValue);
                gvSheetGoodsSQL.UpdateParameters.Add("SheetSize", txtSheetSize.Text);
                gvSheetGoodsSQL.UpdateParameters.Add("ThicknessID", ddlThickness.SelectedValue);
                gvSheetGoodsSQL.UpdateParameters.Add("CoreID", ddlCore.SelectedValue);
                gvSheetGoodsSQL.UpdateParameters.Add("Color", txtColor.Text);
                gvSheetGoodsSQL.UpdateParameters.Add("CustColorCode", txtCustColorCode.Text);
                gvSheetGoodsSQL.UpdateParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                gvSheetGoodsSQL.Update();
                Response.Redirect(Request.RawUrl);
                //ddlMatNameSQL.Update();
            }
        }
        protected void gvSupport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow footerRow = gvSupportMats.FooterRow;
                if (footerRow == null) { return; }
                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtMatName = (TextBox)footerRow.FindControl("txtNewSupportName");
                DropDownList ddlPartNum = (DropDownList)footerRow.FindControl("ddlNewPartNum");
                DropDownList ddlFinish = (DropDownList)footerRow.FindControl("ddlNewFinish");
                TextBox txtColor = (TextBox)footerRow.FindControl("txtNewSupportColor");
                TextBox txtNotes = (TextBox)footerRow.FindControl("txtNewSupportNotes");
                TextBox txtQuotedCost = (TextBox)footerRow.FindControl("txtNewSupportCost");

                if (string.IsNullOrWhiteSpace(txtMatName.Text))
                {
                    // Error Handling Message
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                    //e.Cancel = true;
                }
                else
                {
                    gvSupportMatsSQL.InsertParameters.Clear();
                    gvSupportMatsSQL.InsertParameters.Add("OrderID",lblOrderID.Text);
                    gvSupportMatsSQL.InsertParameters.Add("ExtrusionName", txtMatName.Text);
                    gvSupportMatsSQL.InsertParameters.Add("PartNumID", ddlPartNum.SelectedValue);
                    gvSupportMatsSQL.InsertParameters.Add("FinishID", ddlFinish.SelectedValue);
                    gvSupportMatsSQL.InsertParameters.Add("Color", txtColor.Text);
                    gvSupportMatsSQL.InsertParameters.Add("Notes", txtNotes.Text);
                    gvSupportMatsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                    gvSupportMatsSQL.Insert();
                    Response.Redirect(Request.RawUrl);
                }

            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow emptyRow = (GridViewRow)gvSupportMats.Controls[0].Controls[0];
                if (emptyRow == null) { return; }
                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtMatName = (TextBox)emptyRow.FindControl("txtEmptySupportName");
                DropDownList ddlPartNum = (DropDownList)emptyRow.FindControl("ddlEmptyPartNum");
                DropDownList ddlFinish = (DropDownList)emptyRow.FindControl("ddlEmptyFinish");
                TextBox txtColor = (TextBox)emptyRow.FindControl("txtEmptySupportColor");
                TextBox txtNotes = (TextBox)emptyRow.FindControl("txtEmptyNotes");
                TextBox txtQuotedCost = (TextBox)emptyRow.FindControl("txtEmptySupportCost");

                if (string.IsNullOrWhiteSpace(txtMatName.Text))
                {
                    // Error Handling Message
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                    //e.Cancel = true;
                }
                else
                {
                    gvSupportMatsSQL.InsertParameters.Clear();
                    gvSupportMatsSQL.InsertParameters.Add("OrderID", lblOrderID.Text);
                    gvSupportMatsSQL.InsertParameters.Add("ExtrusionName", txtMatName.Text);
                    gvSupportMatsSQL.InsertParameters.Add("PartNumID", ddlPartNum.SelectedValue);
                    gvSupportMatsSQL.InsertParameters.Add("FinishID", ddlFinish.SelectedValue);
                    gvSupportMatsSQL.InsertParameters.Add("Color", txtColor.Text);
                    gvSupportMatsSQL.InsertParameters.Add("Notes", txtNotes.Text);
                    gvSupportMatsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                    gvSupportMatsSQL.Insert();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
        protected void gvSupport_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = gvSupportMats.Rows[e.RowIndex];
            TextBox txtMatName = (TextBox)gvrow.FindControl("txtSupportName");
            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                e.Cancel = true;
            }
            else
            {
                Label lblSupportID = (Label)gvrow.FindControl("lblEditSupportID");
                DropDownList ddlPartNum = (DropDownList)gvrow.FindControl("ddlPartNum");
                DropDownList ddlFinish = (DropDownList)gvrow.FindControl("ddlFinish");
                TextBox txtColor = (TextBox)gvrow.FindControl("txtSupportColor");
                TextBox txtNotes = (TextBox)gvrow.FindControl("txtSupportNotes");
                TextBox txtQuotedCost = (TextBox)gvrow.FindControl("txtSupportCost");

                gvSupportMatsSQL.UpdateParameters.Clear();
                gvSupportMatsSQL.UpdateParameters.Add("ExtrusionID", lblSupportID.Text);
                gvSupportMatsSQL.UpdateParameters.Add("ExtrusionName", txtMatName.Text);
                gvSupportMatsSQL.UpdateParameters.Add("PartNumID", ddlPartNum.SelectedValue);
                gvSupportMatsSQL.UpdateParameters.Add("FinishID", ddlFinish.SelectedValue);
                gvSupportMatsSQL.UpdateParameters.Add("Color", txtColor.Text);
                gvSupportMatsSQL.UpdateParameters.Add("Notes", txtNotes.Text);
                gvSupportMatsSQL.UpdateParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                gvSupportMatsSQL.Update();
                Response.Redirect(Request.RawUrl);
            }
        }
        protected void gvMisc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow footerRow = gvMiscMats.FooterRow;
                if (footerRow == null) { return; }
                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtMatName = (TextBox)footerRow.FindControl("txtNewMiscName");
                TextBox txtItemDesc = (TextBox)footerRow.FindControl("txtNewMiscDesc");
                TextBox txtSize = (TextBox)footerRow.FindControl("txtNewMiscSize");
                TextBox txtAlloy = (TextBox)footerRow.FindControl("txtNewMiscAlloy");
                TextBox txtFinishColor = (TextBox)footerRow.FindControl("txtNewMiscFinishColor");
                TextBox txtQuotedCost = (TextBox)footerRow.FindControl("txtNewMiscCost");

                if (string.IsNullOrWhiteSpace(txtMatName.Text))
                {
                    // Error Handling Message
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                    //e.Cancel = true;
                }
                else
                {
                    gvMiscMatsSQL.InsertParameters.Clear();
                    gvMiscMatsSQL.InsertParameters.Add("OrderID", lblOrderID.Text);
                    gvMiscMatsSQL.InsertParameters.Add("MiscName", txtMatName.Text);
                    gvMiscMatsSQL.InsertParameters.Add("ItemDesc", txtItemDesc.Text);
                    gvMiscMatsSQL.InsertParameters.Add("Size", txtSize.Text);
                    gvMiscMatsSQL.InsertParameters.Add("Alloy", txtAlloy.Text);
                    gvMiscMatsSQL.InsertParameters.Add("FinishColor", txtFinishColor.Text);
                    gvMiscMatsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                    gvMiscMatsSQL.Insert();
                    Response.Redirect(Request.RawUrl);
                }
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow emptyRow = (GridViewRow)gvMiscMats.Controls[0].Controls[0];
                if (emptyRow == null) { return; }
                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtMatName = (TextBox)emptyRow.FindControl("txtEmptyMiscName");
                TextBox txtItemDesc = (TextBox)emptyRow.FindControl("txtEmptyMiscDesc");
                TextBox txtSize = (TextBox)emptyRow.FindControl("txtEmptyMiscSize");
                TextBox txtAlloy = (TextBox)emptyRow.FindControl("txtEmptyAMisclloy");
                TextBox txtFinishColor = (TextBox)emptyRow.FindControl("txtEmptyMiscFinishColor");
                TextBox txtQuotedCost = (TextBox)emptyRow.FindControl("txtEmptyMiscCost");

                if (string.IsNullOrWhiteSpace(txtMatName.Text))
                {
                    // Error Handling Message
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                    //e.Cancel = true;
                }
                else
                {
                    gvMiscMatsSQL.InsertParameters.Clear();
                    gvMiscMatsSQL.InsertParameters.Add("OrderID", lblOrderID.Text);
                    gvMiscMatsSQL.InsertParameters.Add("MiscName", txtMatName.Text);
                    gvMiscMatsSQL.InsertParameters.Add("ItemDesc", txtItemDesc.Text);
                    gvMiscMatsSQL.InsertParameters.Add("Size", txtSize.Text);
                    gvMiscMatsSQL.InsertParameters.Add("Alloy", txtAlloy.Text);
                    gvMiscMatsSQL.InsertParameters.Add("FinishColor", txtFinishColor.Text);
                    gvMiscMatsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                    gvMiscMatsSQL.Insert();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
        protected void gvMisc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = gvMiscMats.Rows[e.RowIndex];
            
            TextBox txtMatName = (TextBox)gvrow.FindControl("txtMiscName");
            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                e.Cancel = true;
            }
            else
            {
                Label lblMiscID = (Label)gvrow.FindControl("lblEditMiscID");
                TextBox txtItemDesc = (TextBox)gvrow.FindControl("txtMiscDesc");
                TextBox txtSize = (TextBox)gvrow.FindControl("txtMiscSize");
                TextBox txtAlloy = (TextBox)gvrow.FindControl("txtMiscAlloy");
                TextBox txtColor = (TextBox)gvrow.FindControl("txtMiscFinishColor");
                TextBox txtQuotedCost = (TextBox)gvrow.FindControl("txtMiscCost");

                gvMiscMatsSQL.UpdateParameters.Clear();
                gvMiscMatsSQL.UpdateParameters.Add("MiscID", lblMiscID.Text);
                gvMiscMatsSQL.UpdateParameters.Add("MiscName", txtMatName.Text);
                gvMiscMatsSQL.UpdateParameters.Add("ItemDesc", txtItemDesc.Text);
                gvMiscMatsSQL.UpdateParameters.Add("Size", txtSize.Text);
                gvMiscMatsSQL.UpdateParameters.Add("Alloy", txtAlloy.Text);
                gvMiscMatsSQL.UpdateParameters.Add("FinishColor", txtColor.Text);
                gvMiscMatsSQL.UpdateParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                gvMiscMatsSQL.Update();
                Response.Redirect(Request.RawUrl);
                //ddlMatNameSQL.Update();
            }
        }
        protected void gvMatAlloc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow footerRow = gvMatAllocation.FooterRow;
                if (footerRow == null) { return; }
                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtZoneName = (TextBox)footerRow.FindControl("txtNewZoneName");
                TextBox txtReleaseName = (TextBox)footerRow.FindControl("txtNewReleaseDesc");
                TextBox txtMTOByName = (TextBox)footerRow.FindControl("txtNewMTOBy");
                DropDownList ddlMatName = (DropDownList)footerRow.FindControl("ddlNewMatName");
                TextBox txtMatQty = (TextBox)footerRow.FindControl("txtNewMatQty");
                TextBox txtOverageQty = (TextBox)footerRow.FindControl("txtNewOverageQty");
                TextBox txtUsageDesc = (TextBox)footerRow.FindControl("txtNewUsageDesc");
                TextBox txtUsageQty = (TextBox)footerRow.FindControl("txtNewUsageQty");
                TextBox txtLinInch = (TextBox)footerRow.FindControl("txtNewLinInch");

                if (string.IsNullOrWhiteSpace(txtMatQty.Text)) { txtMatQty.Text = "0"; };
                if (string.IsNullOrWhiteSpace(txtOverageQty.Text)) { txtOverageQty.Text = "0"; };
                if (string.IsNullOrWhiteSpace(txtUsageQty.Text)) { txtUsageQty.Text = "0"; };

                gvMatAllocationSQL.InsertParameters.Clear();
                gvMatAllocationSQL.InsertParameters.Add("OrderID", lblOrderID.Text);
                gvMatAllocationSQL.InsertParameters.Add("ZoneName", txtZoneName.Text);
                gvMatAllocationSQL.InsertParameters.Add("ReleaseName", txtReleaseName.Text);
                gvMatAllocationSQL.InsertParameters.Add("MTOByName", txtMTOByName.Text);
                gvMatAllocationSQL.InsertParameters.Add("MatName", ddlMatName.SelectedValue);
                gvMatAllocationSQL.InsertParameters.Add("MTOMatQty", txtMatQty.Text);
                gvMatAllocationSQL.InsertParameters.Add("MTOOverageQty", txtOverageQty.Text);
                gvMatAllocationSQL.InsertParameters.Add("UsageDesc", txtUsageDesc.Text);
                gvMatAllocationSQL.InsertParameters.Add("UsageQty", txtUsageQty.Text);
                gvMatAllocationSQL.InsertParameters.Add("LinInch", txtLinInch.Text);
                gvMatAllocationSQL.Insert();
                Response.Redirect(Request.RawUrl);
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow emptyRow = (GridViewRow)gvMatAllocation.Controls[0].Controls[0];
                if (emptyRow == null) { return; }
                Label lblOrderID = (Label)this.fvHeader.Row.FindControl("lblOrderID");
                TextBox txtZoneName = (TextBox)emptyRow.FindControl("txtEmptyZoneName");
                TextBox txtReleaseName = (TextBox)emptyRow.FindControl("txtEmptyReleaseName");
                TextBox txtMTOByName = (TextBox)emptyRow.FindControl("txtEmptyMTOByName");
                DropDownList ddlMatName = (DropDownList)emptyRow.FindControl("ddlEmptyMatName");
                TextBox txtMatQty = (TextBox)emptyRow.FindControl("txtEmptyMTOMatQty");
                TextBox txtOverageQty = (TextBox)emptyRow.FindControl("txtEmptyMTOOverageQty");
                TextBox txtUsageDesc = (TextBox)emptyRow.FindControl("txtEmptyUsageDesc");
                TextBox txtUsageQty = (TextBox)emptyRow.FindControl("txtEmptyUsageQty");
                TextBox txtLinInch = (TextBox)emptyRow.FindControl("txtEmptyLinInch");

                if (string.IsNullOrWhiteSpace(txtMatQty.Text)) { txtMatQty.Text = "0"; };
                if (string.IsNullOrWhiteSpace(txtOverageQty.Text)) { txtOverageQty.Text = "0"; };
                if (string.IsNullOrWhiteSpace(txtUsageQty.Text)) { txtUsageQty.Text = "0"; };

                gvMatAllocationSQL.InsertParameters.Clear();
                gvMatAllocationSQL.InsertParameters.Add("OrderID", lblOrderID.Text);
                gvMatAllocationSQL.InsertParameters.Add("ZoneName", txtZoneName.Text);
                gvMatAllocationSQL.InsertParameters.Add("ReleaseName", txtReleaseName.Text);
                gvMatAllocationSQL.InsertParameters.Add("MTOByName", txtMTOByName.Text);
                gvMatAllocationSQL.InsertParameters.Add("MatName", ddlMatName.SelectedValue);
                gvMatAllocationSQL.InsertParameters.Add("MTOMatQty", txtMatQty.Text);
                gvMatAllocationSQL.InsertParameters.Add("MTOOverageQty", txtOverageQty.Text);
                gvMatAllocationSQL.InsertParameters.Add("UsageDesc", txtUsageDesc.Text);
                gvMatAllocationSQL.InsertParameters.Add("UsageQty", txtUsageQty.Text);
                gvMatAllocationSQL.InsertParameters.Add("LinInch", txtLinInch.Text);
                gvMatAllocationSQL.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }
        protected void gvMatAlloc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = (GridViewRow)gvMatAllocation.Rows[e.RowIndex];
            Label lblMatAllocID = (Label)gvrow.FindControl("lblEditMatAllocID");
            TextBox txtZoneName = (TextBox)gvrow.FindControl("txtZoneName");
            TextBox txtReleaseDesc = (TextBox)gvrow.FindControl("txtReleaseDesc");
            TextBox txtMTOBy = (TextBox)gvrow.FindControl("txtMTOBy");
            DropDownList ddlMatName = (DropDownList)gvrow.FindControl("ddlMatName");
            TextBox txtLinInch = (TextBox)gvrow.FindControl("txtLinInch");
            TextBox txtMatQty = (TextBox)gvrow.FindControl("txtMatQty");
            TextBox txtOverageQty = (TextBox)gvrow.FindControl("txtOverageQty");
            TextBox txtUsageDesc = (TextBox)gvrow.FindControl("txtUsageDesc");
            TextBox txtUsageQty = (TextBox)gvrow.FindControl("txtUsageQty");

            if (string.IsNullOrWhiteSpace(txtMatQty.Text)) { txtMatQty.Text = "0"; };
            if (string.IsNullOrWhiteSpace(txtOverageQty.Text)) { txtOverageQty.Text = "0"; };
            if (string.IsNullOrWhiteSpace(txtUsageQty.Text)) { txtUsageQty.Text = "0"; };


            gvMatAllocationSQL.UpdateParameters.Clear();
            gvMatAllocationSQL.UpdateParameters.Add("MatAllocationID", lblMatAllocID.Text);
            gvMatAllocationSQL.UpdateParameters.Add("ZoneName", txtZoneName.Text);
            gvMatAllocationSQL.UpdateParameters.Add("ReleaseName", txtReleaseDesc.Text);
            gvMatAllocationSQL.UpdateParameters.Add("MTOByName", txtMTOBy.Text);
            gvMatAllocationSQL.UpdateParameters.Add("MatName", ddlMatName.SelectedValue);
            gvMatAllocationSQL.UpdateParameters.Add("LinInch", txtLinInch.Text);
            gvMatAllocationSQL.UpdateParameters.Add("MTOMatQty", txtMatQty.Text);
            gvMatAllocationSQL.UpdateParameters.Add("MTOOverageQty", txtOverageQty.Text);
            gvMatAllocationSQL.UpdateParameters.Add("UsageDesc", txtUsageDesc.Text);
            gvMatAllocationSQL.UpdateParameters.Add("UsageQty", txtUsageQty.Text);
            gvMatAllocationSQL.Update();
            Response.Redirect(Request.RawUrl);
        }
    }
}