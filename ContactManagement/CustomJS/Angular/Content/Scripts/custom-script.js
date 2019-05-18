window.onload = function (){
	if(!is_empty(document.getElementById('timer')))
	{
		setInterval(startTime,1000);
	}
} 
function startTime()
{
	var d = new Date();
	var ds = d.toDateString();//Tue Dec 18 2012
	var ts = d.toTimeString();//20:02:26 GMT+0600 (Central Asia Standard Time)
	var ls = d.toLocaleString();//Tuesday, December 18, 2012 8:00:33 PM
	var lds = d.toLocaleDateString();//Tuesday, December 18, 2012
	var lts = d.toLocaleTimeString();//as 7:55:54 PM
	document.getElementById('timer').innerHTML ="&nbsp;&nbsp;&nbsp;"+lts+"<br/>"+ds;
}
function is_empty(input) {
    if (typeof input === 'undefined' || input === null) return true;
    return input.toString().trim().length < 1;
}
/* Don't Remove
var collapseClass=".collapse.in";
var faresize = getCookie('fa-resize');
if (faresize!='') {resizer(faresize,true);}
else {document.cookie = 'fa-resize=show';}

function resizer(val,isonload)
{
	switch(val)
	{
		case"hide":
			if(isonload)
			{   //alert(collapseClass);
				if(collapseClass==".collapse.in"){$(".collapse.in").collapse("hide");}
				$(".collapse").on('show.bs.collapse', function(){
					resizer('show',false);
				}).on('hide.bs.collapse', function(){
					resizer('hide',false);
				});
			}				
			$("#container-main").removeClass("container").addClass("container-fluid");	
			$("#fa-resize").removeClass("fa-expand").addClass("fa-compress");					
			$("#contain-main").removeClass("col-sm-9 col-md-10");	
			document.cookie = 'fa-resize=hide';
		break;
		case"show":
			if(isonload)
			{
				if(collapseClass==".collapse"){$(".collapse").collapse("show");}
				$(".collapse.in").on('show.bs.collapse', function(){
					resizer('show',false);
				}).on('hide.bs.collapse', function(){
					resizer('hide',false);
				});
			}	
			$("#container-main").removeClass("container-fluid").addClass("container");
			$("#fa-resize").removeClass("fa-compress").addClass("fa-expand");
			$("#contain-main").addClass("col-sm-9 col-md-10");	
			document.cookie = 'fa-resize=show';	
		break;
	}
}
*/
$("#resizer").click(function(){ 
	if($(this).hasClass('fa-expand')){ 
		$(this).removeClass('fa-expand').addClass('fa-compress');
		$("#container-main").removeClass("container").addClass("container-fluid");
		document.cookie = 'resizer=fa-compress;';
	}
	else{
		$(this).removeClass('fa-compress').addClass('fa-expand');
		$("#container-main").removeClass("container-fluid").addClass("container");
		document.cookie = 'resizer=fa-expand;';
	}
	return false;			
});
$("#sidebar-chevron").click(function(){
	if($(this).hasClass('fa-chevron-right')){
		$(this).removeClass('fa-chevron-right').addClass('fa-chevron-left');					
		$("#contain-main").removeClass("col-sm-9 col-md-10");	
		$("#sidebar").toggle();
		document.cookie = 'chevron=fa-chevron-left;';		
	}
	else{
		$(this).removeClass('fa-chevron-left').addClass('fa-chevron-right');
		$("#contain-main").addClass("col-sm-9 col-md-10");	
		$("#sidebar").toggle();
		document.cookie = 'chevron=fa-chevron-right;';		
	}
	return false;			
});
var resizer = getCookie('resizer');var resizerClass="fa-expand";
var chevron = getCookie('chevron');var chevronClass="fa-chevron-right";
if (resizer!='' && resizer!=resizerClass) { $("#resizer").click();}//alert(resizer);
if (chevron!='' && chevron!=chevronClass) { $("#sidebar-chevron").click();}//alert(chevron);
/**/
$("#header-state").click(function(){
	var id=$("#timer").css('display')=="block"?"#nav-level-02":"#nav-level-04";
	var tid=id=="#nav-level-02"?"#nav-level-02":"#nav-level-03";
	if($(this).hasClass('up')){ 
		$(this).removeClass('up').addClass('down');
		$("body").css({"padding-top":"27px"});
		$("#header").css({"padding-bottom":"27px"});
		$("#header-banner,#header-navbar,"+tid).toggle();
		myFunction(true,id);
		document.cookie = 'headerstate=down;';
	}
	else{
		$(this).removeClass('down').addClass('up');
		$("body").css({"padding-top":"136px"});
		$("#header").css({"padding-bottom":"48px"});
		$("#header-banner,#header-navbar,"+tid).toggle();
		myFunction(false,id);
		document.cookie = 'headerstate=up;';
	}
	return false;			
});
function myFunction(up,id) {
	if(up)
	{   //alert(id);
		$(id+' li:not(:first):not(:last)').remove();
		$("#nav-level-11").children().each(function(i,obj){
			$(id).append(obj.cloneNode(true));
		});
		//var itm = document.getElementById("nav-level-0").lastChild;
		//var cln = itm.cloneNode(true);
		//document.getElementById("myList1").appendChild(cln);
	}else{$(id+' li:not(:first):not(:last)').remove();};//$("#nav-level-0").empty()
}
var headerstate = getCookie('headerstate');var stateClass="up";
if (headerstate!='' && headerstate!=stateClass) { $("#header-state").click();}//alert(resizer);

function setCookie(cookieName, cookieValue, expires, path, domain, secure) {
	document.cookie =
		escape(cookieName) + '=' + escape(cookieValue)
		+ (expires ? '; expires=' + expires.toGMTString() : '')
		+ (path ? '; path=' + path : '')
		+ (domain ? '; domain=' + domain : '')
		+ (secure ? '; secure' : '');
};
function getCookie(cookieName) 
{
	var cookieValue = '';//alert(document.cookie);
	var posName = document.cookie.indexOf(escape(cookieName) + '=');//alert(posName);
	if (posName != -1) {
		var posValue = posName + (escape(cookieName) + '=').length;
		var endPos = document.cookie.indexOf(';', posValue);
		if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));
		else cookieValue = unescape(document.cookie.substring(posValue));
	}
	return (cookieValue);
};
if(document.getElementById('glocation')!=null)	
{
	$('#gcancel').on('click', function(){ $(this).parent().parent().remove();});
		$('#gsave').on('click', function(){ //alert($("#glocation").attr('action'));
		$.post($("#glocation").attr('action'),{location_id:$("#get-select").val()},
			function (data) {
				$('#gcancel').click();
				//location.reload();
		});
	});
}