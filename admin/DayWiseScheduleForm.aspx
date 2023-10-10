<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DayWiseScheduleForm.aspx.cs" Inherits="admin_DayWiseScheduleForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                            <h1>Detailed Day Wise Schedule Form</h1>
                            <p>(TourDetails.aspax)</p>

                            <div class="col-md-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="form-group">
                                                <label for="dd_place">Select Place</label>
                                                <asp:DropDownList ID="dd_place" runat="server" class="form-control" DataTextField="place" DataValueField="Id"></asp:DropDownList>
                                            </div>

                                            <div class="form-group">
                                                <label for="txtday">Enter Day Number</label>
                                                <asp:TextBox ID="txtday" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="txtdaytitle">Enter Day Title</label>
                                                <asp:TextBox ID="txtdaytitle" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="txtdaydetails">Enter Day Details</label>
                                                <asp:TextBox ID="txtdaydetails" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <asp:Button ID="btnSubmit_AboutTour" runat="server" Text="Submit" OnClick="btnSubmit_AboutTour_Click" class="btn btn-gradient-primary me-2" />
                                            <asp:Button ID="btnUpdate_AboutTour" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_AboutTour_Click" class="btn btn-gradient-primary me-2" />
                                            <asp:Button ID="btnCancel_AboutTour" runat="server" Text="Cancel" OnClick="btnCancel_AboutTour_Click" class="btn btn-gradient-primary me-2" />

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-12">
                                <div class="table-responsive">
                                    <table class="table" style="background-color: #fff;">
                                        <thead>
                                            <tr>
                                                <th scope="col">Id</th>
                                                <th scope="col">Selected Place</th>
                                                <th scope="col">Day Number</th>
                                                <th scope="col">Day Title</th>
                                                <th scope="col">Day Details</th>
                                                <th scope="col">status</th>
                                                <th scope="col">Edit</th>
                                                <th scope="col">Delete</th>
                                                <th scope="col">Change Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:HiddenField ID="hdnvalue" runat="server" />
                                            <asp:ListView ID="ListView_DayWise_schedule" runat="server" OnItemCommand="ListView_DayWise_schedule_ItemCommand" OnItemEditing="ListView_DayWise_schedule_ItemEditing" OnItemDeleting="ListView_DayWise_schedule_ItemDeleting">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblplace" runat="server" Text='<%# Eval("place") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblday" runat="server" Text='<%# Eval("day") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldaytitle" runat="server" Text='<%# Eval("daytitle") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldaydetails" runat="server" Text='<%# Eval("daydetails") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                                    <tr class="">
                                                        <td><%# Eval("Id") %></td>
                                                        <td><%# Eval("place") %></td>
                                                        <td><%# Eval("day") %></td>
                                                        <td><%# Eval("daytitle") %></td>
                                                        <td><%# Eval("daydetails") %></td>
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

