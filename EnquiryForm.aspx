<%--<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnquiryForm.aspx.cs" Inherits="DEMOProject.EnquiryForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Enquiry Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" />

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 30px;
            margin: 30px auto;
            max-width: 900px;
        }

        .form-title {
            color: #2c3e50;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e9ecef;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 8px;
        }

        .form-control, .form-select {
            border-radius: 6px;
            border: 1px solid #ced4da;
            padding: 10px 12px;
            transition: all 0.3s ease;
        }

            .form-control:focus, .form-select:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }

        .btn-submit {
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

            .btn-submit:hover {
                background-color: #1a252f;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

        .error-message {
            font-size: 0.85rem;
            margin-top: 5px;
        }

        /* GridView Custom Styling */
        .gridview-custom {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            margin-top: 30px;
        }

        .gridview-header {
            background-color: #2c3e50;
            color: white;
            font-weight: 200;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

            .gridview-header th {
                padding: 12px 15px;
                text-align: center;
                border: none;
            }

        .gridview-row td, .gridview-alt-row td {
            padding: 10px 15px;
            vertical-align: middle;
            border-color: #e0e0e0;
        }

        .gridview-row:hover, .gridview-alt-row:hover {
            background-color: #f8f9fa;
        }

        .gridview-alt-row {
            background-color: #f8f9fa;
        }

        .gridview-edit-row {
            background-color: #fff3cd !important;
        }

            .gridview-edit-row td {
                padding: 8px;
            }

        .gridview-table {
            border-collapse: collapse;
            width: max-content; /* important to allow scroll */
            min-width: 100%;
        }

            .gridview-table th, .gridview-table td {
                border: 1px solid #ccc;
                padding: 5px;
                white-space: nowrap; /* prevent text wrap */
            }
        /* Form Controls Styling */
        .form-control-sm {
            border-radius: 4px;
            border: 1px solid #ced4da;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

            .form-control-sm:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }

        /* Button Styling */
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            border-radius: 4px;
            transition: all 0.15s ease-in-out;
        }

        .btn-outline-primary:hover {
            background-color: #0d6efd;
            transform: translateY(-1px);
        }

        .btn-outline-danger:hover {
            background-color: #dc3545;
            transform: translateY(-1px);
        }

        .btn-success:hover {
            background-color: #198754;
            transform: translateY(-1px);
        }

        .btn-secondary:hover {
            background-color: #5c636a;
            transform: translateY(-1px);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .form-container {
                margin: 20px 15px;
                padding: 20px;
            }

            .gridview-custom {
                font-size: 0.625rem;
            }

            .gridview-header th {
                padding: 8px 5px;
                font-size: 0.625rem;
            }

            .gridview-row td, .gridview-alt-row td {
                padding: 5px;
            }

            .btn-sm {
                padding: 0.15rem 0.3rem;
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>

    <form id="EnquiryForm" runat="server">
        <div class="container">
            <div class="form-container">
                <h2 class="form-title">Enquiry Form</h2>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblSrNo" runat="server" Text="Sr. No" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtSrNo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Sr. No should not be blank"
                                ControlToValidate="txtSrNo" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtCustomerCode" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Customer code should not be blank"
                                ControlToValidate="txtCustomerCode" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddlCustomers" runat="server" AutoPostBack="true"
                                DataTextField="CustomerName" DataValueField="SrNo" CssClass="form-select">
                            </asp:DropDownList>
                            <%--<asp:DropDownList ID="ddlCustomers" runat="server" CssClass="form-select">
                                <asp:ListItem Text="-- Select --" Value="" />
                                <asp:ListItem Text="abc" Value="abc" />
                                <asp:ListItem Text="pqr" Value="pqr" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="You must select a value"
                                ControlToValidate="ddlCustomers" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblSize" runat="server" Text="Radiator Size" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtSize" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="Radiator size should not be blank"
                                ControlToValidate="txtSize" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblPitch" runat="server" Text="Pitch" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtPitch" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblPaintShade" runat="server" Text="Paint Shade" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtPaintShade" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv5" runat="server" ErrorMessage="Paint shade should not be blank"
                                ControlToValidate="txtPaintShade" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblSheetThick" runat="server" Text="Sheet Thickness" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtSheetThick" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv6" runat="server" ErrorMessage="Sheet thickness should not be blank"
                                ControlToValidate="txtSheetThick" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblhdg" runat="server" Text="HDG" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddlhdg" runat="server" CssClass="form-select">
                                <asp:ListItem Text="-- Select --" Value="" />
                                <asp:ListItem Text="Yes" Value="Yes" />
                                <asp:ListItem Text="No" Value="No" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv7" runat="server" ErrorMessage="You must select HDG value"
                                ControlToValidate="ddlhdg" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblTransportation" runat="server" Text="Transportation" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtTransportation" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblTransportationCondition" runat="server" Text="Transportation Condition" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtTransportationCondition" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblDeliverySchedule" runat="server" Text="Delivery Schedule" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtDeliverySchedule" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblDrawNo" runat="server" Text="Draw No" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtDrawNo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblQty" runat="server" Text="Quantity" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv9" runat="server" ErrorMessage="Quantity should not be blank"
                                ControlToValidate="txtQty" ForeColor="Red" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblRequirement" runat="server" Text="Special Requirements" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtRequirement" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn-submit" />
                </div>

                <div style="overflow-x: auto; width: 100%;">

                    <asp:GridView ID="gvEnquiries" runat="server" AutoGenerateColumns="False"
                        OnRowEditing="gvEnquiries_RowEditing"
                        OnRowUpdating="gvEnquiries_RowUpdating"
                        OnRowCancelingEdit="gvEnquiries_RowCancelingEdit"
                        OnRowDeleting="gvEnquiries_RowDeleting"
                        DataKeyNames="SrNo"
                        pagesize="10"
                        CssClass="table table-striped table-hover table-bordered gridview-custom">

                        <HeaderStyle CssClass="gridview-header" />
                        <RowStyle CssClass="gridview-row" />
                        <EditRowStyle CssClass="gridview-edit-row" />
                        <AlternatingRowStyle CssClass="gridview-alt-row" />

                        <Columns>
                            <asp:TemplateField HeaderText="SrNo">
                                <ItemTemplate>
                                    <asp:Label ID="lblSrNo"  runat="server" Text='<%# Eval("SrNo") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSrNo" ReadOnly="true" runat="server" Text='<%# Eval("SrNo") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Customer Code">
                                <ItemTemplate>
                                    <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Eval("CustomerCode") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCustomerCode" ReadOnly="true" runat="server" Text='<%# Eval("CustomerCode") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Customer Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("CustomerName") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCustomerName" runat="server" Text='<%# Eval("CustomerName") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Radiator Size">
                                <ItemTemplate>
                                    <asp:Label ID="lblSize" runat="server" Text='<%# Eval("RadiatorSize") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSize" runat="server" Text='<%# Eval("RadiatorSize") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Pitch">
                                <ItemTemplate>
                                    <asp:Label ID="lblPitch" runat="server" Text='<%# Eval("Pitch") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPitch" runat="server" Text='<%# Eval("Pitch") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Paint Shade">
                                <ItemTemplate>
                                    <asp:Label ID="lblPaintShade" runat="server" Text='<%# Eval("PaintShade") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPaintShade" runat="server" Text='<%# Eval("PaintShade") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Sheet Thickness">
                                <ItemTemplate>
                                    <asp:Label ID="lblSheetThick" runat="server" Text='<%# Eval("SheetThick") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSheetThick" runat="server" Text='<%# Eval("SheetThick") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="HDG">
                                <ItemTemplate>
                                    <asp:Label ID="lblhdg" runat="server" Text='<%# Eval("HDG") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txthdg" runat="server" Text='<%# Eval("HDG") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Transportation">
                                <ItemTemplate>
                                    <asp:Label ID="lblTransportation" runat="server" Text='<%# Eval("Transportation") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTransportation" runat="server" Text='<%# Eval("Transportation") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Trans. Condition">
                                <ItemTemplate>
                                    <asp:Label ID="lblTransportationCondition" runat="server" Text='<%# Eval("TransportationCondition") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTransportationCondition" runat="server" Text='<%# Eval("TransportationCondition") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Delivery Schedule">
                                <ItemTemplate>
                                    <asp:Label ID="lblDeliverySchedule" runat="server" Text='<%# Eval("DeliverySchedule") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDeliverySchedule" runat="server" Text='<%# Eval("DeliverySchedule") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Draw No">
                                <ItemTemplate>
                                    <asp:Label ID="lblDrawNo" runat="server" Text='<%# Eval("DrawNo") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDrawNo" runat="server" Text='<%# Eval("DrawNo") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Requirements">
                                <ItemTemplate>
                                    <asp:Label ID="lblRequirement" runat="server" Text='<%# Eval("Requirement") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRequirement" runat="server" Text='<%# Eval("Requirement") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-label" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control form-control-sm" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CausesValidation="False" CommandArgument='<%# Eval("SrNo") %>'
                                        CssClass="btn btn-sm btn-outline-primary me-1">
                    <i class="bi bi-pencil"></i> Edit
                </asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="False" CommandArgument='<%# Eval("SrNo") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this Enquiry?');"
                                        CssClass="btn btn-sm btn-outline-danger">
                    <i class="bi bi-trash"></i> Delete
                </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CausesValidation="False" CommandArgument='<%# Eval("SrNo") %>'
                                        CssClass="btn btn-sm btn-success me-1">
                    <i class="bi bi-check-circle"></i> Update
                </asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" CausesValidation="False" CommandArgument='<%# Eval("SrNo") %>'
                                        CssClass="btn btn-sm btn-secondary">
                    <i class="bi bi-x-circle"></i> Cancel
                </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>


                </div>

            </div>
        </div>
    </form>
  
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnquiryForm.aspx.cs" Inherits="DEMOProject.EnquiryForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Enquiry Form</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            // Attach the keyup event listener to the txtRate input
            $('#txtPrimer, #txtMIO, #txtPUTapeCount').on('input', function () {
                var primer = parseInt($('#txtPrimer').val(), 10) || 0;
                var MIO = parseInt($('#txtMIO').val(), 10) || 0;
                var PU = parseInt($('#txtPUTapeCount').val(), 10) || 0;

                // Calculate the total
                var total = primer + MIO + PU;

                // Display the total in txtTotal
                $('#txtTotalDFT').val(total); // Format to 2 decimal places
            });
        });


    </script>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 10px;
            font-size: 2.2em;
        }

        .subtitle {
            text-align: center;
            color: #7f8c8d;
            margin-bottom: 30px;
            font-size: 1.1em;
        }

        .form-section {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }

            .form-section:last-child {
                border-bottom: none;
            }

        .section-title {
            color: #3498db;
            font-size: 1.4em;
            margin-bottom: 20px;
            padding-bottom: 8px;
            border-bottom: 2px solid #3498db;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 15px;
        }

        .form-group {
            flex: 1;
            min-width: 250px;
            margin-right: 15px;
            margin-bottom: 15px;
        }

            .form-group:last-child {
                margin-right: 0;
            }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

            input[type="text"]:focus,
            input[type="number"]:focus,
            select:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
            }

        .btn-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
        }

            .btn-submit:hover {
                background-color: #2980b9;
            }

        .validation-error {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
            display: none;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
            display: none;
        }

        .required {
            color: #e74c3c;
        }

        @media (max-width: 768px) {
            .form-group {
                flex: 100%;
                margin-right: 0;
            }
        }

        .minimal-preview {
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            padding: 15px;
            background-color: #fff;
        }

        .minimal-title {
            font-size: 1.1em;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 1px solid #f0f0f0;
        }

        .minimal-item {
            margin-bottom: 12px;
        }

        .minimal-label {
            font-weight: 600;
            color: #34495e;
            margin-right: 8px;
        }

        .minimal-value {
            color: #2c3e50;
        }

        .minimal-empty {
            color: #95a5a6;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Enquiry Form</h1>
        <p class="subtitle">Please fill in all required fields to submit your enquiry</p>

        <div id="successMessage" class="success-message" runat="server">
            Enquiry submitted successfully!
        </div>

        <div id="errorMessage" class="error-message" runat="server">
            Error submitting enquiry. Please try again.
        </div>

        <form id="enquiryForm" runat="server">
            <label for="ddlQuotation">Quotation<span class="required">*</span></label>
            <asp:DropDownList ID="ddlQuotation" runat="server" CssClass="form-select">
                <asp:ListItem Text="-- Select --" Value="" />
                <asp:ListItem Text="Yes" Value="Yes" />
                <asp:ListItem Text="No" Value="No" />
            </asp:DropDownList>
            <!-- Basic Information Section -->
            <div class="form-section">
                <h2 class="section-title">Basic Information</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtSrNo">Serial Number <span class="required">*</span></label>
                        <asp:TextBox ID="txtSrNo" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSrNo" runat="server" ControlToValidate="txtSrNo"
                            ErrorMessage="Serial Number is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtEnquiryNo">Enquiry Number <span class="required">*</span></label>
                        <asp:TextBox ID="txtEnquiryNo" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEnquiryNo" runat="server" ControlToValidate="txtEnquiryNo"
                            ErrorMessage="Enquiry Number is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtCustomerCode">Customer Code <span class="required">*</span></label>
                        <asp:TextBox ID="txtCustomerCode" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCustomerCode" runat="server" ControlToValidate="txtCustomerCode"
                            ErrorMessage="Customer Code is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="ddlCustomers">Customer Name <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlCustomers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged"
                            DataTextField="CustomerName" DataValueField="SrNo" CssClass="form-select">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="ddlCustomers"
                            ErrorMessage="Customer Name is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="customer-details" style="margin-top: 20px;">
                    </div>
                    <div class="form-group">
                        <label for="txtPlace">Place <span class="required">*</span></label>
                        <asp:TextBox ID="txtPlace" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPlace" runat="server" ControlToValidate="txtPlace"
                            ErrorMessage="Place is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="minimal-preview">
                    <div class="minimal-title">Customer Information</div>

                    <div class="minimal-item">
                        <asp:Label ID="lblAddress" runat="server" CssClass="minimal-value" />
                    </div>

                    <div class="minimal-item">
                        <asp:Label ID="lblPhone" runat="server" CssClass="minimal-value" />
                    </div>

                    <div class="minimal-item">
                        <asp:Label ID="lblContactPerson" runat="server" CssClass="minimal-value" />
                    </div>
                </div>
            </div>

            <!-- Radiator Specifications Section -->
            <div class="form-section">
                <h2 class="section-title">Radiator Specifications</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtRadiatorSize">Radiator Size <span class="required">*</span></label>
                        <asp:TextBox ID="txtRadiatorSize" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRadiatorSize" runat="server" ControlToValidate="txtRadiatorSize"
                            ErrorMessage="Radiator Size is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtWidth">Width <span class="required">*</span></label>
                        <asp:TextBox ID="txtWidth" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvWidth" runat="server" ControlToValidate="txtWidth"
                            ErrorMessage="Width is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtCD">CD <span class="required">*</span></label>
                        <asp:TextBox ID="txtCD" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCD" runat="server" ControlToValidate="txtCD"
                            ErrorMessage="CD is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtSheetThick">Sheet Thickness <span class="required">*</span></label>
                        <asp:TextBox ID="txtSheetThick" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSheetThick" runat="server" ControlToValidate="txtSheetThick"
                            ErrorMessage="Sheet Thickness is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtTins">No. of Tins <span class="required">*</span></label>
                        <asp:TextBox ID="txtTins" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTins" runat="server" ControlToValidate="txtTins"
                            ErrorMessage="Tins is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%-- <asp:RangeValidator ID="rvTins" runat="server" ControlToValidate="txtTins" 
                            Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="txtWeight">Weight <span class="required">*</span></label>
                        <asp:TextBox ID="txtWeight" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvWeight" runat="server" ControlToValidate="txtWeight"
                            ErrorMessage="Weight is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%-- <asp:RangeValidator ID="rvWeight" runat="server" ControlToValidate="txtWeight" 
                            Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                </div>
            </div>

            <!-- Coating Specifications Section -->
            <div class="form-section">
                <h2 class="section-title">Coating Specifications</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtHDG">HDG <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlHDG" runat="server" CssClass="form-select">
                            <asp:ListItem Text="-- Select --" Value="" />
                            <asp:ListItem Text="Yes" Value="Yes" />
                            <asp:ListItem Text="No" Value="No" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvHDG" runat="server" ControlToValidate="ddlHDG"
                            ErrorMessage="HDG is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtPrimer">Primer <span class="required">*</span></label>
                        <asp:TextBox ID="txtPrimer" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrimer" runat="server" ControlToValidate="txtPrimer"
                            ErrorMessage="Primer is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--  <asp:RangeValidator ID="rvPrimer" runat="server" ControlToValidate="txtPrimer" 
                            Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtMIO">MIO <span class="required">*</span></label>
                        <asp:TextBox ID="txtMIO" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMIO" runat="server" ControlToValidate="txtMIO"
                            ErrorMessage="MIO is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%-- <asp:RangeValidator ID="rvMIO" runat="server" ControlToValidate="txtMIO" 
                            Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="txtPUTapeCount">PU Tape Count <span class="required">*</span></label>
                        <asp:TextBox ID="txtPUTapeCount" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPUTapeCount" runat="server" ControlToValidate="txtPUTapeCount"
                            ErrorMessage="PU Tape Count is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--<asp:RangeValidator ID="rvPUTapeCount" runat="server" ControlToValidate="txtPUTapeCount" 
                            Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtPaintShade">Paint Shade <span class="required">*</span></label>
                        <asp:TextBox ID="txtPaintShade" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPaintShade" runat="server" ControlToValidate="txtPaintShade"
                            ErrorMessage="Paint Shade is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtTotalDFT">Total DFT <span class="required">*</span></label>
                        <asp:TextBox ID="txtTotalDFT" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTotalDFT" runat="server" ControlToValidate="txtTotalDFT"
                            ErrorMessage="Total DFT is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%-- <asp:RangeValidator ID="rvTotalDFT" runat="server" ControlToValidate="txtTotalDFT" 
                            Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="ddlVP">Varnish/Paint <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlVP" runat="server" CssClass="form-select">
                            <asp:ListItem Text="-- Select --" Value="" />
                            <asp:ListItem Text="Varnish" Value="Varnish" />
                            <asp:ListItem Text="Paint" Value="Paint" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvVP" runat="server" ControlToValidate="ddlVP"
                            ErrorMessage="Varnish/Paint is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <%-- <div class="form-group">
                        <label for="txtDFT">DFT <span class="required">*</span></label>
                        <asp:TextBox ID="txtDFT" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:TextBox ID="txtOption" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDFT" runat="server" ControlToValidate="txtDFT"
                            ErrorMessage="DFT is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>--%>
                    <div class="form-group">
                        <label for="txtPitch">Pitch <span class="required">*</span></label>
                        <asp:TextBox ID="txtPitch" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPitch" runat="server" ControlToValidate="txtPitch"
                            ErrorMessage="Pitch is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <!-- Logistics Section -->
            <div class="form-section">
                <h2 class="section-title">Logistics Information</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label for="ddlTransportation">Transportation By<span class="required">*</span></label>
                        <asp:DropDownList ID="ddlTransportation" runat="server" CssClass="form-select">
                            <asp:ListItem Text="-- Select --" Value="" />
                            <asp:ListItem Text="Air" Value="Air" />
                            <asp:ListItem Text="Ship" Value="Ship" />
                            <asp:ListItem Text="Road" Value="Road" />
                            <asp:ListItem Text="Rail" Value="Rail" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvTransportation" runat="server" ControlToValidate="ddlTransportation"
                            ErrorMessage="Transportation is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="ddlTransportationCondition">Transportation Condition <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlTransportationCondition" runat="server" CssClass="form-select">
                            <asp:ListItem Text="-- Select --" Value="" />
                            <asp:ListItem Text="CFR" Value="CFR" />
                            <asp:ListItem Text="FOB" Value="FOB" />
                            <asp:ListItem Text="CIF" Value="CIF" />
                            <asp:ListItem Text="EX WORSE" Value="EX WORSE" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvTransportationCondition" runat="server" ControlToValidate="ddlTransportationCondition"
                            ErrorMessage="Transportation Condition is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtDeliverySchedule">Delivery Schedule (From - To) <span class="required">*</span></label>
                        <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" Style="width: 220px; height: 35px;" />
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" Style="width: 220px; height: 35px;" />
                        <%-- <asp:RequiredFieldValidator ID="rfvDeliverySchedule" runat="server" ControlToValidate="txtDeliverySchedule"
                            ErrorMessage="Delivery Schedule is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="txtDrawingNo">Drawing Number <span class="required">*</span></label>
                        <asp:TextBox ID="txtDrawingNo" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDrawingNo" runat="server" ControlToValidate="txtDrawingNo"
                            ErrorMessage="Drawing Number is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--<asp:RangeValidator ID="rvDrawingNo" runat="server" ControlToValidate="txtDrawingNo" 
                            Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="txtQuantity">Quantity <span class="required">*</span></label>
                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity"
                            ErrorMessage="Quantity is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--  <asp:RangeValidator ID="rvQuantity" runat="server" ControlToValidate="txtQuantity" 
                            Type="Integer" MinimumValue="1" ErrorMessage="Please enter a valid quantity (minimum 1)" 
                            CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                    </div>
                </div>
            </div>

            <div class="btn-container">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="DataSubmit_Click" />
            </div>

            <br />
            <div style="overflow-x: auto; width: 100%;">
                <asp:GridView ID="gvEnquiry" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SrNo"
                    OnRowEditing="gvEnquiry_RowEditing"
                    OnRowUpdating="gvEnquiry_RowUpdating"
                    OnRowCancelingEdit="gvEnquiry_RowCancelingEdit"
                    OnRowDeleting="gvEnquiry_RowDeleting" PageSize="10">

                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <%# Eval("SrNo") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Enquiry No" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_EnquiryNo" runat="server" Text='<%#Eval("EnquiryNo") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_EnquiryNo" runat="server" Text='<%#Eval("EnquiryNo") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Customer Code" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_CustomerCode" runat="server" Text='<%#Eval("CustomerCode") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_CustomerCode" ReadOnly="true" runat="server" Text='<%#Eval("CustomerCode") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Customer Name" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_CustomerName" runat="server" Text='<%#Eval("CustomerName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_CustomerName" ReadOnly="true" runat="server" Text='<%#Eval("CustomerName") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Place" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Place" runat="server" Text='<%#Eval("Place") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Place" runat="server" Text='<%#Eval("Place") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Radiator Size" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_RadiatorSize" runat="server" Text='<%#Eval("RadiatorSize") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_RadiatorSize" runat="server" Text='<%#Eval("RadiatorSize") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Width" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Width" runat="server" Text='<%#Eval("Width") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Width" runat="server" Text='<%#Eval("Width") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="CD" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_CD" runat="server" Text='<%#Eval("CD") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_CD" runat="server" Text='<%#Eval("CD") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sheet Thickness" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ST" runat="server" Text='<%#Eval("SheetThick") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_ST" runat="server" Text='<%#Eval("SheetThick") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="No. of Tins" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Tins" runat="server" Text='<%#Eval("Tins") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Tins" runat="server" Text='<%#Eval("Tins") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Weight" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Weight" runat="server" Text='<%#Eval("Weight") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Weight" runat="server" Text='<%#Eval("Weight") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="HDG" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_HDG" runat="server" Text='<%#Eval("HDG") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_HDG" runat="server" Text='<%#Eval("HDG") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Primer" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Primer" runat="server" Text='<%#Eval("Primer") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Primer" runat="server" Text='<%#Eval("Primer") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MIO" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_MIO" runat="server" Text='<%#Eval("MIO") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_MIO" runat="server" Text='<%#Eval("MIO") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="PU Tapecount" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_PU_Tapecount" runat="server" Text='<%#Eval("PU_Tapecount") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_PU_Tapecount" runat="server" Text='<%#Eval("PU_Tapecount") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Paint Shade" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_PaintShade" runat="server" Text='<%#Eval("PaintShade") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_PaintShade" runat="server" Text='<%#Eval("PaintShade") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total DFT" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Total_DFT" runat="server" Text='<%#Eval("Total_DFT") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Total_DFT" runat="server" Text='<%#Eval("Total_DFT") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Varnish" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Varnish" runat="server" Text='<%#Eval("Varnish") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Varnish" runat="server" Text='<%#Eval("Varnish") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Pitch" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Pitch" runat="server" Text='<%#Eval("Pitch") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Pitch" runat="server" Text='<%#Eval("Pitch") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Transportation" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Transportation" runat="server" Text='<%#Eval("Transportation") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Transportation" runat="server" Text='<%#Eval("Transportation") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Transportation Condition" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_TransportationCondition" runat="server" Text='<%#Eval("TransportationCondition") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_TransportationCondition" runat="server" Text='<%#Eval("TransportationCondition") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delivery Schedule" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_DeliverySchedule" runat="server" Text='<%#Eval("DeliverySchedule") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_DeliverySchedule" runat="server" Text='<%#Eval("DeliverySchedule") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Drawing No" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_DrawingNo" runat="server" Text='<%#Eval("DrawingNo") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_DrawingNo" runat="server" Text='<%#Eval("DrawingNo") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Quantity" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Quantity" runat="server" Text='<%#Eval("Quantity") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions" HeaderStyle-BackColor="#3498db" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Button ID="btn_Edit" runat="server" Text="Edit" CausesValidation="false" CommandName="Edit" CssClass="btn btn-sm btn-primary" />
                                <asp:Button ID="btn_Delete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete" CommandArgument='<%# Eval("SrNo") %>' CssClass="btn btn-sm btn-danger" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btn_Update" runat="server" Text="Update" CausesValidation="false" CommandName="Update" CssClass="btn btn-sm btn-success" />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CausesValidation="false" CommandName="Cancel" CssClass="btn btn-sm btn-secondary" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </div>
</body>
</html>


