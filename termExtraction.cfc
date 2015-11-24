<cfcomponent output = "false">
<!--- appid - this can be obtained from http://api.search.yahoo.com/webservices/register_application --->
	<cffunction name="termExtration" access="public" returntype="any" output="no">
		<cfargument name="appID" type="string" required="yes">
		<cfargument name="context" type="string" required="yes" hint="the text to extract words from">
		
		<cfset var local = structNew() />
		
		<cfset local.reqURL = "http://api.search.yahoo.com/ContentAnalysisService/V1/termExtraction">
<!---  make the request - we need to post the variables to make this work --->
		<cfhttp url="#local.reqURL#" method="post" charset="utf-8">
			<cfhttpparam type="formfield" name="appid" value="#arguments.appID#">
			<cfhttpparam type="formfield" name="context" value="#arguments.context#">
		</cfhttp>
<!---  put the returned words into a query --->
		<cfset local.xmlResult 	= xmlParse(cfhttp.fileContent)>
		
		<cfif structKeyExists(local.xmlResult, "Error")>
		   <cfset local.keyworks.error = local.xmlResult.error.message.xmlText>
		<cfelse>
		   <!--- get words --->
		   <cfset local.keyWords = queryNew("keyword")>
		   
		   <cfif structKeyExists(local.xmlResult.resultSet, "result")>	  
			  <cfloop index="x" from="1" to="#arrayLen(local.xmlResult.resultSet.result)#">
				 <cfset queryAddRow(local.keyWords,1) />
				 <cfset querySetCell(local.keyWords,"keyword",local.xmlResult.resultSet.result[x].xmltext) />
			  </cfloop>
		   </cfif>		   
		</cfif>
		
	<cfreturn local.keyWords>
	</cffunction>
</cfcomponent>