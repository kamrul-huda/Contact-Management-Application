/*--------------------------------------------------|

| generic 3.01 | www.destroydrop.com/javascript/tree/ |
|---------------------------------------------------	|
| Copyright (c) 2015 Deshicoder               		|
|                                                   |
| This script can be used freely as long as all     |
| copyright messages are intact.                    |
|                                                   |
| Updated: 28.06.2006 by Abdus Sobhan           
|                    |
|--------------------------------------------------*/



// Node object

function Node(id, pid, name, url, title, target, icon, iconOpen, open, imageUrl, selfUrl, sid, spouseName, spouseImageUrl, spouseUrl, data) {

	this.id = id;

	this.pid = pid;

	this.name = name;

	this.url = url;

	this.title = title;

	this.target = target;

	this.icon = icon; 

	this.iconOpen = iconOpen;

	this.imageUrl = imageUrl;

	this.selfUrl = selfUrl;

	this.spouseImageUrl=spouseImageUrl;

	this.spouseUrl=spouseUrl;
	this.spouseName=spouseName;
	this.sid=sid;

	this._io = open || false;

	this._is = false; // if this node is selected or not

	this._ls = false; // is this node is the last sibling

	this._hc = false; // if this node have children or not

	this._ai = 0;

	this._p;            // the parent node of this node
	
	this._children = 0; // Number of children this nodes have
	
	this._isLeft =  false; // Is this node is a very left child
	
	this._isRight = false; // Is this node is a very right child
	
	this._isOnly = false;  // Is this node is the only child for its parent
	
	this._nodeIndex = 0; // the index of this node in the childs array of its parent
	this.data = data; // the index of this node in the childs array of its parent
};



// Tree object

function generic(objName, url) {
	this.config = {

		target			: null,

		folderLinks		: true,

		useSelection	: true,

		useCookies		: true,

		useLines		: true,

		useIcons		: true,

		useStatusText	: false,

		closeSameLevel	: false,

		inOrder			: false

	}

	this.icon = {

	    root: 'circle',

	    folder: 'circle',

	    folderOpen: 'circle',

	    node: 'circle',

	    empty: 'circle',

	    img: url+'Images/tree/m.gif',

		line			: url+'Images/tree/line.gif',

		join			: url+'Images/tree/join.gif',

		joinBottom		: url+'Images/tree/joinbottom.gif',

		plus			: url+'Images/tree/plus.gif',

		plusBottom		: url+'Images/tree/plusbottom.gif',

		minus			: url+'Images/tree/minus.gif',

		minusBottom		: url+'Images/tree/minusbottom.gif',

		nlPlus			: url+'Images/tree/nolines_plus.gif',

		nlMinus			: url+'Images/tree/nolines_minus.gif',
		
		middleLine		: url+'Images/tree/line.gif',
		
		leftLine		: url+'Images/tree/line.gif',
		
		smallLine		: url+'Images/tree/smallLine.gif',
		
		rightLine		: url+'Images/tree/line.gif'

	};

	this.obj = objName;

	this.aNodes = [];

	this.aIndent = [];

	this.root = new Node(-1);

	this.selectedNode = null;

	this.selectedFound = false;

	this.completed = false;

};



// Adds a new node to the node array

generic.prototype.add = function(id, pid, name, imageUrl, selfUrl, sid, spouseName, spouseImageUrl, spouseUrl, data) {
	
	var node= new Node(id, pid, name, null, null, null, null, null, null, imageUrl, selfUrl, sid, spouseName, spouseImageUrl, spouseUrl,data);
	this.aNodes[this.aNodes.length] = node;
	//console.log(node);
};


// Open/close all nodes

generic.prototype.openAll = function() {

	this.oAll(true);

};

generic.prototype.closeAll = function() {

	this.oAll(false);

};



// Outputs the tree to the page

generic.prototype.toString = function() {

	var str = '<div class="generic">\n';

	if (document.getElementById) {

		if (this.config.useCookies) this.selectedNode = this.getSelected();

		str += this.addNode(this.root);

	} else str += 'Browser not supported.';

	str += '</div>';

	if (!this.selectedFound) this.selectedNode = null;

	this.completed = true;

	return str;

};



