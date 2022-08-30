<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html>
    <head>
        <link rel="stylesheet" href="css/otp.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
    </head>
    <body>
        <section class="header">
            <div class="fpdiv">
                <h3>Canara Exam Manager</h3>
                <div class="cd">
                    <div class="cd2">
                        <div class="cd3">
                        <form id="otpform">
                        <i class="fa-solid fa-envelope-open-text fa-7x"></i><br/>
                        <label>OTP Verification</label><br/>
                        <label>Enter the OTP Sent to</label><br/>
                        <label>rahuljmusic99@gmail.com</label><br/>
                        <input class="otpinput" type="text" id="digit-1" name="digit-1" data-next="digit-2" />
						<input class="otpinput" type="text" id="digit-2" name="digit-2" data-next="digit-3" data-previous="digit-1" />
						<input class="otpinput" type="text" id="digit-3" name="digit-3" data-next="digit-4" data-previous="digit-2" />
						<span class="splitter">&ndash;</span>
						<input class="otpinput" type="text" id="digit-4" name="digit-4" data-next="digit-5" data-previous="digit-3" />
						<input class="otpinput" type="text" id="digit-5" name="digit-5" data-next="digit-6" data-previous="digit-4" />
						<input class="otpinput" type="text" id="digit-6" name="digit-6" data-previous="digit-5" />
                        <button>Reset Password</button>
                        <a onclick="">Back To Login</a>
                        
                        <script>
                        $('#otpform').find('input').each(function() {
                        	$(this).attr('maxlength', 1);
                        	$(this).on('keyup', function(e) {
                        		var parent = $($(this).parent());
                        		
                        		if(e.keyCode === 8 || e.keyCode === 37) {
                        			var prev = parent.find('input#' + $(this).data('previous'));
                        			
                        			if(prev.length) {
                        				$(prev).select();
                        			}
                        		} else if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) {
                        			var next = parent.find('input#' + $(this).data('next'));
                        			
                        			if(next.length) {
                        				$(next).select();
                        			} else {
                        				if(parent.data('autosubmit')) {
                        					parent.submit();
                        				}
                        			}
                        		}
                        	});
                        });
                        </script>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>