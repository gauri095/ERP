<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationForm.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="DEMOProject.QuotationForm" MaintainScrollPositionOnPostback="true" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        //$(document).ready(function () {
        //    $('#txtRate, #txtQty').on('input', function () {
        //        var quantity = parseFloat($('#txtQty').val()) || 0;
        //        var rate = parseFloat($('#txtRate').val()) || 0;

        //        // Calculate the total
        //        var total = quantity * rate;

        //        // Display the total in txtTotal
        //        $('#txtTotal').val(total.toFixed(2)); // Format to 2 decimal places
        //    });
        //});
      <%--  function getEnquiries(customerName) {
            if (customerName === "") {
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "QuotationForm.aspx/GetEnquiries", true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // var ddl = document.getElementById("<%= ddlFilterEnquiryNo.ClientID %>");
                    var ddl = document.querySelector("[id$='ddlFilterEnquiryNo']");

             ddl.options.length = 0; // Clear previous options

             var data = JSON.parse(xhr.responseText).d;
             var defaultOption = document.createElement("option");
             defaultOption.text = "Select Enquiry";
             defaultOption.value = "";
             ddl.add(defaultOption);

             for (var i = 0; i < data.length; i++) {
                 var opt = document.createElement("option");
                 opt.value = data[i];
                 opt.text = data[i];
                 ddl.add(opt);
             }
         }
     };

     var payload = JSON.stringify({ customerName: customerName });
     xhr.send(payload);
 }--%>

        function getEnquiries(customerName) {
            if (!customerName) {
                var ddl = document.getElementById('<%= ddlFilterEnquiryNo.ClientID %>');
         ddl.innerHTML = '<option value="">--Select Enquiry--</option>';
         return;
     }

     var xhr = new XMLHttpRequest();
     xhr.open("POST", "QuotationForm.aspx/GetEnquiries", true);
     xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");

     xhr.onreadystatechange = function () {
         if (xhr.readyState === 4) {
             if (xhr.status === 200) {
                 var response = JSON.parse(xhr.responseText);
                 var data = response.d;

                 var ddl = document.getElementById('<%= ddlFilterEnquiryNo.ClientID %>');
                 ddl.innerHTML = "";

                 var defaultOpt = document.createElement("option");
                 defaultOpt.value = "";
                 defaultOpt.text = "Select Enquiry";
                 ddl.add(defaultOpt);

                 for (var i = 0; i < data.length; i++) {
                     var opt = document.createElement("option");
                     opt.value = data[i];
                     opt.text = data[i];
                     ddl.add(opt);
                 }
             } else {
                 console.error("AJAX Error:", xhr.status, xhr.responseText);
             }
         }
     };

     var payload = JSON.stringify({ customerName: customerName });
     xhr.send(payload);
 }

        document.addEventListener('DOMContentLoaded', function () {
            const enquiryDropdown = document.getElementById('<%= ddlFilterEnquiryNo.ClientID %>');

     enquiryDropdown.addEventListener('change', function () {
         const selectedEnquiry = this.value;
         if (!selectedEnquiry) return;

         fetchEnquiryDetails(selectedEnquiry);
     });
 });

        function fetchEnquiryDetails(enquiryNo) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "QuotationForm.aspx/GetEnquiryDetails", true);
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var data = JSON.parse(xhr.responseText).d;

                    // Populate textboxes
                    document.getElementById('<%= txtEnquiryNo.ClientID %>').value = data.EnquiryNo || "";
            document.getElementById('<%= txtCustomerName.ClientID %>').value = data.CustomerName || "";
            document.getElementById('<%= txtCustomerCode.ClientID %>').value = data.CustomerCode || "";
            document.getElementById('<%= txtPlace.ClientID %>').value = data.Place || "";

            document.getElementById('<%= txtRadiatorSize.ClientID %>').value = data.RadiatorSize || "";
            document.getElementById('<%= txtWidth.ClientID %>').value = data.Width || "";
            document.getElementById('<%= txtCD.ClientID %>').value = data.CD || "";
            document.getElementById('<%= txtSheetThick.ClientID %>').value = data.SheetThick || "";
            document.getElementById('<%= txtTins.ClientID %>').value = data.Tins || "";
            document.getElementById('<%= txtWeight.ClientID %>').value = data.Weight || "";

            document.getElementById('<%= txtHDG.ClientID %>').value = data.HDG || "";
            document.getElementById('<%= txtPrimer.ClientID %>').value = data.Primer || "";
            document.getElementById('<%= txtMIO.ClientID %>').value = data.MIO || "";
            document.getElementById('<%= txtPUTapeCount.ClientID %>').value = data.PUTapeCount || "";
            document.getElementById('<%= txtPaintShade.ClientID %>').value = data.PaintShade || "";
            document.getElementById('<%= txtTotalDFT.ClientID %>').value = data.TotalDFT || "";
            document.getElementById('<%= txtVP.ClientID %>').value = data.VP || "";
            document.getElementById('<%= txtPitch.ClientID %>').value = data.Pitch || "";

            document.getElementById('<%= txtTransportation.ClientID %>').value = data.Transportation || "";
            document.getElementById('<%= txtTransportationCondition.ClientID %>').value = data.TransportationCondition || "";

            document.getElementById('<%= txtFromDate.ClientID %>').value = data.FromDate || "";
            document.getElementById('<%= txtToDate.ClientID %>').value = data.ToDate || "";

            document.getElementById('<%= txtDrawingNo.ClientID %>').value = data.DrawingNo || "";
            document.getElementById('<%= txtQuantity.ClientID %>').value = data.Quantity || "";
                }
            };

            xhr.send(JSON.stringify({ enquiryNo: enquiryNo }));
        }

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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <h1>Quotation Form</h1>
        <p class="subtitle">Please fill in all required fields to generate quotation</p>

        <div id="successMessage" class="success-message" runat="server">Quotation submitted successfully!</div>
        <div id="errorMessage" class="error-message" runat="server">Error submitting quotation. Please try again.</div>

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
        <div class="form-row">
            <div class="form-group">
                <label for="ddlFilterCustomer">Customer Name</label>
                <asp:DropDownList ID="ddlFilterCustomer" runat="server" AutoPostBack="false" onchange="getEnquiries(this.value)"
                    CssClass="form-select">
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlFilterEnquiryNo">Enquiry No</label>
                <asp:DropDownList ID="ddlFilterEnquiryNo" runat="server" CssClass="form-select" onchange="fetchEnquiryDetails()">
                </asp:DropDownList>
            </div>
        </div>

        <!-- Basic Information Section -->
        <div class="form-section">
            <h2 class="section-title">Basic Information</h2>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtSrNo">Serial Number <span class="required">*</span></label>
                    <asp:TextBox ID="txtSrNo" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSrNo" runat="server" ControlToValidate="txtSrNo"
                        ErrorMessage="Serial Number is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>

            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtEnquiryNo">Enquiry Number <span class="required">*</span></label>
                    <asp:TextBox ID="txtEnquiryNo" runat="server" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEnquiryNo" runat="server" ControlToValidate="txtEnquiryNo"
                        ErrorMessage="Enquiry Number is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtCustomerCode">Customer Code <span class="required">*</span></label>
                    <asp:TextBox ID="txtCustomerCode" runat="server" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCustomerCode" runat="server" ControlToValidate="txtCustomerCode"
                        ErrorMessage="Customer Code is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtCustomerName">Customer Name <span class="required">*</span></label>
                    <%-- <asp:DropDownList ID="ddlCustomers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged"
                            DataTextField="CustomerName" DataValueField="SrNo" CssClass="form-select">
                        </asp:DropDownList>--%>
                    <asp:TextBox ID="txtCustomerName" runat="server" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName"
                        ErrorMessage="Customer Name is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="customer-details" style="margin-top: 20px;">
                </div>
                <div class="form-group">
                    <label for="txtPlace">Place <span class="required">*</span></label>
                    <asp:TextBox ID="txtPlace" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPlace" runat="server" ControlToValidate="txtPlace"
                        ErrorMessage="Place is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
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
                        ErrorMessage="Radiator Size is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtWidth">Width <span class="required">*</span></label>
                    <asp:TextBox ID="txtWidth" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvWidth" runat="server" ControlToValidate="txtWidth"
                        ErrorMessage="Width is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtCD">CD <span class="required">*</span></label>
                    <asp:TextBox ID="txtCD" runat="server" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCD" runat="server" ControlToValidate="txtCD"
                        ErrorMessage="CD is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtSheetThick">Sheet Thickness <span class="required">*</span></label>
                    <asp:TextBox ID="txtSheetThick" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSheetThick" runat="server" ControlToValidate="txtSheetThick"
                        ErrorMessage="Sheet Thickness is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtTins">No. of Tins <span class="required">*</span></label>
                    <asp:TextBox ID="txtTins" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTins" runat="server" ControlToValidate="txtTins"
                        ErrorMessage="Tins is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <%-- <asp:RangeValidator ID="rvTins" runat="server" ControlToValidate="txtTins" 
                         Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                         CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                </div>
                <div class="form-group">
                    <label for="txtWeight">Weight <span class="required">*</span></label>
                    <asp:TextBox ID="txtWeight" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvWeight" runat="server" ControlToValidate="txtWeight"
                        ErrorMessage="Weight is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
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
                    <asp:TextBox ID="txtHDG" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHDG" runat="server" ControlToValidate="txtHDG"
                        ErrorMessage="HDG is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtPrimer">Primer <span class="required">*</span></label>
                    <asp:TextBox ID="txtPrimer" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPrimer" runat="server" ControlToValidate="txtPrimer"
                        ErrorMessage="Primer is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
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
                        ErrorMessage="MIO is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <%-- <asp:RangeValidator ID="rvMIO" runat="server" ControlToValidate="txtMIO" 
                         Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                         CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                </div>
                <div class="form-group">
                    <label for="txtPUTapeCount">PU Tape Count <span class="required">*</span></label>
                    <asp:TextBox ID="txtPUTapeCount" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPUTapeCount" runat="server" ControlToValidate="txtPUTapeCount"
                        ErrorMessage="PU Tape Count is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
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
                        ErrorMessage="Paint Shade is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtTotalDFT">Total DFT <span class="required">*</span></label>
                    <asp:TextBox ID="txtTotalDFT" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTotalDFT" runat="server" ControlToValidate="txtTotalDFT"
                        ErrorMessage="Total DFT is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <%-- <asp:RangeValidator ID="rvTotalDFT" runat="server" ControlToValidate="txtTotalDFT" 
                         Type="Integer" MinimumValue="0" ErrorMessage="Please enter a valid number" 
                         CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtVP">Varnish/Paint <span class="required">*</span></label>
                    <asp:TextBox ID="txtVP" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvVP" runat="server" ControlToValidate="txtVP"
                        ErrorMessage="Varnish/Paint is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
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
                        ErrorMessage="Pitch is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <!-- Logistics Section -->
        <div class="form-section">
            <h2 class="section-title">Logistics Information</h2>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtTransportation">Transportation By<span class="required">*</span></label>
                    <asp:TextBox ID="txtTransportation" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTransportation" runat="server" ControlToValidate="txtTransportation"
                        ErrorMessage="Transportation is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtTransportationCondition">Transportation Condition <span class="required">*</span></label>
                    <asp:TextBox ID="txtTransportationCondition" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTransportationCondition" runat="server" ControlToValidate="txtTransportationCondition"
                        ErrorMessage="Transportation Condition is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtDeliverySchedule">Delivery Schedule (From - To) <span class="required">*</span></label>
                    <%--<asp:TextBox ID="txtDeliverySchedule" runat="server" MaxLength="50"></asp:TextBox>--%>
                    <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" />
                    &nbsp;&nbsp;
                        <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" />
                    <%-- <asp:RequiredFieldValidator ID="rfvDeliverySchedule" runat="server" ControlToValidate="txtDeliverySchedule"
                         ErrorMessage="Delivery Schedule is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-group">
                    <label for="txtDrawingNo">Drawing Number <span class="required">*</span></label>
                    <asp:TextBox ID="txtDrawingNo" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDrawingNo" runat="server" ControlToValidate="txtDrawingNo"
                        ErrorMessage="Drawing Number is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
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
                        ErrorMessage="Quantity is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <%--  <asp:RangeValidator ID="rvQuantity" runat="server" ControlToValidate="txtQuantity" 
                         Type="Integer" MinimumValue="1" ErrorMessage="Please enter a valid quantity (minimum 1)" 
                         CssClass="validation-error" Display="Dynamic"></asp:RangeValidator>--%>
                </div>
                <div class="form-group">
                    <label for="txtRate">Rate <span class="required">*</span></label>
                    <asp:TextBox ID="txtRate" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                        ErrorMessage="Rate is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtTotal">Total <span class="required">*</span></label>
                    <asp:TextBox ID="txtTotal" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTotal" runat="server" ControlToValidate="txtTotal"
                        ErrorMessage="Quantity is required" CssClass="validation-error" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <div class="btn-container">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" />
        </div>
    </div>
</asp:Content>




