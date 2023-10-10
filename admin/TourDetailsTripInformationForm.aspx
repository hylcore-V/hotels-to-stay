<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TourDetailsTripInformationForm.aspx.cs" Inherits="admin_TourDetailsTripInformationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <h1>Tour Details Form</h1>
        <h4 class="card-title">Popular Cities(Default.aspx) --> Trip Information(tour-details.aspx)</h4>

        <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="forms-sample">

                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">

                                <div class="form-group">
                                    <label for="ddmain">Select Place</label>
                                    <asp:DropDownList ID="ddmain" runat="server" class="form-control form-control-lg" DataTextField="place" DataValueField="Id">
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <label for="txttrip_price">Enter Trip Price</label>
                                    <asp:TextBox ID="txttrip_price" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="txtarrival_date">Enter Arrival Date</label>
                                    <asp:TextBox ID="txtarrival_date" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="txtdeparture_date">Enter Departure Date</label>
                                    <asp:TextBox ID="txtdeparture_date" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="txthelp_number">Enter Help Line Number</label>
                                    <asp:TextBox ID="txthelp_number" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="offer_image">Upload Offer Image</label>
                                    <asp:FileUpload ID="offer_image" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>

                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                            </div>
                        </div>

                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn btn-gradient-primary me-2" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_Click" class="btn btn-gradient-primary me-2" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-gradient-primary me-2" />

                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-sm-12 col-md-12 col-12">
            <div class="table-responsive">
                <table class="table" style="background-color: #fff;">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">place id</th>
                            <th scope="col">place name</th>
                            <th scope="col">trip price</th>
                            <th scope="col">arrival date</th>
                            <th scope="col">departure date</th>
                            <th scope="col">help number</th>
                            <th scope="col">offer image</th>
                            <th scope="col">status</th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                            <th scope="col">Change Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:HiddenField ID="hdnvalue" runat="server" />
                        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemEditing="ListView1_ItemEditing" OnItemDeleting="ListView1_ItemDeleting">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblplace_id" runat="server" Text='<%# Eval("place_id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblplace_name" runat="server" Text='<%# Eval("place_name") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lbltrip_price" runat="server" Text='<%# Eval("trip_price") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblarrival_date" runat="server" Text='<%# Eval("arrival_date") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lbldeparture_date" runat="server" Text='<%# Eval("departure_date") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblhelp_number" runat="server" Text='<%# Eval("help_number") %>' Visible="false"></asp:Label>
                                <asp:FileUpload ID="lbloffer_image" runat="server" Text='<%# Eval("offer_image") %>' Visible="false" />

                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                <tr class="">
                                    <td><%# Eval("Id") %></td>
                                    <td><%# Eval("place_id") %></td>
                                    <td><%# Eval("place_name") %></td>
                                    <td><%# Eval("trip_price") %></td>
                                    <td><%# Eval("arrival_date") %></td>
                                    <td><%# Eval("departure_date") %></td>
                                    <td><%# Eval("help_number") %></td>
                                    <td>
                                        <img src="../images/offer_images/<%# Eval("offer_image") %>" />
                                    </td>

                                    <td><%# Eval("status") %></td>

                                    <td>
                                        <asp:Button ID="EditBtn" runat="server" Text="Edit" CommandName="edit" class="btn btn-gradient-primary me-2" />
                                    </td>

                                    <td>
                                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CommandName="delete" class="btn btn-gradient-primary me-2" />
                                    </td>

                                    <td>
                                        <span id="Span1" runat="server" visible='<%# Eval("status").ToString() == "1" ? true : false %>'>
                                            <asp:Button ID="Active" runat="server" Text="Deactive" CommandName="Deactive" class="btn btn-gradient-primary me-2" />
                                        </span>

                                        <span id="Span2" runat="server" visible='<%# Eval("status").ToString() == "0" ? true : false %>'>
                                            <asp:Button ID="Deactive" runat="server" Text="Active" CommandName="Active" class="btn btn-gradient-primary me-2" />
                                        </span>
                                    </td>


                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

