// 스크롤 시 네비바 올라가게
window.addEventListener('scroll', function() {
	   
	   var navElem = document.getElementsByClassName('nav_menu');
	   if(window.scrollY > 100) {
	      navElem[0].classList.add('nav_action');
	   } else {
	      navElem[0].classList.remove('nav_action');
	   }
});

// 스크롤 시 햄버거 안 내용 올라가게
window.addEventListener('scroll', function() {
	   var navElem = document.getElementsByClassName('category_cont');
	   if(window.scrollY > 50) {
	      navElem[0].classList.add('ctgr_action');
	   } else {
	      navElem[0].classList.remove('ctgr_action');
	   }
});