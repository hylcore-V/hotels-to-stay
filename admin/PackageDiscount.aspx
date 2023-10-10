<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PackageDiscount.aspx.cs" Inherits="admin_PackageDiscount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                            <h1>Discounte Form</h1>
                            <h4 class="card-title">Top Discounts ( discount.aspx )</h4>
                            <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                    <div class="form-group">
                                                        <label for="ddl_selectpackage">Select Package</label>
                                                        <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddl_selectpackage_SelectedIndexChanged" ID="ddl_selectpackage" runat="server" class="form-control form-control-lg" DataTextField="package_name" DataValueField="package_id">
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtdiscount_percentage">Package Original Price ( In Rupees )</label>
                                                        <asp:TextBox ID="txtoriginal_price" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtdiscount_price">Enter Package Discounted Price Enter</label>
                                                        <asp:TextBox ID="txtdiscount_price" OnTextChanged="txtdiscount_price_TextChanged" AutoPostBack="true" runat="server" class="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="txtdiscount_percentage">Package Discounte Percentage</label>
                                                        <asp:TextBox ID="txtdiscount_percentage" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
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
                                                <th scope="col">Package Id</th>
                                                <th scope="col">Package Name</th>
                                                <th scope="col">Package Original Price</th>
                                                <th scope="col">Package Discounted Price</th>
                                                <th scope="col">Package Discount %</th>
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
                                                    <asp:Label ID="lbldiscount_id" runat="server" Text='<%# Eval("discount_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldiscount_package_id" runat="server" Text='<%# Eval("discount_package_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldiscount_package" runat="server" Text='<%# Eval("discount_package") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldiscount_price" runat="server" Text='<%# Eval("discount_price") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lbldiscount_percentage" runat="server" Text='<%# Eval("discount_percentage") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                                    <tr class="">
                                                        <td><%# Eval("discount_id") %></td>
                                                        <td><%# Eval("discount_package_id") %></td>
                                                        <td><%# Eval("discount_package") %></td>
                                                        <td><%# Eval("discount_original_price") %></td>
                                                        <td><%# Eval("discount_price") %></td>
                                                        <td><%# Eval("discount_percentage") %></td>
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

