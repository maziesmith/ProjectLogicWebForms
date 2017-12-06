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

        protected void GvSheet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FooterInsert" when Page.IsValid:
                {
                    GridViewRow footerRow = GvSheetGoods.FooterRow;
                    if (footerRow == null)
                    {
                        return;
                    }
                    SheetRowInsert(footerRow);
                    break;
                }
                case "EmptyInsert" when Page.IsValid:
                {
                    GridViewRow emptyRow = (GridViewRow) GvSheetGoods.Controls[0].Controls[0];
                    if (emptyRow == null)
                    {
                        return;
                    }
                    SheetRowInsert(emptyRow);
                    break;
                }
            }
        }

        private void SheetRowInsert(GridViewRow gvRow)
        {
            GridViewRow gvrow = gvRow;
            Label lblOrderId = (Label) FvHeader.Row.FindControl("lblOrderID");
            TextBox txtMatName = (TextBox) gvrow.FindControl("txtSheetName");
            DropDownList ddlVendor = (DropDownList) gvrow.FindControl("ddlVendor");
            TextBox txtSheetSize = (TextBox) gvrow.FindControl("txtSheetSize");
            DropDownList ddlThickness = (DropDownList) gvrow.FindControl("ddlThickness");
            DropDownList ddlCore = (DropDownList) gvrow.FindControl("ddlCore");
            TextBox txtColor = (TextBox) gvrow.FindControl("txtColor");
            TextBox txtCustColorCode = (TextBox) gvrow.FindControl("txtCustColorCode");
            TextBox txtQuotedCost = (TextBox) gvrow.FindControl("txtCost");

            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                //e.Cancel = true;
            }
            else
            {
                GvSheetGoodsSQL.InsertParameters.Clear();
                GvSheetGoodsSQL.InsertParameters.Add("OrderID", lblOrderId.Text);
                GvSheetGoodsSQL.InsertParameters.Add("SheetName", txtMatName.Text);
                GvSheetGoodsSQL.InsertParameters.Add("VendorID", ddlVendor.SelectedValue);
                GvSheetGoodsSQL.InsertParameters.Add("SheetSize", txtSheetSize.Text);
                GvSheetGoodsSQL.InsertParameters.Add("ThicknessID", ddlThickness.SelectedValue);
                GvSheetGoodsSQL.InsertParameters.Add("CoreID", ddlCore.SelectedValue);
                GvSheetGoodsSQL.InsertParameters.Add("Color", txtColor.Text);
                GvSheetGoodsSQL.InsertParameters.Add("CustColorCode", txtCustColorCode.Text);
                GvSheetGoodsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                GvSheetGoodsSQL.Insert();

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void GvSheet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = GvSheetGoods.Rows[e.RowIndex];
            TextBox txtMatName = (TextBox) gvrow.FindControl("txtSheetName");

            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                e.Cancel = true;
            }
            else
            {
                Label lblSheetId = (Label) gvrow.FindControl("lblSheetID");
                DropDownList ddlVendor = (DropDownList) gvrow.FindControl("ddlVendor");
                TextBox txtSheetSize = (TextBox) gvrow.FindControl("txtSheetSize");
                DropDownList ddlThickness = (DropDownList) gvrow.FindControl("ddlThickness");
                DropDownList ddlCore = (DropDownList) gvrow.FindControl("ddlCore");
                TextBox txtColor = (TextBox) gvrow.FindControl("txtColor");
                TextBox txtCustColorCode = (TextBox) gvrow.FindControl("txtCustColorCode");
                TextBox txtQuotedCost = (TextBox) gvrow.FindControl("txtCost");

                GvSheetGoodsSQL.UpdateParameters.Clear();
                GvSheetGoodsSQL.UpdateParameters.Add("SheetID", lblSheetId.Text);
                GvSheetGoodsSQL.UpdateParameters.Add("SheetName", txtMatName.Text);
                GvSheetGoodsSQL.UpdateParameters.Add("VendorID", ddlVendor.SelectedValue);
                GvSheetGoodsSQL.UpdateParameters.Add("SheetSize", txtSheetSize.Text);
                GvSheetGoodsSQL.UpdateParameters.Add("ThicknessID", ddlThickness.SelectedValue);
                GvSheetGoodsSQL.UpdateParameters.Add("CoreID", ddlCore.SelectedValue);
                GvSheetGoodsSQL.UpdateParameters.Add("Color", txtColor.Text);
                GvSheetGoodsSQL.UpdateParameters.Add("CustColorCode", txtCustColorCode.Text);
                GvSheetGoodsSQL.UpdateParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                GvSheetGoodsSQL.Update();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void GvSupport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FooterInsert" when Page.IsValid:
                    GridViewRow footerRow = GvSupportMats.FooterRow;
                    if (footerRow == null)
                    {
                        return;
                    }
                    SupportRowInsert(footerRow);
                    break;
                case "EmptyInsert" when Page.IsValid:
                    GridViewRow emptyRow = (GridViewRow) GvSupportMats.Controls[0].Controls[0];
                    if (emptyRow == null)
                    {
                        return;
                    }
                    SupportRowInsert(emptyRow);
                    break;
            }
        }

        private void SupportRowInsert(GridViewRow gvrow)
        {
            GridViewRow gvRow = gvrow;
            Label lblOrderId = (Label) FvHeader.Row.FindControl("lblOrderID");
            TextBox txtMatName = (TextBox) gvRow.FindControl("txtSupportName");
            DropDownList ddlPartNum = (DropDownList) gvRow.FindControl("ddlPartNum");
            DropDownList ddlFinish = (DropDownList) gvRow.FindControl("ddlFinish");
            TextBox txtColor = (TextBox) gvRow.FindControl("txtColor");
            TextBox txtNotes = (TextBox) gvRow.FindControl("txtNotes");
            TextBox txtQuotedCost = (TextBox) gvRow.FindControl("txtCost");

            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                //e.Cancel = true;
            }
            else
            {
                GvSupportMatsSQL.InsertParameters.Clear();
                GvSupportMatsSQL.InsertParameters.Add("OrderID", lblOrderId.Text);
                GvSupportMatsSQL.InsertParameters.Add("ExtrusionName", txtMatName.Text);
                GvSupportMatsSQL.InsertParameters.Add("PartNumID", ddlPartNum.SelectedValue);
                GvSupportMatsSQL.InsertParameters.Add("FinishID", ddlFinish.SelectedValue);
                GvSupportMatsSQL.InsertParameters.Add("Color", txtColor.Text);
                GvSupportMatsSQL.InsertParameters.Add("Notes", txtNotes.Text);
                GvSupportMatsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                GvSupportMatsSQL.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void GvSupport_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = GvSupportMats.Rows[e.RowIndex];
            TextBox txtMatName = (TextBox) gvrow.FindControl("txtSupportName");
            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                e.Cancel = true;
            }
            else
            {
                Label lblSupportId = (Label) gvrow.FindControl("lblSupportID");
                DropDownList ddlPartNum = (DropDownList) gvrow.FindControl("ddlPartNum");
                DropDownList ddlFinish = (DropDownList) gvrow.FindControl("ddlFinish");
                TextBox txtColor = (TextBox) gvrow.FindControl("txtColor");
                TextBox txtNotes = (TextBox) gvrow.FindControl("txtNotes");
                TextBox txtQuotedCost = (TextBox) gvrow.FindControl("txtCost");

                GvSupportMatsSQL.UpdateParameters.Clear();
                GvSupportMatsSQL.UpdateParameters.Add("ExtrusionID", lblSupportId.Text);
                GvSupportMatsSQL.UpdateParameters.Add("ExtrusionName", txtMatName.Text);
                GvSupportMatsSQL.UpdateParameters.Add("PartNumID", ddlPartNum.SelectedValue);
                GvSupportMatsSQL.UpdateParameters.Add("FinishID", ddlFinish.SelectedValue);
                GvSupportMatsSQL.UpdateParameters.Add("Color", txtColor.Text);
                GvSupportMatsSQL.UpdateParameters.Add("Notes", txtNotes.Text);
                GvSupportMatsSQL.UpdateParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                GvSupportMatsSQL.Update();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void GvMisc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FooterInsert" when Page.IsValid:
                    GridViewRow footerRow = GvMiscMats.FooterRow;
                    if (footerRow == null)
                    {
                        return;
                    }
                    MiscRowInsert(footerRow);
                    break;
                case "EmptyInsert" when Page.IsValid:
                    GridViewRow emptyRow = (GridViewRow) GvMiscMats.Controls[0].Controls[0];
                    if (emptyRow == null)
                    {
                        return;
                    }
                    MiscRowInsert(emptyRow);
                    break;
            }
        }

        private void MiscRowInsert(GridViewRow gvrow)
        {
            GridViewRow gvRow = gvrow;
            Label lblOrderId = (Label) FvHeader.Row.FindControl("lblOrderID");
            TextBox txtMatName = (TextBox) gvRow.FindControl("txtMiscName");
            TextBox txtItemDesc = (TextBox) gvRow.FindControl("txtDesc");
            TextBox txtSize = (TextBox) gvRow.FindControl("txtSize");
            TextBox txtAlloy = (TextBox) gvRow.FindControl("txtAlloy");
            TextBox txtFinishColor = (TextBox) gvRow.FindControl("txtColor");
            TextBox txtQuotedCost = (TextBox) gvRow.FindControl("txtCost");

            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a Material Name.');", true);
                //e.Cancel = true;
            }
            else
            {
                GvMiscMatsSQL.InsertParameters.Clear();
                GvMiscMatsSQL.InsertParameters.Add("OrderID", lblOrderId.Text);
                GvMiscMatsSQL.InsertParameters.Add("MiscName", txtMatName.Text);
                GvMiscMatsSQL.InsertParameters.Add("ItemDesc", txtItemDesc.Text);
                GvMiscMatsSQL.InsertParameters.Add("Size", txtSize.Text);
                GvMiscMatsSQL.InsertParameters.Add("Alloy", txtAlloy.Text);
                GvMiscMatsSQL.InsertParameters.Add("FinishColor", txtFinishColor.Text);
                GvMiscMatsSQL.InsertParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                GvMiscMatsSQL.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void GvMisc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = GvMiscMats.Rows[e.RowIndex];

            TextBox txtMatName = (TextBox) gvrow.FindControl("txtMiscName");
            if (string.IsNullOrWhiteSpace(txtMatName.Text))
            {
                // Error Handling Message
                e.Cancel = true;
            }
            else
            {
                Label lblMiscId = (Label) gvrow.FindControl("lblMiscID");
                TextBox txtItemDesc = (TextBox) gvrow.FindControl("txtDesc");
                TextBox txtSize = (TextBox) gvrow.FindControl("txtSize");
                TextBox txtAlloy = (TextBox) gvrow.FindControl("txtAlloy");
                TextBox txtColor = (TextBox) gvrow.FindControl("txtColor");
                TextBox txtQuotedCost = (TextBox) gvrow.FindControl("txtCost");

                GvMiscMatsSQL.UpdateParameters.Clear();
                GvMiscMatsSQL.UpdateParameters.Add("MiscID", lblMiscId.Text);
                GvMiscMatsSQL.UpdateParameters.Add("MiscName", txtMatName.Text);
                GvMiscMatsSQL.UpdateParameters.Add("ItemDesc", txtItemDesc.Text);
                GvMiscMatsSQL.UpdateParameters.Add("Size", txtSize.Text);
                GvMiscMatsSQL.UpdateParameters.Add("Alloy", txtAlloy.Text);
                GvMiscMatsSQL.UpdateParameters.Add("FinishColor", txtColor.Text);
                GvMiscMatsSQL.UpdateParameters.Add("CostFromEstimate", txtQuotedCost.Text);
                GvMiscMatsSQL.Update();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void GvMatAlloc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FooterInsert" when Page.IsValid:
                    GridViewRow footerRow = GvMatAllocation.FooterRow;
                    if (footerRow == null)
                    {
                        return;
                    }
                    MatAllocRowInsert(footerRow);
                    break;
                case "EmptyInsert" when Page.IsValid:
                    GridViewRow emptyRow = (GridViewRow) GvMatAllocation.Controls[0].Controls[0];
                    if (emptyRow == null)
                    {
                        return;
                    }
                    MatAllocRowInsert(emptyRow);
                    break;
            }
        }

        private void MatAllocRowInsert(GridViewRow gvrow)
        {
            GridViewRow gvRow = gvrow;
            Label lblOrderId = (Label) FvHeader.Row.FindControl("lblOrderID");
            TextBox txtZoneName = (TextBox) gvRow.FindControl("txtZoneName");
            TextBox txtReleaseName = (TextBox) gvRow.FindControl("txtReleaseDesc");
            TextBox txtMtoByName = (TextBox) gvRow.FindControl("txtMTOBy");
            DropDownList ddlMatName = (DropDownList) gvRow.FindControl("ddlMatName");
            TextBox txtMatQty = (TextBox) gvRow.FindControl("txtMatQty");
            TextBox txtOverageQty = (TextBox) gvRow.FindControl("txtOverageQty");
            TextBox txtUsageDesc = (TextBox) gvRow.FindControl("txtUsageDesc");
            TextBox txtUsageQty = (TextBox) gvRow.FindControl("txtUsageQty");
            TextBox txtLinInch = (TextBox) gvRow.FindControl("txtLinInch");

            if (string.IsNullOrWhiteSpace(txtMatQty.Text))
            {
                txtMatQty.Text = "0";
            }
            ;
            if (string.IsNullOrWhiteSpace(txtOverageQty.Text))
            {
                txtOverageQty.Text = "0";
            }
            ;
            if (string.IsNullOrWhiteSpace(txtUsageQty.Text))
            {
                txtUsageQty.Text = "0";
            }
            ;

            GvMatAllocationSQL.InsertParameters.Clear();
            GvMatAllocationSQL.InsertParameters.Add("OrderID", lblOrderId.Text);
            GvMatAllocationSQL.InsertParameters.Add("ZoneName", txtZoneName.Text);
            GvMatAllocationSQL.InsertParameters.Add("ReleaseName", txtReleaseName.Text);
            GvMatAllocationSQL.InsertParameters.Add("MTOByName", txtMtoByName.Text);
            GvMatAllocationSQL.InsertParameters.Add("MatName", ddlMatName.SelectedValue);
            GvMatAllocationSQL.InsertParameters.Add("MTOMatQty", txtMatQty.Text);
            GvMatAllocationSQL.InsertParameters.Add("MTOOverageQty", txtOverageQty.Text);
            GvMatAllocationSQL.InsertParameters.Add("UsageDesc", txtUsageDesc.Text);
            GvMatAllocationSQL.InsertParameters.Add("UsageQty", txtUsageQty.Text);
            GvMatAllocationSQL.InsertParameters.Add("LinInch", txtLinInch.Text);
            GvMatAllocationSQL.Insert();
            Response.Redirect(Request.RawUrl);
        }

        protected void GvMatAlloc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = (GridViewRow) GvMatAllocation.Rows[e.RowIndex];
            Label lblMatAllocId = (Label) gvrow.FindControl("lblMatAllocID");
            TextBox txtZoneName = (TextBox) gvrow.FindControl("txtZoneName");
            TextBox txtReleaseDesc = (TextBox) gvrow.FindControl("txtReleaseDesc");
            TextBox txtMtoBy = (TextBox) gvrow.FindControl("txtMTOBy");
            DropDownList ddlMatName = (DropDownList) gvrow.FindControl("ddlMatName");
            TextBox txtLinInch = (TextBox) gvrow.FindControl("txtLinInch");
            TextBox txtMatQty = (TextBox) gvrow.FindControl("txtMatQty");
            TextBox txtOverageQty = (TextBox) gvrow.FindControl("txtOverageQty");
            TextBox txtUsageDesc = (TextBox) gvrow.FindControl("txtUsageDesc");
            TextBox txtUsageQty = (TextBox) gvrow.FindControl("txtUsageQty");

            if (string.IsNullOrWhiteSpace(txtMatQty.Text))
            {
                txtMatQty.Text = "0";
            }
            ;
            if (string.IsNullOrWhiteSpace(txtOverageQty.Text))
            {
                txtOverageQty.Text = "0";
            }
            ;
            if (string.IsNullOrWhiteSpace(txtUsageQty.Text))
            {
                txtUsageQty.Text = "0";
            }
            ;


            GvMatAllocationSQL.UpdateParameters.Clear();
            GvMatAllocationSQL.UpdateParameters.Add("MatAllocationID", lblMatAllocId.Text);
            GvMatAllocationSQL.UpdateParameters.Add("ZoneName", txtZoneName.Text);
            GvMatAllocationSQL.UpdateParameters.Add("ReleaseName", txtReleaseDesc.Text);
            GvMatAllocationSQL.UpdateParameters.Add("MTOByName", txtMtoBy.Text);
            GvMatAllocationSQL.UpdateParameters.Add("MatName", ddlMatName.SelectedValue);
            GvMatAllocationSQL.UpdateParameters.Add("LinInch", txtLinInch.Text);
            GvMatAllocationSQL.UpdateParameters.Add("MTOMatQty", txtMatQty.Text);
            GvMatAllocationSQL.UpdateParameters.Add("MTOOverageQty", txtOverageQty.Text);
            GvMatAllocationSQL.UpdateParameters.Add("UsageDesc", txtUsageDesc.Text);
            GvMatAllocationSQL.UpdateParameters.Add("UsageQty", txtUsageQty.Text);
            GvMatAllocationSQL.Update();
            Response.Redirect(Request.RawUrl);
        }

        protected void FvFooter_OnItemCommand(object sender, FormViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "DeleteOrder":
                    Label lblOrderId = (Label)FvHeader.Row.FindControl("lblOrderID");
                    // Confirmation stuff here

                    

                    FvMatOrdersSQL.DeleteParameters.Clear();
                    FvMatOrdersSQL.DeleteParameters.Add("OrderID", lblOrderId.Text);
                    FvMatOrdersSQL.Delete();
                    Response.Redirect("~/MatOrderIndex.aspx");
                    break;
                case "NewOrder" when Page.IsValid:
                    Label lblProjectId = (Label)FvHeader.FindControl("LblProjectID");
                    String strOrderDate = DateTime.Now.ToShortDateString();
                    
                    FvMatOrdersSQL.InsertParameters["ProjectID"].DefaultValue = lblProjectId.Text;
                    FvMatOrdersSQL.InsertParameters["OrderDate"].DefaultValue =  strOrderDate;
                    FvMatOrdersSQL.Insert();
                    break;
                case "Email" when Page.IsValid:

                    break;
            }
        }

        protected void FvMatOrdersSQL_OnInserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            String strOrderId = e.Command.Parameters["@NewOrderID"].Value.ToString();
            Response.Redirect(strOrderId);
        }
    }
}