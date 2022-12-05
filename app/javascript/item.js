window.addEventListener('load', function(){
  // スマホ用 アイテム詳細欄 詳細を確認するを押下時のアクション
  const DetailContainer = document.querySelector('.smp-detail_container');
  const DetailOpen = document.querySelector('.detail_open');
  const DetailClose = document.querySelector('.detail_close');
  const SPDetail = document.querySelector('.sample_detail_menu');

  DetailContainer.addEventListener('click', () => {
      DetailOpen.classList.toggle('active');
      DetailClose.classList.toggle('active');
      SPDetail.classList.toggle('active');
    });
  

})