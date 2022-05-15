$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
}
);

// To SAVE Data---------------------------------------------
$(document).on("click", "#btnSave", function(event)
{
	//clear alerts-----------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	//Form validations-------------------------
	var status = validationNotificationForm();
	if(status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	//If valid-------------------------
	var type = ($("#hidAppIDSave").val() == "" ) ? "POST"  : "PUT";
	
	//AJAX for save
	$.ajax(
	{
		url : "NotificationAPI",
		type : type,
		data : $("#formNotification").serialize(),
		dataType : "text",
		complete : function(response, status)
		{   
			onNotificationSaveComplete(response.responseText, status);
		}
	}); 
});


//onNotificationSaveComplete function
function onNotificationSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show(); 

			$("#divAppGrid").html(resultSet.data);
			} else if (resultSet.status.trim() == "error")
			{
				$("#alertError").text(resultSet.data);
				$("#alertError").show();
			} 

	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	} 

	$("#hidAppIDSave").val("");
	$("#formNotification")[0].reset();
	}

//UPDATE Function--------------------------------------------------
$(document).on("click", ".btnUpdate",function(event)
{
	
	
	$("#hidAppIDSave").val($(this).closest("tr").find('td:eq(0)').text());
	
	$("#notificationId").val($(this).closest("tr").find('td:eq(0)').text());
	$("#accountId").val($(this).closest("tr").find('td:eq(1)').text());
	$("#billid").val($(this).closest("tr").find('td:eq(2)').text());
	$("#amountToBePaid").val($(this).closest("tr").find('td:eq(3)').text());
	$("#email").val($(this).closest("tr").find('td:eq(4)').text());
	$("#mobileNumber").val($(this).closest("tr").find('td:eq(5)').text());
	$("#subject").val($(this).closest("tr").find('td:eq(6)').text());
	$("#massage").val($(this).closest("tr").find('td:eq(7)').text());
	$("#dateNotify").val($(this).closest("tr").find('td:eq(8)').text());
	
	
});

//DELETE Function----------------------------------------
$(document).on("click", ".btnRemove", function(event)
{
	//AJAX to delete
	$.ajax(
		{
			url : "NotificationAPI",
			type : "DELETE",
			data : "id=" + $(this).data("id"),
			dataType : "text",
			complete : function(response, status)
			{
				onNotificationDeleteComplete(response.responseText, status);
			}
	});
}); 

//onNotificationDeleteComplete function
function onNotificationDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show(); 

			$("#divAppGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{ 
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		} 

	} else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

//CLIENT-MODEL Validations--------------------
function validationNotificationForm()
{
	
	
	//account id
	if($("#accountId").val().trim() == "")
	{
		return "Insert Account Id.";
	}
	
	//Bill id
	if($("#billid").val().trim() == "")
	{
		return "Insert Bill Id.";
	}
	
	//Amount to be paid
	if($("#amountToBePaid").val().trim() == "")
	{
		return "Insert Amount To Be Paid.";
	}
	
	//email
	if($("#email").val().trim() == "")
	{
		return "Insert Email.";
	}
	
	//mobile number
	if($("#mobileNumber").val().trim() == "")
	{
		return "Insert Mobile Number.";
	}
	
	//Subject
	if($("#subject").val().trim() == "")
	{
		return "Insert Subject.";
	}
	
	//Message
	if($("#massage").val().trim() == "")
	{
		return "Insert Message.";
	}
	
	//Date Notify
	if($("#dateNotify").val().trim() == "")
	{
		return "Insert Date Notify.";
	}
	
	

	return true;
}