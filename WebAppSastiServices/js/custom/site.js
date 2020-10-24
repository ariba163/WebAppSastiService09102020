$('#quickCall').on('click', function () {
    $('#QuickCallForm').css("right", "0");
});

function CloseForm() {
    $('#QuickCallForm').css("right", "-350px");
}

//function OpenForm(value, serviceID) {

//    var ServiceTypeID = document.getElementById("txtServiceTypeID");
//    console.log(ServiceTypeID);
//    ServiceTypeID.value = serviceID;




//    console.log(serviceID);
//    $.ajax({
//        url: window.location.href + 'Home/ReturnServiceRequirment?ServiceTypID=' + serviceID.toString(),
//        type: "GET",
//        success: function (result) {
//            console.table(result);


//            var DependentList = document.getElementById("cmbDependent");
//            var PowerList = document.getElementById("cmbPowerRange");
//            DependentList.length = 0;
//            PowerList.length = 0;

//            result.Dependent.map((item, index) => {
//                console.log(item.Value);
//                var DependentOption = document.createElement("option");
//                DependentOption.text = item.Value;
//                DependentOption.value = item.ID;

//                DependentList.add(DependentOption);
//            });

//            result.PowerList.map((item, index) => {

//                var PowerOption = document.createElement("option");
//                PowerOption.text = item.PowerRange;
//                PowerOption.value = item.PowerID;

//                PowerList.add(PowerOption);

//                console.log(item.PowerName)
//            });
//            $('#exampleModalLongService1').modal('show');
//        }
        
//    });
//}




