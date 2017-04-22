var req;
	function loadXML(idCL) 
	{	
		var url='/Product/Type/?loai='+idCL;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
			req.onreadystatechange = function()
				  {
					  if (req.readyState==4 && req.status==200)
						{
							document.getElementById("shop").innerHTML=req.responseText;
						}
				  }
			req.open('GET', url, true);
			req.send(null);
		// branch for IE/Windows ActiveX version
		} else if (window.ActiveXObject) {
			req = new ActiveXObject('Microsoft.XMLHTTP');
			if (req) {
				req.onreadystatechange = function()
				  {
					  if (req.readyState==4 && req.status==200)
						{
							document.getElementById("shop").innerHTML=req.responseText;
						};
				  }
				req.open('GET', url, true);
				req.send();
			}
		}
	}
