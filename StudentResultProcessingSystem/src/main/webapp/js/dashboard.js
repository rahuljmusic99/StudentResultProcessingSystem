
            function setupTabs() {
                document.querySelectorAll(".tabs__button").forEach(button => {
                    
                    button.addEventListener("click", () => {
                        
                       const sideBar = button.parentElement;
                       const tabsContainer = sideBar.parentElement;
                       const tabNumber = button.dataset.forTab;
                       const tabToActivate =tabsContainer.querySelector(`.tabs__content[data-tab ="${tabNumber}"]`);
                        
                        sideBar.querySelectorAll(".tabs__button").forEach(button => { 
                            button.classList.remove("tabs__button--active");
                            
                        });
                        
                        
                        
                        tabsContainer.querySelectorAll(".tabs__content").forEach(tab => { 
                            tab.classList.remove("tabs__content--active");
                            
                        });
                        
                        button.classList.add("tabs__button--active");
                        tabToActivate.classList.add("tabs__content--active");
                        
                    });
                    
                });
                                                                    
             }
            
           	document.addEventListener("DOMContentLoaded", () => {
                setupTabs();
                
                
            document.querySelectorAll(".tabs").forEach(tabsContainer =>{
                tabsContainer.querySelector(".tabs__sidebar .tabs__button").click();
                    
                    
                });
            });
     
            
            function logoutConfirm(){
    			
    			swal({title: "Confirm Logout",
    				 text: "Are you shure you want to Logout?",
    				 icon: "warning",
    				 buttons: {
    					 cancel: "Cancel",
    					 logout: "Log Out",
    				 },	 
    			})
    			.then((value) => {	
    				if(value == "logout"){
    					document.location.href="LogoutServlet";
    				}
    			});
    		}
    		
    		
    		
    		
    		    document.getElementById("div1");
    		    document.getElementById("div2");
    		    document.getElementById("div3");
    		    document.getElementById("div4");
    		    document.getElementById("div5");
    		    document.getElementById("div6");    		    
    		    document.getElementById("div7");
    		    document.getElementById("div8");
    		    
        	function callResultServlet1(){
						
				document.forms['semesterForm']['semester'].value = "1";
			    document.getElementById("semesterForm").submit();
				
				
			}
			
			function callResultServlet2(){
						
				document.forms['semesterForm']['semester'].value = "2";
			    document.getElementById("semesterForm").submit();
				
				
			}
			
			function callResultServlet3(){
						
				document.forms['semesterForm']['semester'].value = "3";
				document.getElementById("semesterForm").submit();
				
				
			}
			
			function callResultServlet4(){
						
				document.forms['semesterForm']['semester'].value = "4";
			    document.getElementById("semesterForm").submit();
				
				
			}
			
			function callResultServlet5(){
						
				document.forms['semesterForm']['semester'].value = "5";
			    document.getElementById("semesterForm").submit();
				
				
			}
			
			function callResultServlet6(){
						
				document.forms['semesterForm']['semester'].value = "6";
			    document.getElementById("semesterForm").submit();
				
				
			}
			
			function callResultServlet7(){
						
				document.forms['semesterForm']['semester'].value = "7";
			    document.getElementById("semesterForm").submit();
				
				
			}
			
			function callResultServlet8(){
						
				document.forms['semesterForm']['semester'].value = "8";
			    document.getElementById("semesterForm").submit();
				
				
			}