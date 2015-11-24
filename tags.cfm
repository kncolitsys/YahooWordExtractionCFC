<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Word Extraction</title>
</head>

<body>

<cfif structKeyExists(form,"context")>
	<!---  APP ID - this can be obtained from http://api.search.yahoo.com/webservices/register_application --->
	<cfset request.AppID = "YOUR APPID" />
	<cfset request.termExtractionObj = createObject("component","termExtraction") />
	
	<cfset request.tags_list = request.termExtractionObj.termExtration(request.AppID,form.context) />
	<cfdump var="#request.tags_list#" label="Key Words" />
</cfif>
<cfparam name="form.context" 	default="The BBC has signed an agreement with Microsoft to explore ways of developing its digital services. 
The non-exclusive memorandum of understanding sets out a framework for joint projects between the two organisations. 
This includes plans for next-generation web 2.0 and ways to share online content in the future. 
BBC director general Mark Thompson said there had been unprecedented rates of change in technology. 
He said: 'To ensure that the BBC is able to embrace the creative challenges of the digital future, we need to forge strategic partnerships with technology companies and distributors for the benefit of licence payers.'">

<form name="tags" action="tags.cfm" method="post" >
	<fieldset>
     <div>
        <label for="context">context:</label><br>
        <textarea name="context" rows="10" cols="50" ><cfoutput>#form.context#</cfoutput></textarea>
    </div>
    <div>
        <input type="submit">
    </div>
</fieldset>
</form>

</body>
</html>