// Creates the tree structure

generic.prototype.addNode = function(pNode) 
{
	var str = '';
	str += '<table border=0 cellpadding=0 cellspacing=0  align="center">';
	str += '	<tr>';
	var n=0;

	if (this.config.inOrder) n = pNode._ai;
	//alert("NODES LENGTH: "+this.aNodes.length+" N="+n+" NAME: "+pNode.name);
	var childsIndex =0;
	for (n; n<this.aNodes.length; n++) 
	{

		if (this.aNodes[n].pid == pNode.id) 
		{
			var cn = this.aNodes[n];
			cn._p = pNode;
			
			cn._ai = n;
			
			this.setCS(cn); // Checks if a node has any children and if it is the last sibling
			cn._childIndex = childsIndex++;
			
			if(cn._p._children <= 1)
				cn._isOnly;
			else
			{
				if(cn._childIndex == 0)
					cn._isLeft=true;
				if(cn._childIndex == cn._p._children-1)
					cn._isRight=true;
			}
						
			if (!cn.target && this.config.target) cn.target = this.config.target;
			if (cn._hc && !cn._io && this.config.useCookies) cn._io = this.isOpen(cn.id);
			if (!this.config.folderLinks && cn._hc) cn.url = null;
			if (this.config.useSelection && cn.id == this.selectedNode && !this.selectedFound) {
					cn._is = true;
					this.selectedNode = n;
					this.selectedFound = true;
			}
			
			str += '	<td valign=top align=center ';
			str += '>';
			
			str += this.node(cn, n);
			str += '	</td>';
			
			//alert("Node '"+cn.name+"' is: ONLY:"+cn._isOnly+" - Left: "+cn._isLeft+" - Right: "+cn._isRight+" PARENT: "+cn._p._children);
			
			if (cn._ls) break;
		}
		
	}
	
	str += '	</tr>';
	str += '</table>';

	return str;

};



// Creates the node icon, url and text

