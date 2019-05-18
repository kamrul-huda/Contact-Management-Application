function Activate(switch_on,url,eid){
	var obj = document.getElementById("ko_"+switch_on);
	switch(switch_on)
	{
		case"productedit":
			var productViewModel = function(uses) {
				var self=this;
				this.uses = ko.observableArray(uses);
				this.addUse = function() {
					this.uses.push({ id:0, value:""});
				};
				self.removeUse = function(use) {
					if(self.uses().length>1){
						if(use.id==0)
						{
							self.uses.remove(use);
						}else
							if(confirm("Confirm permanently delete?"))
							{	
								$.post(url+'/application/remove_junction/'+eid,{id:use.id}, function(data){
									if(data==1)
									{
										self.uses.remove(use);
									}
								});
							}
						}
					};			
			};
			//var uses=[{ id:0, value:""}];
			$.get(url+'/application/product_use/'+eid, function(uses){
				//console.log(uses);
				//uses=[{ id:0, value:""}];
				ko.cleanNode($(obj)[0]);
				ko.applyBindings(new productViewModel(uses),obj);
				$('.eselect-post').multiselect({
					//includeSelectAllOption: true,
					maxHeight: 200,
					inheritClass:true,
					enableFiltering: true,
					 onChange: function(option, checked, select) {
						 if(!checked && $(option).attr('db')!==undefined)
						 {	
							var parent=$(option).parent();						
							if(confirm("Confirm permanently delete?"))
							{	
								$.post(url+'/application/remove_junction/'+eid,{id:$(option).attr('db')}, function(data){
									if(data!=1)
									{
										$(parent).multiselect('select', option.val());
									}
								});
							}else $(parent).multiselect('select', option.val());
								
						 }
					 }
				});
			});
		break;
		case"product":	//c=company p=person
			
			var productViewModel = function(items,uses) {
				var self=this;
				/*this.items = ko.observableArray(items);
				
				this.addItem = function() {
					this.items.push({ name: "New item", sales: 0, price: 100 });
				};
				this.sortByName = function() {
					this.items.sort(function(a, b) {
						return a.name < b.name ? -1 : 1;
					});
				};
			
				this.jumpToFirstPage = function() {
					this.gridViewModel.currentPageIndex(0);
				};
			 
				this.gridViewModel = new ko.simpleGrid.viewModel({
					data: this.items,
					columns: [
						{ headerText: "Item Name", rowText: "name" },
						{ headerText: "Sales Count", rowText: "sales" },
						{ headerText: "Price", rowText: function (item) { return "$" + item.price.toFixed(2) } }
					],
					pageSize: 4
				});*/
				//product uses	
				this.uses = ko.observableArray(uses);
				this.addUse = function() {
					this.uses.push({ id:0, value:""});
				};
				self.removeUse = function(use) {
					if(self.uses().length>1){
						self.uses.remove(use);
						}
					};			
			};
			var products = [/*
				{ name: "Well-Travelled Kitten", sales: 352, price: 75.95 },
				{ name: "Speedy Coyote", sales: 89, price: 190.00 },
				{ name: "Furious Lizard", sales: 152, price: 25.00 },
				{ name: "Indifferent Monkey", sales: 1, price: 99.95 },
				{ name: "Brooding Dragon", sales: 0, price: 6350 },
				{ name: "Ingenious Tadpole", sales: 39450, price: 0.35 },
				{ name: "Optimistic Snail", sales: 420, price: 1.50 }*/
			]; 			
			var uses=[{ id:0, value:""}];
			$('#filter').hide();var product='',country='',company='';
			$.get(url+'/application/table', function(data){
				ko.cleanNode($(obj)[0]);
				ko.applyBindings(new productViewModel(products,uses),obj);
				//$('.ko-grid').addClass('table table-bordered');

				$('.select-post').multiselect({
					//includeSelectAllOption: true,
					maxHeight: 200,
					inheritClass:true,
					enableFiltering: true,
					//enableCaseInsensitiveFiltering: false,
					 onChange: function(option, checked, select) {
						var parent=$(option).parent();
						/**/						
						switch(parent.attr('label'))
						{
							case"Product":	
							case"Country":
							case"Company":							
								var values = [];
								if($(parent).val()!=null)
								{
									$.each($(parent).val(),function(i,v){
										if (v !== option.val()) 
										{									
											values.push(v);
										}
									});	
								}
								$(parent).multiselect('deselect', values);
							break;
							
						}
						
						switch(parent.attr('label'))
						{
							case"Product":	
								if($(parent).val()!==null)
								{
									product=$(parent).val().join();
								}else product='';
							break;
							case"Country":
								if($(parent).val()!==null)
								{
									country=$(parent).val().join();
								}else country='';
							break;
							case"Company":
								if($(parent).val()!==null)
								{
									company=$(parent).val().join();
								}else company='';
							break;
							default:
								//alert($(select).attr('label') + $(option).val());
								//if(checked){product.push($(option).val());}
								//else {
								//	product.pop($(option).val());
								//}															 
								//alert(product.length);								
								//console.log(product);
								break;
						}
						//console.log(product);
						//console.log(country);
						//console.log(company);
					},
					optionLabel: function(element) {
						return $(element).html() + '(' + $(element).val() + ')';
					},
					buttonText: function(options, select) {
						var str = $(select).attr('label');
						if (options.length === 0) {			
							return str!==undefined?str:'No option selected ...';
						}else return str!==undefined?str+"("+ options.length+")":options.length+" option selected.";						 
					}		
				});	
				$('#filter').show();
				$('#search-result').html('No item found, <b>Click on search..</b>');
				$('#search-button').click(function(){
					$('#search-result').html('Loaging...').load(url+'/application/search_product/'+eid,
					{productid:product,countryid:country,companyid:company},
					function(data){
						//alert(data); 
						$('.addProduct').click(function(e){
							e.preventDefault();
							$('#myTabs a[href="#productAdd"]').tab('show');
							//alert(self.uses);
						});
					});
				});				
			});
		break;
		case"company":
		case"companyedit":	//c=company p=person
			var contactModel = function(ccontacts,pcontacts) {
				var self = this;
				self.ccontacts = ko.observableArray(ccontacts);
				self.pcontacts = ko.observableArray(pcontacts);
			 
				self.addCContact = function() {
					self.ccontacts.push({id:0,key: "",value: ""});
				};
				self.addPContact = function() {
					self.pcontacts.push({id:0,key: "",value: ""});
				};
				self.removeCContact = function(contact) 
				{
					if(self.ccontacts().length>1){
						if(contact.id==0)
						{
							self.ccontacts.remove(contact);
						}else
							if(confirm("Confirm permanently delete?"))
							{	/**/
								$.post(url+'/application/remove_bcontact/'+eid,{id:contact.id}, function(data){
									if(data==1)
									{
										self.ccontacts.remove(contact);
									}
								});
								//alert(contact.id);
							}
					}
				};
				self.removePContact = function(contact)
				{
					if(self.pcontacts().length>1){
						if(contact.id==0)
						{
							self.pcontacts.remove(contact);
						}else
							if(confirm("Confirm permanently delete?"))
							{	/**/
								$.post(url+'/application/remove_pcontact/'+eid,{id:contact.id}, function(data){
									if(data==1)
									{
										self.pcontacts.remove(contact);
									}
								});
								//alert(contact.id);
							}
					}
				};
			};
			ko.cleanNode($(obj)[0]);
			if(eid==0||eid==undefined)
			{
				var viewModel = new contactModel([{id:0,key: "",value: ""}],[{id:0,key: "",value: ""}]);
				ko.applyBindings(viewModel,obj);
			}
			else
			{
				$.get(url+'/application/contacts/'+eid, function(data){	
					ko.applyBindings(new contactModel(data.bcontact,data.pcontact),obj);
				});				
			}
			//alert(eid);//
			// Activate jQuery Validation;
			$('.addCompany').click(function(e){
				e.preventDefault();
				$('#myTabs a[href="#companyAdd"]').tab('show');
				//alert(self.uses);
			});
			//$("form").validate({ submitHandler: viewModel.save })
		break;/***************************************************************************/
	}
}

