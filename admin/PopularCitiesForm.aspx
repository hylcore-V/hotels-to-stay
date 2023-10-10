<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PopularCitiesForm.aspx.cs" Inherits="admin_PopularCitiesForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">

                            <h1>Popular Cities Form</h1>
                            <div class="col-md-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="forms-sample">

                                            <div class="form-group">
                                                <label for="exampleInputUsername1">Enter Popular Cities Heading</label>
                                                <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputUsername1">Enter Popular Cities Sub Heading</label>
                                                <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputUsername1">Enter Popular Cities Place Name</label>
                                                <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputUsername1">Enter Popular Cities Starting from Price In Rupees</label>
                                                <asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <label>Upload Popular Cities Place Image</label>
                                                <asp:FileUpload ID="FileUpload3" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                            </div>

                                            <asp:Button ID="Button1" runat="server" class="btn btn-gradient-primary me-2" Text="Submit" />

                                        </div>
                                    </div>
                                </div>
                            </div>                                                            
                        </div>
</asp:Content>