generic.prototype.node = function (node, nodeId) {

    if (node._p._children <= 1)
        node._isOnly = true;
    //alert("Node '"+node.name+"' is: ONLY:"+node._isOnly+" - Left: "+node._isLeft+" - Right: "+node._isRight+" PARENT: "+node._p._children);
    //alert("NODE NAME: "+node.name+" HAS CHILDREN: "+node._hc+" INDENT: "+this.indent(node, nodeId));
    var str = '<div class="dTreeNode" style="white-space:nowrap;padding: 1px;">';

    str += '<table border="0" cellpadding="0" cellspacing="0" width="100%" >';
    str += '<tr>';
    str += '	<td align="center" width="52%" '

    //alert("Node: "+node.name+" Left TD Decesion -- Node '"+node.name+"' is: ONLY:"+node._isOnly+" - Left: "+node._isLeft+" - Right: "+node._isRight);

    if (this.root.id != node.pid) {
        if (this.config.useLines) {
            if (node._isOnly) {
                str += '';
            }
            else if (node._isLeft) {
                str += '';
            }
            else if (node._isRight) {
                str += ' style="border-top-width:1px;border-top-style:dotted;border-top-color:Gray;" ';
            }
            else {
                str += ' style="border-top-width:1px;border-top-style:dotted;border-top-color:Gray;" ';
            }
        }
    }
    str += ' >&nbsp; ';
    str += '	</td>';
    str += '	<td valign="top" style="padding-top:0px;" align="center" width="1%" ';
    str += ' >';

    if (this.root.id != node.pid) /// if this node isn't a first lever node
    {
        str += '<img src="';
        if (this.config.useLines) {
            if (node._isOnly)
                str += this.icon.line
            else if (node._isLeft)
                str += this.icon.leftLine;
            else if (node._isRight)
                str += this.icon.rightLine;
            else
                str += this.icon.middleLine;
        }
        else {
            str += this.icon.empty
        }
        str += '" alt="" />';
    }


    str += '	</td>';
    str += '	<td align="center" width="52%" ';

    if (this.root.id != node.pid) {
        if (this.config.useLines) {
            if (node._isOnly)
                str += ' ';
            else if (node._isLeft)
                str += ' style="border-top-width:1px;border-top-style:dotted;border-top-color:Gray;" ';
            else if (node._isRight)
                str += '';
            else
                str += ' style="border-top-width:1px;border-top-style:dotted;border-top-color:Gray;" ';
        }
    }

    str += ' >&nbsp; ';
    str += '	</td>';
    str += '</tr>';

    //alert("NODE: "+node.name+" is: "+str);

    str += '<tr>';
    str += '	<td align="center" colspan="3">';

    str += '<table border=0 bordercolor=blue cellpadding="0" cellspacing="0">';
    //str += '<tr><td valign=top align=center>' + this.indent(node, nodeId);
    //str += "</td></tr>";
    str += '<tr><td valign=top align=center>';// + this.indent(node, nodeId)


    if (this.config.useIcons) {

        if (!node.icon) node.icon = (this.root.id == node.pid) ? this.icon.root : ((node._hc) ? this.icon.folder : this.icon.node);

        if (!node.iconOpen) node.iconOpen = (node._hc) ? this.icon.folderOpen : this.icon.node;

        if (this.root.id == node.pid) {

            node.icon = this.icon.root;

            node.iconOpen = this.icon.root;

        }
        var img= node.imageUrl; //node.imageUrl?node.imageUrl:this.icon.img;
        var spouse= node.spouseImageUrl; //node.spouseImageUrl?node.spouseImageUrl:this.icon.img;
        var selfUrl=node.selfUrl?node.selfUrl:"#";
        var spouseUrl=node.spouseUrl?node.spouseUrl:"#";// btn btn-xs btn-info
        var cursor=node.spouseUrl!="#"?" cursor: pointer; ": "";
		var splits=node.data.split('&');
		/*--*/
		str += '<div style="width: 206px; padding-left: 32px;">'
		+'<div align="left" has-s="'+((cursor!="")?1:0)+'" data-url="'+selfUrl+'" title="'+node.name+'" id="i' + this.obj + nodeId + '"style=" cursor: pointer; background: url(' + img + ') no-repeat scroll center; background-size: 70px 70px; float: left; " class="ctx person_node ' + ((node._io) ? node.iconOpen : node.icon) + '">'
		+'<div class="manage_person update"  data-url="'+selfUrl+'">Update</div><div id='+(node.id)+'-'+(node.sid)+' class="manage_person copy">Copy</div><div class="none">'+splits[0]+'</div></div>'	

		+'<div align="left" has-s="'+((cursor!="")?1:0)+'" data-url="'+spouseUrl+'" title="'+node.spouseName+'"  id="i-' + this.obj + (nodeId-1) + '"style=" '+cursor+' background: url('+spouse+') no-repeat scroll center; background-size: 70px 70px; float: left;" class="ctx person_node ' + ((node._io) ? node.iconOpen : node.icon) + 's">'
		+((cursor!="")?'<div class="manage_person update" data-url="'+spouseUrl+'">Update</div><div id='+(node.sid)+'-'+(node.id)+' class="manage_person copy">Copy</div>':'')+'<div class="none">'+splits[1]+'</div></div>'
		+this.indent(node, nodeId)+'</div>';
	  
      //str += '<div style="width: 100px;float: left;"><div align=left id="i' + this.obj + nodeId + '"style="background: url(' + this.icon.img + ') no-repeat scroll center;" class="' + ((node._io) ? node.iconOpen : node.icon) + '">' + this.indent(node, nodeId) + '</div></div>';
	  //str += '<div style="width: 100px;float:left"><div align=left id="i' + this.obj + (nodeId-1) + '"style="background: url(img/m1.gif) no-repeat scroll center;" class="' + ((node._io) ? node.iconOpen : node.icon) + '">' + this.indent(node, nodeId) + '</div></div>';
      //str += '<img id="i' + this.obj + nodeId + '" src="' + ((node._io) ? node.iconOpen : node.icon) + '" alt="" />';

    }
    str += "</td></tr><tr><td valign=top align=center style='white-space:nowrap;padding: 1px;'>";
    if (node.url) {
        str += '<a id="s' + this.obj + nodeId + '" class="' + ((this.config.useSelection) ? ((node._is ? 'nodeSel' : 'node')) : 'node') + '" href="' + node.url + '"';

        if (node.title) str += ' title="' + node.title + '"';

        if (node.target) str += ' target="' + node.target + '"';

        if (this.config.useStatusText) str += ' onmouseover="window.status=\'' + node.name + '\';return true;" onmouseout="window.status=\'\';return true;" ';

        if (this.config.useSelection && ((node._hc && this.config.folderLinks) || !node._hc))

            str += ' onclick="javascript: ' + this.obj + '.s(' + nodeId + ');"';

        str += '>';

    }

    else if ((!this.config.folderLinks || !node.url) && node._hc && node.pid != this.root.id)

        str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');" class="node">';


    str +=node.name+((cursor!="")?' ['+node.spouseName.trim()+']':"[?]");
    if (node.url || ((!this.config.folderLinks || !node.url) && node._hc)) str += '</a>';
    str += '</div>';

    str += '</td></tr></table>';
    str += '</td></tr></table>';

    if (node._hc) {

        str += '<div id="d' + this.obj + nodeId + '" class="clip" style="display:' + ((node._io) ? 'block' : 'none') + ';">';

        str += '<table border=0 cellpadding=0 cellspacing=0>';
        str += '<tr><td height="9" align="center"><img src="' + this.icon.smallLine + '" alt="" border=0></td></tr>';
        str += '<tr><td>';

        str += this.addNode(node);

        str += '</td></tr></table>';
        str += '</div>';

    }

    this.aIndent.pop();

    return str;

};



