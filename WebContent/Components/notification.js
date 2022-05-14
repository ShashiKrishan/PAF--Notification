$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
}
);

//SAVE======================================
$(document).on("click", "#btnSave", function(event)
{
	//clear alerts-----------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	//Form validation-------------------------
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

//UPDATE=========================================================
$(document).on("click", ".btnUpdate",function(event)
{
	//$("#hidAppIDSave").val(
			//$(this).closest("tr").find('#hidAppIDUpdate').val());
	console.log($(this).closest("tr"));
	document.getElementById("hidAppIDSave").value = "Update";
	$("#id").val($(this).closest("tr").find('td:eq(0)').text());
	$("#hospitalid").val($(this).closest("tr").find('td:eq(1)').text());
	$("#patientid").val($(this).closest("tr").find('td:eq(2)').text());
	$("#date").val($(this).closest("tr").find('td:eq(3)').text());
	$("#time").val($(this).closest("tr").find('td:eq(4)').text());
	$("#description").val($(this).closest("tr").find('td:eq(5)').text());
	
	
});

//DELETE==========================================================
$(document).on("click", ".btnRemove", function(event)
{
	//AJAX for delete
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

//CLIENT-MODEL============================================
function validationNotificationForm()
{
	//ID
	if($("#id").val().trim() == "")
	{
		return "Insert Notification id.";
	}
	
	//hospitalid
	if($("#hospitalid").val().trim() == "")
	{
		return "Insert Hospital id.";
	}
	
	//patientid
	if($("#patientid").val().trim() == "")
	{
		return "Insert Patient id.";
	}
	
	//date
	if($("#date").val().trim() == "")
	{
		return "Insert date.";
	}
	
	//time
	if($("#time").val().trim() == "")
	{
		return "Insert time.";
	}
	
	//description
	if($("#description").val().trim() == "")
	{
		return "Insert description.";
	}
	
	//Status
	if($("#status").val().trim() == "")
	{
		return "Insert status.";
	}
	
	
	return true;
}