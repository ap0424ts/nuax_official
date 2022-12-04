window.addEventListener('load', function(){

  // スマホ用 左側 ハンバーガーメニュー
  const MenuContainer = document.querySelector('.menu_container');
  const MenuOpen = document.querySelector('.menu_open');
  const MenuClose = document.querySelector('.menu_close');
  const SPMenu = document.querySelector('.sample_sp_menu');

    MenuContainer.addEventListener('click', () => {
      MenuOpen.classList.toggle('active');
      MenuClose.classList.toggle('active');
      SPMenu.classList.toggle('active');
    });
  
  // スマホ用 右側 カートメニュー
  const CartContainer = document.querySelector('.cart_container');
  const CartOpen = document.querySelector('.smp-cart-open');
  const CartClose = document.querySelector('.smp-cart-close');
  const CartMenu = document.querySelector('.cart_sp_menu');
  
  CartContainer.addEventListener('click', () => {
    console.log("click test")
    CartOpen.classList.toggle('active');
    CartClose.classList.toggle('active');
    CartMenu.classList.toggle('active');
  });

  // ここから下でスマホ用のSHOP押下時のアクション
  const pullDownShopMenu = document.getElementById("smp-lists")
  const pullDownParents = document.getElementById("smp-pull-down")
    
  
  pullDownShopMenu.addEventListener('click', function() {
     console.log("click OK")
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
        pullDownParents.removeAttribute("style")
    } else {
        pullDownParents.setAttribute("style", "display:block;")
    }
  })

})