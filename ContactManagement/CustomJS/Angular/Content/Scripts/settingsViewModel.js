function Activate(switch_on){
	var obj = document.getElementById("output");
	switch(switch_on)
	{
		case"listApp":		
		function rowMap(id,name,type,note) {
			var self = this;
			self.id = id;
			self.name = ko.observable(name);
			self.note = ko.observable(note);
			self.check = ko.observable(true);
			self.types = ko.observableArray([
				{id:1,name:"Text"},
				{id:2,name:"Dropdown"},
				{id:3,name:"Yes/No"}
			]);
			self.selected = ko.observable(type);
			self.check.subscribe(function(newValue) {
				//alert(newValue);
			/* Do something when ShowOpened changes.
			   newValue variable holds the new value, obviously. :) */
			   //self.check(newValue);
			});
		}
		function tableViewModel() {
			var self = this;	
			self.title = ko.observable();
			self.note = ko.observable();
			self.row = new rowMap(0,'','','');
			self.cols = ['#','Name','Type', 'Note', 'Action'];
			
			$.get('application/table', function(data){
				//self.tables(data);
				//alert(data);
			});
			// Editable data
			self.rows = ko.observableArray(/*[
				new tableMap("id","row","note"),
			]*/);
			
			// Operations
			self.addRow = function() {
				var match = ko.utils.arrayFirst(self.rows(), function(item) {
					return item.name()==self.row.name();
				});//
				if(!is_empty(self.row.name()) && (!match) && (!is_empty(self.row.selected()))){
					self.rows.push(new rowMap(0,self.row.name(),self.row.selected(),self.row.note()));
					self.row.name('');self.row.selected('');self.row.note('');
				}
			}
			self.removeRow = function(row) { self.rows.remove(row) };
			//self.checkRow = function(row) { /*self.row.check(row.check());*/ };
			self.saveRows = function() { alert(self.rows().length+" "+ko.utils.stringifyJson(self.rows()))};
		}
		ko.cleanNode($(obj)[0]);
		ko.applyBindings(new tableViewModel(),obj);
		break;/***************************************************************************/
		case"app":/*
			var myNode = document.getElementById("foo");
			while (myNode.firstChild) {
				myNode.removeChild(myNode.firstChild);
			}*/
		function listAppViewModel() {
			var self = this;		
			self.table = ko.observableArray();
			self.cols = ko.observableArray();
			self.rows = ko.observableArray();
			//self.row = new rowMap(0,'','','');
			//= ['#','Name','Type', 'Note', 'Action'];
			$.get('table',null,function(data){	
				self.table(data);
				var tid=data[0].id;
				$.get('column',{tid:tid},function(data){	
					self.cols(data);
				});
			});
			//$.get('table',null,function(data){	
			//	self.table(data);		
				
			//});
			// Editable data
			
			// Operations
			self.addRow = function() {
				var match = ko.utils.arrayFirst(self.rows(), function(item) {
					return item.name()==self.row.name();
				});//
				//if(!is_empty(self.row.name()) && (!match) && (!is_empty(self.row.selected()))){
				//	self.rows.push(new rowMap(0,self.row.name(),self.row.selected(),self.row.note()));
				//	self.row.name('');self.row.selected('');self.row.note('');
				//}
			}
			self.removeRow = function(row) { self.rows.remove(row) };
			//self.checkRow = function(row) { /*self.row.check(row.check());*/ };
			self.saveRows = function() { alert(self.rows().length+" "+ko.utils.stringifyJson(self.rows()))};
		}
		/*	var GiftModel = function(gifts) {
			    var self = this;
			    self.gifts = ko.observableArray(gifts);
			    self.addGift = function() {
			        self.gifts.push({
			            name: "",
			            price: ""
			        });
			    };
			 
				$.get('table', function(data){		
					alert(data);
				});
			    self.removeGift = function(gift) {
			        self.gifts.remove(gift);
			    };
			 
			    self.save = function(form) {
			        alert("Could now transmit to server: " + ko.utils.stringifyJson(self.gifts));
			        // To actually transmit to server as a regular form post, write this: ko.utils.postJson($("form")[0], self.gifts);
			    };
			};
			 
			var viewModel = new GiftModel([
			    { name: "Tall Hat", price: "39.95"},
			    { name: "Long Cloak", price: "120.00"}
			]);*/
			ko.cleanNode($(obj)[0]);
			ko.applyBindings(new listAppViewModel(),obj);
			// Activate jQuery Validation
			//$("form").validate({ submitHandler: viewModel.save });
		break;
	}
}

