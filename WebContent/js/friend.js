function Searchingin(){
	document.searchvalues.action = "infriendssearch.do";
	document.searchvalues.submit();
}

function Searchingone(){
	document.searchvalues.action = "outfriendssearch.do";
	document.searchvalues.submit();
}

function Subinform(val){
	alert(val+" : " + val["m_id"]);
	document.getElementById("testone").innerHTML=val["m_id"];
}


/*
function befriends(val) {
	alert("친구맺기1"+val);
	
	$(val).attr({"target":"_self", "action":"befriends.do"}).submit();
	
	//document.val.
	//location.href="befriends.do";
}
*/
/*$("#_btnAdd").click(function() {
//	alert("글쓰기");
	$("#_frmForm").attr({"target":"_self", "action":"bbswrite.do"}).submit();
});
*/
/* window.onload=function(){
	var t = "${choosekeyword.m_name}";
	//alert(t);
	
	document.getElementById("words").innerHTML='${choosekeyword.m_name}';
}
function dd(val){
	var t = val;
	
	if('${num}'=="2"){
		alert("${num}");
		document.getElementById("testone").innerHTML=val;
		//document.getElementById("test"+'${fsschfS.count }').innerHTML='${num}';
	}
} */
