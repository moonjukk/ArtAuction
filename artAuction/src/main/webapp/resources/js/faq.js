$(document).ready(function(){
		
		$(".contentContainer").on("click",function(){
			if($(".contentDetail").hasClass("contentActivity")){
				$(".navFaqChildren").children().removeClass("contentActivity");
				$(this).next().addClass("contentActivity");
			}else{
				$(this).next().addClass("contentActivity");
			}
		});
		
		$("#buying").on("click",function(){
			if(!$(".buying").hasClass("navActivity")){
				$(".contentContainer").next().removeClass("contentActivity");
				$(".navFaqChildren").children().removeClass("navActivity");
				$(".buying").addClass("navActivity");
				$(".navFaq").children().removeClass("activeNavFaq");
				$("#buying").addClass("activeNavFaq");
			}			
		});
		
		$("#selling").on("click",function(){
			if(!$(".selling").hasClass("navActivity")){
				$(".contentContainer").next().removeClass("contentActivity");
				$(".navFaqChildren").children().removeClass("navActivity");
				$(".selling").addClass("navActivity");
				$(".navFaq").children().removeClass("activeNavFaq");
				$("#selling").addClass("activeNavFaq");
			}
		});
		
		$("#membership").on("click",function(){
			if(!$(".membership").hasClass("navActivity")){
				$(".contentContainer").next().removeClass("contentActivity");
				$(".navFaqChildren").children().removeClass("navActivity");
				$(".membership").addClass("navActivity");
				$(".navFaq").children().removeClass("activeNavFaq");
				$("#membership").addClass("activeNavFaq");
			}
		});
		
		$("#auction").on("click",function(){
			if(!$(".auction").hasClass("navActivity")){
				$(".contentContainer").next().removeClass("contentActivity");
				$(".navFaqChildren").children().removeClass("navActivity");
				$(".auction").addClass("navActivity");
				$(".navFaq").children().removeClass("activeNavFaq");
				$("#auction").addClass("activeNavFaq");
			}
		});
		
		$("#deposit").on("click",function(){
			if(!$(".deposit").hasClass("navActivity")){
				$(".contentContainer").next().removeClass("contentActivity");
				$(".navFaqChildren").children().removeClass("navActivity");
				$(".deposit").addClass("navActivity");
				$(".navFaq").children().removeClass("activeNavFaq");
				$("#deposit").addClass("activeNavFaq");
			}
		});
		
		$("#credit").on("click",function(){
			if(!$(".credit").hasClass("navActivity")){
				$(".contentContainer").next().removeClass("contentActivity");
				$(".navFaqChildren").children().removeClass("navActivity");
				$(".credit").addClass("navActivity");
				$(".navFaq").children().removeClass("activeNavFaq");
				$("#credit").addClass("activeNavFaq");
			}
		});		
		
		$("#others").on("click",function(){
			if(!$(".others").hasClass("navActivity")){
				$(".contentContainer").next().removeClass("contentActivity");
				$(".navFaqChildren").children().removeClass("navActivity");
				$(".others").addClass("navActivity");
				$(".navFaq").children().removeClass("activeNavFaq");
				$("#others").addClass("activeNavFaq");
			}
		});
	});