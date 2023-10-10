<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PackageCategoryMainForm.aspx.cs" Inherits="admin_PackageCategoryMainForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                            <h1>Package Category Main Form</h1>
                            <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
 
                                                    <div class="form-group">
                                                        <label for="txtpackage_category_name">Enter Main Package Category</label>
                                                        <asp:TextBox ID="txtpackage_category_name" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
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
                                                <th scope="col">Package Category</th>
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
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("package_category_id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblpackage_category_name" runat="server" Text='<%# Eval("package_category_name") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                                    <tr class="">

                                                        <td><%# Eval("package_category_id") %></td>
                                                        <td><%# Eval("package_category_name") %></td>
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