// Adds the empty and line icons

generic.prototype.indent = function(node, nodeId) {

	var str = '';
		
	(node._ls) ? this.aIndent.push(0) : this.aIndent.push(1);

	if (node._hc) 
	{
		str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');"><img id="j' + this.obj + nodeId + '" src="';

		str += (node._io) ? this.icon.nlMinus : this.icon.nlPlus;

		str += '" alt="" /></a>';
	}
	
	return str;
};



// Checks if a node has any children and if it is the last sibling

generic.prototype.setCS = function(node) {

	var lastId;
	
	var children =0;

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.id)
		{
		 node._hc = true;
		 children ++;
		}

		if (this.aNodes[n].pid == node.pid) lastId = this.aNodes[n].id;

	}
	node._children = children;
	if (lastId==node.id) node._ls = true;

};



// Returns the selected node

generic.prototype.getSelected = function() {

	var sn = this.getCookie('cs' + this.obj);

	return (sn) ? sn : null;

};



// Highlights the selected node

generic.prototype.s = function(id) {

	if (!this.config.useSelection) return;

	var cn = this.aNodes[id];

	if (cn._hc && !this.config.folderLinks) return;

	if (this.selectedNode != id) {

		if (this.selectedNode || this.selectedNode==0) {

			eOld = document.getElementById("s" + this.obj + this.selectedNode);

			eOld.className = "node";

		}

		eNew = document.getElementById("s" + this.obj + id);

		eNew.className = "nodeSel";

		this.selectedNode = id;

		if (this.config.useCookies) this.setCookie('cs' + this.obj, cn.id);

	}

};



// Toggle Open or close

generic.prototype.o = function(id) {
	
	if(this.aNodes.length===1) return; 
	var cn = this.aNodes[id];

	this.nodeStatus(!cn._io, id, cn._ls);

	cn._io = !cn._io;

	if (this.config.closeSameLevel) this.closeLevel(cn);

	if (this.config.useCookies) this.updateCookie();
};



// Open or close all nodes

generic.prototype.oAll = function(status) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n]._hc && this.aNodes[n].pid != this.root.id) {

			this.nodeStatus(status, n, this.aNodes[n]._ls)

			this.aNodes[n]._io = status;

		}

	}

	if (this.config.useCookies) this.updateCookie();

};



// Opens the tree to a specific node

