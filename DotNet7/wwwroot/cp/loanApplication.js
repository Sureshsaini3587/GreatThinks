



$("#VerifyButton").click(function () {
    var val = $("#membershipNumber").val();
    $.ajax({
        type: 'GET',
        url: `/api/MasterApi/VerifyMember?membershipNumber=${$("#membershipNumber").val()}`,
        success: function (response) {
            console.log(response.data);
            if (response.fld_Status == 1) {
                $("#memberName").val(response.data[0].fld_MemberName);
                $("#membershipNo").val(response.data[0].fld_MembershipNumber);
                $("#mobileNumber").val(response.data[0].fld_MobileNumber);
                $("#emailAddress").val(response.data[0].fld_EmailAddress);

                $("#memberDetailsSection").css("display", "block");

                $("#memberSearchSection").prop("disabled", true);


            }
            else {
                alert("No Record Found");
            }
        },
        Error: function (e) {
            console.log(e);
        },

    });
});

$("#ApplyButton").click(function () {
    var vals = {
        "Fld_MembershipNumber": $("#membershipNo").val(),
        "Fld_RequiredLoanAmount": $("#RequiredLoanAmount").val(),
        "Fld_LoanScheme": $("#loanScheme").val(),
        "Fld_PromiseToPayDate": $("#promiseToPayDate").val(),
        "Fld_LoanSanctionDate": $("#loanSanctionDate").val(),
        "Fld_PanNumber": $("#panNumber").val(),
    }


    $.ajax({
        type: 'Post',
        data: JSON.stringify(vals),
        url: "/api/MasterApi/LoanApplication",
        contentType: "application/json",
        success: function (response) {
            console.log(response);
            if (response.fld_Status == 1) {
                alert(`Account Successfully Created AccNo: ${response.fld_AccountNumber}`);
                location.reload();
            }
            else {
                alert("Please Contact to Developer");
            }
        },
        error: function (e) {
            alert('error,Something went wrong');
            console.log(e);
        },
        failure: function (e) {
            alert('failure,Something went wrong');
            console.log(e);
        },
        catch: function (e) {
            alert('${e},Something went wrong');
            console.log(e);
        }

    });



});
