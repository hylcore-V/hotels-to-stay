<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="HotelDetailsRoomsCategoryForm.aspx.cs" Inherits="admin_HotelDetailsRoomsCategoryForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                            <h1>Hotel Details Rooms Category Section</h1>
                            <h4 class="card-title">( hotel-details.aspx ) --> Hotel Rooms Category Section</h4>

                            <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">

                                                    <div class="form-group">
                                                        <label for="dd_selecthotel">Select Hotel</label>
                                                        <asp:DropDownList ID="dd_selecthotel" runat="server" class="form-control form-control-lg" DataTextField="hotel" DataValueField="Id">
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtroomtype">Enter Room Category</label>
                                                        <asp:TextBox ID="txtroomtype" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txthotel_amenities">Enter Hotel Amenities</label>
                                                        <asp:TextBox ID="txthotel_amenities" runat="server" class="form-control"></asp:TextBox>
                                                    </div>


                                                    <div class="form-group">
                                                        <label for="txtincludes">Enter Hotel Includes</label>
                                                        <asp:TextBox ID="txtincludes" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtmaxinum">Enter Hotel Maxinum People Number</label>
                                                        <asp:TextBox ID="txtmaxinum" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtprice_per_night">Enter Hotel Room Price Per Night</label>
                                                        <asp:TextBox ID="txtprice_per_night" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="room_image">Upload Hotel Room Image</label>
                                                        <asp:FileUpload ID="room_image" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
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
                                                <th scope="col">Hotel Id</th>
                                                <th scope="col">Hotel Name</th>
                                                <th scope="col">Room Category<br />
                                                    Room Type
                                                </th>
                                                <th scope="col">Hotel Amenities</th>
                                                <th scope="col">Hotel Includes</th>
                                                <th scope="col">Hotel Maxinum</th>
                                                <th scope="col">Room Price Per Night</th>
                                                <th scope="col">Hotel Room Image</th>
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
                                                    <asp:Label ID="lblhotel_id" runat="server" Text='<%# Eval("hotel_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblhotel_name" runat="server" Text='<%# Eval("hotel_name") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblroom_type" runat="server" Text='<%# Eval("room_type") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblhotel_amenities" runat="server" Text='<%# Eval("hotel_amenities") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblincludes" runat="server" Text='<%# Eval("includes") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblmaxinum" runat="server" Text='<%# Eval("maxinum") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblprice_per_night" runat="server" Text='<%# Eval("price_per_night") %>' Visible="false"></asp:Label>
                                                    <asp:FileUpload ID="lblroom_image" runat="server" Text='<%# Eval("room_image") %>' Visible="false" />
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>
                                                    <tr class="">
                                                        <td><%# Eval("Id") %></td>
                                                        <td><%# Eval("Hotel_id") %></td>
                                                        <td><%# Eval("Hotel_name") %></td>
                                                        <td><%# Eval("room_type") %></td>
                                                        <td><%# Eval("hotel_amenities") %></td>
                                                        <td><%# Eval("includes") %></td>
                                                        <td><%# Eval("maxinum") %></td>
                                                        <td><%# Eval("price_per_night") %></td>
                                                        <td>
                                                            <img src="../images/Hotel_Images/<%# Eval("room_image") %>" />
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

