<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TopEvents.aspx.cs" Inherits="admin_TopEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
                            <h1>Top Event Form</h1>
                            <h4 class="card-title">Top Events In This Month ( Default.aspx )</h4>
                            <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="form-group">
                                                        <label for="ddl_selecthotel">Select Hotel For Event</label>
                                                        <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddl_selecthotel_SelectedIndexChanged" ID="ddl_selecthotel" runat="server" class="form-control form-control-lg" DataTextField="hotel" DataValueField="Id" AppendDataBoundItems="true">
                                                        <asp:ListItem Value="-1" text="Select Hotel For Event"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txteventLocation">Enter Event Date</label>
                                                        <asp:TextBox ID="txteventDate" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txteventTime">Enter Event Time</label>
                                                        <asp:TextBox ID="txteventTime" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txteventLocation">Package Event Location</label>
                                                        <asp:TextBox ID="txteventLocation" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
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
                                                <th scope="col">Hotel For Event Id</th>
                                                <th scope="col">Hotel For Event Name</th>
                                                <th scope="col">Event Date</th>
                                                <th scope="col">Event Time</th>
                                                <th scope="col">Event Location</th>
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
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbleventHotelNameId" runat="server" Text='<%# Eval("eventHotelNameId") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbleventHotelName" runat="server" Text='<%# Eval("eventHotelName") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbleventDate" runat="server" Text='<%# Eval("eventDate") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbleventTime" runat="server" Text='<%# Eval("eventTime") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbleventLocation" runat="server" Text='<%# Eval("eventLocation") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                                    <tr class="">
                                                        <td><%# Eval("id") %></td>
                                                        <td><%# Eval("eventHotelNameId") %></td>
                                                        <td><%# Eval("eventHotelName") %></td>
                                                        <td><%# Eval("eventDate") %></td>
                                                        <td><%# Eval("eventTime") %></td>
                                                        <td><%# Eval("eventLocation") %></td>
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

