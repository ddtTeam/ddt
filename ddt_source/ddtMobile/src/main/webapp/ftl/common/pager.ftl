<#function supply url="">
	<#if url?contains("?")>
		<#return url + '&'/>
	<#else>
		<#return url + '?'/>
	</#if>
</#function>
<#function getRange total index>
	<#if total&lt;10>
		<#if total&lt;3><#return []/><#else><#return [2,total-1]/></#if>
	</#if>
	<#local start=index-3/>
	<#local end=index+3/>
	<#if start&lt;2>
		<#local end=end+2-start/>
		<#local start=2/>
	</#if>
	<#if end&gt;total-1>
		<#local start=start-(end-(total-1))/>
		<#local end=total-1/>
	</#if>
	<#return [start, end]/>
</#function>
<#macro lpager total index=1 url="">
  <#if total??&&total&gt;1>
  <div class="pagination-center">
    <ul class="pagination">
  	<#if index==1>
	  	<li class="disabled"><a href="#">&laquo;</a></li>
        <li class="active"><a href="#">1</a></li>
  	<#else>
  	    <li><a href="${supply(url)}page=${index-1}">&laquo;</a></li>
        <li><a href="${supply(url)}page=1">1</a></li>
  	</#if>
  	<#local range=getRange(total,index)/>
  	<#if range?size&gt;0>
	  	<#local start=range[0]/>
	  	<#local end = range[1]/>
	  	<#if start&gt;2><li class="disabled"><a href="#">...</a></li></#if>
	  	<#list start..end as x>
	  		<#if index==x>
	  			<li class="active"><a href="#">${x}</a></li>
	  		<#else>
	  		    <li><a href="${supply(url)}page=${x}">${x}</a></li>
	  		</#if>
	  	</#list>
	  	<#if end&lt;total-1><li class="disabled"><a href="#">...</a></li></#if>
	</#if>
	<#if index==total>
	  	<li class="active"><a href="#">${total}</a></li>
        <li class="disabled"><a href="#">&raquo;</a></li>
  	<#else>
  		<li><a href="${supply(url)}page=${total}">${total}</a></li>
        <li><a href="${supply(url)}page=${index+1}">&raquo;</a></li>
  	</#if>
  	</ul>
  </div>
  </#if>
</#macro>