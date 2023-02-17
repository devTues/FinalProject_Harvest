/**
 * 메인화면 슬라이드
 */
 
 $(document).ready(function(){
     
     $('.items').slick({
  infinite: true,
  slidesToShow: 5,
  slidesToScroll: 1,
  responsive: [
            {
              breakpoint: 768,
              settings: {
                slidesToShow: 3,
                arrows: true,
              }
            },
            {
              breakpoint: 600,
              settings: {
                slidesToShow: 1,
                arrows: true,
              }
            }
          ]
});
          });