generic.prototype.openTo = function(nId, bSelect, bFirst) {

	if (!bFirst) {

		for (var n=0; n<this.aNodes.length; n++) {

			if (this.aNodes[n].id == nId) {

				nId=n;

				break;

			}

		}

	}

	var cn=this.aNodes[nId];

	if (cn.pid==this.root.id || !cn._p) return;

	cn._io = true;

	cn._is = bSelect;

	if (this.completed && cn._hc) this.nodeStatus(true, cn._ai, cn._ls);

	if (this.completed && bSelect) this.s(cn._ai);

	else if (bSelect) this._sn=cn._ai;

	this.openTo(cn._p._ai, false, true);

};



// Closes all nodes on the same level as certain node

generic.prototype.closeLevel = function(node) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.pid && this.aNodes[n].id != node.id && this.aNodes[n]._hc) {

			this.nodeStatus(false, n, this.aNodes[n]._ls);

			this.aNodes[n]._io = false;

			this.closeAllChildren(this.aNodes[n]);

		}

	}

}



// Closes all children of a node

generic.prototype.closeAllChildren = function(node) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.id && this.aNodes[n]._hc) {

			if (this.aNodes[n]._io) this.nodeStatus(false, n, this.aNodes[n]._ls);

			this.aNodes[n]._io = false;

			this.closeAllChildren(this.aNodes[n]);		

		}

	}

}



// Change the status of a node(open or closed)

generic.prototype.nodeStatus = function(status, id, bottom) {

	eDiv	= document.getElementById('d' + this.obj + id);

	eJoin	= document.getElementById('j' + this.obj + id);

	if (this.config.useIcons) {

		eIcon	= document.getElementById('i' + this.obj + id);

		eIcon.src = (status) ? this.aNodes[id].iconOpen : this.aNodes[id].icon;

	}

	eJoin.src = ((status)?this.icon.nlMinus:this.icon.nlPlus);

	eDiv.style.display = (status) ? 'block': 'none';

};





// [Cookie] Clears a cookie

generic.prototype.clearCookie = function() {

	var now = new Date();

	var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);

	this.setCookie('co'+this.obj, 'cookieValue', yesterday);

	this.setCookie('cs'+this.obj, 'cookieValue', yesterday);

};



// [Cookie] Sets value in a cookie

generic.prototype.setCookie = function(cookieName, cookieValue, expires, path, domain, secure) {

	document.cookie =

		escape(cookieName) + '=' + escape(cookieValue)

		+ (expires ? '; expires=' + expires.toGMTString() : '')

		+ (path ? '; path=' + path : '')

		+ (domain ? '; domain=' + domain : '')

		+ (secure ? '; secure' : '');

};



// [Cookie] Gets a value from a cookie

generic.prototype.getCookie = function(cookieName) {

	var cookieValue = '';

	var posName = document.cookie.indexOf(escape(cookieName) + '=');

	if (posName != -1) {

		var posValue = posName + (escape(cookieName) + '=').length;

		var endPos = document.cookie.indexOf(';', posValue);

		if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));

		else cookieValue = unescape(document.cookie.substring(posValue));

	}

	return (cookieValue);

};



// [Cookie] Returns ids of open nodes as a string

generic.prototype.updateCookie = function() {

	var str = '';

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n]._io && this.aNodes[n].pid != this.root.id) {

			if (str) str += '.';

			str += this.aNodes[n].id;

		}

	}

	this.setCookie('co' + this.obj, str);

};



// [Cookie] Checks if a node id is in a cookie

generic.prototype.isOpen = function(id) {

	var aOpen = this.getCookie('co' + this.obj).split('.');

	for (var n=0; n<aOpen.length; n++)

		if (aOpen[n] == id) return true;

	return false;

};



// If Push and pop is not implemented by the browser

if (!Array.prototype.push) {

	Array.prototype.push = function array_push() {

		for(var i=0;i<arguments.length;i++)

			this[this.length]=arguments[i];

		return this.length;

	}

};

if (!Array.prototype.pop) {

	Array.prototype.pop = function array_pop() {

		lastElement = this[this.length-1];

		this.length = Math.max(this.length-1,0);

		return lastElement;

	}

};