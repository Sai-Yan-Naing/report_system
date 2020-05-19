
$(document).on('click', '#user_profile', function() {
    popupProfile();
  });
function popupProfile()
{
	$("#popup_profile").slideToggle();
}
////////////////////

$(document).on('click', function (event) {
  if (!$(event.target).closest('#user_profile').length) {
    // ... clicked on the 'body', but not inside of #menutop
    var status = $("#user_profile").css("display");
    if (status== 'block') 
    {
    	$("#popup_profile").slideUp();
    }
  }
});
////////////////////////////

// $('html').click(function(evt){  
// 	if(evt.target.id == "user_profile")
// 	return;
// 	alert(evt.target.id)
// 	if($(evt.target).closest('#user_profile').length)
//           return;
// });

// document.onclick = function(event){
// 	var hasParent = false;
// 	for(var node = event.target; node != document.body; node=node.parentNode)
// 	{
// 		if(node.id=="#user_profile"){
// 			hasParent = true;
// 			break;
// 		}
// 	}

// 	if (!hasParent) 
// 	{
// 		var status = $("#user_profile").css("display");
// 		if (status=="block") 
// 		{
// 			popupProfile();
// 		}
// 	}
// }

function exportexcel() {  
    alert(2)
            $("#mytable").table2excel({  
                name: "Table2Excel",  
                filename: "myFileName",  
                fileext: ".xls"  
            });  
        }  

$(document).on('click','#clickme',function()
        // $("#clickme").click(function()
        {
            alert(1)
            exportexcel();
        })