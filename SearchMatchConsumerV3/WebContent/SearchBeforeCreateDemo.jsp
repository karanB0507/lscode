x<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
  <%
   /*  try
    {
	    Class.forName("oracle.jdbc.driver.OracleDriver");  
	    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@sa-dorabo01.zsservices.local:1521:oradev","Cmx_C360","Cmx_c360");  
	    Statement stmt=con.createStatement();
	    ResultSet rs=stmt.executeQuery("select MATCH_SET_NAME from C_REPOS_MATCH_SET where ROWID_TABLE='SVR1.3I9K' and search_match_set_ind=1"); */
    
    %>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Search Before Create Demo</title> <!-- to change the name of the heading -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <!-- Compiled and minified JavaScript -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
		<style>
			h1 { 
				color: #fafafa; 
				font-family: 'Trocchi', serif; 
				font-size: 34px; font-weight: normal; 
				line-height: 48px; margin: 0;
				padding: 20px; 
			}
			h2 { 
				color: #7c795d; 
				font-family: 'Source Sans Pro', sans-serif; 
				font-size: 20px; 
				font-weight: 400; 
				line-height: 32px;
				margin:0px;
				padding-top: 10px;
				padding-bottom:10px; 
			}
			h3 { 
				color: #7c795d; 
				font-family: 'Source Sans Pro', sans-serif; 
				font-size: 15px; 
				font-weight: 400; 
				line-height: 32px;
				margin:0px;
				padding-top: 10px;
				padding-bottom:10px; 
			}
			h5 { 
				color: red; 
				font-family: 'Source Sans Pro', sans-serif; 
				font-size: 12px;  
				line-height: 22px;
				margin:0px;
				padding-top: 0px;
				padding-bottom:0px; 
			}
		</style>
	</head>
	<body class=" indigo darken-4">
		<h1>Healthcare Person : Search And Create</h1> <!-- to change the name of the heading -->
		<div class="row" style="
	    	margin-left: 20px;
		">
			<div class="col s5" style="
	   			 width: 622.5px;
			">
				<div class="container z-depth-3" style="margin-left:10px;background-color:white;margin-right: 0px;width: 500px;">
					<div class="row" style="margin-left:10px;margin-right:10px;">	
						<h5>*  : Required field to create record</h5>
						<h5>** : Required field to add address while creating record</h5>
						<div class="input-field col s4">
					    	<input id="first_name" style="text-transform:capitalize" type="text" onkeypress="return AvoidSpace(event)">
					        <label for="first_name">First Name*</label>
		        		</div>
						<div class="input-field col s4">
		          			<input id="middle_name" type="text" style="text-transform:capitalize" class="validate" onkeypress="return AvoidSpace(event)">
		          			<label for="middle_name">Middle Name</label>
		       			</div>
						<div class="input-field col s4">
		          			<input id="last_name" type="text" style="text-transform:capitalize" class="validate" onkeypress="return AvoidSpace(event)">
		          			<label for="last_name">Last Name*</label>
		       			</div>
	       			</div>
	    			<div class="row" style="margin-left:10px;margin-right:10px;">
				    	<div class="input-field col s6">
			          		<input id="NPI" type="number" class="validate">
			          		<label for="NPI">NPI</label>
			        	</div>
						<div class="input-field col s6">
			          		<input id="spcltyCd" type="text" style="text-transform:uppercase" class="validate" onkeypress="return AvoidSpace(event)">
				          	<label for="spcltyCd">Primary Speciality</label>
				        </div>
			      	</div>
				  	<div class="row" style="margin-left:10px;margin-right:10px;">
			        	<div class="input-field col s6">
			          		<input id="addrLn1" type="text" style="text-transform:capitalize" class="validate">
			          		<label for="addrLn1">Address Line 1**</label>
			        	</div>
				        <div class="input-field col s6">
				          	<input id="addrLn2" type="text" style="text-transform:capitalize" class="validate">
			          		<label for="addrLn2">Address Line 2</label>
				        </div>
	      			</div>
		  			<div class="row" style="margin-left:10px;margin-right:10px;">
	        			<div class="input-field col s3">
	          				<input id="city" type="text" style="text-transform:capitalize" class="validate">
	       					<label for="city" class="">City</label>
	  					</div>
	        			<div class="input-field col s3">
	          				<input id="stateCd" type="text" style="text-transform:uppercase" class="validate" onkeypress="return AvoidSpace(event)">
	          				<label for="stateCd" class="">State Code</label>
	        			</div>
	     				<div class="input-field col s3">
	          				<input id="cntryCd" style="text-transform:uppercase" type="text" class="validate" onkeypress="return AvoidSpace(event)">
	          				<label for="cntryCd" class="">Country Code**</label>
	        			</div>
	        			<div class="input-field col s3">
	          				<input id="pstlCd" type="text" style="text-transform:uppercase" class="validate" onkeypress="return AvoidSpace(event)">
	          				<label for="pstlCd" class="">Postal Code</label>
	        			</div>
	      			</div>
	      			<%-- <div class="row" style="margin-left:10px;margin-right:10px;">
	        			<div class="input-field col s8">
	          				<select id="matchRuleSet" required="required">
							      <option value="" disabled selected>Choose your option</option>
							      <%while(rs.next()){
							    		  String option=rs.getString(1); // to be removed
							       %>
							      <option value="<%=option%>"><%=option %></option>
							      <%
							      } 
							      	stmt.close();
							      	con.close();
							      	}catch(Exception e){
							      		e.printStackTrace();
							      	}
							      %>
							      <label>Match Rule Set</label>
						    </select>
	  					</div>
  					</div> --%>
  					<div class="row" style="margin-left:10px;margin-right:10px;">
	  					<div class="input-field col s12">
	          				<div class="input-field col s6">
						      <label>
						        <input type="checkbox" id="isResponseTimeEnabled" class="filled-in"  />
						        <span>Show Response Time</span>
						      </label>
						    </div>
						    <div class="input-field col s6">
						      <label>
						        <input type="checkbox" id="isShowJSONEnabled"  class="filled-in"  />
						        <span>Show JSON Body</span>
						      </label>
						    </div>
	  					</div>
  					</div>
					<div class="row" style="margin-left:10px;margin-right:10px;padding-left:10px;padding-bottom:10px;">
						<div class="input-field col s4">
				        	<button class="btn waves-effect waves-light light-blue darken-4" onclick="query()" name="query">Query
								<i class="material-icons right">send</i>
							</button>
	      				</div>
	      				<div class="input-field col s4">
		      				<button class="btn waves-effect waves-light green darken-4" onclick="addRecord()" name="add">Add
								<i class="material-icons right">add</i>
							</button>
	      				</div>
	      				<div class="input-field col s4">
		      				<button class="btn waves-effect waves-light red darken-4" onclick="clearInput()" name="clear">Clear
								<i class="material-icons right">clear</i>
							</button>
	      				</div>
	    			</div>
	    			
				</div>
			</div>
			<div class="col s7 c" id="divLoader" style="display:none;">
				<div class="preloader-wrapper big active center-align" style="
	    width: 200px;
	    height: 200px;
	    padding-left: 0px;
	    padding-right: 0px;
	    margin-top: 100px;
	    margin-left: 250px;
				">
		      		<div class="spinner-layer spinner-blue">
				        <div class="circle-clipper left">
				          <div class="circle"></div>
				        </div><div class="gap-patch">
				          <div class="circle"></div>
				        </div><div class="circle-clipper right">
				          <div class="circle"></div>
		        		</div>
			      	</div>
			      	<div class="spinner-layer spinner-red">
				        <div class="circle-clipper left">
				          <div class="circle"></div>
				        </div><div class="gap-patch">
				          <div class="circle"></div>
				        </div><div class="circle-clipper right">
				          <div class="circle"></div>
				        </div>
			      	</div>
			      	<div class="spinner-layer spinner-yellow">
				        <div class="circle-clipper left">
				          <div class="circle"></div>
				        </div><div class="gap-patch">
				          <div class="circle"></div>
				        </div><div class="circle-clipper right">
				          <div class="circle"></div>
				        </div>
			      	</div>
			
			      	<div class="spinner-layer spinner-green">
				        <div class="circle-clipper left">
				          <div class="circle"></div>
				        </div><div class="gap-patch">
				          <div class="circle"></div>
				        </div><div class="circle-clipper right">
				          <div class="circle"></div>
				        </div>
			      	</div>
		    	</div>
			</div>
			<div class="col s7 z-depth-3" id="displayContainer" style="
	    		margin-top: 20px;
	    		padding-left:0px;
	    		padding-right:0px;
	    		display:none;
			">
				<div class="collection" id="searchResult" style="
					border-left-width: 0px;
					border-top-width: 0px;border-bottom-width: 0px;
					border-right-width: 0px;margin-bottom: 0px;margin-top: 0px;
					padding:0px;
	    			display:none;
				">
				</div>
			</div>
		</div>
		<script>

		$(document).ready(function(){
		    $('select').formSelect();
		  });
		var frstNm="";
		var mdlNm="";
		var lstNm="";
		var addrLn1="";
		var addrLn2="";
		var city="";
		var stateCd="";
		var cntryCd="";
		var pstlCd="";
		var npi="";
		var spcltyCd="";
		//var matchRuleSet="";
		var sendRequest=false;
		function query(){
			var body="{";
				
			        fetchData();
			        if(checkData(frstNm)){
						body+='"frstNm":"'+frstNm+'",';
						sendRequest=true;
					}
			        if(checkData(mdlNm)){
						body+='"mdlNm":"'+mdlNm+'",';
						sendRequest=true;
					}
					if(checkData(lstNm)){
						body+='"lstNm":"'+lstNm+'",';
						sendRequest=true;
					}
					if(checkData(npi)){
						body+='"CustomerPersonIdentifiers.altIdTyp":"NPI",';
						body+='"CustomerPersonIdentifiers.altIdVal":"'+npi+'",';
						sendRequest=true;
					}
					if(checkData(spcltyCd)){
						body+='"CustomerPersonSpecialization.spcltyTyp":"PRIMARY",';
						body+='"CustomerPersonSpecialization.spcltyCd":"'+spcltyCd+'",';
						sendRequest=true;
					}
					if(checkData(addrLn1)){
						body+='"CustomerPersonPostalAddr.PostalAddress.addrLn1":"'+addrLn1+'",';
						sendRequest=true;
					}
					if(checkData(addrLn2)){
						body+='"CustomerPersonPostalAddr.PostalAddress.addrLn2":"'+addrLn2+'",';
						sendRequest=true;
					}
					if(checkData(city)){
						body+='"CustomerPersonPostalAddr.PostalAddress.city":"'+city+'",';
						sendRequest=true;
					}
					if(checkData(stateCd)){
						body+='"CustomerPersonPostalAddr.PostalAddress.state":"'+stateCd+'",';
						sendRequest=true;
					}
					if(checkData(cntryCd)){
						body+='"CustomerPersonPostalAddr.PostalAddress.cntryCd":"'+cntryCd+'",';
						sendRequest=true;
					}
					if(checkData(pstlCd)){
						body+='"CustomerPersonPostalAddr.PostalAddress.pstlCd":"'+pstlCd+'",';
						sendRequest=true;
					}
					
			        body+="}";
					console.log(body);
					if(sendRequest)
					{
						document.getElementById("divLoader").setAttribute("style","display:block");
						callServer(body);
			    	}
					frstNm="";
					mdlNm="";
					lstNm="";
					addrLn1="";
					addrLn2="";
					city="";
					stateCd="";
					cntryCd="";
					pstlCd="";
					npi="";
					spcltyCd="";
					//matchRuleSet="";
					sendRequest=false;
					
		}
		function AvoidSpace(event) {
		    var k = event ? event.which : window.event.keyCode;
		    if (k == 32) return false;
		}
	 	function addRecord(){
	 		var body="{";
			
	        fetchData();
	        if(checkData(mdlNm)){
	        	body+='"mdlNm":"'+mdlNm+'"';
	        	sendRequest=true;
	        }
	        if(checkData(frstNm) && checkData(lstNm)){
				body+='"frstNm":"'+frstNm+'",';
				body+='"lstNm":"'+lstNm+'"';
				sendRequest=true;
			}else{
				alert("First Name Or Last Name is Empty");
				return false;
			}
	        
			if(checkData(npi)){
				body+=',"CustomerPersonIdentifiers":{'
		    	+'	item:['
		      	+'		{'
		      	+'			"altIdTyp":{"idTyp":"NPI"},'
		      	+'			"altIdVal":"'+npi+'"'
		      	+'		}'
		      	+'	]'
		      	+'}';
				sendRequest=true;
			}
			if(checkData(spcltyCd)){
				body+=',"CustomerPersonSpecialization":{'
			    	+'	item:['
			      	+'		{'
			      	+'			"spcltyTyp":{'
			      	+'				"spcltyTyp":"PRIMARY"'
					+'			},'
			      	+'			"spcltyCd":{'
			      	+'				"spcltyCd":"'+spcltyCd+'"'
			      	+'			}'
			      	+'		}'
			      	+'	]'
			      	+'}';
				sendRequest=true;
				
			}
			if(checkData(addrLn1) && checkData(cntryCd)){
				body+=',"CustomerPersonPrimaryAddress":{'
			    	+'	item:['
			      	+'		{'
			      	+'	      	addrTyp:{'
			      	+'				"addrTyp":"BUSINESS"'
			      	+'			},'
			      	+'			"PostalAddress":{'
			      	+'				"addrLn1":"'+addrLn1+'",'
			      	+'				"addrLn2":"'+addrLn2+'",'
			      	+'				"city":"'+city+'",'
			      	+'				"state":{'
			      	+'					"stateCd":"'+stateCd+'"},'
			      	+'				"cntryCd":{"cntryCd":"'+cntryCd+'"},'
			      	+'				"pstlCd":"'+pstlCd+'"'
			      	+'			}'
			      	+'		}'
			      	+'	]'
			      	+'}';
				sendRequest=true;
			}else if(!checkData(addrLn1) || !checkData(cntryCd)){
				if(checkData(city)||checkData(stateCd)||checkData(addrLn2)||checkData(pstlCd)){
					alert("Address will not be saved as Address Line 1 or Country Code is empty");
				}
			}
			body+="}";
			console.log(body);
			if(sendRequest){
				document.getElementById("displayContainer").setAttribute("style","display:none");
				document.getElementById("divLoader").setAttribute("style","display:block");
				callAdd(body);	
	    	}
			frstNm="";
			lstNm="";
			addrLn1="";
			addrLn2="";
			city="";
			stateCd="";
			cntryCd="";
			pstlCd="";
			npi="";
			spcltyCd="";
			//matchRuleSet="";
			sendRequest=false;
			
	 	}
	 	function callAdd(requestBody){
	 		var divSearchResult=document.getElementById("searchResult");
			divSearchResult.innerHTML="";
			var sendDate = (new Date()).getTime();
			$.ajax({
			    type: 'POST',
			    url: "AddOperation",
			    data:requestBody,
				success:function(data){
					var isResponseApi= document.getElementById("isResponseTimeEnabled");
					var bValue = false;
					bValue=isResponseApi.checked;
					if(bValue){
						var receiveDate = (new Date()).getTime();
						var responseTimeMs = receiveDate - sendDate;
				        var divSearchResult=document.getElementById("searchResult");
				        divSearchResult.innerHTML+='<a style="color:#000000;" class="collection-item text-black">API Response Time : '+responseTimeMs+'ms</a>';
				        document.getElementById("displayContainer").setAttribute("style","display:block;padding-left:0px;"
					    		+"padding-right:0px;");
						
						divSearchResult.setAttribute("style","border-left-width: 0px;"
								+"border-top-width: 0px;border-bottom-width: 0px;"
								+"border-right-width: 0px;margin-bottom: 0px;margin-top: 0px;"
								+"padding:0px;display:block;");
					}
					
					var isShowJSON= document.getElementById("isShowJSONEnabled");
					var bValue2 = false;
					bValue2=isShowJSON.checked;
					if(bValue2){
						alert(data);
					}
					var divSearchResult=document.getElementById("searchResult");
					console.log(data)
			        displayCreatedRecord(data);
				}	
			});
			return true;
	 	}
	 	function displayCreatedRecord(data){
	 		var result=JSON.parse(data);
	 		var divSearchResult=document.getElementById("searchResult");
	 		if(result.errorCode!=null){
	 			
	 			document.getElementById("divLoader").setAttribute("style","display:none");
		 		document.getElementById("displayContainer").setAttribute("style","display:block;padding-left:0px;"
						    		+"padding-right:0px;");
							
				divSearchResult.setAttribute("style","border-left-width: 0px;"
						+"border-top-width: 0px;border-bottom-width: 0px;"
						+"border-right-width: 0px;margin-bottom: 0px;margin-top: 0px;"
						+"padding:0px;display:block;");
		 		divSearchResult.innerHTML+='<a style="color:red;" class="collection-item text-black">Error : API failed to create new record, response returned with an error.</a>';
		 		divSearchResult.innerHTML+='<a style="color:red;" class="collection-item text-black">Error Message : '+result.errorMessage+' </a>';
	 			return true;
	 			
	 		}
	 		var key=result.CustomerPerson.key.rowid;
	 		var sourceKey=result.CustomerPerson.key.sourceKey;
	 		
	 		console.log(key)
	 		document.getElementById("divLoader").setAttribute("style","display:none");
	 		document.getElementById("displayContainer").setAttribute("style","display:block;padding-left:0px;"
					    		+"padding-right:0px;");
						
			divSearchResult.setAttribute("style","border-left-width: 0px;"
					+"border-top-width: 0px;border-bottom-width: 0px;"
					+"border-right-width: 0px;margin-bottom: 0px;margin-top: 0px;"
					+"padding:0px;display:block;");
	 		divSearchResult.innerHTML+='<a class="collection-item text-black">New Record with MDM ID : '+key+' and Source Key : '+sourceKey+' is created Successfully</a>';
			
	 	}
		function clearInput(){
			console.log("pressed clear");
			document.getElementById("first_name").value="";
			document.getElementById("middle_name").value="";
			document.getElementById("last_name").value="";
			document.getElementById("addrLn1").value="";
			document.getElementById("addrLn2").value="";
			document.getElementById("city").value="";
			document.getElementById("stateCd").value="";
			document.getElementById("cntryCd").value="";
			document.getElementById("pstlCd").value="";
			document.getElementById("NPI").value="";
			document.getElementById("spcltyCd").value="";
			//document.getElementById("matchRuleSet").value="";
		}
		function callServer(requestBody)
		{
			var divSearchResult=document.getElementById("searchResult");
			divSearchResult.innerHTML="";
			var sendDate = (new Date()).getTime();
			$.ajax({
			    type: 'POST',
			    url: "RequestController",
			    data:{
			    	//"parameter":value(variable)
			    	"frstNm": frstNm,
			    	"mdlNm":mdlNm,
			    	"lstNm": lstNm
			    	//"matchRuleSetName": matchRuleSet //hard code the match rule set name here from the hub.
			    },
				success:function(data){
					var isResponseApi= document.getElementById("isResponseTimeEnabled");
					var bValue = false;
					bValue=isResponseApi.checked;
					if(bValue){
						var receiveDate = (new Date()).getTime();
						var responseTimeMs = receiveDate - sendDate;
				        var divSearchResult=document.getElementById("searchResult");
				        divSearchResult.innerHTML+='<a style="color:#000000;" class="collection-item text-black">API Response Time : '+responseTimeMs+'ms</a>';
				        document.getElementById("displayContainer").setAttribute("style","display:block;padding-left:0px;"
					    		+"padding-right:0px;");
						
						divSearchResult.setAttribute("style","border-left-width: 0px;"
								+"border-top-width: 0px;border-bottom-width: 0px;"
								+"border-right-width: 0px;margin-bottom: 0px;margin-top: 0px;"
								+"padding:0px;display:block;");
					}
					
					var isShowJSON= document.getElementById("isShowJSONEnabled");
					var bValue2 = false;
					bValue2=isShowJSON.checked;
					if(bValue2){
						alert(data);
					}
					
			        displayResult(data);
					
				}	
			});
			return true;
		}
		function displayResult(data){
			console.log(data+' records returned');
			var jsonArray=JSON.parse(data);
			jsonArray=jsonArray.matchedEntity;
			console.log(jsonArray.length);
			var divSearchResult=document.getElementById("searchResult");
			var check=jsonArray.businessEntity;
			if(jsonArray.length>0){
				document.getElementById("displayContainer").setAttribute("style","display:block;padding-left:0px;"
			    		+"padding-right:0px;");
				
				divSearchResult.setAttribute("style","border-left-width: 0px;"
						+"border-top-width: 0px;border-bottom-width: 0px;"
						+"border-right-width: 0px;margin-bottom: 0px;margin-top: 0px;"
						+"padding:0px;display:block;");
				for(var i=0;i<jsonArray.length;i++){
					debugger;
					console.log(jsonArray[i]);
					setDisplayVariables(jsonArray[i]);
					setTable(jsonArray[i]);
				}	
			}
			else{
				document.getElementById("displayContainer").setAttribute("style","display:block;");
				document.getElementById("displayContainer").setAttribute("class","col s7");
				divSearchResult.setAttribute("style","border-left-width: 0px;"
				+"border-top-width: 0px;border-bottom-width: 0px;"
				+"border-right-width: 0px;margin-bottom: 0px;margin-top: 0px;"
				+"padding:0px;display:block;");
				divSearchResult.innerHTML='<h4 style="color:red;">No result Found</>';
			}
			document.getElementById("divLoader").setAttribute("style","display:none");
			return true;
			
		}
		function setDisplayVariables(mainData){
			var addrtyp=null;
			var row=mainData.businessEntity.CustomerPerson;
			try 
			{
			var addr=mainData.businessEntity.CustomerPerson.CustomerPersonPostalAddr.item;
			}
			catch(err){
			return;	
			}
			
			//console.log("addr : "+addr)
			for(var i=0;i<addr.length;i++){
				if(addr.dfltInd=="Y"){
					try{
						addrtyp=addr[i].addrTyp.addrTypDesc;
					}catch(err){
						addrtyp="";
					}
					break;
				}
				else{
					try{
						addrtyp=addr[i].addrTyp.addrTypDesc;
					}catch(err){
						addrtyp="";
					}
				}
			}
			debugger;
			var divSearchResult=document.getElementById("searchResult");
			// started editing from here
			try {
				var rowRowidObject=row.rowidObject;
			}
			catch(err){
				rowRowidObject=""
			}
			
			divSearchResult.innerHTML+='<a data-target="modal1'+row.rowidObject+'" id="'+row.rowidObject+'" class="collection-item modal-trigger" '
			+ 'onclick="openModel('+row.rowidObject+')">'
			+ ''+row.fullNm+' Address : Address Type '+addrtyp+'<span class="badge">'+mainData.matchScore+'</span><span class="badge"> Match Score:</span><span class="badge">'+row.rowidObject+'</span><span class="badge">MDM ID:</span></a>'
			+ '<div id="modal1'+row.rowidObject+'" class="modal">'
				+'<div class="modal-content" id="table_'+row.rowidObject+'">'
					+'<h3>MDM ID: '+row.rowidObject+' <br>First Name: '+row.frstNm+' <br> Last Name: '+row.lstNm+'</h3>'
					+'</div><div class="modal-footer">'
			+ '<a href="#!" class="modal-close waves-effect waves-light btn-small deep-orange darken-4"><i class="material-icons right">close</i>Close</a></div></div>';
			return true;
		}
		function setTable(mainData)//creation of table structure
		{
			var row=mainData.businessEntity.CustomerPerson;//defining the row value only
			console.log("row : "+row)
			var innerDivModal=document.getElementById("table_"+row.rowidObject);
			var rowidObject=row.rowidObject;
			rowidObject=rowidObject.trim();
			console.log(row.CustomerPersonIdentifiers);
			var data=null;
			var type=null;
			data=row.CustomerPersonPostalAddr;
			type="CustomerPersonPostalAddr";
			if (typeof(data) != "undefined"){
				innerDivModal.innerHTML+='<h2>Address Information</h2><table id="CustomerPersonPostalAddr_'+rowidObject+'" class="highlight" width="100%">'
		        +' <tr>'
		        +'    <th>Address Type</th>'
		        +'    <th>Address Line 1</th>'
		        +'    <th>City</th>'
		        +'    <th>State</th>'
		        +'    <th>Country</th>'
		        +'    <th>Zip</th>'    
		        +'  </tr>'
				+'</table>'
				createTable(data,rowidObject,type);
			}data=null;
			innerDivModal=document.getElementById("table_"+row.rowidObject);
			data=row.CustomerPersonIdentifiers;
			type="CustomerPersonIdentifiers"
			if (typeof(data) != "undefined"){
				innerDivModal.innerHTML+='<h2>Alternate Identifier</h2><table  id="CustomerPersonIdentifiers_'+rowidObject+'" class="highlight" width="100%">'
				+' <tr>'
		        +'    <th>Alternate ID Type</th>'
		        +'     <th>Alternate ID Value</th>'
		        +'  </tr>'
		        +'</table>';
				createTable(data,rowidObject,type);
			}
			innerDivModal=document.getElementById("table_"+row.rowidObject);
			data=null;
			data=row.CustomerPersonDEA;
			console.log("DEA DATA: "+data)
			type="CustomerPersonDEA";
			if (typeof(data) != "undefined"){
				innerDivModal.innerHTML+='<h2>DEA Information</h2><table  id="CustomerPersonDEA_'+rowidObject+'" class="highlight" width="100%">'
				+' <tr>'
		        +'    <th>DEA Number</th>'
		        +'  </tr>'
		        +'</table>'
				createTable(data,rowidObject,type);
			}
			data=null;
			innerDivModal=document.getElementById("table_"+row.rowidObject);
			data=row.CustomerPersonSLN;
			type="CustomerPersonSLN";
			if (typeof(data) != "undefined"){
				innerDivModal.innerHTML+='<h2>SLN Information</h2><table id="CustomerPersonSLN_'+rowidObject+'" class="highlight" width="100%">'
				+'<tr>'
		        +'    <th>State Of License</th>'
		        +'    <th>License Number</th>'
		        +'</tr>'
		        +'</table>';
				createTable(data,rowidObject,type);
			}data=null;
			innerDivModal=document.getElementById("table_"+row.rowidObject);
			data=row.CustomerPersonSpecialization;
			type="CustomerPersonSpecialization";
			if (typeof(data) != "undefined"){
				innerDivModal.innerHTML+='<h2>Speciality</h2><table id="CustomerPersonSpecialization_'+rowidObject+'" class="highlight" width="100%">'
				+' <tr>'
		        +'    <th>Speciality Type</th>'
		        +'    <th>Speciality Value</th>'
		        +'  </tr>'
				+'</table>';
				createTable(data,rowidObject,type);// why is this used here ?
			}
			return true;
		}
		function createTable(data,id,type)//function used for  putting values in the created structure
		{
			var	str	=type+"_"+id;
			var i=0;
			var value="";//new
			data=data.item;// item from JSON
			if(type=='CustomerPersonIdentifiers'){
			for(i=0;i<data.length;i++){

			var table=document.getElementById(str);
			var row=table.insertRow(i+1);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			try{
			value=data[i].altIdTyp.idTypDesc;	//put try catch like this to all the BE where cell1/cell2/cell3 is used this is added
			}
			catch(err){
			value="";
			}
			if(typeof(value)=="undefined")
			{value="";}
			cell1.innerHTML=value;
			value="";// again re-initialize it with null for using it in cell2 as it has been used once in cell1 
			try{
			value=data[i].altIdVal;	
			}catch(err){
			value="";
			}
			cell2.innerHTML=value;
			value="";
			
			}
			}
			if(type=='CustomerPersonSpecialization'){
				for(i=0;i<data.length;i++){
					var table=document.getElementById(str);
					var row=table.insertRow(i+1);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					try{// added this try catch on 24th sept
						cell1.innerHTML=data[i].spcltyTyp.spcltyTypDesc;
					}
					catch(err){
							cell1.innerHTML=""
					}
					try{// added this try catch on 25th sept
					cell2.innerHTML=data[i].spcltyCd.spcltyCdDesc;
					}
					catch(err){
					cell2.innerHTML="";	
					}
				}
			}
			if(type=='CustomerPersonDEA'){
				for(i=0;i<data.length;i++){
					console.log(data);
					var table=document.getElementById(str);
					var row=table.insertRow(i+1);
					var cell1 = row.insertCell(0);
					try{// added this try catch on 24th sept
					cell1.innerHTML=data[i].deaNum;
					}
					catch(err){
					cell1.innerHTML="";
					}
				}
			}
			if(type=='CustomerPersonSLN'){
				for(i=0;i<data.length;i++){
					var table=document.getElementById(str);
					var row=table.insertRow(i+1);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					try{
					cell1.innerHTML=data[i].state.stateDesc;
					}
					catch(err){
					cell1.innerHTML="";
					}
					try{
					cell2.innerHTML=data[i].slnNum;
					}
					catch(err){
					cell2.innerHTML="";
					}
				}
			}
			if(type=='CustomerPersonPostalAddr'){
				for(i=0;i<data.length;i++){
					var table=document.getElementById(str);
					var row=table.insertRow(i+1);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					var cell5 = row.insertCell(4);
					var cell6 = row.insertCell(5);//adding try catch here on 24th sept
					try{
					try{cell1.innerHTML=data[i].addrTyp.addrTypDesc;}
					catch(errr){cell1.innerHTML="";}
					cell2.innerHTML=data[i].PostalAddress.addrLn1;
					cell3.innerHTML=data[i].PostalAddress.city;
					cell4.innerHTML=data[i].PostalAddress.state.stateDesc;
					cell5.innerHTML=data[i].PostalAddress.cntryCd.cntryCd;
					cell6.innerHTML=data[i].PostalAddress.pstlCd;
					}
					catch(err){
					cell2.innerHTML="";
					cell3.innerHTML="";
					cell4.innerHTML="";
					cell5.innerHTML="";
					cell6.innerHTML="";
					}
				}
			}
			
			return true;
		}
		function fetchData(){
			frstNm=document.getElementById("first_name").value;
			lstNm=document.getElementById("last_name").value;
			mdlNm=document.getElementById("middle_name").value;
			addrLn1=document.getElementById("addrLn1").value;
			addrLn2=document.getElementById("addrLn2").value;
			city=document.getElementById("city").value;
			stateCd=document.getElementById("stateCd").value.toUpperCase();
			cntryCd=document.getElementById("cntryCd").value.toUpperCase();
			pstlCd=document.getElementById("pstlCd").value.toUpperCase();
			npi=document.getElementById("NPI").value;
			spcltyCd=document.getElementById("spcltyCd").value.toUpperCase();
			/* var matchRuleSetId=document.getElementById("matchRuleSet");// to be removed
			matchRuleSet=matchRuleSetId.options[matchRuleSetId.selectedIndex].value;// to be removed */
			if(checkData(frstNm)){
				frstNm=capital_letter(frstNm);
			}
			if(checkData(mdlNm)){
				mdlNm=capital_letter(mdlNm);
			}
			if(checkData(lstNm)){
				lstNm=capital_letter(lstNm);
			}
			if(checkData(mdlNm)){
				lstNm=capital_letter(lstNm);
			}
			if(checkData(city)){
				city=capital_letter(city);
			}
			if(checkData(addrLn1)){
				addrLn1=capital_letter(addrLn1);			
			}
			if(checkData(addrLn2)){
				addrLn2=capital_letter(addrLn2);
			}
			return true;
		}
		function capital_letter(inputString) 
		{	
			var str="";
			str =inputString;
			str = str.split(" ");
			newStr="";
			for (var i = 0, x = str.length; i < x; i++) {
				str[i] = str[i][0].toUpperCase() + str[i].substr(1);
				if(i==str.length-1){
					newStr += str[i];	
				}
				else{
					newStr += str[i]+" ";
				}
			}
			console.log(newStr);
			return newStr;
		}
		function checkData(string){
			if(string==""){
				return false;
			}
			return true;
		}
		function openModel(id){
	
			$('.modal').modal();
		 }
		     
		</script>
			
	</body>
</html>